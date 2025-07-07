
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
import logica.Horario;
import logica.Odontologo;
import logica.Persona;
import logica.Usuario;


@WebServlet(name = "SvEditarOdontologos", urlPatterns = {"/SvEditarOdontologos"})
public class SvEditarOdontologos extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idOdonto = Integer.parseInt(request.getParameter("id"));
        
        Odontologo odontoEditar = control.traerOdontologo(idOdonto);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("odontoEditar", odontoEditar);
        
        
        response.sendRedirect("SvUsuOdontoSinAsignarEdit");
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        Date fechaNac =  Date.valueOf(request.getParameter("fechanac"));
        String especialidad = request.getParameter("especialidad");
        String horaInicio = request.getParameter("horaInicio");
        String horaFin = request.getParameter("horaFin");
        String[] diasAtencion = request.getParameterValues("diasAtencion");
        String diasConcat = "";
        int usuarioID = Integer.parseInt(request.getParameter("usuario"));
        
        if (diasAtencion != null) {
            for (String dia : diasAtencion) {     
                diasConcat += dia+" ";
            }
        } else {
            System.out.println("No se seleccionaron dias.");
        } 
        /*System.out.println("Dni:"+dni+"\nnombre:"+nombre+"\napellido:"+apellido+"\ntelefono:"+telefono+"\ndireccion:"+direccion+
                "\nfecha de nacimiento:"+fechaNac+"\nespecialidad:"+especialidad+"\nHora de inicio:"+horaInicio+"\nHora de fin:"+horaFin+
                "\nID de Usuario: "+usuarioID);
        System.out.println("dias concat : "+diasConcat);*/
        Usuario usuario = control.traerUsuario(usuarioID);
        
        Odontologo odonto = (Odontologo) request.getSession().getAttribute("odontoEditar");
        
        Persona pers = control.traerPersona(odonto.getDni());
        pers.setDni(dni);
        pers.setNombre(nombre);
        pers.setApellido(apellido);
        pers.setTelefono(telefono);
        pers.setDireccion(direccion);
        pers.setFecha_nacimiento(fechaNac);
        control.editarPersona(pers);
        
        Horario horario = odonto.getUnHorario();
        horario.setDias_atencion(diasConcat);
        horario.setHorario_incio(horaInicio);
        horario.setHorario_fin(horaFin);
        horario = control.editarHorario(horario); // persistimos y obtenemos el persistido con ID.
        
        System.out.println("horario ID : "+horario.getId_horario()+" , usuario ID: "+usuario.getId_usuario());
   

        odonto.setDni(pers.getDni());
        odonto.setNombre(pers.getNombre());
        odonto.setApellido(pers.getApellido());
        odonto.setTelefono(pers.getTelefono());
        odonto.setDireccion(pers.getDireccion());
        odonto.setFecha_nacimiento(pers.getFecha_nacimiento());
        odonto.setEspecialidad(especialidad);
        odonto.setUnHorario(horario);
        odonto.setUnUsuario(usuario);
        control.editarOdontologo(odonto);
        
        response.sendRedirect("SvOdontologo");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
