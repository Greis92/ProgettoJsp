<%@page import="gestione.GestioneDipendente"%>
<%@page import="bean.Dipendente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>

	<jsp:useBean id="admin" class="bean.Admin" scope="session"></jsp:useBean>
	<jsp:useBean id="dip" class="bean.Dipendente" scope="request"/>
	
	 <jsp:setProperty property="*" name="dip"/>
	 
	 <%
	 	 	if(admin.isValid()){
	 	 	 	GestioneDipendente gDipendente = new GestioneDipendente(); 
	 	 	 	gDipendente.setBeanDipendente(dip);
	 	 %>

	<!--        header di pagina  -->
	<jsp:include page="../headerHtml.jsp"></jsp:include>

	<div>

		<!-- nav bar starts -->
		<jsp:include page="navBarAdmin.jsp"></jsp:include>

	</div>
	
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<div>
			<div>
				<jsp:include page="MenuLateraleAdmin.jsp"></jsp:include>
			</div>
			
		</div>
			<!-- left menu ends -->
			
			<div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
             <div>
    			<ol class="breadcrumb">
  					<li><a href="HomePageAdmin.jsp">Home</a></li>
  					<li><a href="ElencoDipendenti.jsp">Elenco Dipendenti</a></li>
  					<li class="active">Modifica Dipendenti</li>
				</ol>
			</div>
			
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
                				<h2><i class="glyphicon glyphicon-edit"></i> Modifica Dipendente</h2>
                				</div>
                				<div class="box-content">
								<form role="form" action="doEditDipendente.jsp"
									method="post">
									<div class="form-group">
										<label>Nome</label> <input type="text" class="form-control"
											name="nome" value="<%=dip.getNome()%>">
									</div>
									<div class="form-group">
										<label>Cognome</label> <input type="text" class="form-control"
											name="cognome" value="<%=dip.getCognome()%>">
									</div>
									<div class="form-group">
										<label>Username</label> <input type="text" class="form-control" 
											name="username" value="<%=dip.getUsername()%>">
									</div>
									<div class="form-group">
										<label>Password</label> <input type="password" class="form-control" 
											name="password" required>
									</div>
									<div class="form-group">
										<label>Posizione</label> <input type="text" class="form-control" 
											name="posizione" value="<%=dip.getPosizione()%>">
									</div>
									<div class="form-group">
										<label>Stipendio</label> <input type="text" class="form-control" 
											name="stipendio" value="<%=dip.getStipendio()%>">
									</div>
									<div>
										<input type="hidden" name="ruolo" value='d' />
									</div>
									<div>
										<input type="hidden" name="id_utente" value="<%=dip.getId_utente()%>" />
									</div>
									<button type="submit" class="btn btn-primary btn-lg">Salva Modifiche</button>
								</form>
								</div>
							  </div>
							</div>
						</div>
				<!--/row-->

				<!-- content ends -->
			</div>
		</div>
	</div>
	
		<footer class="row">
			<jsp:include page="../footerHtml.jsp"></jsp:include>
		</footer>
		
	</div><!--/.fluid-container-->
	
	<%

    }else{
    	response.sendRedirect(request.getContextPath()+"/Access/Login.jsp");
    }

	%>
	
	<!-- external javascript -->

	<jsp:include page="../IncludeScriptEnd.jsp"></jsp:include>