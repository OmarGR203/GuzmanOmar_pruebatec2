
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Ciudadano</title>
    </head>
    <body>
               <div class="container mt-4">
            <h1>Crear Ciudadano</h1>
            <form action="CiudadanoSv" method="POST">

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre">
                </div>  

                <div class="form-group">
                    <label for="aPaterno">Apellido Paterno:</label>
                    <input type="text" class="form-control" id="aPaterno" name="aPaterno">
                </div> 

                <div class="form-group">
                    <label for="aMaterno">Apelido Materno:</label>
                    <input type="text" class="form-control" id="aMaterno" name="aMaterno">
                </div> 

                <div class="form-group">
                    <label for="curp">Curp:</label>
                    <input type="text" class="form-control" id="curp" name="curp">
                </div> 
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="text" class="form-control" id="telefono" name="telefono">
                </div> 

                <button type="submit" class="btn btn-primary">Guardar</button>

            </form>
        </div>
    </body>
</html>
