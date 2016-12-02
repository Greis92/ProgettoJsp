<%@page import="gestione.GestioneBustaPaga"%>
<%@page import="bean.Dipendente"%>
<%@page import="dao.DipendenteDao"%>
<%@page import="bean.BustaPaga"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="bp" class="bean.BustaPaga" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="bp"/>
     
<%
     	GestioneBustaPaga gBustaPaga = new GestioneBustaPaga();		

     DipendenteDao dDao = new DipendenteDao();
     long id = Long.parseLong(request.getParameter("id_dipendente"));
     Dipendente d = dDao.readDipendenteConId(id);
     bp.setDip(d);

     if(bp.isValid()){
     	
     	if(gBustaPaga.readAllBustaPaga(bp.getDataEmissione(), bp.getDip())== null){     		
     		gBustaPaga.registraBustaPaga(bp);
     	messaggio.setMessaggio("Bustapaga Emessa!");
     %>

<jsp:forward page="ElencoBustePaga.jsp" />

<%
	}
  }else{ 
	  messaggio.setMessaggio("Bustapaga Non Valida!");
	  
%>

<jsp:forward page="ElencoBustePaga.jsp" />

<%
  
  }
  
%>