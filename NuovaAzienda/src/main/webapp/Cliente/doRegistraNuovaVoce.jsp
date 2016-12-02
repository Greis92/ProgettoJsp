<%@page import="bean.Voce"%>
<%@page import="gestione.GestioneRubrica"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>
	
    <jsp:useBean id="voce" class="bean.Voce" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" /> 
    
    <jsp:setProperty property="*" name="voce"/>
     
<%
     GestioneRubrica gRubrica = new GestioneRubrica();

     String idTemp = String.valueOf(request.getParameter("id_utente"));
     long id = Long.parseLong(idTemp);

       if(voce.isValid()){     	 
    	  gRubrica.insertVoce(id, voce);
     	  messaggio.setMessaggio("Nuovo Contatto registrato con successo!");
     %>

<jsp:forward page="ElencoContatti.jsp" />

<%
	  
  }else{
	  messaggio.setMessaggio("Contatto non valido!");
	 
%>

<jsp:forward page="ElencoContatti.jsp" />

<%  

  }
  
%>