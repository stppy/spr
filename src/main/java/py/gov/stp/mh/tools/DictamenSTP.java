package py.gov.stp.mh.tools;

import java.sql.Timestamp;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class DictamenSTP {
	protected int id;
	protected int justificacionId;
	protected int eleccion;
	protected String observacion;
	protected String urlDocumento;
	protected int nivel;
	protected int entidad;
	protected int tipoPresupuesto;
	protected int programa;
	protected int subprograma;
	protected int proyecto;
	protected int producto;
	protected int anho;
	protected int version;
	protected String usuarioResponsable;
	protected Timestamp fechaActualizacion;
	protected boolean borrado;
		
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getJustificacionId() {
		return justificacionId;
	}
	public void setJustificacionId(int justificacionId) {
		this.justificacionId = justificacionId;
	}
	public int getEleccion() {
		return eleccion;
	}
	public void setEleccion(int eleccion) {
		this.eleccion = eleccion;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}	
	public String getUrlDocumento() {
		return urlDocumento;
	}
	public void setUrlDocumento(String urlDocumento) {
		this.urlDocumento = urlDocumento;
	}
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public int getEntidad() {
		return entidad;
	}
	public void setEntidad(int entidad) {
		this.entidad = entidad;
	}
	public int getTipoPresupuesto() {
		return tipoPresupuesto;
	}
	public void setTipoPresupuesto(int tipoPresupuesto) {
		this.tipoPresupuesto = tipoPresupuesto;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
	}
	public int getSubprograma() {
		return subprograma;
	}
	public void setSubprograma(int subprograma) {
		this.subprograma = subprograma;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public int getProducto() {
		return producto;
	}
	public void setProducto(int producto) {
		this.producto = producto;
	}	
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
	}	
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
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
	public Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}	
}
