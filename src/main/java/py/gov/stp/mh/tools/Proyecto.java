package py.gov.stp.mh.tools;

import java.sql.Date;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Proyecto {



	    protected Short numeroFila=0;
	    protected Short anio=2017;
	    protected Short nivel=0;
	    protected Short entidad=0;
	    protected Short tipoPrograma=0;
	    protected Short codigoPrograma=0;
	    protected Short codigoSubprograma=0;
	    protected Short codigoProyecto=0;
	    protected String nombreProyecto="";
	    protected String abrevProyecto="";
	    protected String descripcionProyecto="";
	    protected Short codigoUnidadResponsable=0;
	    protected Short codigoFuncional=0;
	    protected String diagnostico="";
	    protected String resultadoEsperado="";
	    protected Short codigoDepartamento=99;
	    protected Short codigoSnip=0;
	    protected Short objetivo_estrategico_id=0;
	    protected Date fechaActualizacion;
	    protected String usuarioResponsable="";
	    protected boolean borrado;

	    
	    public Short getNumeroFila() {
			return numeroFila;
		}
		public void setNumeroFila(Short numeroFila) {
			this.numeroFila = numeroFila;
		}
		public Short getAnio() {
			return anio;
		}
		public void setAnio(Short anio) {
			this.anio = anio;
		}
		public Short getNivel() {
			return nivel;
		}
		public void setNivel(Short nivel) {
			this.nivel = nivel;
		}
		public Short getEntidad() {
			return entidad;
		}
		public void setEntidad(Short entidad) {
			this.entidad = entidad;
		}
		public Short getTipoPrograma() {
			return tipoPrograma;
		}
		public void setTipoPrograma(Short tipoPrograma) {
			this.tipoPrograma = tipoPrograma;
		}
		public Short getCodigoPrograma() {
			return codigoPrograma;
		}
		public void setCodigoPrograma(Short codigoPrograma) {
			this.codigoPrograma = codigoPrograma;
		}
		public Short getCodigoSubprograma() {
			return codigoSubprograma;
		}
		public void setCodigoSubprograma(Short codigoSubprograma) {
			this.codigoSubprograma = codigoSubprograma;
		}
		public Short getCodigoProyecto() {
			return codigoProyecto;
		}
		public void setCodigoProyecto(Short codigoProyecto) {
			this.codigoProyecto = codigoProyecto;
		}
		public String getNombreProyecto() {
			return nombreProyecto;
		}
		public void setNombreProyecto(String nombreProyecto) {
			this.nombreProyecto = nombreProyecto;
		}
		public String getAbrevProyecto() {
			return abrevProyecto;
		}
		public void setAbrevProyecto(String abrevProyecto) {
			this.abrevProyecto = abrevProyecto;
		}
		public String getDescripcionProyecto() {
			return descripcionProyecto;
		}
		public void setDescripcionProyecto(String descripcionProyecto) {
			this.descripcionProyecto = descripcionProyecto;
		}
		public Short getCodigoUnidadResponsable() {
			return codigoUnidadResponsable;
		}
		public void setCodigoUnidadResponsable(Short codigoUnidadResponsable) {
			this.codigoUnidadResponsable = codigoUnidadResponsable;
		}
		public Short getCodigoFuncional() {
			return codigoFuncional;
		}
		public void setCodigoFuncional(Short codigoFuncional) {
			this.codigoFuncional = codigoFuncional;
		}
		public String getDiagnostico() {
			return diagnostico;
		}
		public void setDiagnostico(String diagnostico) {
			this.diagnostico = diagnostico;
		}
		public String getResultadoEsperado() {
			return resultadoEsperado;
		}
		public void setResultadoEsperado(String resultadoEsperado) {
			this.resultadoEsperado = resultadoEsperado;
		}
		public Short getCodigoDepartamento() {
			return codigoDepartamento;
		}
		public void setCodigoDepartamento(Short codigoDepartamento) {
			this.codigoDepartamento = codigoDepartamento;
		}
		public Short getCodigoSnip() {
			return codigoSnip;
		}
		public void setCodigoSnip(Short codigoSnip) {
			this.codigoSnip = codigoSnip;
		}
		public Short getObjetivo_estrategico_id() {
			return objetivo_estrategico_id;
		}
		public void setObjetivo_estrategico_id(Short objetivo_estrategico_id) {
			this.objetivo_estrategico_id = objetivo_estrategico_id;
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
		 public String getUsuarioResponsable() {
			return usuarioResponsable;
		}
		public void setUsuarioResponsable(String usuarioResponsable) {
			this.usuarioResponsable = usuarioResponsable;
		}
				
}
