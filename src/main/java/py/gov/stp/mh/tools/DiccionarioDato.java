package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class DiccionarioDato {
	
	protected int  		id=0;
 	protected String 	clase="";
 	protected String 	nombre="";
 	protected String  	titulo ="";
 	protected String 	descripcion="";
 	protected String 	instructivo="";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClase() {
		return clase;
	}
	public void setClase(String clase) {
		this.clase = clase;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getInstructivo() {
		return instructivo;
	}
	public void setInstructivo(String instructivo) {
		this.instructivo = instructivo;
	}	


}

