package py.gov.stp.spr.modelos;


import java.sql.Timestamp;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Configuracion {
	protected int id;
	protected String nombre;
	protected boolean borrado = false;
	protected int version = 0;
	protected Timestamp fechaActualizacion;
	protected Timestamp fechaInsercion;
	protected String usuarioResponsable = "";

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
