<%@page import="gestione.GestioneAzienda"%>
<%@page import="bean.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>

	<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
	<jsp:useBean id="cl" class="bean.Cliente" scope="request"/>
	
	 <jsp:setProperty property="*" name="cl"/>
	 
	 <%
	 if(admin.isValid()){
	 	GestioneAzienda g = new GestioneAzienda(); 
	 	g.setBeanClient(cl);
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
  					<li><a href="ElencoClienti.jsp">Elenco Clienti</a></li>
  					<li class="active">Modifica Cliente</li>
				</ol>
			</div>
			
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
                				<h2><i class="glyphicon glyphicon-edit"></i> Modifica Cliente</h2>
                				</div>
                				<div class="box-content">
								<form role="form" action="doEditCliente.jsp"
									method="post">
									<div class="form-group">
										<label>Nome</label> <input type="text" class="form-control"
											name="nome" value="<%=cl.getNome()%>">
									</div>
									<div class="form-group">
										<label>Cognome</label> <input type="text" class="form-control"
											name="cognome" value="<%=cl.getCognome()%>">
									</div>
									<div class="form-group">
										<label>Username</label> <input type="text" class="form-control" 
											name="username" value="<%=cl.getUsername()%>">
									</div>
									<div class="form-group">
										<label>Password</label> <input type="password" class="form-control" 
											name="password" required>
									</div>
									<div class="form-group">
										<label>Ragione Sociale</label> <input type="text" class="form-control" 
											name="ragioneSociale" value="<%=cl.getRagioneSociale()%>">
									</div>
									<div class="form-group">
										<label>Partita Iva</label> <input type="text" class="form-control" 
											name="partitaIva" value="<%=cl.getPartitaIva()%>">
									</div>
									<div>
										<input type="hidden" name="ruolo" value='c' />
									</div>
									<div>
										<input type="hidden" name="id_utente" value="<%=cl.getId_utente()%>"/>
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