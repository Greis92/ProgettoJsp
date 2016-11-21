<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page isELIgnored="false" %>
    
<!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">Main</li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Dipendente/HomePageDipendente.jsp"><i class="glyphicon glyphicon-home"></i><span> Home</span></a>
                        </li>
                         <li><a class="ajax-link" href="${pageContext.request.contextPath}/Dipendente/RegistrazioneNuovaVoce.jsp"><i class="glyphicon glyphicon-plus"></i><span> Nuovo Contatto</span></a>
                         </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Dipendente/ElencoContatti.jsp"><i class="glyphicon glyphicon-book"></i><span> Rubrica</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Dipendente/CercaContatto.jsp"><i class="glyphicon glyphicon-search"></i><span> Cerca Contatto</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Dipendente/ElencoBustePaga.jsp"><i class="glyphicon glyphicon-inbox"></i><span> Bustepaga</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Access/doLogout.jsp"><i class="glyphicon glyphicon-user"></i><span> Logout</span></a>
                        </li>
                    </ul>
                   
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->