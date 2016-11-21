<%@page import="bean.Cliente"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="cliente" class="bean.Cliente" scope="request" />
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<jsp:setProperty property="*" name="cliente" />

<%
  
GestioneAzienda g = new GestioneAzienda();

	if(g.readClientConId(cliente.getId_utente())){
	  	g.deleteClient(cliente); 
	  	messaggio.setMessaggio("Cancellazione Avvenuta!");
%>

<jsp:forward page="ElencoClienti.jsp" />

<%
	  
  	}else{
  		messaggio.setMessaggio("Cancellazione Fallita!");
	 
	 %>

<jsp:forward page="ElencoClienti.jsp" />

<%
	 }
	
	 %>