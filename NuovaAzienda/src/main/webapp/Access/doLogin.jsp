<%@page import="utility.MessaggioErrore"%>
<%@page import="bean.Utente"%>
<%@page import="gestione.GestioneAzienda"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <jsp:useBean id="utente" class="bean.Utente" scope="request"/>
 <jsp:useBean id="admin" class="bean.Admin" scope="session"/>
 <jsp:useBean id="cliente" class="bean.Cliente" scope="session"/>
 <jsp:useBean id="dipendente" class="bean.Dipendente" scope="session"/>   
 <jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" /> 
    
    <jsp:setProperty property="*" name="utente"/>


<%
	
	GestioneAzienda g = new GestioneAzienda();
    
    if(g.existUserBoolean(utente.getUsername(), utente.getPassword())){
    	 g.setBeanUtente(utente);
    	 
    }
   
	if(utente.isValidLogin()){
			
			switch(utente.getRuolo()){
			
			case 'a':
				admin.setId_utente(utente.getId_utente());
				g.setBeanAdmin(admin);
%>

<jsp:forward page="../Admin/HomePageAdmin.jsp" />

<%

			break;
			case 'c':
				cliente.setId_utente(utente.getId_utente());
				g.setBeanClient(cliente);
								
%>
			
<jsp:forward page="../Cliente/HomePageCliente.jsp" />			

<%
			
			break;
			case 'd':
				dipendente.setId_utente(utente.getId_utente());
				g.setBeanDipendente(dipendente);
				
%>

<jsp:forward page="../Dipendente/HomePageDipendente.jsp" />

<%

			break;
			}
		}else{
			
			messaggio.setMessaggio("Username o Password errati!");
			
%>

<jsp:forward page="Login.jsp" />

<%
		}
%>