

<%@page import="com.hackaboss.logica.Tramite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edición de Trámite</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
<div class="container mt-4">
            <h1>Actualización de trámite</h1>
            <form action="EditarTramiteSv" method="POST">
                <%Tramite tramite = (Tramite) request.getSession().getAttribute("tramiteEditar");%>

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%=tramite.getNombre()%>">
                </div>  

                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%=tramite.getDescripcion()%>">
                </div> 


                <button type="submit" class="btn btn-primary">Guardar Cambios</button>

            </form>

            <form action="gestionTramites.jsp">
                <button type="submit" class="btn btn-secondary">Cancelar</button>
            </form>
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
