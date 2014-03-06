<%-- 
    Document   : errore
    Created on : 6-mar-2014, 18.45.10
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = (String) session.getAttribute("error");
    session.setAttribute("error", null);
%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Farmacia :: Errore</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1>Farmacia</h1>
                <br>
                <div class="alert alert-danger"><strong>Attenzione!</strong> Si è 
                    verificato un errore.<br><%= error%>
                </div>
                <br>
                <p>
                    <a class="btn btn-lg btn-primary" href="index.html" 
                       role="button">Vai alla home &raquo;</a>
                </p>
            </div>
        </div>
    </body>
</html>
