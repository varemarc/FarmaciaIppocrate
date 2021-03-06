/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import WSPaziente.PazienteTransient;
import WSPaziente.WSPaziente_Service;
import WSPrescrizioneMedica.PrescrizioneMedicaTransient;
import WSPrescrizioneMedica.WSPrescrizioneMedica_Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author Marco
 */
public class FarmaciaServlet extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WSPrescrizioneMedica/WSPrescrizioneMedica.wsdl")
    private WSPrescrizioneMedica_Service service_1;

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WSPaziente/WSPaziente.wsdl")
    private WSPaziente_Service service;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession s = request.getSession();
            if (request.getParameter("action").equals("findCF")) {
                String cf = request.getParameter("cf");
                Long id = verificaCF(cf);
                if (id.equals(new Long(-1)) == false) {
                    PazienteTransient pt = getPazienteTransient(id);
                    List<PrescrizioneMedicaTransient> lpmt = getPMTransient(id);
                    s.setAttribute("paziente", pt);
                    s.setAttribute("prescrizioni", lpmt);
                    response.sendRedirect("prescrizioni.jsp");
                } else {
                    s.setAttribute("error", "CF cliente non valido.");
                    response.sendRedirect("errore.jsp");
                }
            } else if (request.getParameter("action").startsWith("segnaConsegnata_")) {
                int iPM = Integer.parseInt(request.getParameter("action").substring(16));
                List<PrescrizioneMedicaTransient> lpmtOLD = 
                        (List<PrescrizioneMedicaTransient>) s.getAttribute("prescrizioni");
                PrescrizioneMedicaTransient pmt = segnaConsegnata(lpmtOLD.get(iPM).getId());
                lpmtOLD.set(iPM, pmt);
                s.setAttribute("prescrizioni", lpmtOLD);
                response.sendRedirect("prescrizioni.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Long verificaCF(java.lang.String cf) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        WSPaziente.WSPaziente port = service.getWSPazientePort();
        return port.verificaCF(cf);
    }

    private PazienteTransient getPazienteTransient(java.lang.Long id) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        WSPaziente.WSPaziente port = service.getWSPazientePort();
        return port.getPazienteTransient(id);
    }

    private java.util.List<WSPrescrizioneMedica.PrescrizioneMedicaTransient> getPMTransient(java.lang.Long idPaziente) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        WSPrescrizioneMedica.WSPrescrizioneMedica port = service_1.getWSPrescrizioneMedicaPort();
        return port.getPMTransient(idPaziente);
    }

    private PrescrizioneMedicaTransient segnaConsegnata(java.lang.Long idPM) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        WSPrescrizioneMedica.WSPrescrizioneMedica port = service_1.getWSPrescrizioneMedicaPort();
        return port.segnaConsegnata(idPM);
    }

}
