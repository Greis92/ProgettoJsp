<%@page import="bean.Dipendente"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="dip" class="bean.Dipendente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="dip"/>
     
<%
  
GestioneAzienda g = new GestioneAzienda();

dip.setPassword(g.convertiPass(dip.getPassword()));

  if(dip.isValid() && !g.existDipendente(dip.getUsername())){
	  g.registraDipendente(dip);
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