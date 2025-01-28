package com.hackaboss.logica;

import com.hackaboss.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ControladoraLogica {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearCiudadano(String nombre, String aPaterno, String aMaterno, String curp, String telefono) {
        Ciudadano ciudadano = new Ciudadano(nombre, aPaterno, aMaterno, curp, telefono);
        controlPersis.crearCiudadano(ciudadano);
    }

    public void crearTramite(String nombre, String descripcion) {
        Tramite tramite = new Tramite(nombre, descripcion);
        controlPersis.crearTramite(tramite);
    }

    public Ciudadano traerCiudadanoCurp(String curp) {
        controlPersis.traerCiudadanoCurp(curp);
        return null;
    }

    public void crearCita(LocalDate fechaF, LocalTime horaT, String estado, Ciudadano ciudadano, Usuario usuario, Tramite tramite) {
        Cita cita = new Cita(fechaF, horaT, estado, ciudadano, usuario, tramite);
        controlPersis.crearCita(cita);
    }

    public Tramite traerTramitePorNombre(String nombreTramite) {
        controlPersis.buscarTramitePorNombre(nombreTramite);
        return null;
    }

    public boolean validarAcceso(String email, String password) {

        Usuario usu = controlPersis.buscarUsuario(email);

        if (usu != null) {
            if (usu.getEmail().equals(email)) {
                if (usu.getPassword().equals(password)) {
                    return true;
                }
            }
        }
        return false;

    }

    public void eliminarCiudadano(Long id) {
        controlPersis.eliminarCiudadano(id);
    }

    public List<Ciudadano> buscarPorNombre(String busquedaNombreC) {

        return controlPersis.traerCiudadanos()
                .stream()
                .filter(cid -> cid.getNombre().equals(busquedaNombreC))
                .collect(Collectors.toList());

    }

    public Ciudadano buscarCiudadano(Long id) {
        return controlPersis.traerCiudadano(id);
    }

    public void editarCiudadano(Ciudadano cid) {
        controlPersis.editarCiudadano(cid);
    }

    public List<Tramite> traerTramites() {
        List<Tramite> listaTramites = new ArrayList<>();
        listaTramites = controlPersis.traerTramites();

        return listaTramites;

    }

    public void eliminarTramite(Long id) {
        controlPersis.eliminarTramite(id);
    }

    public Tramite buscarTramite(Long id) {
        return controlPersis.traerTramite(id);

    }

    public void editarTramite(Tramite tramite) {
        controlPersis.editarTramite(tramite);
    }

    public Usuario buscarUsuarioPorEmail(String emailUsu) {
        controlPersis.buscarUsuarioPorEmail(emailUsu);
        return null;

    }

    public List<Cita> listarCitas(LocalDate fechaF, String busquedaEstado) {
        List<Cita> listaCitas = new ArrayList<>();
        listaCitas = controlPersis.listarCitas(fechaF, busquedaEstado);

        return listaCitas;
    }

    public Cita buscarCita(Long id) {
        
        return controlPersis.traerCita(id);
        
   }

    public void eliminarCita(Long id) {
        controlPersis.eliminarCita(id);
    }

    public void editarCita(Cita cita) {
        controlPersis.editarCita(cita);
    }

}
