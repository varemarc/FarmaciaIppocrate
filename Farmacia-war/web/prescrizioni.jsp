<%-- 
    Document   : prescrizioni
    Created on : 6-mar-2014, 18.35.14
    Author     : Marco
--%>

<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="paziente" class="WSPaziente.PazienteTransient" scope="session" />
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
                        <li><a href="#">Altro</a></li>
                    </ul>
<!--                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp">Logout</a></li>
                    </ul>-->
                </div><!--/.nav-collapse -->
            </div>
            <!-- Main component for a primary marketing message or call to action -->
            <div class="jumbotron">
                <p>Da questa pagina puoi visualizzare le prescrizioni mediche
                    del cliente.</p>
            </div>
            <div class="page-header">
                <h1>Prescrizioni mediche di <%= paziente.getNome() + " " + paziente.getCognome() %></h1>
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
                        <dd><%= sdf.format(paziente.getDataNascita().toGregorianCalendar().getTime()) %></dd>
                        <dt>Luogo nascita</dt>
                        <dd><%= paziente.getLuogoNascita()%></dd>
                        <dt>Indirizzo</dt>
                        <dd><%= paziente.getIndirizzo()%></dd>
                    </dl>
                </div>
            </div>
                    tabella prescrizioni
        </div> <!-- /container -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
