
package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Persona;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;




public class ControladoraDePersistencia {
    
    HorarioJpaController horaJPA = new HorarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacJPA = new PacienteJpaController();
    PersonaJpaController persJPA = new PersonaJpaController();
    ResponsableJpaController respJPA = new ResponsableJpaController();
    SecretarioJpaController secreJPA = new SecretarioJpaController();
    TurnoJpaController turnJPA = new TurnoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();

    public ControladoraDePersistencia() {
    }

    
    public void crearUsuario(Usuario usu) {
        usuJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }
    
    public void borrarUsuario(int id){
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuario(int id) {
        return usuJPA.findUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean comprobarExistenciaDeAdmin(String rolUsuario) {
        return usuJPA.existeUsuarioAdmin(rolUsuario);
    }

    public List<Usuario> getUsuariosOdontoSinAsignar() {
        return usuJPA.getUsuariosOdontoSinAsignar();
    }

    public void crearPersona(Persona pers) {
        persJPA.create(pers);
    }

    public Horario crearHorario(Horario horario) {
        return horaJPA.crearHorario(horario);
    }

    public void crearOdontologo(Odontologo odonto) {
        odontoJPA.create(odonto);
    }
 
}
