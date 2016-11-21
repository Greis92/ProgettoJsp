<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>

	<jsp:useBean id="admin" class="bean.Admin" scope="session"></jsp:useBean>

	<!--        header di pagina  -->
	<jsp:include page="../headerHtml.jsp"></jsp:include>

	<div>

		<!-- nav bar starts -->
		<jsp:include page="navBarAdmin.jsp"></jsp:include>

	</div>
	
	<%
    	if(admin.isValid()){
    		
    %>
	
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
  					<li class="active">Nuovo Cliente</li>
				</ol>
			</div>
			
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
                				<h2><i class="glyphicon glyphicon-edit"></i> Nuovo Cliente</h2>
                				</div>
                				<div class="box-content">
								<form role="form" action="doRegistraNuovoCliente.jsp"
									method="post">
									<div class="form-group">
										<label>Nome</label> <input type="text" class="form-control"
											name="nome" placeholder="Nome" required>
									</div>
									<div class="form-group">
										<label>Cognome</label> <input type="text" class="form-control"
											name="cognome" placeholder="Cognome" required>
									</div>
									<div class="form-group">
										<label>Username</label> <input type="text"
											class="form-control" name="username" placeholder="Username"
											required>
									</div>
									<div class="form-group">
										<label>Password</label> <input type="password"
											class="form-control" name="password" placeholder="Password"
											required>
									</div>
									<div class="form-group">
										<label>Ragione Sociale</label> <input type="text"
											class="form-control" name="ragioneSociale"
											placeholder="Ragione Sociale" required>
									</div>
									<div class="form-group">
										<label>Partita Iva</label> <input type="text"
											class="form-control" name="partitaIva"
											placeholder="Partita Iva" required>
									</div>
									<div>
										<input type="hidden" name="ruolo" value='c' />
									</div>
									<button type="submit" class="btn btn-primary btn-lg">Registra</button>
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