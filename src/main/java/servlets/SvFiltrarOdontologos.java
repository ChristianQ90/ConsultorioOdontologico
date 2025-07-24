package servlets;

import java.io.IOException;
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
import logica.Horario;
import logica.Odontologo;


@WebServlet(name = "SvFiltrarOdontologos", urlPatterns = {"/SvFiltrarOdontologos"})
public class SvFiltrarOdontologos extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Date fechaTurno =  Date.valueOf(request.getParameter("fechaTurno"));
        String especialidad = request.getParameter("especialidad");
        List<Odontologo> listaOdontoCompleta = (List<Odontologo>) request.getSession().getAttribute("listaOdontoCompleta");
        
        LocalDate localDate = fechaTurno.toLocalDate();
        String diaSemana = control.pasarFechaADia(localDate);        
        
        List<Odontologo> listaOdontoFiltrada = control.filtrarOdontologosDeLista(listaOdontoCompleta,especialidad,diaSemana);
        List<Horario> listaHorarioFiltrada = control.traerHorariosDeListaFiltrada(listaOdontoFiltrada);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("especialidad", especialidad);
        miSesion.setAttribute("fechaTurno", fechaTurno);
        miSesion.setAttribute("diaTurno", diaSemana);
        miSesion.setAttribute("listaOdontoFiltrada", listaOdontoFiltrada);
        miSesion.setAttribute("listaHorarioFiltrada", listaHorarioFiltrada);
        
        response.sendRedirect("filtrarOdontologos.jsp");
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
