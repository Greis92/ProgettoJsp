<%@page import="bean.BustaPaga"%>
<%@page import="java.util.List"%>
<%@page import="gestione.GestioneBustaPaga"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="admin" class="bean.Admin" scope="session"></jsp:useBean>
<jsp:useBean id="messaggio" class="utility.MessaggioErrore" scope="request" />

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
  					<li class="active">Elenco Bustepaga</li>
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
                    		<h2><i class="glyphicon glyphicon-folder-open"></i> Elenco Bustepaga</h2>
                    	</div>
						<div class="box-content">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive">
								<thead>
									<tr>
										<th class="center">Dipendente</th>
										<th class="center">Data Emissione</th>
										<th class="center">Ore lavorate</th>
										<th class="center">Importo</th>
										<th class="center">Action Edit</th>
										<th class="center">Action Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%
											GestioneBustaPaga gBusta = new GestioneBustaPaga();
										    List <BustaPaga> lista = gBusta.readAll();										    							
										    int i=0;
										    for(BustaPaga b: lista){
										%>
										<td class="center"><%=b.getNomeCognome() %></td>
										<td class="center"><%=b.getDataEmissione() %></td>
										<td class="center"><%=b.getOreLavorate() %></td>
										<td class="center"><%=b.getImporto() %></td>
								<td>
								<form action="EditBustaPaga.jsp" method="post" >
										<input type="hidden" name="idBustaPaga" value=<%=b.getIdBustaPaga()%> />
										<button type="submit" class="btn btn-info" >
										<i class="glyphicon glyphicon-edit icon-white"></i>Edit
										</button>
								</form>
								</td>
								<td>
								<form action="doDeleteBustaPaga.jsp" method="post" >
										<input type="hidden" name="idBustaPaga" value=<%=b.getIdBustaPaga()%> />
										<button type="submit" class="btn btn-danger" >
										<i class="glyphicon glyphicon-trash icon-white"></i>Delete
										</button>
								</form>
								</td>
									</tr>
										<%
    								i++;
    							}
    							%>
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