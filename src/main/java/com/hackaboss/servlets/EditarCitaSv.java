package com.hackaboss.servlets;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import com.hackaboss.logica.Usuario;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EditarCitaSv", urlPatterns = {"/EditarCitaSv"})
public class EditarCitaSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Long id = Long.parseLong(request.getParameter("idCita"));
        Cita cita = control.buscarCita(id);

        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("citaEditar", cita);

        response.sendRedirect("editarCita.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fecha = request.getParameter("fecha");
        LocalDate fechaF = LocalDate.parse(fecha);

        String hora = request.getParameter("hora");
        LocalTime horaT = LocalTime.parse(hora);
        
        String curp = request.getParameter("curpC");
        Ciudadano ciudadano = control.traerCiudadanoCurp(curp);
        
        String nombreT = request.getParameter("NombreTramite");
        Tramite tramite = control.traerTramitePorNombre("nombreT");
        
        String emailUsu = (String) request.getSession().getAttribute("email");
        Usuario usuario = control.buscarUsuarioPorEmail(emailUsu);
        
        String estado = request.getParameter("estado");
        

        Cita cita = (Cita) request.getSession().getAttribute("citaEditar");

        //modificamos los datos originales con los nuevos EN MEMORIA
        cita.setFecha(fechaF);
        cita.setHora(horaT);
        cita.setCiudadano(ciudadano);
        cita.setTramite(tramite);
        cita.setUsuario(usuario);
        cita.setEstado(estado);

        control.editarCita(cita);

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
