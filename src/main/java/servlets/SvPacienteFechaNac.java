
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
import logica.Responsable;


@WebServlet(name = "SvPacienteFechaNac", urlPatterns = {"/SvPacienteFechaNac"})
public class SvPacienteFechaNac extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Responsable> listaResponsables= null;
        Date fechaNac =  Date.valueOf(request.getParameter("fechanac"));
        
        long edadPaciente = control.verificarEdad(fechaNac);
        if (edadPaciente >=0 && edadPaciente<18){
            listaResponsables = control.getResponsablesNoAsignados();
        }
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("fechaNac", fechaNac);
        miSesion.setAttribute("edadPaciente", edadPaciente);
        miSesion.setAttribute("listaResponsables", listaResponsables);
        response.sendRedirect("altaPaciente.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Responsable> listaResponsables= null;
        Date fechaNac =  Date.valueOf(request.getParameter("fechanac"));
        Paciente pacienteEditar = (Paciente)request.getSession().getAttribute("pacienteEditar");
        
        long edadPaciente = control.verificarEdad(fechaNac);
        if (edadPaciente >=0 && edadPaciente<18){
            listaResponsables = control.getResponsablesNoAsignados();
        }else{
            Responsable resp = null;
            pacienteEditar.setResponsable(resp);
        }
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("fechaNac", fechaNac);
        miSesion.setAttribute("edadPaciente", edadPaciente);
        miSesion.setAttribute("listaResponsables", listaResponsables);
        miSesion.setAttribute("pacienteEditar", pacienteEditar);
        response.sendRedirect("editarPacientes.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
