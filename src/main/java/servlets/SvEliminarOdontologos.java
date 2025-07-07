
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Odontologo;
import logica.Persona;


@WebServlet(name = "SvEliminarOdontologos", urlPatterns = {"/SvEliminarOdontologos"})
public class SvEliminarOdontologos extends HttpServlet {
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
        
        int idOdonto = Integer.parseInt( request.getParameter("id"));

        Odontologo odonto = control.traerOdontologo(idOdonto);
        Persona pers = control.traerPersona(odonto.getDni());
        
        control.borrarPersona(pers.getId());
        control.borrarOdontologo(idOdonto);

        response.sendRedirect("SvOdontologo");
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
