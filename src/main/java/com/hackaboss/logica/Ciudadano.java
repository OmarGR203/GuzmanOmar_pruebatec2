package com.hackaboss.logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Ciudadano implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(nullable=false)
    private String nombre;
    
    @Column(nullable=false)
    private String aPaterno;
    private String aMaterno;
    
    @Column(nullable=false)
    private String curp;
    
    @Column(nullable=false)
    private String telefono;
    
    public Ciudadano() {
    }

    public Ciudadano(String nombre, String aPaterno, String aMaterno, String curp, String telefono) {
        this.nombre = nombre;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.curp = curp;
        this.telefono = telefono;
       
    }

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getaPaterno() {
        return aPaterno;
    }

    public void setaPaterno(String aPaterno) {
        this.aPaterno = aPaterno;
    }

    public String getaMaterno() {
        return aMaterno;
    }

    public void setaMaterno(String aMaterno) {
        this.aMaterno = aMaterno;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }





   
    
}
