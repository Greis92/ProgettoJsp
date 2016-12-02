<%@page import="gestione.GestionePass"%>
<%@page import="gestione.GestioneCliente"%>
<%@page import="bean.Cliente"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="cl" class="bean.Cliente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="cl"/>
     
<%
     	GestioneCliente gCliente = new GestioneCliente();
		GestionePass gPass = new GestionePass();

     cl.setPassword(gPass.convertiPass(cl.getPassword()));

       if(cl.isValid() && !gCliente.existCliente(cl.getUsername())){
    	   gCliente.registraCliente(cl);
     	  messaggio.setMessaggio("Registrazione Avvenuta Con Successo!");
     %>

<jsp:forward page="ElencoClienti.jsp" />

<%
	  
  }else{ 
	  messaggio.setMessaggio("Registrazione Fallita!");
	  
%>

<jsp:forward page="ElencoClienti.jsp" />

<%
  
  }
  
%>
