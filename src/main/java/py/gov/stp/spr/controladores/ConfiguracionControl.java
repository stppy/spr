package py.gov.stp.spr.controladores;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import py.gov.stp.mh.tools.ConnectionConfiguration;
import py.gov.stp.spr.modelos.Configuracion;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ConfiguracionControl {
	
	/**
	 * ConfiguracionControl.insertar("rpalau@stp.gov.py", "ocultarBorrado");
	 * @param nombre de la nueva configuracion
	 * @return idInsertado de la configuracion recien inserada
	 * @throws SQLException
	 */
	public static int insertar(String usuario, String nombre)throws SQLException{
			
		Connection conn=ConnectionConfiguration.conectar();
		String query = " insert into configuraciones (nombre, usuario_responsable) values (?,?)  RETURNING id ";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs=null;
		int idInsertado=0;
		try {
			ps.setString(1, nombre);
			ps.setString(2, usuario);
			rs=ps.executeQuery();
			rs.next();
			idInsertado=rs.getInt("id");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			if (ps != null) {ps.close();}
			if (conn != null) {conn.close();}
		}
		return idInsertado;
	}
	
	/**
	 * ConfiguracionControl.listar();|ConfiguracionControl.listar("where sql");
	 * @param where para la tabla de configuraciones
	 * @return lista de configuraciones
	 * @throws SQLException
	 */
	public static List<Configuracion> listar(String condition) throws SQLException{
	 	 Connection conn=ConnectionConfiguration.conectar();
		 String query = " select * from configuraciones ?";
		 
		 PreparedStatement ps = conn.prepareStatement(query);
		 ResultSet rs=null;
		 List<Configuracion> objetos = new ArrayList<Configuracion>();

		try {
			ps.setString(1, condition);
			rs=ps.executeQuery();
			while(rs.next()){
				Configuracion objeto = new Configuracion();

				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setVersion(rs.getInt("version"));
				objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
				objeto.setFechaInsercion(rs.getTimestamp("fecha_insercion"));
				objeto.setUsuarioResponsable(rs.getString("usuario_responsable"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			if (ps != null) {ps.close();}
			if (conn != null) {conn.close();}
		}
		return objetos;
	}
	
	/**
	 * ConfiguracionControl.acutalizar("ocultarBorrado", "where id=234")
	 * @param nuevoNombre
	 * @param condition
	 * @return true/false segun exito del update
	 * @throws SQLException
	 */
	public static boolean actualizar(String nuevoNombre, String condition) throws SQLException{
	 	 Connection conn=ConnectionConfiguration.conectar();
		 String query = " update configuraciones set nombre=? ?";
		 PreparedStatement ps = conn.prepareStatement(query);

		try {
			ps.setString(1, nuevoNombre);
			ps.setString(2, condition);
			ps.executeQuery();
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			if (ps != null) {ps.close();}
			if (conn != null) {conn.close();}
		}
		return true;
	}
		
	/**
	 * ConfiguracionControl.eliminar(2423);
	 * @param id de configuracion a eliminar
	 * @return true/false para exito o fracaso de la eliminacion
	 * @throws SQLException
	 */
	public static boolean eliminar(int id) throws SQLException{
		Connection conn = ConnectionConfiguration.conectar();
		String query = "update configuraciones set borrado=true where id=?";
		PreparedStatement ps = conn.prepareStatement(query);
		try {
			ps.setInt(1, id);
			ps.executeQuery();
			//TODO: Eliminar en cascada
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}finally{
			if (ps != null) {ps.close();}
			if (conn != null) {conn.close();}
		}
		return true;
	}
	
	/**
	 * ConfiguracionControl.restaurar(2423);
	 * @param id de configuracion a restaurar
	 * @return true/false para exito o fracaso de la restauracion
	 * @throws SQLException
	 */
	public static boolean restaurar(int id) throws SQLException{
		Connection conn = ConnectionConfiguration.conectar();
		String query = "update configuraciones set borrado=false where id=?";
		PreparedStatement ps = conn.prepareStatement(query);
		try {
			ps.setInt(1, id);
			ps.executeQuery();
			//TODO: Restarurar en cascada
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}finally{
			if (ps != null) {ps.close();}
			if (conn != null) {conn.close();}
		}
		return true;
	}
	
}
