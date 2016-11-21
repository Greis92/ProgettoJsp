<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>

	<jsp:useBean id="cliente" class="bean.Cliente" scope="session"></jsp:useBean>

	<!--        header di pagina  -->
	<jsp:include page="../headerHtml.jsp"></jsp:include>
	
	
	<%
    	if(cliente.isValid()){
    		
    %>

	<div>

		<!-- nav bar starts -->
		<jsp:include page="navBarCliente.jsp"></jsp:include>

	</div>
	
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<div>
				<div>
					<jsp:include page="MenuLateraleCliente.jsp"></jsp:include>
				</div>

			</div>
			<!-- left menu ends -->
			
			<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<div>
    			<ol class="breadcrumb">
    				<li><a href="HomePageCliente.jsp">Home</a></li>
        			<li class="active"><a>Nuovo Contatto </a></li>
            	</ol>
			</div>

			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-edit"></i> Nuovo Contatto
								</h2>
							</div>
							<div class="box-content">
								<form role="form" action="doRegistraNuovaVoce.jsp" method="post">
									<div class="form-group">
										<label>Nome</label> <input type="text" class="form-control"
											name="nome" placeholder="nome" required>
									</div>
									<div class="form-group">
										<label>Cognome</label> <input type="text" class="form-control"
											name="cognome" placeholder="cognome" required>
									</div>
									<div class="form-group">
										<label>Telefono</label> <input type="text"
											class="form-control" name="telefono" placeholder="telefono"
											required>
									</div>
									<div class="form-group">
										<input type="hidden" name="id_utente"
											value="<%=cliente.getId_utente()%>">
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

	</div>
	<!--/.fluid-container-->
	
	<%

    }else{
    	response.sendRedirect(request.getContextPath()+"/Access/Login.jsp");
    }

%>

	<!-- external javascript -->

	<jsp:include page="../IncludeScriptEnd.jsp"></jsp:include>