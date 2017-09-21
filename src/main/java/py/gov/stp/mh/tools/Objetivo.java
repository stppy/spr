package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Objetivo {
	
 	protected int  		id=0;
 	protected String 	nombre="";
 	protected String 	descripcion="";
	protected int  		tipo_objetivo_id=0;
	protected int 		version;
	protected int 		anho;
	protected int  		borradoInt=0;
	protected boolean   borrado;
	
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
	public int getTipo_objetivo_id() {
		return tipo_objetivo_id;
	}
	public void setTipo_objetivo_id(int tipo_objetivo_id) {
		this.tipo_objetivo_id = tipo_objetivo_id;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public int getBorradoInt() {
		return borradoInt;
	}
	public void setBorradoInt(int borradoInt) {
		this.borradoInt = borradoInt;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public void changeBorrado(){
		this.borrado =! borrado;
	}	

}
