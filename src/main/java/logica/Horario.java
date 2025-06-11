
package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Horario implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id_horario;
    private String horario_incio;
    private String horario_fin;

    public Horario() {
    }

    public Horario(int id_horario, String horario_incio, String horario_fin) {
        this.id_horario = id_horario;
        this.horario_incio = horario_incio;
        this.horario_fin = horario_fin;
    }

    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public String getHorario_incio() {
        return horario_incio;
    }

    public void setHorario_incio(String horario_incio) {
        this.horario_incio = horario_incio;
    }

    public String getHorario_fin() {
        return horario_fin;
    }

    public void setHorario_fin(String horario_fin) {
        this.horario_fin = horario_fin;
    }
            
    
}
