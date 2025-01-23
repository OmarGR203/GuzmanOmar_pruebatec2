package com.hackaboss.logica;

import com.hackaboss.persistencia.ControladoraPersistencia;

public class ControladoraLogica {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearCita() {
        throw new UnsupportedOperationException("Not supported yet."); }

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

}
