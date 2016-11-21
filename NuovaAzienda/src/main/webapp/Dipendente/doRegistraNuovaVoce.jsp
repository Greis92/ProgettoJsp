<%@page import="bean.Dipendente"%>
<%@page import="bean.Voce"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>
	
    <jsp:useBean id="voce" class="bean.Voce" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
   
    <jsp:setProperty property="*" name="voce"/>
     
<%
  
GestioneAzienda g = new GestioneAzienda();

String idTemp = String.valueOf(request.getParameter("id_utente"));
long id = Long.parseLong(idTemp);

  if(voce.isValid()){	 
	  g.insertVoce(id, voce);
	  messaggio.setMessaggio("Contatto inserito nella Rubrica!");

%>

<jsp:forward page="ElencoContatti.jsp" />

<%
	  
  }else{
	  messaggio.setMessaggio("Contatto non Valido!");
	 
%>

<jsp:forward page="ElencoContatti.jsp" />

<%  

  }
  
%>