package com.hackaboss.servlets;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EliminarCitaSv", urlPatterns = {"/EliminarCitaSv"})
public class EliminarCitaSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("idCita"));
        //buscar a la persona en la bd por la id

        Cita cita = control.buscarCita(id);
        String estado = cita.getEstado();
        String fecha = request.getParameter("fecha");
        LocalDate fechaF = LocalDate.parse(fecha);
        
        control.eliminarCita(id);
  
        List<Cita> listaCitas = control.listarCitas(fechaF, estado);
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCitas", listaCitas);

        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
