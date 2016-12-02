<%@page import="bean.Cliente"%>
<%@page import="gestione.GestioneCliente"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="cliente" class="bean.Cliente" scope="request" />
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<jsp:setProperty property="*" name="cliente" />

<%
	GestioneCliente gCliente = new GestioneCliente();

	if(gCliente.readClienteConId(cliente.getId_utente())){
		gCliente.deleteCliente(cliente); 
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