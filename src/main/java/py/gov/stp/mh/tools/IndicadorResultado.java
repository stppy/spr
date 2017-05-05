package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class IndicadorResultado {
	 protected int id=0;
	 protected String nombre="";
	 protected String descripcion="";
	 protected int tipo_indicador_id=0;
	 protected String metodo_calculo_id="";
	 protected int unidad_medida_id=0;
	 protected int frecuencia_meses=0;
	 protected int desagregacion_tipo_zona_geografica_id=0;
	 protected int tipo_demografica_id=0;
	 protected String fuente_verificacion="";
	 protected String observaciones="";
	 protected int objetivo_id=0;
	 protected double meta2014=0;
	 protected double meta2015=0;
	 protected double meta2016=0;
	 protected double meta2017=0;
	 protected double meta2018=0;

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
	public String getFuente_verificacion() {
		return fuente_verificacion;
	}
	public void setFuente_verificacion(String fuente_verificacion) {
		this.fuente_verificacion = fuente_verificacion;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public double getMeta2014() {
		return meta2014;
	}
	public void setMeta2014(double meta2014) {
		this.meta2014 = meta2014;
	}
	public double getMeta2015() {
		return meta2015;
	}
	public void setMeta2015(double meta2015) {
		this.meta2015 = meta2015;
	}
	public double getMeta2016() {
		return meta2016;
	}
	public void setMeta2016(double meta2016) {
		this.meta2016 = meta2016;
	}
	public double getMeta2017() {
		return meta2017;
	}
	public void setMeta2017(double meta2017) {
		this.meta2017 = meta2017;
	}
	public double getMeta2018() {
		return meta2018;
	}
	public void setMeta2018(double meta2018) {
		this.meta2018 = meta2018;
	}
	public int getObjetivo_id() {
		return objetivo_id;
	}
	public void setObjetivo_id(int objetivo_id) {
		this.objetivo_id = objetivo_id;
	}

}
