
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

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nueva Cita</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label class="form-label" for="ciudadano">Ciudadano</label>
                            <input type="text" class="form-control"  id="ciudadano" name="ciudadano" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trámite</label>
                            <select class="form-select" required>
                                <option value="">Seleccione un trámite</option> <!-- traer tramites creados-->
                                <option>Renovación DNI</option>
                                <option>Licencia de Conducir</option>
                                <option>Certificado de Residencia</option>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label" for="fecha">Fecha</label>
                                <input type="date" class="form-control" id="fecha" name="fecha" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label" for="hora">Hora</label>
                                <input type="time" class="form-control" id ="hora" name="hora" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">

                    <form action="index.jsp">
                        <button type="button" class="btn btn-secondary">Cancelar</button>
                    </form>
                    <form action="crearCitaSv" method="POST">
                        <button type="button" class="btn btn-custom">Crear Cita</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
