
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;


@WebServlet(name = "SvUsuOdontoSinAsignar", urlPatterns = {"/SvUsuOdontoSinAsignar"})
public class SvUsuOdontoSinAsignar extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        List<Usuario> listaUsuarios = control.getUsuariosOdontoSinAsignar(); 
        
      
        
        HttpSession misession = request.getSession();
        misession.setAttribute("listaUsuOdontoSinAsignar", listaUsuarios);
        
        
        
        response.sendRedirect("altaOdontologo.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
