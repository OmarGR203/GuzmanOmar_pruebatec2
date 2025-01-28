package com.hackaboss.servlets;

import com.hackaboss.logica.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CitaSv", urlPatterns = {"/CitaSv"})
public class CitaSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String busquedaEstado = request.getParameter("busquedaNombreC");
        String busquedaFecha = request.getParameter("busquedafecha");
        LocalDate fechaF = LocalDate.parse(busquedaFecha);
        

        List<Cita> listaCitas = control.listarCitas(fechaF, busquedaEstado);
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCitas", listaCitas);

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fecha = request.getParameter("fecha");
        LocalDate fechaF = LocalDate.parse(fecha);

        String hora = request.getParameter("hora");
        LocalTime horaT = LocalTime.parse(hora);

        String estado = "En espera";

        String curp = request.getParameter("curp");
        Ciudadano ciudadano = control.traerCiudadanoCurp(curp);
        


        String emailUsu = (String) request.getSession().getAttribute("email");
        Usuario usuario = control.buscarUsuarioPorEmail(emailUsu);

        String nombreTramite = request.getParameter("nombreTramite");
        Tramite tramite = control.traerTramitePorNombre("nombreTramite");

        control.crearCita(fechaF, horaT, estado, ciudadano, usuario, tramite);
        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
