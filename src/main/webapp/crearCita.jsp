

<%@page import="com.sun.tools.javac.util.List"%>
<%@page import="com.hackaboss.logica.Tramite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Cita</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <div class="container mt-4">
            <h1>Crear Cita</h1>
            <form action="CitaSv" method="POST">

                <div class="form-group">
                    <label for="fecha">Fecha:</label>
                    <input type="date" class="form-control" id="fecha" name="fecha" required>
                </div>  

                <div class="form-group">
                    <label for="hora">Hora:</label>
                    <input type="time" class="form-control" id="hora" name="hora"required>
                </div> 
                <div class="form-group">
                    <label for="curpCiud">Curp Ciudadano:</label>
                    <input type="text" class="form-control" id="curpCiud" name="curpCiud" required>
                </div> 
                <div class="form-group">
                    <label for="nombreTramite">Tramite:</label>
                    <select class="form-select" id="nombreTramite" name="nombreTramite" required>
                        <option value="">Seleccione un trámite</option> 
                                             <% 
                         //traer la lista de Personas
                        List<Tramite> listaTramites = (List) request.getSession().getAttribute("listaTramites");
                        if (listaTramites!=null) { 
                        
                        for (Tramite trat:listaTramites) { %>
                        <option><%=trat.getNombre()%></option>
                             <% 
                         }
                     %>
                    </select>
                </div> 


                <button type="submit" class="btn btn-primary">Guardar</button>

            </form>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
