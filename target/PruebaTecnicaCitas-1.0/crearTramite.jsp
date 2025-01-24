
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Tramite</title>
    </head>
    <body>
                <div class="container mt-4">
            <h1>Crear Trámite</h1>
            <form action="TramiteSv" method="POST">

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre">
                </div>  

                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion">
                </div> 
         
                <button type="submit" class="btn btn-primary">Guardar</button>

            </form>
        </div>
    </body>
</html>
