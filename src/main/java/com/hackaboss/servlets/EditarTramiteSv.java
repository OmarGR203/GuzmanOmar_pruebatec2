package com.hackaboss.servlets;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EditarTramiteSv", urlPatterns = {"/EditarTramiteSv"})
public class EditarTramiteSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.parseLong(request.getParameter("idTramite"));
        Tramite tramite = control.buscarTramite(id);

        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("tramiteEditar", tramite);

        response.sendRedirect("editarTramite.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //traemos los datos  modificados de la persona
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        //traemos la persona original sin modificar
        Tramite tramite = (Tramite) request.getSession().getAttribute("tramiteEditar");

        //modificamos los datos originales con los nuevos EN MEMORIA
        tramite.setNombre(nombre);
        tramite.setDescripcion(descripcion);

        control.editarTramite(tramite);

        List<Tramite> listaTramites = control.traerTramites();
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaTramites", listaTramites);

        response.sendRedirect("gestionTramites.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
