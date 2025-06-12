
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
}
