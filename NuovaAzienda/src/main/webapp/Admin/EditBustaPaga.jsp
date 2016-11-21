<%@page import="gestione.GestioneAzienda"%>
<%@page import="bean.BustaPaga"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>

	<jsp:useBean id="admin" class="bean.Admin" scope="session"></jsp:useBean>
	<jsp:useBean id="bp" class="bean.BustaPaga" scope="request"/>
	
	 <jsp:setProperty property="*" name="bp"/>
	 
	 <%
	 if(admin.isValid()){
	 	GestioneAzienda g = new GestioneAzienda(); 
	 	g.setBeanBustaPaga(bp); 
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
  					<li><a href="ElencoBustePaga.jsp">Elenco Bustepaga</a></li>  					
  					<li class="active">Modifica Bustapaga</li>
				</ol>
			</div>
			
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
                				<h2><i class="glyphicon glyphicon-edit"></i> Modifica Bustapaga</h2>
                				</div>
                				<div class="box-content">
								<form role="form" action="doEditBustaPaga.jsp"
									method="post">
									<div class="form-group">
										<label>Data Emissione</label> <input type="text" class="form-control"
											name="dataEmissione" value="<%=bp.getDataEmissione()%>">
									</div>
									<div class="form-group">
										<label>Ore lavorate</label> <input type="text" class="form-control" 
											name="oreLavorate" value="<%=bp.getOreLavorate()%>">
									</div>
									<div class="form-group">
										<label>Importo</label> <input type="text" class="form-control" 
											name="importo" value="<%=bp.getImporto()%>">
									</div>
									<div>
										<input type="hidden" name="idBustaPaga" value="<%=bp.getIdBustaPaga()%>" />
									</div>
									<div>
									<input type="hidden" name="idDipendente" value="<%=bp.getDip().getId_utente()%>"/>
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