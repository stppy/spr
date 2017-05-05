package py.gov.stp.mh.tools;

import java.sql.Timestamp;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ObjetivoHasObjetivo {
	protected int objetivoId;
	protected int tipoObjetivoId;
	protected int objetivoAnho;
	protected int objetivoVersion;
	protected int objetivoRelId;
	protected int relTipoObjetivoId;
	protected int relAnho;
	protected int relVersion;
	protected Double colaboracion;
	protected Double influencia;
	protected int nivel;
	protected int entidad;
	protected int tipoPresupuesto;
	protected int programa;
	protected int subprograma;
	protected int proyecto;
	protected int producto;
	protected int unidadResponable;
	protected String productoConcat;
	protected  Timestamp fechaActualizacion;
	protected boolean borrado;
	
	public int getObjetivoId() {
		return objetivoId;
	}
	public void setObjetivoId(int objetivoId) {
		this.objetivoId = objetivoId;
	}
	public int getTipoObjetivoId() {
		return tipoObjetivoId;
	}
	public void setTipoObjetivoId(int tipoObjetivoId) {
		this.tipoObjetivoId = tipoObjetivoId;
	}
	public int getObjetivoAnho() {
		return objetivoAnho;
	}
	public void setObjetivoAnho(int objetivoAnho) {
		this.objetivoAnho = objetivoAnho;
	}
	public int getObjetivoVersion() {
		return objetivoVersion;
	}
	public void setObjetivoVersion(int objetivoVersion) {
		this.objetivoVersion = objetivoVersion;
	}
	public int getObjetivoRelId() {
		return objetivoRelId;
	}
	public void setObjetivoRelId(int objetivoRelId) {
		this.objetivoRelId = objetivoRelId;
	}
	public int getRelTipoObjetivoId() {
		return relTipoObjetivoId;
	}
	public void setRelTipoObjetivoId(int relTipoObjetivoId) {
		this.relTipoObjetivoId = relTipoObjetivoId;
	}
	public int getReltipoObjetivoId() {//wtf?
		return relTipoObjetivoId;
	}
	public void setReltipoObjetivoId(int reltipoObjetivoId) {//wtf?
		this.relTipoObjetivoId = reltipoObjetivoId;
	}
	public int getRelAnho() {
		return relAnho;
	}
	public void setRelAnho(int relAnho) {
		this.relAnho = relAnho;
	}
	public int getRelVersion() {
		return relVersion;
	}
	public void setRelVersion(int relVersion) {
		this.relVersion = relVersion;
	}
	public double getColaboracion() {
		return colaboracion;
	}
	public void setColaboracion(double colaboracion) {
		this.colaboracion = colaboracion;
	}
	public double getInfluencia() {
		return influencia;
	}
	public void setInfluencia(double influencia) {
		this.influencia = influencia;
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
	public int getUnidadResponable() {
		return unidadResponable;
	}
	public void setUnidadResponable(int unidadResponable) {
		this.unidadResponable = unidadResponable;
	}
	
	public String getProductoConcat() {
		return productoConcat;
	}
	public void setProductoConcat(String productoConcat) {
		this.productoConcat = productoConcat;
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
	public java.sql.Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(java.sql.Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}	
}
