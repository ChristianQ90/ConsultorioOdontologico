
package logica;

import java.util.Date;


public class Responsable extends Persona {
    
    private int id_responsable;
    private String tipo_responsable;

    public Responsable() {
    }

    public Responsable(int id_responsable, String tipo_responsable) {
        this.id_responsable = id_responsable;
        this.tipo_responsable = tipo_responsable;
    }

    public Responsable(int id_responsable, String tipo_responsable, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.id_responsable = id_responsable;
        this.tipo_responsable = tipo_responsable;
    }

    

    public int getId_responsable() {
        return id_responsable;
    }

    public void setId_responsable(int id_responsable) {
        this.id_responsable = id_responsable;
    }

    public String getTipo_responsable() {
        return tipo_responsable;
    }

    public void setTipo_responsable(String tipo_responsable) {
        this.tipo_responsable = tipo_responsable;
    }
    
    
}
