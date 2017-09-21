package py.gov.stp.mh.tools;

import java.util.List;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class UserInfo {

	String userNivelId; 
	String userEntidadId; 
	String userUnrId;
	String userRolId;
	List<PermisoPorModulo> userPermisos;
	
	
	public String getUserNivelId() {
		return userNivelId;
	}
	public void setUserNivelId(String userNivelId) {
		this.userNivelId = userNivelId;
	}
	public String getUserEntidadId() {
		return userEntidadId;
	}
	public void setUserEntidadId(String userEntidadId) {
		this.userEntidadId = userEntidadId;
	}
	public String getUserUnrId() {
		return userUnrId;
	}
	public void setUserUnrId(String userUnrId) {
		this.userUnrId = userUnrId;
	}
	public String getUserRolId() {
		return userRolId;
	}
	public void setUserRolId(String userRolId) {
		this.userRolId = userRolId;
	}
	public List<PermisoPorModulo> getUserPermisos() {
		return userPermisos;
	}
	public void setUserPermisos(List<PermisoPorModulo> userPermisos) {
		this.userPermisos = userPermisos;
	}
	
	
}
