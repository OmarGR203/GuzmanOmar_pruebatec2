
package com.hackaboss.persistencia;

import com.hackaboss.logica.Usuario;

public class ControladoraPersistencia {
    
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    CitaJpaController citaJpa = new CitaJpaController();
    TramiteJpaController tramiteJpa = new TramiteJpaController();
    UsuarioJpaController usuarioJpa = new UsuarioJpaController();

    public Usuario buscarUsuario(String email) {
        return usuarioJpa.findUserByEmail(email);
        
    }
    
    
    
    
}
