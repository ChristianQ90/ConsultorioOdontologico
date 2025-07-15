
package servlets;

import java.io.IOException;
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


@WebServlet(name = "SvPaciente", urlPatterns = {"/SvPaciente"})
public class SvPaciente extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Paciente> listaPacientes = control.getPacientes();
        
        HttpSession misession = request.getSession();
        misession.setAttribute("listaPacientes", listaPacientes);
        
        response.sendRedirect("verPacientes.jsp");
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
        control.crearPersona(dni,nombre,apellido,telefono,direccion,fechaNac);
        control.crearPaciente(dni,nombre,apellido,telefono,direccion,fechaNac,tieneSM,grupoSang,idResponsable);

        response.sendRedirect("index.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
