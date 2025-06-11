
package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Odontologo extends Persona implements Serializable{
    //private int id_odontologo;
    private String especialidad;
    @OneToOne
    private Horario unHorario;
    @OneToOne
    private Usuario unUsuario;
    @OneToMany (mappedBy = "odonto")//relacion (1, n) , mapea a traves del objeto odonto en la clase turno
    private List<Turno> listaTurnos;
    
    
    public Odontologo() {
    }

    public Odontologo(String especialidad, Horario unHorario, Usuario unUsuario, List<Turno> listaTurnos, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.especialidad = especialidad;
        this.unHorario = unHorario;
        this.unUsuario = unUsuario;
        this.listaTurnos = listaTurnos;
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
