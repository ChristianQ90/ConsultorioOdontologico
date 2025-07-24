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
import logica.Paciente;


@WebServlet(name = "SvRangoHorarioSeleccionado", urlPatterns = {"/SvRangoHorarioSeleccionado"})
public class SvRangoHorarioSeleccionado extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rangoSeleccionado = request.getParameter("rangoSeleccionado");
        List<Paciente> listaPacientes = control.getPacientes();
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("rangoSeleccionado", rangoSeleccionado);
        miSesion.setAttribute("listaPacientes", listaPacientes);
        
        response.sendRedirect("seleccionDePaciente.jsp");
        
        
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
