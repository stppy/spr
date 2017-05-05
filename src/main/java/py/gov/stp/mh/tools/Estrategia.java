package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Estrategia {

 	protected int  		id=0;
 	protected String 	nombre="";
 	protected String 	descripcion="";
 	protected int  		numero_fila =0;
 	protected int  		eje_estrategico_id =0;
 	protected int  		linea_transversal_id =0;
 	protected int  		plan =0;
 	
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
	public int getNumero_fila() {
		return numero_fila;
	}
	public void setNumero_fila(int numero_fila) {
		this.numero_fila = numero_fila;
	}
	public int getEje_estrategico_id() {
		return eje_estrategico_id;
	}
	public void setEje_estrategico_id(int eje_estrategico_id) {
		this.eje_estrategico_id = eje_estrategico_id;
	}
	public int getLinea_transversal_id() {
		return linea_transversal_id;
	}
	public void setLinea_transversal_id(int linea_transversal_id) {
		this.linea_transversal_id = linea_transversal_id;
	}
	public int getPlan() {
		return plan;
	}
	public void setPlan(int plan) {
		this.plan = plan;
	}	
 	
}
