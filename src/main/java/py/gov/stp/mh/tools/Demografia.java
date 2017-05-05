package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Demografia {
	
 	protected int  		id=0;
 	protected String 	nombre="";
 	protected String 	descripcion="";
 	protected int  		tipo_demografica_id =0;

 	protected String 	abrev="";
 	
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
	public int getTipo_demografica_id() {
		return tipo_demografica_id;
	}
	public void setTipo_demografica_id(int tipo_demografica_id) {
		this.tipo_demografica_id = tipo_demografica_id;
	}
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	
	
}
