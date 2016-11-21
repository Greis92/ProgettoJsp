<%@page import="bean.Cliente"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="cl" class="bean.Cliente" scope="request" />
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<jsp:setProperty property="*" name="cl" />

<%
  
GestioneAzienda g = new GestioneAzienda();

	if(g.readClientConId(cl.getId_utente())){ 
%>

<jsp:forward page="EditCliente.jsp" />

<%
	  
  	}else{
  		messaggio.setMessaggio("Cliente non valido o non presente!");
	 
	 %>

<jsp:forward page="ElencoClienti.jsp" />

<%
	 }
	
	 %>