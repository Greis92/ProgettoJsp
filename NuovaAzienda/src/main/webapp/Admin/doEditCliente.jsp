<%@page import="gestione.GestionePass"%>
<%@page import="gestione.GestioneCliente"%>
<%@page import="bean.Cliente"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="cliente" class="bean.Cliente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="cliente"/>
     
<%
     	GestioneCliente gCliente = new GestioneCliente();
		GestionePass gPass = new GestionePass();

     cliente.setPassword(gPass.convertiPass(cliente.getPassword()));

     String idTemp = String.valueOf(cliente.getId_utente());
     long id = Long.parseLong(idTemp);
     cliente.setId_utente(id);

       if(gCliente.readClienteConId(cliente.getId_utente())){
    	   gCliente.updateCliente(cliente);
     	  messaggio.setMessaggio("Modifica Effettuata!");
     %>

<jsp:forward page="ElencoClienti.jsp" />

<%
	  
  }else{ 
	  messaggio.setMessaggio("Impossibile effettuare la modifica!");
	  
%>

<jsp:forward page="ElencoClienti.jsp" />

<%
  
  }
  
%>
