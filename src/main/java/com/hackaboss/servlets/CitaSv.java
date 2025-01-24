package com.hackaboss.servlets;

import com.hackaboss.logica.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CitaSv", urlPatterns = {"/CitaSv"})
public class CitaSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fecha = request.getParameter("fecha");
        LocalDate fechaF = LocalDate.parse(fecha);
        
        String hora = request.getParameter("hora");
        LocalTime horaT = LocalTime.parse(hora);
        
        Boolean estado = false;

        String curp = request.getParameter("curp");
        Ciudadano ciudadano = control.traerCiudadano(curp);

        Usuario usuario = control.traerUsuario("admin");

        String nombreTramite = request.getParameter("nombreTramite");
        Tramite tramite = control.traerTramite("nombreTramite");

        control.crearCita(fechaF, horaT, estado, ciudadano, usuario, tramite);
        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
