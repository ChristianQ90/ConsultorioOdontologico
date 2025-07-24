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
import logica.Odontologo;


@WebServlet(name = "SvLimpiarBusquedaOdonto", urlPatterns = {"/SvLimpiarBusquedaOdonto"})
public class SvLimpiarBusquedaOdonto extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate fechaActual = LocalDate.now();
        Date fechaTurno = Date.valueOf(fechaActual);
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("especialidad", "");
        miSesion.setAttribute("fechaTurno", fechaTurno);
        miSesion.setAttribute("diaTurno", "");
        List<Odontologo> listaOdontoCompleta = control.getOdontologos();
        miSesion.setAttribute("listaOdontoCompleta", listaOdontoCompleta);
        
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
