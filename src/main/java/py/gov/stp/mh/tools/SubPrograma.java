package py.gov.stp.mh.tools;

import java.util.Date;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class SubPrograma {
	protected int id=0;
	protected int programa_id=0;
	protected int programa_tipo_presupuesto_id=0;
	protected int programa_entidad_id=0;
	protected int programa_entidad_nivel_id=0;
	protected int anho=0;
	protected String nombre="";
	protected String abrev="";
	protected String descripcion="";
	protected String objetivo="";
	protected int codigo_departamento=0;
	protected String baseLegal="";
	protected Date fechaActualizacion;
	protected boolean borrado=false;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrograma_id() {
		return programa_id;
	}
	public void setPrograma_id(int programa_id) {
		this.programa_id = programa_id;
	}
	public int getPrograma_tipo_presupuesto_id() {
		return programa_tipo_presupuesto_id;
	}
	public void setPrograma_tipo_presupuesto_id(int programa_tipo_presupuesto_id) {
		this.programa_tipo_presupuesto_id = programa_tipo_presupuesto_id;
	}
	public int getPrograma_entidad_id() {
		return programa_entidad_id;
	}
	public void setPrograma_entidad_id(int programa_entidad_id) {
		this.programa_entidad_id = programa_entidad_id;
	}
	public int getPrograma_entidad_nivel_id() {
		return programa_entidad_nivel_id;
	}
	public void setPrograma_entidad_nivel_id(int programa_entidad_nivel_id) {
		this.programa_entidad_nivel_id = programa_entidad_nivel_id;
	}
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public int getCodigo_departamento() {
		return codigo_departamento;
	}
	public void setCodigo_departamento(int codigo_departamento) {
		this.codigo_departamento = codigo_departamento;
	}
	public String getBaseLegal() {
		return baseLegal;
	}
	public void setBaseLegal(String baseLegal) {
		this.baseLegal = baseLegal;
	}
	public Date getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Date fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}
}
