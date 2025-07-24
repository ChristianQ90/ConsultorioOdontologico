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
import logica.Odontologo;
import logica.Turno;


@WebServlet(name = "SvVerDisponibilidadOdonto", urlPatterns = {"/SvVerDisponibilidadOdonto"})
public class SvVerDisponibilidadOdonto extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idOdonto =  request.getParameter("id");
        Odontologo odontoSeleccionado = control.traerOdontologo(idOdonto);
        List<String>rangosHorarios = control.elaborarRangosHorarios(idOdonto);
        Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
        List<Turno> listaTurnos = control.getTurnosEnFechaDeOdonto(fechaTurno,odontoSeleccionado);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("rangosHorarios", rangosHorarios);
        miSesion.setAttribute("odontoSeleccionado", odontoSeleccionado);
        miSesion.setAttribute("listaTurnos", listaTurnos);
        
        response.sendRedirect("seleccionHorarioTurno.jsp");
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
