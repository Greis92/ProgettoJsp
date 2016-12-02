<%@page import="javassist.runtime.Inner"%>
<%@page import="bean.Dipendente"%>
<%@page import="java.util.List"%>
<%@page import="gestione.GestioneDipendente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="admin" class="bean.Admin" scope="session"></jsp:useBean>

<!--        header di pagina  -->
<jsp:include page="../headerHtml.jsp"></jsp:include>

<%
	if(admin.isValid()){
%>
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
  					<li class="active">Nuova Bustapaga</li>
				</ol>
			</div>

		<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<div class="row">
				<div class="box col-md-12">
					<div class="box-inner">
						<div class="box-header well" data-original-title="">
							<h2>
								<i class="glyphicon glyphicon-edit"></i> Nuova Bustapaga
							</h2>
						</div>
						<div class="box-content">
							<form role="form" action="doEmettiNuovaBustaPaga.jsp"
								method="post">
										    					
								<label id="dip" class="control-label" for="list">Seleziona
									Dipendente</label>
								<div class="controls">
									<select id="list" name="id_dipendente" data-rel="chosen">
									<option value=""></option>
									<%
										GestioneDipendente gDipendente = new GestioneDipendente();
										List<Dipendente> listaDip = gDipendente.readAllDipendenti();
										session.setAttribute("listaDip", listaDip);
									%>
									<c:forEach items="${listaDip}" var="d"> 
										<option value="${d.id_utente}" >
											<c:out value="${d.cognome} ${d.nome}"></c:out>
										</option>
									</c:forEach>
									</select>
								</div>
								<br>
								<div class="form-group">
									<label>Data Emissione</label> <input type="date"
										class="form-control" name="dataEmissione" required>
								</div>
								<br>
								<div class="form-group">
									<label>Ore Lavorative</label> <input type="text"
										class="form-control" name="oreLavorate" required>
								</div>
								<br>
								<div class="form-group">
									<label>Importo</label> <input type="text" class="form-control"
										name="importo" required>
								</div>
								<br>
								<button type="submit" class="btn btn-primary btn-lg">Emetti</button>
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

<!-- external javascript -->
<%

    }else{
    	response.sendRedirect(request.getContextPath()+"/Access/Login.jsp");
    }

%>
<jsp:include page="../IncludeScriptEnd.jsp"></jsp:include>