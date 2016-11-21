<%@page import="bean.BustaPaga"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="bp" class="bean.BustaPaga" scope="request" />
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<jsp:setProperty property="*" name="bp" />

<%
  
GestioneAzienda g = new GestioneAzienda();

	if(g.readBustaPagaById(bp.getIdBustaPaga())){
	  	g.deleteBustaPaga(bp);
	  	messaggio.setMessaggio("Cancellazione Avvenuta!");
%>

<jsp:forward page="ElencoBustePaga.jsp" />

<%
	  
  	}else{
  		messaggio.setMessaggio("Cancellazione Fallita!");
	 
	 %>

<jsp:forward page="ElencoBustePaga.jsp" />

<%
	 }
	
	 %>