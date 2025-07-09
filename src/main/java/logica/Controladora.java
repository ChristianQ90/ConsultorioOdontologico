
package logica;

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

}
