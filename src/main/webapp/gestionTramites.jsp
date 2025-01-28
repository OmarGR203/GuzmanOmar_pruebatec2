

<%@page import="java.util.List"%>
<%@page import="com.hackaboss.logica.Tramite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de trámites</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <%
            String usuario = (String) request.getSession().getAttribute("email");
            if (usuario != null) {
        %>

        <div class="barra-superior" style="background-color: #2874a6; color: white;">

            <div class="logo">
                <span>Gobierno del Estado</span>

                <h5>Trámites y Servicios del Estado</h5>
            </div>

            <div class="datos-sesion">
                <p class="m-4">Bienvenido</p> 
                <span class="m-4">Usuario: <%=usuario%></span>|
                <a href="login.jsp" style="color: #ff6b6b;">Cerrar sesión</a>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">

                <!-- Panel de control -->
                <div class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                    <div class="text-white mb-4">
                        <h4>Panel de Control</h4>
                    </div>

                    <form action="index.jsp">
                        <button class="nav-link active" >
                            <i class="bi bi-calendar"></i> Citas
                        </button>
                    </form>

                    <form action="gestionCiudadano.jsp">
                        <button class="nav-link active">
                            <i class="bi bi-people"></i> Ciudadanos
                        </button>
                    </form>

                    <form action="gestionTramites.jsp">   
                        <button class="nav-link " style="color:#000000"
                                <i class="bi bi-file-text"></i> Trámites
                        </button>
                    </form> 
                </div>


                <div class="container my-5">
                    <h1>Trámites</h1>

                    <div class="d-flex justify-content-end mb-3">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newProcedureModal">Nuevo Trámite</button>
                    </div>

                    <!-- Búsqueda-->
                    <form action="TramiteSv" method="GET">
                        <button type="submit" class="btn btn-primary">Listar</button>  
                    </form>


                    <!-- Listar Tramites -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                //traer la lista de Ciudadanos
                                List<Tramite> listaTramites = (List) request.getSession().getAttribute("listaTramites");
                                if (listaTramites != null) {

                                    for (Tramite tramite : listaTramites) {%>


                            <tr>
                                <td><%=tramite.getNombre()%></td>
                                <td><%=tramite.getDescripcion()%></td>
                                
                                <td style="display: flex; width: 230px;">
                                    <form name="editar" action="EditarTramiteSv" method="GET">
                                        <button class="btn btn-sm btn-primary">Editar</button>
                                        <input type="hidden" name="idTramite" value="<%=tramite.getId()%>">
                                    </form>
                                    <form name="eliminar" action="EliminarTramiteSv" method="POST">
                                        <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
                                        <input type="hidden" name="idTramite" value="<%=tramite.getId()%>">
                                    </form>
                                </td>
                            </tr>
                            <%}%>

                        </tbody>
                        <%}%>
                    </table>
                </div>

                <!-- Crear Tramite -->
                <form action="TramiteSv" method="POST">
                    <div class="modal fade" id="newProcedureModal" tabindex="-1" aria-labelledby="newProcedureModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="newProcedureModalLabel">Nuevo Trámite</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="descripcion" class="form-label">Descripción</label>
                                        <textarea class="form-control" id="descripcion" name="descripcion" required></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">

                                    <button type="submit" class="btn btn-primary">Guardar</button>
                                    </form>

                                    <form action="gestionTramites.jsp">
                                        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" class="btn-close">Cancelar</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <% }%>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
