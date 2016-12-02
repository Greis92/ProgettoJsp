<%@page import="gestione.GestioneDipendente"%>
<%@page import="bean.Dipendente"%>
<%@page import="bean.BustaPaga"%>
<%@page import="gestione.GestioneBustaPaga"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="bp" class="bean.BustaPaga" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    
    <jsp:setProperty property="*" name="bp"/>
     
<%
     	GestioneBustaPaga gBusta = new GestioneBustaPaga();
		GestioneDipendente gDipendente = new GestioneDipendente();

     // pars id_bustaPaga
     String idTemp = String.valueOf(bp.getIdBustaPaga());
     long idB = Long.parseLong(idTemp);
     bp.setIdBustaPaga(idB);

     // pars id_dipendente
     long idD = Long.parseLong(request.getParameter("idDipendente"));
     Dipendente d = gDipendente.readDipendente(idD);
     bp.setDip(d);


       if(gBusta.readBustaPagaById(bp.getIdBustaPaga())){
    	   gBusta.updateBustaPaga(bp);
     	  messaggio.setMessaggio("Bustapaga modificata!");
     %>

<jsp:forward page="ElencoBustePaga.jsp" />

<%
	  
  }else{ 
	  messaggio.setMessaggio("Impossibile effettuare la modifica!");
	  
%>

<jsp:forward page="ElencoBustePaga.jsp" />

<%
  
  }
  
%>
