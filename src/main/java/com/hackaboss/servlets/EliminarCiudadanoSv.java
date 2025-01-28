
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


@WebServlet(name = "EliminarCiudadanoSv", urlPatterns = {"/EliminarCiudadanoSv"})
public class EliminarCiudadanoSv extends HttpServlet {
    
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
               
        Long id = Long.parseLong(request.getParameter("idCiudadano"));
          
        Ciudadano ciudadano = control.buscarCiudadano(id);
        String nombre = ciudadano.getNombre();
        control.eliminarCiudadano(id);
          
            
      List<Ciudadano> listaCiudadanos = control.buscarPorNombre(nombre);
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCiudadanos", listaCiudadanos);
        
        response.sendRedirect("gestionCiudadano.jsp");
    }
       
   

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
