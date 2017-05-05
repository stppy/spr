package py.gov.stp.spr.modelos;

import java.sql.Timestamp;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class UsuarioHasConfiguracion {
	protected int configuracionId;
	protected String usuarioCorreo;
	protected String valor;
	protected boolean borrado=false;
	protected int version=0;
	protected Timestamp fechaActualizacion;
	protected Timestamp fechaInsercion;
	protected String usuarioResponsable="";
	public int getConfiguracionId() {
		return configuracionId;
	}
	public void setConfiguracionId(int configuracionId) {
		this.configuracionId = configuracionId;
	}
	public String getUsuarioCorreo() {
		return usuarioCorreo;
	}
	public void setUsuarioCorreo(String usuarioCorreo) {
		this.usuarioCorreo = usuarioCorreo;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public Timestamp getFechaInsercion() {
		return fechaInsercion;
	}
	public void setFechaInsercion(Timestamp fechaInsercion) {
		this.fechaInsercion = fechaInsercion;
	}
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
	}
	
	

}
