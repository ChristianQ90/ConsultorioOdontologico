package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Odontologo;


@WebServlet(name = "SvEliminarTurnos", urlPatterns = {"/SvEliminarTurnos"})
public class SvEliminarTurnos extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Odontologo odontoSeleccionado = (Odontologo) request.getSession().getAttribute("odontoTurnos");
        String fechaTurno =String.valueOf (request.getSession().getAttribute("fechaTurno"));
        String idTurno =request.getParameter("id");
        control.borrarTurno(idTurno);
        response.sendRedirect("SvProcesarConsultaTurnos?id=" + odontoSeleccionado.getId() + "&fechaTurno=" + fechaTurno);

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
