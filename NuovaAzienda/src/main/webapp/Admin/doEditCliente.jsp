<%@page import="bean.Cliente"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="cliente" class="bean.Cliente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="cliente"/>
     
<%

GestioneAzienda g = new GestioneAzienda();

cliente.setPassword(g.convertiPass(cliente.getPassword()));

String idTemp = String.valueOf(cliente.getId_utente());
long id = Long.parseLong(idTemp);
cliente.setId_utente(id);

  if(g.readClientConId(cliente.getId_utente())){
	  g.updateClient(cliente);
	  messaggio.setMessaggio("Modifica Effettuata!");

%>

<jsp:forward page="ElencoClienti.jsp" />

<%
	  
  }else{ 
	  messaggio.setMessaggio("Impossibile effettuare la modifica!");
	  
%>

<jsp:forward page="ElencoClienti.jsp" />

<%
  
  }
  
%>
