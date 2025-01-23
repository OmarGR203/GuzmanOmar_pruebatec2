
package com.hackaboss.servlets;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.ControladoraLogica;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ListaCitasSv", urlPatterns = {"/ListaCitasSv"})
public class ListaCitasSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                
        String busquedafecha = request.getParameter("listaCitas");
        

        
         response.sendRedirect("index.jsp");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
