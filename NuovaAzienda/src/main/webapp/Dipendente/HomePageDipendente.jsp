<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<jsp:useBean id="dipendente" class="bean.Dipendente" scope="session"></jsp:useBean>

<!--        header di pagina  -->
<jsp:include page="../headerHtml.jsp"></jsp:include>

<!-- nav bar starts -->
<jsp:include page="navBarDipendente.jsp"></jsp:include>


<%
    	if(dipendente.isValid()){
    		
    %>


<div class="ch-container">
	<div class="row">

		<!-- left menu starts -->
		<jsp:include page="MenuLateraleDipendente.jsp"></jsp:include>
		<!-- left menu ends -->
		
		<div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
           <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
           <div>
    			<ol class="breadcrumb">
        			<li class="active">
            			<a>Home </a>
        			</li>
       
    			</ol>
			</div>

		<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<div class="jumbotron">
  				<h1>Welcome, ${dipendente.nome}!</h1>
  					<p>Benvenuto nel portale Dipendente.</p>  
			</div>



			</div>
			<!-- content ends -->
		</div>
		<!--/#content.col-md-0-->
	</div>
	<!--/fluid-row-->
</div>



	<hr>

	<jsp:include page="../footerHtml.jsp"></jsp:include>


</div>
<!--/.fluid-container-->
<%

    }else{
    	response.sendRedirect(request.getContextPath()+"/Access/Login.jsp");
    }

%>

<!--      includo tutti script di sotto -->
<jsp:include page="../IncludeScriptEnd.jsp"></jsp:include>