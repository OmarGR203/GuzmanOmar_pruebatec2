
<%@page import="com.hackaboss.logica.Cita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cita</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <div class="container mt-4">
            <h1>Modificación de Cita</h1>
            <form action="EditarCiudadanoSv" method="POST">
                <%Cita cita = (Cita) request.getSession().getAttribute("citaEditar");%>

                <div class="form-group">
                    <label for="fecha">Fecha: </label>
                    <input type="date" class="form-control" id="fecha" name="fecha" required value="<%=cita.getFecha()%>">
                </div>  

                <div class="form-group">
                    <label for="hora">Hora:</label>
                    <input type="time" class="form-control" id="hora" name="hora" value="<%=cita.getHora()%>">
                </div> 

                <div class="form-group">
                    <label for="curpC">Curp Ciudadano:</label>
                    <input type="text" class="form-control" id="curpC" name="curpC" value="<%=cita.getCiudadano().getCurp()%>">
                </div>  

                <div class="form-group">
                    <label for="NombreTramite">Tramite</label>
                    <input type="text" class="form-control" id="NombreTramite" name="NombreTramite" value="<%=cita.getTramite().getNombre()%>">
                </div> 

                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <input type="text" class="form-control" id="estado" name="estado" placeholder="En Espera - Atendido" value="<%=cita.getEstado()%>">
                </div> 
                
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>

            </form>

            <form action="index.jsp">
                <button type="submit" class="btn btn-secondary">Cancelar</button>
            </form>
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
