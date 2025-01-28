
<%@page import="com.hackaboss.logica.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Principal</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/styles.css"/>

    </head>
    <body>  
        <!-- Barra superior-->
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
                    <nav class="nav flex-column">
                        <form action="index.jsp">
                            <button class="nav-link" style="color:#000000">
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
                </div>

                <!-- crear cita -->
                <div class="col-md-9 col-lg-10 ms-sm-auto px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h1> Citas</h1>


                        <form action="crearCita.jsp">
                            <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="crearCita">
                                + Nueva Cita
                            </button>
                        </form> 
                    </div>


                    <!-- Filtros -->
                    <form action="CitaSv" method="POST">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <input type="date" class="form-control" id="busquedaFecha" name="busquedaFecha" placeholder="Fecha">
                                    </div>


                                    <div class="form-group">
                                        <label for="busquedaEstado" >Estado:</label>
                                        <input type="text" class="form-control" id="busquedaEstado" name="busquedaEstado" placeholder="En Espera - Atendido">
                                    </div> 

                                    <button type="submit" class="btn btn-primary">Buscar</button> 

                                </div>
                            </div>
                        </div>
                    </form> 

                    <!-- Tabla de resultados -->
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>

                                        <tr>
                                            <th>CITA</th>
                                            <th>CURP</th>
                                            <th>TRÁMITE</th>
                                            <th>FECHA</th>
                                            <th>HORA</th>
                                            <th>ESTADO</th>
                                            <th>ACCIONES</th>

                                        </tr>

                                    </thead>
                                    <tbody>
                                        <%
                                            //traer la lista de Citas
                                            List<Cita> listaCitas = (List) request.getSession().getAttribute("listaCitas");
                                            if (listaCitas != null) {

                                                for (Cita cita : listaCitas) {%>

                                        <tr>
                                            <td><%=cita.getId()%></td>
                                            <td><%=cita.getCiudadano().getCurp()%></td>
                                            <td><%=cita.getTramite().getNombre()%></td>
                                            <td><%=cita.getFecha()%></td>
                                            <td><%=cita.getHora()%></td>
                                            <td><%=cita.getEstado()%></td>

                                            <td style="display: flex; width: 230px;">
                                                <form name="editar" action="EditarCitaSv" method="GET">
                                                    <button class="btn btn-sm btn-primary">Editar</button>
                                                    <input type="hidden" name="idCita" value="<%=cita.getId()%>">
                                                </form>
                                                <form name="eliminar" action="EliminarCitaSv" method="POST">
                                                    <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
                                                    <input type="hidden" name="idCita" value="<%=cita.getId()%>">
                                                </form>
                                            </td>
                                        </tr>

                                        <%}%>
                                    </tbody>
                                    <%}%>
                                </table>

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
