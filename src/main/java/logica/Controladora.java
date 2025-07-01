
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
        System.out.println("svusuAdmin false");
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

}
