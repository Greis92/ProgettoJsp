<%@page import="bean.Voce"%>
<%@page import="java.util.List"%>
<%@page import="gestione.GestioneAzienda"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="cliente" class="bean.Cliente" scope="session"/>
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

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
        			<li class="active"><a>Rubrica</a></li>
            	</ol>
			</div>
		
		<div class="alert alert-info alert-dismissible" role="info">
             <strong><%=messaggio.getMessaggio()%></strong>
        </div>

		<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<div class="row">
				<div class="box col-md-12">
					<div class="box-inner">
						<div class="box-header well" data-original-title="">
                    		<h2><i class="glyphicon glyphicon-folder-open"></i> Rubrica</h2>
                    	</div>
						<div class="box-content">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive">
								<thead>
									<tr>
										<th class="center">Nome</th>
										<th class="center">Cognome</th>
										<th class="center">Telefono</th>
										<th class="center">Modifica Contatto</th>
										<th class="center">Cancella Contatto</th>
									</tr>
								</thead>
								<tbody>
								<%
										GestioneAzienda g = new GestioneAzienda();
										List<Voce> listaVoci = g.getAllVoci(cliente.getRubrica());
										session.setAttribute("listaVoci", listaVoci);	
										
										
									%>
								<c:forEach items="${listaVoci}" var="voce">
										<tr>
											<td class="center"><c:out value="${voce.nome}" /></td>
											<td class="center"><c:out value="${voce.cognome}" /></td>
											<td class="center"><c:out value="${voce.telefono}" /></td>
											<td>
												<form action="doFormEditVoce.jsp" method="post">
													<input type="hidden" name="id_voce" value="${voce.id_voce}" />
													<button type="submit" class="btn btn-info">
														<i class="glyphicon glyphicon-edit icon-white"></i>Modifica
													</button>
												</form>
											</td>
											<td>
												<form action="doDeleteVoce.jsp" method="post">
													<input type="hidden" name="id_voce" value="${voce.id_voce}" />
													<button type="submit" class="btn btn-danger">
														<i class="glyphicon glyphicon-trash icon-white"></i>Cancella
													</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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