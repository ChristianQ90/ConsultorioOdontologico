
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;


@WebServlet(name = "SvUsuAdmin", urlPatterns = {"/SvUsuAdmin"})
public class SvUsuAdmin extends HttpServlet {
   
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
        String rolUsuario = request.getParameter("rol");
        control.comprobarExistenciaDeAdmin(rolUsuario);

        // Marcamos en sesión que ya se verificó/creó el admin
        request.getSession().setAttribute("adminVerificado", true);

        response.sendRedirect("login.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
