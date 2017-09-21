package py.gov.stp.mh.clasificadores;

import java.sql.Date;
import java.sql.Timestamp;

public class Mensaje {
	protected int id;
	protected Date tiempo;
	protected int estadoMensajeId;
	protected int tipo;
	protected String observacion;
	protected Timestamp fechaInsercion;
	protected Timestamp fechaActualizacion;
	protected String usuarioResponsable;
	protected Boolean borrado;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getTiempo() {
		return tiempo;
	}
	public void setTiempo(Date tiempo) {
		this.tiempo = tiempo;
	}
	public int getEstadoMensajeId() {
		return estadoMensajeId;
	}
	public void setEstadoMensajeId(int estadoMensajeId) {
		this.estadoMensajeId = estadoMensajeId;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public Timestamp getFechaInsercion() {
		return fechaInsercion;
	}
	public void setFechaInsercion(Timestamp fechaInsercion) {
		this.fechaInsercion = fechaInsercion;
	}
	public Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
	}
	public Boolean getBorrado() {
		return borrado;
	}
	public void setBorrado(Boolean borrado) {
		this.borrado = borrado;
	}
	
	
}
