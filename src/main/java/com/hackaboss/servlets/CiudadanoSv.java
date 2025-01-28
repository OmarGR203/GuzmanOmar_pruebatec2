package com.hackaboss.servlets;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CiudadanoSv", urlPatterns = {"/CiudadanoSv"})
public class CiudadanoSv extends HttpServlet {
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String busquedaNombreC = request.getParameter("busquedaNombreC");
        
        
        List<Ciudadano> listaCiudadanos = control.buscarPorNombre(busquedaNombreC);
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCiudadanos", listaCiudadanos);
        
         response.sendRedirect("gestionCiudadano.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String curp = request.getParameter("curp");
        String telefono = request.getParameter("telefono");

        control.crearCiudadano(nombre, aPaterno, aMaterno, curp, telefono);

        
        response.sendRedirect("gestionCiudadano.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
