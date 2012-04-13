<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"   uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" type="text/css">
        <link rel="stylesheet" href="<c:url value='/css/bootstrap-responsive.min.css' />" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-fixed-top" role="navigation">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="i-bar"></span>
                        <span class="i-bar"></span>
                        <span class="i-bar"></span>
                    </a>
                    <a class="brand" href="<c:url value='/' />">Blog</a>
                    <div class="nav-collapse">
                        <ul>
                            <li><a href="<c:url value='/'/>">Inicio</a></li>
                            <li class="active"><a href="<c:url value='/articulo'/>">Articulos</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </nav>
        <h1>Nuevo Artículo</h1>
        
        <c:url var="nuevo" value="/articulo/crea" />
        <form:form action="${nuevo}" method="post" commandName="articulo" >
            <form:errors path="*">
                <div class="alert alert-block alert-error fade in" role="status">
                    <a class="close" data-dismiss="alert">×</a>
                    <c:forEach items="${messages}" var="message">
                        <p>${message}</p>
                    </c:forEach>
                </div>
            </form:errors>
            
            <fieldset>
                <div class="row-fluid">
                    <s:bind path="articulo.titulo">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="titulo">
                                Título <span class="required-indicator">*</span>
                            </label>
                            <form:input path="titulo" maxlength="128" required="true" class="input-large" />
                        </div>
                    </s:bind>
                    <s:bind path="articulo.descripcion">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="descripcion">
                                Descripción <span class="required-indicator">*</span>
                            </label>
                            <form:textarea path="descripcion" required="true" class="input-large" />
                        </div>
                    </s:bind>
                    <s:bind path="articulo.contenido">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="contenido">
                                Contenido <span class="required-indicator">*</span>
                            </label>
                            <form:textarea path="contenido" required="true" class="input-large" />
                        </div>
                    </s:bind>
                    <s:bind path="articulo.autor">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="autor">
                                Autor <span class="required-indicator">*</span>
                            </label>
                            <form:input path="autor" maxlength="128" required="true" class="input-large" />
                        </div>
                    </s:bind>
                </div>
                
                <p class="well" style="margin-top: 10px;">
                    <button type="submit" name="crearBtn" class="btn btn-primary " id="crear" ><i class="icon-ok icon-white"></i>&nbsp;Crear Artículo</button>
                    <a class="btn" href="<s:url value='/articulo'/>"><i class="icon-remove"></i> Cancelar</a>
                </p>
            </fieldset>
            
        </form:form>

        
        <!-- JavaScript at the bottom for fast page loading -->
        <script src="<c:url value='/js/jquery-1.7.2.min.js' />"></script>
        <script src="<c:url value='/js/bootstrap.min.js' />"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("input#titulo").focus(); 
            });
        </script>
    </body>
</html>
