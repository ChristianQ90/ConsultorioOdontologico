
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Horario;
import logica.Odontologo;
import logica.Persona;
import logica.Responsable;
import logica.Usuario;


@WebServlet(name = "SvResponsables", urlPatterns = {"/SvResponsables"})
public class SvResponsables extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Responsable> listaResponsables = control.getResponsables();
        
        HttpSession misession = request.getSession();
        misession.setAttribute("listaResponsables", listaResponsables);
        
        response.sendRedirect("verResponsables.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        Date fechaNac =  Date.valueOf(request.getParameter("fechanac"));
        String tipo_responsabilidad = request.getParameter("tipo_responsabilidad");
        
        Persona pers = new Persona();
        pers.setDni(dni);
        pers.setNombre(nombre);
        pers.setApellido(apellido);
        pers.setTelefono(telefono);
        pers.setDireccion(direccion);
        pers.setFecha_nacimiento(fechaNac);
        control.crearPersona(pers);
        
        Responsable resp = new Responsable();
        resp.setDni(pers.getDni());
        resp.setNombre(pers.getNombre());
        resp.setApellido(pers.getApellido());
        resp.setTelefono(pers.getTelefono());
        resp.setDireccion(pers.getDireccion());
        resp.setFecha_nacimiento(pers.getFecha_nacimiento());
        resp.setTipo_responsabilidad(tipo_responsabilidad);
        control.crearResponsable(resp);
        
        response.sendRedirect("index.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
