package py.gov.stp.spr.controladores;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import py.gov.stp.mh.tools.ConnectionConfiguration;

public class UsuarioHasConfiguracionControl {
	/**
	 *
	 * @author		DGTIC-STP
	 * @email		dgtic@stp.gov.py 
	 *
	 * @param responsable usuario que modifico el registro
	 * @param correo usuario sobre le cual aplica la configuracion
	 * @param configuracionId id de configuracion 
	 * @see py.gov.stp.spr.modelos.Configuracion
	 * @param valor aplicado a la configuracion para este usuario
	 * @param version por ahora cero
	 * @return true/false, no tiene pk
	 * @throws SQLException
	 */
	public static boolean insertar(String responsable, String correo, int configuracionId, String valor, int version )throws SQLException{
		
		Connection conn=ConnectionConfiguration.conectar();
		String query = " insert into usuario_has_configuraciones (configuracion_id, usuario_correo, valor, version, usuario_responsable) "
				+ "values (?,?,?,?,?)  RETURNING id ";
		PreparedStatement ps = conn.prepareStatement(query);
		boolean retorno;
		try {
			ps.setInt(1, configuracionId);
			ps.setString(2, correo);
			ps.setString(3, valor);
			ps.setInt(4, version);
			ps.setString(5, responsable);
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

}
