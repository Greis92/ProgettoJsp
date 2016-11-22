<%@page import="bean.Rubrica"%>
<%@page import="bean.Voce"%>
<%@page import="gestione.GestioneAzienda"%>
<%@page import="utility.MessaggioErrore"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>

    <jsp:useBean id="v" class="bean.Voce" scope="request"/>
    <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />
    
    <jsp:setProperty property="*" name="v"/>
     
<%

GestioneAzienda g = new GestioneAzienda();

String rTemp = String.valueOf(request.getParameter("idRubrica"));
long idR = Long.parseLong(rTemp);
Rubrica r = g.readRubricaById(idR);

String idTemp = String.valueOf(v.getId_voce());
long id = Long.parseLong(idTemp);

v.setRubrica(r);
v.setId_voce(id);

  if(g.readVoceByIdBool(id)){
	  g.updateVoce(v);
	  messaggio.setMessaggio("Contatto modificato!");

%>

<jsp:forward page="ElencoContatti.jsp" />

<%
	  
  }else{ 
	  messaggio.setMessaggio("Impossibile effettuare la modifica!");
	  
%>

<jsp:forward page="ElencoContatti.jsp" />

<%
  
  }
  
%>