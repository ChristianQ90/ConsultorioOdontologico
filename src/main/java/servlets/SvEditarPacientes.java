
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
import logica.Paciente;
import logica.Persona;
import logica.Responsable;



@WebServlet(name = "SvEditarPacientes", urlPatterns = {"/SvEditarPacientes"})
public class SvEditarPacientes extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idPacien = Integer.parseInt(request.getParameter("id"));
        
        Paciente pacienteEditar = control.traerPaciente(idPacien);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("pacienteEditar", pacienteEditar);
        
        response.sendRedirect("editarPacientesVerificarNacimiento.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        Date fechaNac = (Date) request.getSession().getAttribute("fechaNac");
        String cuentaConSegMed = request.getParameter("tieneSM");
        boolean tieneSM = false;
        String grupoSang = request.getParameter("grupoSang");
        String idResponsable = request.getParameter("responsable");
        
        //System.out.println(cuentaConSegMed+" GS: "+grupoSang+" IdResp: "+idResponsable);
        if (cuentaConSegMed!=null){
            if(cuentaConSegMed.equalsIgnoreCase("true")){
            tieneSM = true;
            }
        }
        Paciente pacien = (Paciente) request.getSession().getAttribute("pacienteEditar");
        Persona pers = control.traerPersona(pacien.getDni());
        
        control.editarPersona(pers,dni,nombre,apellido,telefono,direccion,fechaNac);
        control.editarPaciente(pacien,dni,nombre,apellido,telefono,direccion,fechaNac,tieneSM,grupoSang,idResponsable);
        
        response.sendRedirect("SvPaciente");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
