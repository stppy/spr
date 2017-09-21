package py.gov.stp.mh.clasificadores;

import java.sql.Timestamp;

public class Comunicacion {
	protected int usuarioEmisorId;
	protected int accionRequerida;
	protected int accionEsperada;
	protected int usuarioDestinatarioId;
	protected Timestamp fechaInsercion;
	protected Timestamp fechaActualizacion;
	protected String usuarioResponsable;
	protected Boolean borrado;
	public int getUsuarioEmisorId() {
		return usuarioEmisorId;
	}
	public void setUsuarioEmisorId(int usuarioEmisorId) {
		this.usuarioEmisorId = usuarioEmisorId;
	}
	public int getAccionRequerida() {
		return accionRequerida;
	}
	public void setAccionRequerida(int accionRequerida) {
		this.accionRequerida = accionRequerida;
	}
	public int getAccionEsperada() {
		return accionEsperada;
	}
	public void setAccionEsperada(int accionEsperada) {
		this.accionEsperada = accionEsperada;
	}
	public int getUsuarioDestinatarioId() {
		return usuarioDestinatarioId;
	}
	public void setUsuarioDestinatarioId(int usuarioDestinatarioId) {
		this.usuarioDestinatarioId = usuarioDestinatarioId;
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
