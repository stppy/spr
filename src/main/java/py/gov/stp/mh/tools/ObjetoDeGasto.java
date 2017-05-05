package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ObjetoDeGasto {
	protected int id=0;
	protected String nombre="";
	protected String descripcion="";
	protected String abrev="";
	protected String es_imputable="";
	protected int numero_fila=0;
	protected int anho=0;
	
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
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	public String getEs_imputable() {
		return es_imputable;
	}
	public void setEs_imputable(String es_imputable) {
		this.es_imputable = es_imputable;
	}
	public int getNumero_fila() {
		return numero_fila;
	}
	public void setNumero_fila(int numero_fila) {
		this.numero_fila = numero_fila;
	}
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	
}
