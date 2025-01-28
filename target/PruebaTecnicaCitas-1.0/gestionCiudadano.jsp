
<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Ciudadanos</title>
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
                        <button class="nav-link" style="color:#000000">
                            <i class="bi bi-people"></i> Ciudadanos
                        </button>
                    </form>

                    <form action="gestionTramites.jsp">   
                        <button class="nav-link active" "
                                <i class="bi bi-file-text"></i> Trámites
                        </button>
                    </form> 
                </div>

                <!-- ListarCiudadanos -->
                <div class="container my-5">
                    <h1>Ciudadanos</h1>

                    <div class="d-flex justify-content-end mb-3">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newCitizenModal">Nuevo Ciudadano</button>
                    </div>
                    <!-- Búsqueda-->
                    <form action="CiudadanoSv" method="GET">
                        <div class="form-group">
                            <label for="busquedaNombreC">Buscar por Nombre:</label>
                            <input type="text" class="form-control" id="busquedaNombreC" name="busquedaNombreC">
                        </div> 

                        <button type="submit" class="btn btn-primary">Buscar</button>  
                    </form>

                    <!-- Listar Ciudadanos -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>CURP</th>
                                <th>Nombre</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Telefono</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //traer la lista de Ciudadanos
                                List<Ciudadano> listaCiudadanos = (List) request.getSession().getAttribute("listaCiudadanos");
                                if (listaCiudadanos != null) {

                                    for (Ciudadano cid : listaCiudadanos) {%>

                            <tr>
                                <td><%=cid.getCurp()%></td>
                                <td><%=cid.getNombre()%></td>
                                <td><%=cid.getaPaterno()%></td>
                                <td><%=cid.getaMaterno()%></td>
                                <td><%=cid.getTelefono()%></td>

                                <td style="display: flex; width: 230px;">
                                    <form name="editar" action="EditarCiudadanoSv" method="GET">
                                        <button class="btn btn-sm btn-primary">Editar</button>
                                        <input type="hidden" name="idCiudadano" value="<%=cid.getId()%>">
                                    </form>
                                    <form name="eliminar" action="EliminarCiudadanoSv" method="POST">
                                        <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
                                        <input type="hidden" name="idCiudadano" value="<%=cid.getId()%>">
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                        <%}%>
                    </table>

                </div>


                <!-- Crear Ciudadano -->
                <form action="CiudadanoSv" method="POST">
                    <div class="modal fade" id="newCitizenModal" tabindex="-1" aria-labelledby="newCitizenModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="newCitizenModalLabel">Nuevo Ciudadano</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="newCitizenForm">
                                        <div class="mb-3">
                                            <label for="curp" class="form-label">CURP</label>
                                            <input type="text" class="form-control" id="curp" name="curp" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="nombre" class="form-label">Nombre</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="aPaterno" class="form-label">Apellido Paterno: </label>
                                            <input type="text" class="form-control" id="aPaterno" name="aPaterno" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="aMaterno" class="form-label">Apellido Materno: </label>
                                            <input type="text" class="form-control" id="aMaterno" name="aMaterno" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="telefono" class="form-label">Telefono</label>
                                            <input type="text" class="form-control" id="telefono" name="telefono" required>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">

                                    <button type="submit" class="btn btn-primary">Guardar</button>
                                    </form>
                                    <form action="gestionCiudadanos.jsp">
                                        <button type="submit" class="btn btn-secondary">Cancelar</button>
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
