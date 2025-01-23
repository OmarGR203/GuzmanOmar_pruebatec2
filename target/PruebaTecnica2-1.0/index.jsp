
<%@page import="com.hackaboss.logica.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Principal</title>
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
                <!-- Panel de control -->
                <div class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                    <div class="text-white mb-4">
                        <h4>Panel de Control</h4>
                    </div>

                    <form action="index.jsp">
                        <nav class="nav flex-column">
                            <button class="nav-link">
                                <i class="bi bi-calendar"></i> Citas
                            </button>
                    </form>

                    <form action="gestionCiudadano.jsp">
                        <button class="nav-link active">
                            <i class="bi bi-people"></i> Ciudadanos
                        </button>
                    </form>

                    <form action="gestionTramites.jsp">   
                        <button class="nav-link active">
                            <i class="bi bi-file-text"></i> Trámites
                        </button>
                    </form> 

                    </nav>
                </div>

                <!-- crear cita -->
                <div class="col-md-9 col-lg-10 ms-sm-auto px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Gestión de Citas</h2>

                        <form action="crearCita.jsp">
                            <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="crearCita">
                                + Nueva Cita
                            </button>
                        </form> 
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <h5 class="card-title">Citas Hoy</h5>
                                    <h2 class="mb-0">24</h2> <!-- traercitas -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <h5 class="card-title">En Espera</h5>
                                    <h2 class="mb-0">12</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <h5 class="card-title">Atendidos</h5>
                                    <h2 class="mb-0">8</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Filters -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <input type="date" class="form-control" placeholder="Fecha">
                                </div>
                                <div class="col-md-4">
                                    <select class="form-select">
                                        <option value="">Todos los estados</option>
                                        <option value="espera">En espera</option>
                                        <option value="atendidos">Atendidos</option>
                                    </select>
                                </div>
                                
                                    <form action="ListaCitasSv" method="POST">
                                        <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="crearCita">
                                            buscar
                                        </button>
                                    </form> 
                              
                            </div>
                        </div>
                    </div>

                    <!-- Appointments Table -->
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>CITA</th>
                                            <th>CIDADANO</th>
                                            <th>CURP</th>
                                            <th>Trámite</th>
                                            <th>Fecha y Hora</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <td>María González</td>
                                    <td>Renovación DNI</td>
                                    <td>2025-01-21 09:00</td>
                                    <td><span class="status-badge status-waiting">En espera</span></td>
                                    <td>
                                        <form name="editar" action="EditarCitaSv" method="GET">
                                            <button class="  btn btn-sm btn-outline-primary">Editar</button>
                                            <input type="hidden" name="idCita" value="idCita">
                                        </form>
                                        <form name="editar" action="EditarCitaSv" method="GET">
                                            <button class=" btn btn-sm btn-outline-success">Eliminar</button>
                                        </form>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>#002</td>
                                        <td>Carlos Rodríguez</td>
                                        <td>Licencia de Conducir</td>
                                        <td>2025-01-21 09:30</td>
                                        <td><span class="status-badge status-completed">Atendido</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">Editar</button>
                                            <button class="btn btn-sm btn-outline-success">Eliminar</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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
