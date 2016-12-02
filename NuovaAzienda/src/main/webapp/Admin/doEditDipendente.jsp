<%@page import="gestione.GestionePass"%>
<%@page import="gestione.GestioneDipendente"%>
<%@page import="bean.Dipendente"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="d" class="bean.Dipendente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="d"/>
     
<%
     	GestioneDipendente gDipendente = new GestioneDipendente();
		GestionePass gPass = new GestionePass();

     d.setPassword(gPass.convertiPass(d.getPassword()));

     String idTemp = String.valueOf(d.getId_utente());
     long id = Long.parseLong(idTemp);
     d.setId_utente(id);

       if(gDipendente.readDipendenteConId(d.getId_utente())){
    	   gDipendente.updateDipendente(d);
     	  messaggio.setMessaggio("Modifica Effettuata!");
     %>

<jsp:forward page="ElencoDipendenti.jsp" />

<%
	  
  }else{ 
	  messaggio.setMessaggio("Impossibile effettuare la modifica!");
	  
%>

<jsp:forward page="ElencoDipendenti.jsp" />

<%
  
  }
  
%>
