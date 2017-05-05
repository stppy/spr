package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class PermisoPorModulo {
protected int id;
protected int moduloId;
protected int usuarioId;
protected int permisoModuloId;
protected String usuarioResponsable;
protected boolean borrado;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getModuloId() {
	return moduloId;
}
public void setModuloId(int moduloId) {
	this.moduloId = moduloId;
}
public int getUsuarioId() {
	return usuarioId;
}
public void setUsuarioId(int usuarioId) {
	this.usuarioId = usuarioId;
}
public int getPermisoModuloId() {
	return permisoModuloId;
}
public void setPermisoModuloId(int permisoModuloId) {
	this.permisoModuloId = permisoModuloId;
}
public String getUsuarioResponsable() {
	return usuarioResponsable;
}
public void setUsuarioResponsable(String usuarioResponsable) {
	this.usuarioResponsable = usuarioResponsable;
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
