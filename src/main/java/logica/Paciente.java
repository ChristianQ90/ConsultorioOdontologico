
package logica;

import java.util.Date;


public class Paciente extends Persona{
    
    private int id_paciente;
    private boolean tieneSM;
    private String tipoSangre;

    public Paciente() {
    }

    public Paciente(int id_paciente, boolean tiene_SM, String tipo_sangre) {
        this.id_paciente = id_paciente;
        this.tieneSM = tiene_SM;
        this.tipoSangre = tipo_sangre;
    }

    public Paciente(int id_paciente, boolean tieneSM, String tipoSangre, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.id_paciente = id_paciente;
        this.tieneSM = tieneSM;
        this.tipoSangre = tipoSangre;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public boolean isTiene_SM() {
        return tieneSM;
    }

    public void setTiene_SM(boolean tiene_SM) {
        this.tieneSM = tiene_SM;
    }

    public String getTipo_sangre() {
        return tipoSangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipoSangre = tipo_sangre;
    }
    
    
    
}
