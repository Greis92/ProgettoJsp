<%@page import="gestione.GestioneBustaPaga"%>
<%@page import="bean.BustaPaga"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:useBean id="dipendente" class="bean.Dipendente" scope="session"/>
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

<!--        header di pagina  -->
<jsp:include page="../headerHtml.jsp"></jsp:include>


<%
	if(dipendente.isValid()){
%>

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
        			<li class="active"><a>Elenco Bustepaga</a></li>
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
                    		<h2><i class="glyphicon glyphicon-folder-open"></i> Bustepaga</h2>
                    	</div>
						<div class="box-content">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive">
								<thead>
									<tr>
										<th class="center">Data Emissione</th>
										<th class="center">Ore Lavorate</th>
										<th class="center">Importo</th>
									</tr>
								</thead>
								<tbody>
								<%
									GestioneBustaPaga gBusta = new GestioneBustaPaga();
									List<BustaPaga> bustePaga = gBusta.readBustaDip(dipendente);
									session.setAttribute("bustePaga", bustePaga);
								%>
								<c:forEach items="${bustePaga}" var="bustaPaga">
									<tr>    									
										<td class="center"><c:out value="${bustaPaga.dataEmissione}"/></td>
										<td class="center"><c:out value="${bustaPaga.oreLavorate}"/></td>
										<td class="center"><c:out value="${bustaPaga.importo}"/></td>
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