
package logica;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Month;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import persistencia.ControladoraDePersistencia;


public class Controladora {
    ControladoraDePersistencia controlPersis = new ControladoraDePersistencia();
    
    //Ejemplo
    public void crearUsuario (String nombreUsuario, String contrasenia, String rol){
        Usuario usu = new Usuario();
        usu.setNombreUsuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        
        controlPersis.crearUsuario(usu);
    }

    public List<Usuario> getUsuarios() {
        return controlPersis.getUsuarios();
        
    }
    
    public void borrarUsuario(int id){
        controlPersis.borrarUsuario(id);
    }

    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public boolean comprobarIngreso(String usuario, String contrasenia) {
        //Lo ideal es hacer la query a la base de datos para traer solo el Usuario y comprobar contraseña
        boolean ingreso = false;
        
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlPersis.getUsuarios();
        
        for(Usuario usu : listaUsuarios){
            if(usu.getNombreUsuario().equals(usuario)){
                if(usu.getContrasenia().equals(contrasenia)){
                    ingreso = true;
                }else{
                    ingreso = false;
                }
            }
        }
        return ingreso;
    }

    public boolean comprobarExistenciaDeAdmin(String rolUsuario) {
        
        boolean existeAdmin = false;
        existeAdmin = controlPersis.comprobarExistenciaDeAdmin(rolUsuario);
        
        if (!existeAdmin){
            Usuario usuAdmin = new Usuario();
            usuAdmin.setNombreUsuario("Admin");
            usuAdmin.setContrasenia("Admin");
            usuAdmin.setRol(rolUsuario);
            controlPersis.crearUsuario(usuAdmin);
            existeAdmin=true;
            System.out.println("svusuAdmin true");
        }
        return existeAdmin;
     }

    public List<Usuario> getUsuariosOdontoSinAsignar() {
        return controlPersis.getUsuariosOdontoSinAsignar();
    }

    public void crearPersona(Persona pers) {
        controlPersis.crearPersona(pers);
    }

    public Horario crearHorario(Horario horario) {
        return controlPersis.crearHorario(horario);
    }

    public void crearOdontologo(Odontologo odonto) {
        controlPersis.crearOdontologo(odonto);
    }

    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologos();
    }

    public List<Horario> getHorarios() {
        return controlPersis.getHorarios();
    }

    public List<Usuario> getUsuariosOdonto() {
        return controlPersis.getUsuariosOdonto();
    }

    public void borrarOdontologo(int idOdonto) {
        controlPersis.borrarOdontologo(idOdonto);
    }

    public Odontologo traerOdontologo(int idOdonto) {
        return controlPersis.traerOdontologo(idOdonto);
    }

    public Persona traerPersona(String dni) {
        return controlPersis.traerPersona(dni);
    }

    public void editarPersona(Persona pers) {
        controlPersis.editarPersona(pers);
    }

    public Horario editarHorario(Horario horario) {
        return controlPersis.editarHorario(horario);
    }

    public void editarOdontologo(Odontologo odonto) {
        controlPersis.editarOdontologo(odonto);
    }

    public void borrarPersona(int idPers) {
        controlPersis.borrarPersona(idPers);
    }

    public void crearResponsable(Responsable resp) {
        controlPersis.crearResponsable(resp);
    }

    public List<Responsable> getResponsables() {
        return controlPersis.getResponsables();
    }

    public void borrarResponsable(int id) {
        controlPersis.borrarResponsable(id);
    }

    public Responsable traerResponsable(int id) {
        return controlPersis.traerResponsable(id);
    }

    public void editarResponsable(Responsable resp) {
        controlPersis.editarResponsable(resp);
    }

    public long verificarEdad(Date fechaNac) {
        LocalDate fechaActual = LocalDate.now();
        //System.out.println(fechaActual);
        String fechaNacString = String.valueOf(fechaNac);
        String [] fechaSplit = fechaNacString.split("-");
        int anio = Integer.parseInt(fechaSplit[0]);
        int mes = Integer.parseInt(fechaSplit[1]);
        int dia = Integer.parseInt(fechaSplit[2]);
        LocalDate fechaNacimiento = LocalDate.of(anio, mes, dia);
        //System.out.println(fechaNacimiento);
        long edad = ChronoUnit.YEARS.between(fechaNacimiento, fechaActual);
        return edad;
    }

    public void crearPaciente(String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac, boolean tieneSM, String grupoSang, String idResponsable) {
        
        Integer idResp = null;
        Responsable respons= null;
        if (idResponsable!= null){
            idResp = Integer.parseInt( idResponsable);
            respons= traerResponsable(idResp);
        }
        
        Paciente pacien = new Paciente();
        pacien.setDni(dni);
        pacien.setNombre(nombre);
        pacien.setApellido(apellido);
        pacien.setTelefono(telefono);
        pacien.setDireccion(direccion);
        pacien.setFecha_nacimiento(fechaNac);
        pacien.setTieneSM(tieneSM);
        pacien.setTipoSangre(grupoSang);
        pacien.setResponsable(respons);
        
        controlPersis.crearPaciente(pacien);
    }

    public List<Responsable> getResponsablesNoAsignados() {
        return controlPersis.getResponsablesNoAsignados();
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes(); 
    }

    public Paciente traerPaciente(int id) {
        return controlPersis.traerPaciente(id);
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }

    public void crearPersona(String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        Persona pers = new Persona();
        pers.setDni(dni);
        pers.setNombre(nombre);
        pers.setApellido(apellido);
        pers.setTelefono(telefono);
        pers.setDireccion(direccion);
        pers.setFecha_nacimiento(fechaNac);
        controlPersis.crearPersona(pers);

    }

    public void editarPaciente(Paciente pacien, String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac, boolean tieneSM, String grupoSang, String idResponsable) {
        Integer idResp = null;
        Responsable respons= null;
        if (idResponsable!= null){
            idResp = Integer.parseInt( idResponsable);
            respons= traerResponsable(idResp);
        }
        
        Paciente paciente = pacien;
        paciente.setDni(dni);
        paciente.setNombre(nombre);
        paciente.setApellido(apellido);
        paciente.setTelefono(telefono);
        paciente.setDireccion(direccion);
        paciente.setFecha_nacimiento(fechaNac);
        paciente.setTieneSM(tieneSM);
        paciente.setTipoSangre(grupoSang);
        paciente.setResponsable(respons);
        
        controlPersis.editarPaciente(paciente);
    }

    public void editarPersona(Persona pers, String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        Persona persona = pers;
        
        persona.setDni(dni);
        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setTelefono(telefono);
        persona.setDireccion(direccion);
        persona.setFecha_nacimiento(fechaNac);
        controlPersis.editarPersona(persona);
    }


}
