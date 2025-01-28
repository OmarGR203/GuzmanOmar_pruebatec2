
<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ciudadano</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <div class="container mt-4">
            <h1>Modificación de Ciudadanos</h1>
            <form action="EditarCiudadanoSv" method="POST">
                <%Ciudadano cid = (Ciudadano) request.getSession().getAttribute("ciudadanoEditar");%>

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%=cid.getNombre()%>">
                </div>  

                <div class="form-group">
                    <label for="aPaterno">Apellido Paterno:</label>
                    <input type="text" class="form-control" id="aPaterno" name="aPaterno" value="<%=cid.getaPaterno()%>">
                </div> 

                <div class="form-group">
                    <label for="aMaterno">Apellido Materno:</label>
                    <input type="text" class="form-control" id="aMaterno" name="aMaterno" value="<%=cid.getaMaterno()%>">
                </div>  

                <div class="form-group">
                    <label for="curp">CURP:</label>
                    <input type="text" class="form-control" id="curp" name="curp" value="<%=cid.getCurp()%>">
                </div> 

                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="text" class="form-control" id="telefono" name="telefono" value="<%=cid.getTelefono()%>">
                </div> 

                <button type="submit" class="btn btn-primary">Guardar Cambios</button>

            </form>

            <form action="gestionCiudadano.jsp">
                <button type="submit" class="btn btn-secondary">Cancelar</button>
            </form>
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
