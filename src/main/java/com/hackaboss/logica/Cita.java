
package com.hackaboss.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.persistence.*;

@Entity        
public class Cita implements Serializable {
    
     @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(nullable=false)
    private LocalDate fecha;
    
    @Column(nullable=false)
    private LocalTime hora;
    
    @Column(nullable=false)
    private String estado;
    
    @ManyToOne
    @JoinColumn(name= "Ciudadano_id", nullable=false)
    private Ciudadano ciudadano;
    
    @ManyToOne
    @JoinColumn(name= "Ususario_id")
    private Usuario usuario;
    
    @ManyToOne
    @JoinColumn(name= "Tramite_id", nullable=false)
    private Tramite tramite;
    

    public Cita() {
    }

    public Cita(LocalDate fecha, LocalTime hora, String estado, Ciudadano ciudadano, Usuario usuario, Tramite tramite) {
        this.fecha = fecha;
        this.hora = hora;
        this.estado = estado;
        this.ciudadano = ciudadano;
        this.usuario = usuario;
        this.tramite = tramite;
    }
    
    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Tramite getTramite() {
        return tramite;
    }

    public void setTramite(Tramite tramite) {
        this.tramite = tramite;
    }
    
    

}
