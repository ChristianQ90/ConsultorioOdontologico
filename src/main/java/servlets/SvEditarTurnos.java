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
import logica.Odontologo;
import logica.Turno;


@WebServlet(name = "SvEditarTurnos", urlPatterns = {"/SvEditarTurnos"})
public class SvEditarTurnos extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idTurno = request.getParameter("id");
        Turno turnoEditar = control.traerTurno(idTurno);
        String idOdonto = String.valueOf(turnoEditar.getOdonto().getId());
        Odontologo odontoSeleccionado =control.traerOdontologo(idOdonto);
        List<String>rangosHorarios = control.elaborarRangosHorarios(idOdonto);
                
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("turnoEditar", turnoEditar);
        miSesion.setAttribute("odontoSeleccionado", odontoSeleccionado);
        miSesion.setAttribute("rangosHorarios", rangosHorarios);
        
        response.sendRedirect("editarTurnos.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rangoSeleccionado = request.getParameter("rangoSeleccionado");
        Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
        
        Turno turnoEditar = (Turno) request.getSession().getAttribute("turnoEditar");
        turnoEditar.setHora_turno(rangoSeleccionado);
        turnoEditar.setFecha_turno(fechaTurno);
        
        control.editarTurno(turnoEditar);
        
        Odontologo odontoSeleccionado = (Odontologo) request.getSession().getAttribute("odontoTurnos");
        String fechaTurnoS =String.valueOf (fechaTurno);

        response.sendRedirect("SvProcesarConsultaTurnos?id=" + odontoSeleccionado.getId() + "&fechaTurno=" + fechaTurnoS);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
