package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Persona;
import logica.Secretario;

@WebServlet(name = "SvEditarSecretarios", urlPatterns = {"/SvEditarSecretarios"})
public class SvEditarSecretarios extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idSecre = Integer.parseInt(request.getParameter("id"));
        
        Secretario secreEditar = control.traerSecretario(idSecre);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("secreEditar", secreEditar);
        
        
        response.sendRedirect("SvUsuSecreSinAsignarEdit");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        Date fechaNac = Date.valueOf(request.getParameter("fechaNac"));
        String sector = request.getParameter("sector");
        String idUsuario = request.getParameter("usuario");
        
        Secretario secre = (Secretario) request.getSession().getAttribute("secreEditar");
        Persona pers = control.traerPersona(secre.getDni());
        
        control.editarPersona(pers,dni,nombre,apellido,telefono,direccion,fechaNac);
        control.editarSecretario(secre,dni,nombre,apellido,telefono,direccion,fechaNac,sector,idUsuario);
        
        response.sendRedirect("SvSecretario");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
