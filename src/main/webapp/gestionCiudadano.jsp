
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
        <div class="barra-superior" style="background-color: #2874a6; color: white;">

            <div class="logo">
                <span>Gobierno del Estado</span>

                <h5>Trámites y Servicios del Estado</h5>
            </div>

            <div class="datos-sesion">
                <p class="m-4">Bienvenido</p>

                <span class="m-4">Usuario:</span>
                <br>

                <a style="color:#A9A9A9;">Cerrar sesión</a>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                    <div class="text-white mb-4">
                        <h4>Panel de Control</h4>
                    </div>

                    <form action="index.jsp">
                        <nav class="nav flex-column active">
                            <button class="nav-link">
                                <i class="bi bi-calendar"></i> Citas
                            </button>
                    </form>

                    <form action="gestionCiudadano.jsp">
                        <button class="nav-link">
                            <i class="bi bi-people"></i> Ciudadanos
                        </button>
                    </form>

                    <form action="gestionTramites.jsp">   
                        <button class="nav-link active">
                            <i class="bi bi-file-text"></i> Trámites
                        </button>
                    </form> 

                    </nav>

                    <div class="container my-5">
                        <h1>Ciudadanos</h1>

                        <div class="d-flex justify-content-end mb-3">
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newCitizenModal">Nuevo Ciudadano</button>
                        </div>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>CURP</th>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="citizen" items="">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" onclick="">Editar</button>
                                        <button class="btn btn-sm btn-danger" onclick="')">Eliminar</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- New Citizen Modal -->
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
                                            <label for="name" class="form-label">Nombre</label>
                                            <input type="text" class="form-control" id="name" name="name" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="surname" class="form-label">Apellidos</label>
                                            <input type="text" class="form-control" id="surname" name="surname" required>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-primary" onclick="createCitizen()">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
