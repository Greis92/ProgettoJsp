<%@page import="gestione.GestionePass"%>
<%@page import="gestione.GestioneDipendente"%>
<%@page import="bean.Dipendente"%>
<%@page import="utility.MessaggioErrore"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="dip" class="bean.Dipendente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="dip"/>
     
<%
     	GestioneDipendente gDipendente = new GestioneDipendente();
		GestionePass gPass = new GestionePass();

     dip.setPassword(gPass.convertiPass(dip.getPassword()));

       if(dip.isValid() && !gDipendente.existDipendente(dip.getUsername())){
    	   gDipendente.registraDipendente(dip);
     	  messaggio.setMessaggio("Registrazione Avvenuta Con Successo!");
     %>

<jsp:forward page="ElencoDipendenti.jsp" />

<%

  }else{
	  messaggio.setMessaggio("Registrazione Fallita!");
	  
%>

 <jsp:forward page="ElencoDipendenti.jsp" />

<%
	    
   }
	    
%>