
package logica;

import java.util.Date;
import java.util.List;


public class Odontologo extends Persona{
    private int id_odontologo;
    private String especialidad;
    private Horario unHorario;
    private Usuario unUsuario;
    private List<Turno> listaTurnos;
    
    public Odontologo() {
    }

    public Odontologo(int id_odontologo, String especialidad, Horario unHorario, Usuario unUsuario, List<Turno> listaTurnos, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.id_odontologo = id_odontologo;
        this.especialidad = especialidad;
        this.unHorario = unHorario;
        this.unUsuario = unUsuario;
        this.listaTurnos = listaTurnos;
    }

    public int getId_odontologo() {
        return id_odontologo;
    }

    public void setId_odontologo(int id_odontologo) {
        this.id_odontologo = id_odontologo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Horario getUnHorario() {
        return unHorario;
    }

    public void setUnHorario(Horario unHorario) {
        this.unHorario = unHorario;
    }

    public Usuario getUnUsuario() {
        return unUsuario;
    }

    public void setUnUsuario(Usuario unUsuario) {
        this.unUsuario = unUsuario;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }

   
    


}
