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
import logica.Odontologo;
import logica.Paciente;


@WebServlet(name = "SvConfirmarTurno", urlPatterns = {"/SvConfirmarTurno"})
public class SvConfirmarTurno extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idPacien = request.getParameter("id");
        
        Paciente pacienteSeleccionado = control.traerPaciente(idPacien);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("pacienteSeleccionado", pacienteSeleccionado);
        
        response.sendRedirect("confirmarTurno.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Aqui confirmamos y persistimos el turno y redirigimos a seleccionHorarioTurno.jsp
        String afeccion = request.getParameter("afeccion");
        Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
        String rangoSeleccionado = (String)request.getSession().getAttribute("rangoSeleccionado");
        Odontologo odontoSeleccionado =(Odontologo) request.getSession().getAttribute("odontoSeleccionado");
        Paciente pacienteSeleccionado = (Paciente) request.getSession().getAttribute("pacienteSeleccionado");
        boolean existeTurnoEnRango = control.verificarExistenciaTurno(fechaTurno,rangoSeleccionado,odontoSeleccionado);
        if(!existeTurnoEnRango){
            control.crearTurno(afeccion,fechaTurno,rangoSeleccionado,odontoSeleccionado,pacienteSeleccionado);
            response.sendRedirect("SvVerDisponibilidadOdonto?id=" + odontoSeleccionado.getId());
        }else{
            response.sendRedirect("turnoNoAsignado.jsp");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
