<%@page import="gestione.GestioneRubrica"%>
<%@page import="bean.Voce"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>

	<jsp:useBean id="dipendente" class="bean.Dipendente" scope="session"/>
	<jsp:useBean id="v" class="bean.Voce" scope="request"/>
	
	 <jsp:setProperty property="*" name="v"/>
	 
	 <%
	 	 	if(dipendente.isValid()){
	 	 	 	GestioneRubrica gRubrica = new GestioneRubrica();  
	 	 	 	gRubrica.setBeanVoce(v);
	 	 %>

	<!--        header di pagina  -->
	<jsp:include page="../headerHtml.jsp"></jsp:include>

	<div>

		<!-- nav bar starts -->
		<jsp:include page="navBarDipendente.jsp"></jsp:include>

	</div>
	
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<div>
			<div>
				<jsp:include page="MenuLateraleDipendente.jsp"></jsp:include>
			</div>
			
		</div>
			<!-- left menu ends -->
			
			<div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    			<ol class="breadcrumb">
  					<li><a href="HomePageDipendente.jsp">Home</a></li>
  					<li><a href="ElencoContatti.jsp">Rubrica</a></li>
  					<li class="active">Modifica Contatto</li>
				</ol>
			</div>
			
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
                				<h2><i class="glyphicon glyphicon-edit"></i> Modifica Contatto</h2>
                				</div>
                				<div class="box-content">
								<form role="form" action="doEditVoce.jsp"
									method="post">
									<div class="form-group">
										<label>Nome</label> <input type="text" class="form-control"
											name="nome" value="${v.nome}">
									</div>
									<div class="form-group">
										<label>Cognome</label> <input type="text" class="form-control"
											name="cognome" value="${v.cognome}">
									</div>
									<div class="form-group">
										<label>Telefono</label> <input type="text" class="form-control" 
											name="telefono" value="${v.telefono}">
									</div>
									<div>
										<input type="hidden" name="idRubrica" value="${v.rubrica.id_rubrica}"/>
									</div>									
									<div>
										<input type="hidden" name="id_voce" value="${v.id_voce}"/>
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