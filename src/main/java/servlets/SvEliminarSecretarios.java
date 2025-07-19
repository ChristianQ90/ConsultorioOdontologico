package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Persona;
import logica.Secretario;

@WebServlet(name = "SvEliminarSecretarios", urlPatterns = {"/SvEliminarSecretarios"})
public class SvEliminarSecretarios extends HttpServlet {
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
        
        int idSecre = Integer.parseInt( request.getParameter("id"));

        Secretario secre = control.traerSecretario(idSecre);
        Persona pers = control.traerPersona(secre.getDni());//Suponiendo que el dni que se ingresa es distinto en cada alta
        
        control.borrarPersona(pers.getId());
        control.borrarSecretario(idSecre);

        response.sendRedirect("SvSecretario");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
