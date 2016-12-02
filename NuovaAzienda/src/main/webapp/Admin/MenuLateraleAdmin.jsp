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
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/HomePageAdmin.jsp"><i class="glyphicon glyphicon-home"></i><span> Home</span></a>
                        </li>
                         <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/RegistrazioneNuovoCliente.jsp"><i class="glyphicon glyphicon-plus"></i><span> Nuovo Cliente</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/RegistrazioneNuovoDipendente.jsp"><i class="glyphicon glyphicon-plus"></i><span> Nuovo Dipendente</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/ElencoClienti.jsp"><i class="glyphicon glyphicon-list"></i><span> Elenco Clienti</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/ElencoDipendenti.jsp"><i class="glyphicon glyphicon-list"></i><span> Elenco Dipendenti</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/NuovaBustaPaga.jsp"><i class="glyphicon glyphicon-pencil"></i><span> Nuova Bustapaga</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Admin/ElencoBustePaga.jsp"><i class="glyphicon glyphicon-list-alt"></i><span> Elenco Bustepaga</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/Access/doLogout.jsp"><i class="glyphicon glyphicon-user"></i><span> Logout</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->