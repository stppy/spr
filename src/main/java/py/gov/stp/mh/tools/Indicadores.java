package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Indicadores {
	
 	protected int  		id=0;
 	protected String 	nombre="";
 	protected String 	descripcion="";
	protected int  		tipo_indicador_id=0;
	protected String  		metodo_calculo_id="";
	protected int  		unidad_medida_id=0;
	protected int  		frecuencia_meses=0;
	protected int  		desagregacion_tipo_zona_geografica_id=0;
	protected int  		tipo_demografica_id=0;
	protected int  		fuente_verificacion_id=0;
 	protected String 	observaciones="";
	protected int  		objetivo_id=0;
	
	
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
	public int getTipo_indicador_id() {
		return tipo_indicador_id;
	}
	public void setTipo_indicador_id(int tipo_indicador_id) {
		this.tipo_indicador_id = tipo_indicador_id;
	}
	
	public String getMetodo_calculo_id() {
		return metodo_calculo_id;
	}
	public void setMetodo_calculo_id(String metodo_calculo_id) {
		this.metodo_calculo_id = metodo_calculo_id;
	}
	public int getUnidad_medida_id() {
		return unidad_medida_id;
	}
	public void setUnidad_medida_id(int unidad_medida_id) {
		this.unidad_medida_id = unidad_medida_id;
	}
	public int getFrecuencia_meses() {
		return frecuencia_meses;
	}
	public void setFrecuencia_meses(int frecuencia_meses) {
		this.frecuencia_meses = frecuencia_meses;
	}
	public int getDesagregacion_tipo_zona_geografica_id() {
		return desagregacion_tipo_zona_geografica_id;
	}
	public void setDesagregacion_tipo_zona_geografica_id(
			int desagregacion_tipo_zona_geografica_id) {
		this.desagregacion_tipo_zona_geografica_id = desagregacion_tipo_zona_geografica_id;
	}
	public int getTipo_demografica_id() {
		return tipo_demografica_id;
	}
	public void setTipo_demografica_id(int tipo_demografica_id) {
		this.tipo_demografica_id = tipo_demografica_id;
	}
	public int getFuente_verificacion_id() {
		return fuente_verificacion_id;
	}
	public void setFuente_verificacion_id(int fuente_verificacion_id) {
		this.fuente_verificacion_id = fuente_verificacion_id;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public int getObjetivo_id() {
		return objetivo_id;
	}
	public void setObjetivo_id(int objetivo_id) {
		this.objetivo_id = objetivo_id;
	}
	
	

}
