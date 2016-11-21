<%@page import="bean.Dipendente"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="dip" class="bean.Dipendente" scope="request" />
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<jsp:setProperty property="*" name="dip" />

<%
  
GestioneAzienda g = new GestioneAzienda();

	if(g.readDipendenteConId(dip.getId_utente())){
	  	g.deleteDipendente(dip); 
	  	messaggio.setMessaggio("Cancellazione Avvenuta!");
%>

<jsp:forward page="ElencoDipendenti.jsp" />

<%
	  
  	}else{
  		messaggio.setMessaggio("Cancellazione Fallita!");
	 
	 %>

<jsp:forward page="ElencoDipendenti.jsp" />

<%
	 }
	
	 %>