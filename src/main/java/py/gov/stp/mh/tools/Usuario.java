package py.gov.stp.mh.tools;

import java.sql.Date;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Usuario {
	protected int id=0;
	protected String correo="";
	protected String passwd="";
	protected Date last_login;
	protected String entidad="";
	protected String nombre="";
	protected int entidad_id=0;
	protected int nivel_id=0;
	protected int rol_id=0;
	protected String urlimagen=""; 
	protected String url;
	protected int unidadResponsable;
	protected boolean borrado;
	protected int rolTablero;
	protected int rolMovil;
	protected boolean correoReal;
	protected int ultimaEtiquetaId;
	
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getUnidadResponsable() {
		return unidadResponsable;
	}
	public void setUnidadResponsable(int unidadResponsable) {
		this.unidadResponsable = unidadResponsable;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getLast_login() {
		return last_login;
	}
	public void setLast_login(Date last_login) {
		this.last_login = last_login;
	}
	public String getEntidad() {
		return entidad;
	}
	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}
	public int getRol_id() {
		return rol_id;
	}
	public void setRol_id(int rol_id) {
		this.rol_id = rol_id;
	}
	public int getEntidad_id() {
		return entidad_id;
	}
	public void setEntidad_id(int entidad_id) {
		this.entidad_id = entidad_id;
	}
	public int getNivel_id() {
		return nivel_id;
	}
	public void setNivel_id(int nivel_id) {
		this.nivel_id = nivel_id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getUrlimagen() {
		return urlimagen;
	}
	public void setUrlimagen(String urlimagen) {
		this.urlimagen = urlimagen;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}
	public int getRolTablero() {
		return rolTablero;
	}
	public void setRolTablero(int rolTablero) {
		this.rolTablero = rolTablero;
	}
	public int getRolMovil() {
		return rolMovil;
	}
	public void setRolMovil(int rolMovil) {
		this.rolMovil = rolMovil;
	}
	public boolean isCorreoReal() {
		return correoReal;
	}
	public void setCorreoReal(boolean correoReal) {
		this.correoReal = correoReal;
	}
	public int getUltimaEtiquetaId() {
		return ultimaEtiquetaId;
	}
	public void setUltimaEtiquetaId(int ultimaEtiquetaId) {
		this.ultimaEtiquetaId = ultimaEtiquetaId;
	}
	
}
