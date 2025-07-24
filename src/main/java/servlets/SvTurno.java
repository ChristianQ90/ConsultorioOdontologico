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
import logica.Horario;
import logica.Odontologo;
import logica.Usuario;


@WebServlet(name = "SvTurno", urlPatterns = {"/SvTurno"})
public class SvTurno extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate fechaActual = LocalDate.now();
        Date fechaTurno = Date.valueOf(fechaActual);
        List<Odontologo> listaOdontoCompleta = control.getOdontologos();
        List<Horario> listaHorarios = control.getHorarios();
        Odontologo odontoTurnos = null;
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("fechaTurno", fechaTurno);
        miSesion.setAttribute("listaOdontoCompleta", listaOdontoCompleta);
        miSesion.setAttribute("listaHorarios", listaHorarios);
        miSesion.setAttribute("odontoTurnos", odontoTurnos);
        
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
