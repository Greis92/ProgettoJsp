<%@page import="bean.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="gestione.GestioneCliente"%>
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

<div class="ch-container">
	<div class="row">

		<!-- left menu starts -->
		<div>
			<div>
				<jsp:include page="MenuLateraleAdmin.jsp"></jsp:include>
			</div>
			
			<%
				if(admin.isValid()){
						%>

		</div>
		<!-- left menu ends -->
		
		<div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
			<div>
    			<ol class="breadcrumb">
  					<li><a href="HomePageAdmin.jsp">Home</a></li>
  					<li class="active">Elenco Clienti</li>
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
                    		<h2><i class="glyphicon glyphicon-folder-open"></i> Elenco Clienti</h2>
                    	</div>
						<div class="box-content">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive">
								<thead>
									<tr>
										<th class="center">Nome</th>
										<th class="center">Cognome</th>
										<th class="center">Username</th>
										<th class="center">Ragione Sociale</th>
										<th class="center">Partita Iva</th>
										<th class="center">Action Edit</th>
										<th class="center">Action Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%
											GestioneCliente gCliente = new GestioneCliente();
										    List <Cliente> lista = gCliente.readAllCliente();										    							
										    int i=0;
										    for(Cliente c: lista){
										%>
										<td class="center"><%=c.getNome() %></td>
										<td class="center"><%=c.getCognome() %></td>
										<td class="center"><%=c.getUsername() %></td>
										<td class="center"><%=c.getRagioneSociale() %></td>
										<td class="center"><%=c.getPartitaIva() %></td>
								<td>
								<form action="EditCliente.jsp" method="post" >
										<input type="hidden" name="id_utente" value=<%=c.getId_utente()%> />
										<button type="submit" class="btn btn-info" >
										<i class="glyphicon glyphicon-edit icon-white"></i>
										Edit</button>
								</form>
								</td>
								<td>
								<form action="doDeleteCliente.jsp" method="post" >
										<input type="hidden" name="id_utente" value=<%=c.getId_utente()%> />
										<button type="submit" class="btn btn-danger" >
										<i class="glyphicon glyphicon-trash icon-white"></i>
										Delete</button>
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