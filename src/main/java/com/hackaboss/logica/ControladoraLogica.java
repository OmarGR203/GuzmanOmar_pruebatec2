
package com.hackaboss.logica;

import com.hackaboss.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.time.LocalTime;


public class ControladoraLogica {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearCiudadano(String nombre, String aPaterno, String aMaterno, String curp, String telefono) {
            Ciudadano ciudadano = new Ciudadano (nombre, aPaterno, aMaterno, curp, telefono); 
        controlPersis.crearCiudadano(ciudadano);
    }

    public void crearTramite(String nombre, String descripcion) {
        Tramite tramite = new Tramite (nombre, descripcion); 
        controlPersis.crearTramite(tramite);
   }



    public Usuario traerUsuario(String admin) {
        controlPersis.traerUsuario(admin);
        return null;
        
    }

    public Ciudadano traerCiudadano(String curp) {
        controlPersis.traerCiudadano(curp);
        return null;
   }

    public void crearCita(LocalDate fechaF, LocalTime horaT, Boolean estado, Ciudadano ciudadano, Usuario usuario, Tramite tramite) {
        Cita cita = new Cita(fechaF, horaT, estado, ciudadano, usuario, tramite);
        controlPersis.crearCita(cita);
    }

    public Tramite traerTramite(String nombreTramite) {
        controlPersis.traerTramite(nombreTramite);
        return null;
    }
    
}
