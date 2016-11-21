<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page isELIgnored="false" %>
    
   <jsp:useBean id="cliente" class="bean.Cliente" scope="session"></jsp:useBean>
    
	<!--        header di pagina  -->
	<jsp:include page="../headerHtml.jsp"></jsp:include>
    
    <!-- nav bar starts -->
    <jsp:include page="navBarCliente.jsp"></jsp:include>
    
    
	<%
    	if(cliente.isValid()){
    		
    %>


    <div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <jsp:include page="MenuLateraleCliente.jsp"></jsp:include>
        <!-- left menu ends -->

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
  				<h1>Welcome, ${cliente.nome}!</h1>
  					<p>Benvenuto nel portale Cliente.</p>  
			</div>

    
</div><!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

  
    

    <hr>

    <jsp:include page="../footerHtml.jsp"></jsp:include>
    

</div><!--/.fluid-container-->
<%

    }else{
    	response.sendRedirect(request.getContextPath()+"/Access/Login.jsp");
    }

%>

<!--      includo tutti script di sotto -->
<jsp:include page="../IncludeScriptEnd.jsp"></jsp:include>