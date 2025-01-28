
package com.hackaboss.persistencia;

import com.hackaboss.logica.*;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


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


    public Ciudadano traerCiudadanoCurp(String curp) {
        
     return ciudadanoJpa.findCiudadanoByCurp(curp);
        
    }

    public void crearCita(Cita cita) {
        citaJpa.create(cita);
   }

    public Tramite buscarTramitePorNombre(String nombreTramite) {
        
     return ciudadanoJpa.findTramitebyNombre(nombreTramite);
        
    }

    public Usuario buscarUsuario(String email) {
        return usuarioJpa.findUserByEmail(email); 
   }

    public void eliminarCiudadano(Long id) {
     try {
            ciudadanoJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public List<Ciudadano> traerCiudadanos() {
          return ciudadanoJpa.findCiudadanoEntities();
   }

    public Ciudadano traerCiudadano(Long id) {
        return ciudadanoJpa.findCiudadano(id);
    }

    public void editarCiudadano(Ciudadano cid) {
        try {
            ciudadanoJpa.edit(cid);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
   }

    public List<Tramite> traerTramites() {
        return tramiteJpa.findTramiteEntities();
   }

    public void eliminarTramite(Long id) {
        try {
            tramiteJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
  }

    public Tramite traerTramite(Long id) {
        return tramiteJpa.findTramite(id);
 }

    public void editarTramite(Tramite tramite) {
        try {
            tramiteJpa.edit(tramite);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
  }

    public Usuario buscarUsuarioPorEmail(String emailUsu) {
        return usuarioJpa.findUserByEmail(emailUsu);
   }

    public List<Cita> listarCitas(LocalDate busquedaFecha, String busquedaEstado) {
        
        return citaJpa.findCitasByFilters(busquedaFecha,busquedaEstado);
   }

    public Cita traerCita(Long id) {
        
        return citaJpa.findCita(id);
    }

    public void eliminarCita(Long id) {
        try {
            citaJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarCita(Cita cita) {
        try {
            citaJpa.edit(cita);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }






    
}
