
package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Persona;
import logica.Responsable;
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

    public List<Odontologo> getOdontologos() {
        return odontoJPA.findOdontologoEntities();
    }

    public List<Horario> getHorarios() {
        return horaJPA.findHorarioEntities();
    }

    public List<Usuario> getUsuariosOdonto() {
        return usuJPA.getUsuariosOdonto();
    }

    public void borrarOdontologo(int idOdonto) {
        try {
            odontoJPA.destroy(idOdonto);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Odontologo traerOdontologo(int idOdonto) {
        return odontoJPA.findOdontologo(idOdonto);
    }

    public Persona traerPersona(String dni) {
        return persJPA.traerPersona(dni);
    }

    public void editarPersona(Persona pers) {
        try {
            persJPA.edit(pers);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Horario editarHorario(Horario horario) {
        try {
            return horaJPA.editarHorario(horario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editarOdontologo(Odontologo odonto) {
        try {
            odontoJPA.edit(odonto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarPersona(int idPers) {
        try {
            persJPA.destroy(idPers);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearResponsable(Responsable resp) {
        respJPA.create(resp);
    }

    public List<Responsable> getResponsables() {
        return respJPA.findResponsableEntities();
    }

    public void borrarResponsable(int id) {
        try {
            respJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Responsable traerResponsable(int id) {
        return respJPA.findResponsable(id);
    }

    public void editarResponsable(Responsable resp) {
        try {
            respJPA.edit(resp);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearPaciente(Paciente pacien) {
        pacJPA.create(pacien);
    }

    public List<Responsable> getResponsablesNoAsignados() {
        return respJPA.getResponsablesNoAsignados();
    }

    public List<Paciente> getPacientes() {
        return pacJPA.findPacienteEntities();
    }

    public Paciente traerPaciente(int id) {
        return pacJPA.findPaciente(id);
    }

    public void borrarPaciente(int id) {
        try {
            pacJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarPaciente(Paciente paciente) {
        try {
            pacJPA.edit(paciente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraDePersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

 
    
 
}
