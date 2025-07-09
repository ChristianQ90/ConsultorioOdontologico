
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
import logica.Responsable;


@WebServlet(name = "SvEditarResponsables", urlPatterns = {"/SvEditarResponsables"})
public class SvEditarResponsables extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idResp = Integer.parseInt(request.getParameter("id"));
        
        Responsable resp = control.traerResponsable(idResp);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("respEditar", resp);
        
        response.sendRedirect("editarResponsables.jsp");
        
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
        
        Responsable resp = (Responsable) request.getSession().getAttribute("respEditar");
        Persona pers = control.traerPersona(resp.getDni());
        
        pers.setDni(dni);
        pers.setNombre(nombre);
        pers.setApellido(apellido);
        pers.setTelefono(telefono);
        pers.setDireccion(direccion);
        pers.setFecha_nacimiento(fechaNac);
        control.editarPersona(pers);
        
        resp.setDni(pers.getDni());
        resp.setNombre(pers.getNombre());
        resp.setApellido(pers.getApellido());
        resp.setTelefono(pers.getTelefono());
        resp.setDireccion(pers.getDireccion());
        resp.setFecha_nacimiento(pers.getFecha_nacimiento());
        resp.setTipo_responsabilidad(tipo_responsabilidad);
        control.editarResponsable(resp);
        
        response.sendRedirect("SvResponsables");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
