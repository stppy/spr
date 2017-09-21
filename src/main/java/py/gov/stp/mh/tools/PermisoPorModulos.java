package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class PermisoPorModulos {
	protected int id;
	protected int modulosId;
	protected int usuarioId;
	protected int permisosModulosId;
	protected String usuarioResponsable;
	protected boolean borrado;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getModulosId() {
		return modulosId;
	}
	public void setModulosId(int modulosId) {
		this.modulosId = modulosId;
	}
	public int getUsuarioId() {
		return usuarioId;
	}
	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}
	public int getPermisosModulosId() {
		return permisosModulosId;
	}
	public void setPermisosModulosId(int permisosModulosId) {
		this.permisosModulosId = permisosModulosId;
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
