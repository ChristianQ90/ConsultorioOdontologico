
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Paciente;
import logica.Persona;
import logica.Responsable;


@WebServlet(name = "SvEliminarPacientes", urlPatterns = {"/SvEliminarPacientes"})
public class SvEliminarPacientes extends HttpServlet {
    Controladora control = new Controladora();

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
        
        int id =Integer.parseInt(request.getParameter("id"));
        
        Paciente pacien = control.traerPaciente(id);
        Persona pers = control.traerPersona(pacien.getDni());//Suponiendo que el dni que se ingresa es distinto en cada alta
        
        control.borrarPersona(pers.getId());
        control.borrarPaciente(id);
        
        response.sendRedirect("SvPaciente");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
