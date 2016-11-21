<%@page import="bean.Cliente"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="cl" class="bean.Cliente" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="cl"/>
     
<%
  
GestioneAzienda g = new GestioneAzienda();

cl.setPassword(g.convertiPass(cl.getPassword()));

  if(cl.isValid() && !g.existClient(cl.getUsername())){
	  g.registraClient(cl);
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
