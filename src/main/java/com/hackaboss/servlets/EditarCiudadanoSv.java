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

@WebServlet(name = "EditarCiudadanoSv", urlPatterns = {"/EditarCiudadanoSv"})
public class EditarCiudadanoSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("idCiudadano"));
        Ciudadano cid = control.buscarCiudadano(id);

        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("ciudadanoEditar", cid);

        response.sendRedirect("editarCiudadano.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //traemos los datos  modificados de la persona
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String curp = request.getParameter("curp");
        String telefono = request.getParameter("telefono");

        //traemos la persona original sin modificar
        Ciudadano cid = (Ciudadano) request.getSession().getAttribute("ciudadanoEditar");

        //modificamos los datos originales con los nuevos EN MEMORIA
        cid.setNombre(nombre);
        cid.setaPaterno(aPaterno);
        cid.setaMaterno(aMaterno);
        cid.setCurp(curp);
        cid.setTelefono(telefono);

        control.editarCiudadano(cid);

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
