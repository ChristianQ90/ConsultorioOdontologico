
package logica;

import persistencia.ControladoraDePersistencia;


public class Controladora {
    ControladoraDePersistencia controlPersis = new ControladoraDePersistencia();
    
    //Ejemplo
    public void crearUsuario (int id , String nombreUsuario, String contrasenia, String rol){
        Usuario usu = new Usuario(id,nombreUsuario,contrasenia,rol);
        controlPersis.crearUsuario(usu);
    }
}
