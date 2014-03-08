<%-- 
    Document   : prescrizioni
    Created on : 6-mar-2014, 18.35.14
    Author     : Marco
--%>

<%@page import="WSPrescrizioneMedica.PrescrizioneMedicaTransient"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="paziente" class="WSPaziente.PazienteTransient" scope="session" />
<jsp:useBean id="prescrizioni" class="List<PrescrizioneMedicaTransient>" scope="session" />
<% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Farmacia :: Prescrizioni</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/navbar.css" rel="stylesheet">
    </head>
    <body> 
        <div class="container">
            <!-- Static navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">         
                    <a class="navbar-brand" href="index.html">Farmacia</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">Home</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
            <!-- Main component for a primary marketing message or call to action -->
            <div class="jumbotron">
                <p>Da questa pagina puoi visualizzare le prescrizioni mediche
                    del cliente.</p>
            </div>
            <div class="page-header">
                <h1>Prescrizioni mediche di <%= paziente.getNome() + " " + paziente.getCognome()%></h1>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Informazioni cliente</div>
                <div class="panel-body">
                    <dl class="dl-horizontal">
                        <dt>Nome</dt>
                        <dd><%= paziente.getNome()%></dd>
                        <dt>Cognome</dt>
                        <dd><%= paziente.getCognome()%></dd>
                        <dt>CF</dt>
                        <dd><%= paziente.getCf()%></dd>
                        <dt>Sesso</dt>
                        <dd><%= paziente.getSesso()%></dd>
                        <dt>Data nascita</dt>
                        <dd><%= sdf.format(paziente.getDataNascita().toGregorianCalendar().getTime())%></dd>
                        <dt>Luogo nascita</dt>
                        <dd><%= paziente.getLuogoNascita()%></dd>
                        <dt>Indirizzo</dt>
                        <dd><%= paziente.getIndirizzo()%></dd>
                    </dl>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Prescrizioni mediche</div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Data prescrizione</th>
                            <th>Data scadenza prescrizione</th>
                            <th>Medicinale</th>
                            <th>Quantità</th>
                            <th>Consegnata</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < prescrizioni.size(); i++) {%>
                        <tr>
                            <td><%= i + 1%></td>
                            <td><%= sdf.format(prescrizioni.get(i).getDataPrescrizione().toGregorianCalendar().getTime())%></td>
                            <td><%= sdf.format(prescrizioni.get(i).getDataScadenza().toGregorianCalendar().getTime())%></td>
                            <td><%= prescrizioni.get(i).getMedicinale()%></td>
                            <td><%= prescrizioni.get(i).getNumConfezioni()%></td>
                            <td>
                                <form class="form-inline" action="FarmaciaServlet?action=segnaConsegnata_<%=i%>" role="form" method="POST"><%= prescrizioni.get(i).getConsegnata()%>
                                    <% if (prescrizioni.get(i).getConsegnata().equals("no")) {%>
                                    &nbsp
                                    <button type="submit" class="btn btn-primary btn-xs" title="Consegna">
                                        <span class="glyphicon glyphicon-ok"></span>
                                    </button>
                                    <%}%>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div> <!-- /container -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
