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


@WebServlet(name = "SvProcesarConsultaTurnos", urlPatterns = {"/SvProcesarConsultaTurnos"})
public class SvProcesarConsultaTurnos extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idOdonto = request.getParameter("id");
        Date fechaTurno =  Date.valueOf(request.getParameter("fechaTurno"));
        
        Odontologo odontoTurnos = control.traerOdontologo(idOdonto);
        List<Turno> listaTurnos = control.getTurnosEnFechaDeOdonto(fechaTurno, odontoTurnos);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("odontoTurnos", odontoTurnos);
        miSesion.setAttribute("listaTurnos", listaTurnos);
        miSesion.setAttribute("fechaTurno", fechaTurno);
        
        response.sendRedirect("verTurnos.jsp");
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
