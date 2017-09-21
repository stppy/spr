package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Indicador {
	 protected int id=0;
	 protected String nombre="";
	 protected String descripcion="";
	 protected int tipo_indicador_id=0;
	 protected String metodo_calculo_id="";
	 protected int unidad_medida_id=0;
	 protected int frecuencia_meses=0;
	 protected int desagregacion_tipo_zona_geografica_id=0;
	 protected int tipo_demografica_id=0;
	 protected String fuente_verificacion_id="";
	 protected String observaciones="";
	 protected int objetivo_id=0;
	 protected boolean borrado;
	 protected String fechaDisponibilidadInformacion="";
	 protected int coberturaGeograficaAlcance=0;
	 protected int NivelDespliegueGeograficoDesagregacion=0;
	 protected int coberturaDemograficaAlcance=0;
	 protected int NivelDespliegueDemograficoDesagregacion=0;
	 protected String institucionResponsableCalculoIndicador="";
	 protected String evaluacionHeci="";
	 protected String contacto="";
	 protected short borradoInt=0;
	 
	 protected int tipoIndicadorId=0;
	 protected int metodoCalculoId=0;
	 protected int unidadMedidaId=0;
	 protected int desagregacionTipoZonaGeograficaId=0;
	 protected int tipoDemograficaId=0;
	 protected String fuenteVerificacionId="";
	 protected int objetivoId=0;
	 protected int nivel=0;
	 protected int entidad=0;
	 protected String usuarioResponsable;
	 
	 
	public short getBorradoInt() {
		return borradoInt;
	}
	public void setBorradoInt(short borradoInt) {
		this.borradoInt = borradoInt;
	}
	public String getFechaDisponibilidadInformacion() {
		return fechaDisponibilidadInformacion;
	}
	public void setFechaDisponibilidadInformacion(
			String fechaDisponibilidadInformacion) {
		this.fechaDisponibilidadInformacion = fechaDisponibilidadInformacion;
	}
	public int getCoberturaGeograficaAlcance() {
		return coberturaGeograficaAlcance;
	}
	public void setCoberturaGeograficaAlcance(int coberturaGeograficaAlcance) {
		this.coberturaGeograficaAlcance = coberturaGeograficaAlcance;
	}
	public int getNivelDespliegueGeograficoDesagregacion() {
		return NivelDespliegueGeograficoDesagregacion;
	}
	public void setNivelDespliegueGeograficoDesagregacion(
			int nivelDespliegueGeograficoDesagregacion) {
		NivelDespliegueGeograficoDesagregacion = nivelDespliegueGeograficoDesagregacion;
	}
	public int getCoberturaDemograficaAlcance() {
		return coberturaDemograficaAlcance;
	}
	public void setCoberturaDemograficaAlcance(int coberturaDemograficaAlcance) {
		this.coberturaDemograficaAlcance = coberturaDemograficaAlcance;
	}
	public int getNivelDespliegueDemograficoDesagregacion() {
		return NivelDespliegueDemograficoDesagregacion;
	}
	public void setNivelDespliegueDemograficoDesagregacion(
			int nivelDespliegueDemograficoDesagregacion) {
		NivelDespliegueDemograficoDesagregacion = nivelDespliegueDemograficoDesagregacion;
	}
	public String getInstitucionResponsableCalculoIndicador() {
		return institucionResponsableCalculoIndicador;
	}
	public void setInstitucionResponsableCalculoIndicador(
			String institucionResponsableCalculoIndicador) {
		this.institucionResponsableCalculoIndicador = institucionResponsableCalculoIndicador;
	}
	public String getEvaluacionHeci() {
		return evaluacionHeci;
	}
	public void setEvaluacionHeci(String evaluacionHeci) {
		this.evaluacionHeci = evaluacionHeci;
	}
	public String getContacto() {
		return contacto;
	}
	public void setContacto(String contacto) {
		this.contacto = contacto;
	}
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
	public void setDesagregacion_tipo_zona_geografica_id(int desagregacion_tipo_zona_geografica_id) {
		this.desagregacion_tipo_zona_geografica_id = desagregacion_tipo_zona_geografica_id;
	}
	public int getTipo_demografica_id() {
		return tipo_demografica_id;
	}
	public void setTipo_demografica_id(int tipo_demografica_id) {
		this.tipo_demografica_id = tipo_demografica_id;
	}
	public String getFuente_verificacion_id() {
		return fuente_verificacion_id;
	}
	public void setFuente_verificacion_id(String fuente_verificacion_id) {
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
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getTipoIndicadorId() {
		return tipoIndicadorId;
	}
	public void setTipoIndicadorId(int tipoIndicadorId) {
		this.tipoIndicadorId = tipoIndicadorId;
	}
	public int getMetodoCalculoId() {
		return metodoCalculoId;
	}
	public void setMetodoCalculoId(int metodoCalculoId) {
		this.metodoCalculoId = metodoCalculoId;
	}
	public int getUnidadMedidaId() {
		return unidadMedidaId;
	}
	public void setUnidadMedidaId(int unidadMedidaId) {
		this.unidadMedidaId = unidadMedidaId;
	}
	public int getDesagregacionTipoZonaGeograficaId() {
		return desagregacionTipoZonaGeograficaId;
	}
	public void setDesagregacionTipoZonaGeograficaId(
			int desagregacionTipoZonaGeograficaId) {
		this.desagregacionTipoZonaGeograficaId = desagregacionTipoZonaGeograficaId;
	}
	public int getTipoDemograficaId() {
		return tipoDemograficaId;
	}
	public void setTipoDemograficaId(int tipoDemograficaId) {
		this.tipoDemograficaId = tipoDemograficaId;
	}
	public String getFuenteVerificacionId() {
		return fuenteVerificacionId;
	}
	public void setFuenteVerificacionId(String fuenteVerificacionId) {
		this.fuenteVerificacionId = fuenteVerificacionId;
	}
	public int getObjetivoId() {
		return objetivoId;
	}
	public void setObjetivoId(int objetivoId) {
		this.objetivoId = objetivoId;
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
