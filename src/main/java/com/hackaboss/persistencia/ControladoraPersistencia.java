
package com.hackaboss.persistencia;

import com.hackaboss.logica.*;


public class ControladoraPersistencia {
    
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    CitaJpaController citaJpa = new CitaJpaController();
    TramiteJpaController tramiteJpa = new TramiteJpaController();
    UsuarioJpaController usuarioJpa = new UsuarioJpaController();

    public void crearCiudadano(Ciudadano ciudadano) {
        ciudadanoJpa.create(ciudadano);
    }

    public void crearTramite(Tramite tramite) {
        tramiteJpa.create(tramite);
    }

    public Usuario traerUsuario(String admin) {
         return usuarioJpa.findUserAdmin(admin);
   }

    public Ciudadano traerCiudadano(String curp) {
        
     return ciudadanoJpa.findCiudadanoByCurp(curp);
        
    }

    public void crearCita(Cita cita) {
        citaJpa.create(cita);
   }

    public Tramite traerTramite(String nombreTramite) {
        
     return ciudadanoJpa.findTramitebyNombre(nombreTramite);
        
    }


    
}
