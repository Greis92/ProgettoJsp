<%@page import="bean.Voce"%>
<%@page import="gestione.GestioneRubrica"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="v" class="bean.Voce" scope="request" />
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<jsp:setProperty property="*" name="v" />

<%
	GestioneRubrica gRubrica = new GestioneRubrica();

	if(gRubrica.readVoceByIdBool(v.getId_voce())){
		gRubrica.deleteVoce(v);
	  	messaggio.setMessaggio("Contatto cancellato!");
%>

<jsp:forward page="ElencoContatti.jsp" />

<%
	  
  	}else{
  		messaggio.setMessaggio("Cancellazione Fallita!");
	 
	 %>

<jsp:forward page="ElencoContatti.jsp" />

<%
	 }
	
	 %>