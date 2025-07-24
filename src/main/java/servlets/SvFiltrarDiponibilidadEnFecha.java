
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
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


@WebServlet(name = "SvFiltrarDiponibilidadEnFecha", urlPatterns = {"/SvFiltrarDiponibilidadEnFecha"})
public class SvFiltrarDiponibilidadEnFecha extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Date fechaTurno =  Date.valueOf(request.getParameter("fechaTurno"));
        
        LocalDate localDate = fechaTurno.toLocalDate();
        String diaSemana = control.pasarFechaADia(localDate);        
        Odontologo odontoSeleccionado = (Odontologo)request.getSession().getAttribute("odontoSeleccionado");
        List<String>rangosHorarios = control.verificarSiOdontoTrabaja(odontoSeleccionado,diaSemana);
        List<Turno> listaTurnos = control.getTurnosEnFechaDeOdonto(fechaTurno, odontoSeleccionado);
        
        String afeccion = request.getParameter("afeccion");
        Turno turnoEditar = (Turno) request.getSession().getAttribute("turnoEditar");
        turnoEditar.setAfeccion(afeccion);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("rangosHorarios", rangosHorarios);
        miSesion.setAttribute("listaTurnos", listaTurnos);
        miSesion.setAttribute("fechaTurno", fechaTurno);
        miSesion.setAttribute("turnoEditar", turnoEditar);
        
        response.sendRedirect("editarTurnos.jsp");
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
