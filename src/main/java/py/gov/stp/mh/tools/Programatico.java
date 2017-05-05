package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Programatico {
	
 	protected int  		id=0;
 	protected String 	nombre="";
 	protected String 	descripcion="";
	protected int  		tipo_programatico_id=0;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getTipo_programatico_id() {
		return tipo_programatico_id;
	}
	public void setTipo_programatico_id(int tipo_programatico_id) {
		this.tipo_programatico_id = tipo_programatico_id;
	}


}
