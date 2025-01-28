package com.hackaboss.servlets;

import com.hackaboss.logica.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EliminarTramiteSv", urlPatterns = {"/EliminarTramiteSv"})
public class EliminarTramiteSv extends HttpServlet {
    
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
        
        Long id = Long.parseLong(request.getParameter("idTramite"));

        control.eliminarTramite(id);
      
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
