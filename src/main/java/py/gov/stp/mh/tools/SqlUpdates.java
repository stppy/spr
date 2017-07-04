package py.gov.stp.mh.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import py.gov.stp.mh.clasificadores.*;
import py.gov.stp.mh.tools.ConnectionConfiguration;
import py.gov.stp.mh.tools.Credenciales;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class SqlUpdates {
	public static void updateEntidad(Entidad entidadObj,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update entidad set ";
			PreparedStatement update = null;

			if (entidadObj.getDescripcion() != null) {
				query += " descripcion = ?, ";
			}
			if (entidadObj.getAbrev() != null) {
				query += " abrev = ?,";
			}
			if (entidadObj.getSigla() != null) {
				query += " sigla = ?,";
			}
			if (entidadObj.getBase_legal() != null) {
				query += " base_legal = ?, ";
			}
			if (entidadObj.getMision() != null) {
				query += " mision = ?, ";
			}
			if (entidadObj.getVision() != null) {
				query += " vision = ?, ";
			}
			if (entidadObj.getPolitica() != null) {
				query += " politica = ?, ";
			}
			if (entidadObj.getObjetivo() != null) {
				query += " objetivo = ?, ";
			}
			if (entidadObj.getDiagnostico() != null) {
				query += " diagnostico = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ? and nivel_id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (entidadObj.getDescripcion() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getDescripcion());
			}
			if (entidadObj.getAbrev() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getAbrev());
			}
			if (entidadObj.getSigla() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getSigla());
			}
			if (entidadObj.getBase_legal() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getBase_legal());
			}
			if (entidadObj.getMision() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getMision());
			}
			if (entidadObj.getVision() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getVision());
			}
			if (entidadObj.getPolitica() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getPolitica());
			}
			if (entidadObj.getObjetivo() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getObjetivo());
			}
			if (entidadObj.getDiagnostico() != null) {
				cantCampos++;
				update.setString(cantCampos, entidadObj.getDiagnostico());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, entidadObj.getId());
			cantCampos++;
			update.setInt(cantCampos, entidadObj.getNivel_id());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static boolean updatePrograma(Programa programaObj,
			String usuarioResponsable) throws ParseException {

		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update programa set ";

			PreparedStatement update = null;

			if (programaObj.getNombrePrograma() != null) {
				query += " nombre= ?, ";
			}
			if (programaObj.getAbrevPrograma() != null) {
				query += " abrev= ?, ";
			}
			if (programaObj.getObjetivo() != null) {
				query += " objetivo= ?, ";
			}
			if (programaObj.getDiagnostico() != null) {
				query += " diagnostico= ?, ";
			}
			if (programaObj.getBaseLegal() != null) {
				query += " base_legal= ?, ";
			}
			if (true) {
				query += " codigodepartamento= ?, ";
			}
			query += " usuario_responsable= ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?  and tipo_presupuesto_id = ? and entidad_id=? and entidad_nivel_id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (programaObj.getNombrePrograma() != null) {
				cantCampos++;
				update.setString(cantCampos, programaObj.getNombrePrograma());
			}
			if (programaObj.getAbrevPrograma() != null) {
				cantCampos++;
				update.setString(cantCampos, programaObj.getAbrevPrograma());
			}
			if (programaObj.getObjetivo() != null) {
				cantCampos++;
				update.setString(cantCampos, programaObj.getObjetivo());
			}
			if (programaObj.getDiagnostico() != null) {
				cantCampos++;
				update.setString(cantCampos, programaObj.getDiagnostico());
			}
			if (programaObj.getBaseLegal() != null) {
				cantCampos++;
				update.setString(cantCampos, programaObj.getBaseLegal());
			}
			if (true) {
				cantCampos++;
				update.setInt(cantCampos, programaObj.getCodigoDepartamento());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, programaObj.getCodigoPrograma());
			cantCampos++;
			update.setInt(cantCampos, programaObj.getTipoPrograma());
			cantCampos++;
			update.setInt(cantCampos, programaObj.getEntidad());
			cantCampos++;
			update.setInt(cantCampos, programaObj.getNivel());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean updateSubPrograma(SubPrograma subprogramaObj,
			String usuarioResponsable) {

		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update subprograma set ";

			PreparedStatement update = null;

			if (subprogramaObj.getNombre() != null) {
				query += " nombre= ?, ";
			}
			if (subprogramaObj.getAbrev() != null) {
				query += " abrev= ?, ";
			}
			if (subprogramaObj.getDescripcion() != null) {
				query += " descripcion= ?, ";
			}
			if (subprogramaObj.getObjetivo() != null) {
				query += " objetivo= ?, ";
			}
			if (true) {
				query += " codigo_departamento= ?, ";
			}
			if (subprogramaObj.getBaseLegal() != null) {
				query += " baseLegal= ?, ";
			}
			query += " usuario_responsable= ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?  and programa_id = ? and programa_tipo_presupuesto_id = ? and programa_entidad_id=? and programa_entidad_nivel_id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (subprogramaObj.getNombre() != null) {
				cantCampos++;
				update.setString(cantCampos, subprogramaObj.getNombre());
			}
			if (subprogramaObj.getAbrev() != null) {
				cantCampos++;
				update.setString(cantCampos, subprogramaObj.getAbrev());
			}
			if (subprogramaObj.getDescripcion() != null) {
				cantCampos++;
				update.setString(cantCampos, subprogramaObj.getDescripcion());
			}
			if (subprogramaObj.getObjetivo() != null) {
				cantCampos++;
				update.setString(cantCampos, subprogramaObj.getObjetivo());
			}
			if (true) {
				cantCampos++;
				update.setInt(cantCampos,
						subprogramaObj.getCodigo_departamento());
			}
			if (subprogramaObj.getBaseLegal() != null) {
				cantCampos++;
				update.setString(cantCampos, subprogramaObj.getBaseLegal());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, subprogramaObj.getId());
			cantCampos++;
			update.setInt(cantCampos, subprogramaObj.getPrograma_id());
			cantCampos++;
			update.setInt(cantCampos,
					subprogramaObj.getPrograma_tipo_presupuesto_id());
			cantCampos++;
			update.setInt(cantCampos, subprogramaObj.getPrograma_entidad_id());
			cantCampos++;
			update.setInt(cantCampos,
					subprogramaObj.getPrograma_entidad_nivel_id());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	/*
	 * 
	 * public static void updateSubPrograma(SubPrograma objeto){ Connection
	 * conect=ConnectionConfiguration.conectar(); Statement statement = null;
	 * 
	 * String query = "update subprograma set"; //if (programa_id!="") query+=
	 * "programa_id=\""+programa_id+"\", "; //if
	 * (programa_tipo_presupuesto_id!="") query+=
	 * "programa_tipo_presupuesto_id=\""+programa_tipo_presupuesto_id+"\", ";
	 * //if (programa_entidad_id!="") query+=
	 * "programa_entidad_id=\""+programa_entidad_id+"\", "; //if
	 * (programa_entidad_nivel_id!="") query+=
	 * "programa_entidad_nivel_id=\""+programa_entidad_nivel_id+"\", ";
	 * 
	 * if (objeto.getNombre()!=null) query+=
	 * " nombre=\""+objeto.getNombre()+"\", "; if (objeto.getAbrev()!=null)
	 * query+= " abrev=\""+objeto.getAbrev()+"\", "; if
	 * (objeto.getDescripcion()!=null) query+=
	 * " descripcion=\""+objeto.getDescripcion()+"\", "; if
	 * (objeto.getObjetivo()!=null) query+=
	 * " objetivo=\""+objeto.getObjetivo()+"\", "; if (true) query+=
	 * " codigo_departamento=\""+objeto.getCodigo_departamento()+"\", "; query =
	 * query.substring(0, query.length()-2);
	 * query+="where id ="+objeto.getId()+" and programa_id = "
	 * +objeto.getPrograma_id()+" and programa_tipo_presupuesto_id="+objeto.
	 * getPrograma_tipo_presupuesto_id
	 * ()+" and programa_entidad_nivel_id="+objeto
	 * .getPrograma_entidad_nivel_id()
	 * +" and programa_entidad_id="+objeto.getPrograma_entidad_id();
	 * 
	 * try { statement=conect.createStatement(); statement.execute(query);
	 * conect.close(); } catch (SQLException e) {e.printStackTrace();}
	 * 
	 * }
	 */

	public static boolean updateProyecto(Proyecto proyectoObj,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update proyecto set ";
			PreparedStatement update = null;

			if (proyectoObj.getNombreProyecto() != "") {
				query += "nombre= ?, ";
			}
			if (proyectoObj.getDescripcionProyecto() != "") {
				query += "descripcion= ?, ";
			}
			if (proyectoObj.getAbrevProyecto() != "") {
				query += "abrev= ?, ";
			}
			if (proyectoObj.getAnio() != 2017) {
				query += "anho= ?, ";
			}
			if (proyectoObj.getCodigoUnidadResponsable() != 0) {
				query += "unidad_responsable_id= ?, ";
			}
			if (proyectoObj.getCodigoFuncional() != 0) {
				query += "funcional_id= ?, ";
			}
			if (proyectoObj.getDiagnostico() != "") {
				query += "diagnostico= ?,  ";
			}
			if (proyectoObj.getResultadoEsperado() != "") {
				query += "resultado_esperado= ?, ";
			}
			if (proyectoObj.getCodigoDepartamento() != null) {
				query += "codigo_departamento= ?, ";
			}
			if (proyectoObj.getCodigoSnip() != 0) {
				query += "codigo_snip= ?, ";
			}
			if (proyectoObj.getObjetivo_estrategico_id() != 0) {
				query += "objetivo_estrategico_id= ?, ";
			}
			query += "usuario_responsable= ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ? and subprograma_id = ? and subprograma_programa_id= ? and subprograma_programa_tipo_presupuesto_id= ? and subprograma_programa_entidad_id= ? and subprograma_programa_entidad_nivel_id= ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (proyectoObj.getNombreProyecto() != "") {
				cantCampos++;
				update.setString(cantCampos, proyectoObj.getNombreProyecto());
			}
			if (proyectoObj.getDescripcionProyecto() != "") {
				cantCampos++;
				update.setString(cantCampos,
						proyectoObj.getDescripcionProyecto());
			}
			if (proyectoObj.getAbrevProyecto() != "") {
				cantCampos++;
				update.setString(cantCampos, proyectoObj.getAbrevProyecto());
			}
			if (proyectoObj.getAnio() != 2017) {
				cantCampos++;
				update.setShort(cantCampos, proyectoObj.getAnio());
			}
			if (proyectoObj.getCodigoUnidadResponsable() != 0) {
				cantCampos++;
				update.setShort(cantCampos,
						proyectoObj.getCodigoUnidadResponsable());
			}
			if (proyectoObj.getCodigoFuncional() != 0) {
				cantCampos++;
				update.setShort(cantCampos, proyectoObj.getCodigoFuncional());
			}
			if (proyectoObj.getDiagnostico() != "") {
				cantCampos++;
				update.setString(cantCampos, proyectoObj.getDiagnostico());
			}
			if (proyectoObj.getResultadoEsperado() != "") {
				cantCampos++;
				update.setString(cantCampos, proyectoObj.getResultadoEsperado());
			}
			if (proyectoObj.getCodigoDepartamento() != null) {
				cantCampos++;
				update.setShort(cantCampos, proyectoObj.getCodigoDepartamento());
			}
			if (proyectoObj.getCodigoSnip() != 0) {
				cantCampos++;
				update.setShort(cantCampos, proyectoObj.getCodigoSnip());
			}
			if (proyectoObj.getObjetivo_estrategico_id() != 0) {
				cantCampos++;
				update.setShort(cantCampos,
						proyectoObj.getObjetivo_estrategico_id());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setShort(cantCampos, proyectoObj.getCodigoProyecto());
			cantCampos++;
			update.setShort(cantCampos, proyectoObj.getCodigoSubprograma());
			cantCampos++;
			update.setShort(cantCampos, proyectoObj.getCodigoPrograma());
			cantCampos++;
			update.setShort(cantCampos, proyectoObj.getTipoPrograma());
			cantCampos++;
			update.setShort(cantCampos, proyectoObj.getEntidad());
			cantCampos++;
			update.setShort(cantCampos, proyectoObj.getNivel());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		/*
		 * Connection conect=ConnectionConfiguration.conectar(); Statement
		 * statement = null; String query = "update proyecto set "; if
		 * (objeto.getNombreProyecto()!="") query+=
		 * "nombre=\""+objeto.getNombreProyecto()+"\", "; if
		 * (objeto.getDescripcionProyecto()!="") query+=
		 * "descripcion=\""+objeto.getDescripcionProyecto()+"\", "; if
		 * (objeto.getAbrevProyecto()!="") query+=
		 * "abrev=\""+objeto.getAbrevProyecto()+"\", "; if
		 * (objeto.getAnio()!=2017) query+= "anho=\""+objeto.getAnio()+"\", ";
		 * if (objeto.getCodigoUnidadResponsable()!=0) query+=
		 * "unidad_responsable_id=\""
		 * +objeto.getCodigoUnidadResponsable()+"\", "; if
		 * (objeto.getCodigoFuncional()!=0) query+=
		 * "funcional_id=\""+objeto.getCodigoFuncional()+"\", "; if
		 * (objeto.getDiagnostico()!="") query+=
		 * "diagnostico=\""+objeto.getDiagnostico()+"\", "; if
		 * (objeto.getResultadoEsperado()!="") query+=
		 * "resultado_esperado=\""+objeto.getResultadoEsperado()+"\", "; if
		 * (objeto.getCodigoDepartamento()!=null) query+=
		 * "codigo_departamento=\""+objeto.getCodigoDepartamento()+"\", "; if
		 * (objeto.getCodigoSnip()!=0) query+=
		 * "codigo_snip=\""+objeto.getCodigoSnip()+"\", "; if
		 * (objeto.getObjetivo_estrategico_id()!=0) query+=
		 * "objetivo_estrategico_id=\""
		 * +objeto.getObjetivo_estrategico_id()+"\", "; query =
		 * query.substring(0, query.length()-2);
		 * query+=" where id = "+objeto.getCodigoProyecto
		 * ()+" and subprograma_id = "
		 * +objeto.getCodigoSubprograma()+" and subprograma_programa_id="
		 * +objeto.
		 * getCodigoPrograma()+" and subprograma_programa_tipo_presupuesto_id="
		 * +objeto
		 * .getTipoPrograma()+" and subprograma_programa_entidad_id="+objeto
		 * .getEntidad
		 * ()+" and subprograma_programa_entidad_nivel_id="+objeto.getNivel();
		 * 
		 * try { statement=conect.createStatement(); statement.execute(query);
		 * conect.close(); } catch (SQLException e) {e.printStackTrace();}
		 */
	}

	public static void updateResultados(Resultado resultadoObj,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update objetivo set ";
			PreparedStatement update = null;

			if (resultadoObj.getNombre() != "") {
				query += "nombre= ?, ";
			}
			if (resultadoObj.getDescripcion() != "") {
				query += "descripcion= ?, ";
			}
			if (resultadoObj.getNivel() != 0) {
				query += "nivel= ?, ";
			}
			if (resultadoObj.getEntidad() != 0) {
				query += "entidad= ?, ";
			}
			if (resultadoObj.getPrograma() != 0) {
				query += "programa= ?,  ";
			}
			if (resultadoObj.getSubprograma() != 0) {
				query += "subprograma= ?, ";
			}
			if (resultadoObj.getProyecto() != 0) {
				query += "proyecto= ?, ";
			}
			if (resultadoObj.getFuncional() != 0) {
				query += "funcional= ?, ";
			}
			if (resultadoObj.getVersion() != 0) {
				query += "version= ?, ";
			}
			if (resultadoObj.getAnho() != 0) {
				query += "anho= ?, ";
			}
			query += "usuario_responsable= ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ? and tipo_objetivo_id= ? and tipo_presupuesto= ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (resultadoObj.getNombre() != "") {
				cantCampos++;
				update.setString(cantCampos, resultadoObj.getNombre());
			}
			if (resultadoObj.getDescripcion() != "") {
				cantCampos++;
				update.setString(cantCampos, resultadoObj.getDescripcion());
			}
			if (resultadoObj.getNivel() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getNivel());
			}
			if (resultadoObj.getEntidad() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getEntidad());
			}
			if (resultadoObj.getPrograma() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getPrograma());
			}
			if (resultadoObj.getSubprograma() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getSubprograma());
			}
			if (resultadoObj.getProyecto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getProyecto());
			}
			if (resultadoObj.getFuncional() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getFuncional());
			}
			if (resultadoObj.getVersion() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getVersion());
			}
			if (resultadoObj.getAnho() != 0) {
				cantCampos++;
				update.setInt(cantCampos, resultadoObj.getAnho());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, resultadoObj.getId());
			cantCampos++;
			update.setInt(cantCampos, resultadoObj.getTipo_objetivo_id());
			cantCampos++;
			update.setInt(cantCampos, resultadoObj.getTipo_presupuesto());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public static boolean updateObjetivos(Objetivo objetivo,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update objetivo set ";
			PreparedStatement update = null;

			if (objetivo.getNombre() != "") {
				query += "nombre= ?, ";
			}
			if (objetivo.getDescripcion() != "") {
				query += "descripcion= ?, ";
			}
			query += "usuario_responsable= ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ? and tipo_objetivo_id = ? and version = ? and anho = ? ";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (objetivo.getNombre() != "") {
				cantCampos++;
				update.setString(cantCampos, objetivo.getNombre());
			}
			if (objetivo.getDescripcion() != "") {
				cantCampos++;
				update.setString(cantCampos, objetivo.getDescripcion());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, objetivo.getId());
			cantCampos++;
			update.setInt(cantCampos, objetivo.getTipo_objetivo_id());
			cantCampos++;
			update.setInt(cantCampos, objetivo.getVersion());
			cantCampos++;
			update.setInt(cantCampos, objetivo.getAnho());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	

	public static boolean updateBorradoObjetivos(Objetivo objetivoObjeto,
			String usuarioResponsable) throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		objetivoObjeto.changeBorrado();

		String query = "update objetivo set borrado='"
				+ objetivoObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where id =" + objetivoObjeto.getId()
				+ " and tipo_objetivo_id="
				+ objetivoObjeto.getTipo_objetivo_id() + " and version="
				+ objetivoObjeto.getVersion() + " and anho="
				+ objetivoObjeto.getAnho();
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/*
	 * borrado con el entero public static boolean
	 * updateBorradoObjetivos(Objetivo objetivoObjeto)throws ParseException{ try
	 * { Connection conect=ConnectionConfiguration.conectar(); String query =
	 * "update objetivo set "; PreparedStatement update = null;
	 * 
	 * if (objetivoObjeto.getBorrado() !=1 ) query+= "borrado = 1 ";
	 * 
	 * query+="where id = ? "; update = conect.prepareStatement(query);
	 * update.setInt (1, objetivoObjeto.getId());
	 * 
	 * update.execute(); conect.close(); return true; } catch (SQLException e)
	 * {e.printStackTrace(); return false;} }
	 */
	public static boolean updateObjetivoSugerido(ObjetivoSugerido objeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update objetivo_sugerido set ";
			PreparedStatement update = null;

			if (objeto.getObjetivoId() != 0) {
				query += " objetivo_id = ?, ";
			}
			if (objeto.getTipoObjetivoId() != 0) {
				query += " objetivo_tipo_objetivo_id = ?, ";
			}
			if (objeto.getObjetivoAnho() != 0) {
				query += " objetivo_anho = ?, ";
			}
			if (objeto.getObjetivoVersion() != 0) {
				query += " objetivo_version = ?, ";
			}
			if (objeto.getObjetivoSugeridoId() != 0) {
				query += " objetivo_sugerido_id = ?, ";
			}
			if (objeto.getObjetivoSugeridoTipoId() != 0) {
				query += " objetivo_sugerido_tipo_id = ?, ";
			}
			if (objeto.getObjetivoSugeridoAnho() != 0) {
				query += " objetivo_sugerido_anho = ?, ";
			}
			if (objeto.getObjetivoSugeridoVersion() != 0) {
				query += " objetivo_sugerido_version = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where objetivo_id = ? and objetivo_tipo_objetivo_id = ? and objetivo_anho = ? and objetivo_version = ? and objetivo_sugerido_id = ? and objetivo_sugerido_tipo_id = ? and objetivo_sugerido_anho = ? and objetivo_sugerido_version = ?";

			int cantCampos = 0;

			update = conect.prepareStatement(query);
			if (objeto.getObjetivoId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoId());
			}
			if (objeto.getTipoObjetivoId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getTipoObjetivoId());
			}
			if (objeto.getObjetivoAnho() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoAnho());
			}
			if (objeto.getObjetivoVersion() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoVersion());
			}
			if (objeto.getObjetivoSugeridoId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoSugeridoId());
			}
			if (objeto.getObjetivoSugeridoTipoId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoSugeridoTipoId());
			}
			if (objeto.getObjetivoSugeridoAnho() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoSugeridoAnho());
			}
			if (objeto.getObjetivoSugeridoVersion() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getObjetivoSugeridoVersion());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getTipoObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoVersion());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoSugeridoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoSugeridoTipoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoSugeridoAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoSugeridoVersion());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateBorradoObjetivosSugeridos(
			ObjetivoSugerido objetivoSugeridoObjeto, String usuarioResponsable)
			throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		objetivoSugeridoObjeto.changeBorrado();

		String query = "update objetivo_sugerido set borrado='"
				+ objetivoSugeridoObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where objetivo_id ="
				+ objetivoSugeridoObjeto.getObjetivoId()
				+ " and objetivo_tipo_objetivo_id="
				+ objetivoSugeridoObjeto.getTipoObjetivoId()
				+ " and objetivo_anho="
				+ objetivoSugeridoObjeto.getObjetivoAnho()
				+ " and objetivo_version="
				+ objetivoSugeridoObjeto.getObjetivoVersion()
				+ " and objetivo_sugerido_id="
				+ objetivoSugeridoObjeto.getObjetivoSugeridoId()
				+ " and objetivo_sugerido_tipo_id="
				+ objetivoSugeridoObjeto.getObjetivoSugeridoTipoId()
				+ " and objetivo_sugerido_anho="
				+ objetivoSugeridoObjeto.getObjetivoSugeridoAnho()
				+ " and objetivo_sugerido_version="
				+ objetivoSugeridoObjeto.getObjetivoSugeridoVersion();
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void updateObjetivo(String id, String nombre,
			String descripcion, String tipo_objetivo_id,
			String usuarioResponsable) {

		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update objetivo set";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		// if (tipo_objetivo_id!="") query+=
		// "tipo_objetivo_id=\""+tipo_objetivo_id+"\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += " where id = " + id + " and tipo_objetivo_id="
				+ tipo_objetivo_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateIndicador(String id, String nombre,
			String descripcion, String tipo_indicador_id,
			String metodo_calculo_id, String unidad_medida_id,
			String frecuencia_meses,
			String desagregacion_tipo_zona_geografica_id,
			String tipo_demografica_id, String fuente_verificacion_id,
			String observaciones, String objetivo_id, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update indicador set";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		// if (tipo_indicador_id!="") query+=
		// "tipo_indicador_id=\""+tipo_indicador_id+"\", ";
		 if (metodo_calculo_id!="") query+=
		 "metodo_calculo_id=\""+metodo_calculo_id+"\", ";
		// if (unidad_medida_id!="") query+=
		// "unidad_medida_id=\""+unidad_medida_id+"\", ";
		if (frecuencia_meses != "")
			query += "frecuencia_meses=\"" + frecuencia_meses + "\", ";
		// if (desagregacion_tipo_zona_geografica_id!="") query+=
		// "desagregacion_tipo_zona_geografica_id=\""+desagregacion_tipo_zona_geografica_id+"\", ";
		// if (tipo_demografica_id!="") query+=
		// "tipo_demografica_id=\""+tipo_demografica_id+"\", ";
		// if (fuente_verificacion_id!="") query+=
		// "fuente_verificacion_id=\""+fuente_verificacion_id+"\", ";
		if (observaciones != "")
			query += "observaciones=\"" + observaciones + "\", ";
		// if (objetivo_id!="") query+= "objetivo_id=\""+objetivo_id+"\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += " where id = " + id + " and objetivo_id=" + objetivo_id
				+ " and tipo_indicador_id=" + tipo_indicador_id
				+ " and unidad_medida_id=" + unidad_medida_id
				+ " and desagregacion_tipo_zona_geografica_id="
				+ desagregacion_tipo_zona_geografica_id
				+ " and tipo_demografica_id=" + tipo_demografica_id;// quite
																	// fuente_verificacion_id="+fuente_verificacion_id

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateMeta(String id, String cantidad,
			String vencimiento, String indicador_id, String zona_geografica_id,
			String demografia_id, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update meta set";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (cantidad != "")
			query += "cantidad=\"" + cantidad + "\", ";
		if (vencimiento != "")
			query += "vencimiento=\"" + vencimiento + "\", ";
		// if (indicador_id!="") query+= "indicador_id=\""+indicador_id+"\", ";
		// if (zona_geografica_id!="") query+=
		// "zona_geografica_id=\""+zona_geografica_id+"\", ";
		// if (demografia_id!="") query+=
		// "demografia_id=\""+demografia_id+"\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += " where id = " + id + " and indicador_id=" + indicador_id
				+ " and zona_geografica_id=" + zona_geografica_id
				+ " demografia_id=" + demografia_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean updateMetaCrud(Meta objeto, String usuarioResponsable, String nivel, String entidad) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			
			String tabla="";
			if(objeto.getAvance().equals("Avance")){
				tabla="avance_indicador ";
			}else{
				if(objeto.getAvance().equals("Metas")){
					tabla="meta ";
				}
			}
			
			String query = "update "+tabla+" set";
			PreparedStatement update = null;

			if (objeto.getCantidad() != 0) {
				query += " cantidad = ?,";
			}
			if (objeto.getVencimiento() != null) {
				query += " vencimiento = ?,";
			}
			if (objeto.getNivel() != 0) {
				query += " nivel = ?,";
			}
			if (objeto.getEntidad() != 0) {
				query += " entidad = ?,";
			}
			query += " usuario_responsable = ?,";

			query = query.substring(0, query.length() - 1);
			query += " where id = ? and indicador_id = ? and zona_geografica_id = ? and demografia_id = ? and nivel = ? and entidad = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (objeto.getCantidad() != 0) {
				cantCampos++;
				update.setDouble(cantCampos, objeto.getCantidad());
			}
			if (objeto.getVencimiento() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getVencimiento());
			}
			if (objeto.getNivel() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getNivel());
			}
			if (objeto.getEntidad() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getEntidad());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, objeto.getId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getIndicador_id());
			cantCampos++;
			update.setInt(cantCampos, objeto.getZona_geografica_id());
			cantCampos++;
			update.setInt(cantCampos, objeto.getDemografia_id());
			cantCampos++;
			update.setInt(cantCampos, Integer.parseInt(nivel));
			cantCampos++;
			update.setInt(cantCampos, Integer.parseInt(entidad));	
			
			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	/*
	 * public static void updateProductoPresupuestoMeta(ProductoPresupuestoMetas
	 * metas){ try { Connection conect=ConnectionConfiguration.conectar();
	 * String query = "update producto_presupuesto_meta set "; PreparedStatement
	 * update = null;
	 * 
	 * if (metas.getCantidades() !=null) { query+= "cantidad= ?, ";} if
	 * (metas.getCatalogo_destianatario_id() !="1") { query+=
	 * "catalogo_destinatario_id= ?, ";} if (metas.getUnidad_medida_id() !=null)
	 * { query+= "unidad_medida_id= ?, ";}
	 * 
	 * query = query.substring(0, query.length()-2);
	 * query+=" where entidad_id = ? "; query+=" and nivel_id = ? ";
	 * query+=" and tipo_presupuesto_id = ? "; query+=" and programa_id = ? ";
	 * query+=" and subprograma_id = ? "; query+=" and proyecto_id = ? ";
	 * query+=" and producto_id = ? ";
	 * query+=" and producto_presupusto_id = ? ";
	 * query+=" and departamento_id = ? "; query+=" and anho = ? ";
	 * query+=" and mes = ? ";
	 * 
	 * //int cantCampos =0; update = conect.prepareStatement(query); if
	 * (!metas.getCantidades().equals(0.0)) update.setString(1,
	 * metas.getCantidades());
	 * 
	 * if (!metas.getCatalogo_destianatario_id().equals(1)) update.setInt(2,
	 * metas.getCatalogo_destianatario_id());
	 * 
	 * if (metas.getUnidad_medida_id() !=null) { cantCampos++;update.setInt
	 * (cantCampos, metas.getUnidad_medida_id());}
	 * 
	 * cantCampos++; update.setShort (cantCampos, metas.getEntidad_id());
	 * cantCampos++; update.setShort (cantCampos, metas.getNivel_id());
	 * cantCampos++; update.setShort (cantCampos,
	 * metas.getTipo_presupuesto_id()); cantCampos++; update.setShort
	 * (cantCampos, metas.getPrograma_id()); cantCampos++; update.setShort
	 * (cantCampos, metas.getSubprograma_id()); cantCampos++; update.setShort
	 * (cantCampos, metas.getProyecto_id()); cantCampos++; update.setShort
	 * (cantCampos, metas.getProducto_presupusto_id()); cantCampos++;
	 * update.setShort (cantCampos, metas.getDepartamento()); cantCampos++;
	 * update.setShort (cantCampos, metas.getAnho()); cantCampos++;
	 * update.setShort (cantCampos, metas.getMes());
	 * 
	 * update.execute(); conect.close(); } catch (SQLException e)
	 * {e.printStackTrace();}
	 * 
	 * 
	 * 
	 * }
	 */
	public static boolean updateProductoPresupuestoMeta(double cantidad,
			String anho, String mes, String catalogo_destinatario_id,
			String departamento_id, String producto_presupusto_id,
			String producto_id, String unidad_medida_id, String proyecto_id,
			String subprograma_id, String programa_id,
			String tipo_presupuetso_id, String entidad_id, String nivel_id,
			String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update producto_presupuesto_meta set ";
		// if (entidad_id!="") query+= "entidad_id=\""+entidad_id+"\", ";
		// if (nivel_id!="") query+= "nivel_id=\""+nivel_id+"\", ";
		// if (tipo_presupuetso_id!="") query+=
		// "tipo_presupuetso_id=\""+tipo_presupuetso_id+"\", ";
		// if (programa_id!="") query+= "programa_id=\""+programa_id+"\", ";
		// if (subprograma_id!="") query+=
		// "subprograma_id=\""+subprograma_id+"\", ";
		// if (proyecto_id!="") query+= "proyecto_id=\""+proyecto_id+"\", ";
		// if (producto_id!="") query+= "producto_id=\""+producto_id+"\", ";
		// if (producto_presupusto_id!="") query+=
		// "producto_presupusto_id=\""+producto_presupusto_id+"\", ";
		// if (departamento_id!="") query+=
		// "departamento_id=\""+departamento_id+"\", ";
		// if (anho!="") query+= "anho=\""+anho+"\", ";
		// if (mes!="") query+= "mes=\""+mes+"\", ";
		if (cantidad > -1.0)
			query += "cantidad=" + cantidad + ", ";
		if (catalogo_destinatario_id != null)
			query += "catalogo_destinatario_id=" + catalogo_destinatario_id
					+ ", ";
		if (unidad_medida_id != null)
			query += "unidad_medida_id=" + unidad_medida_id + ", ";
		query += "usuario_responsable='" + usuarioResponsable + "', ";

		query = query.substring(0, query.length() - 2);
		query += " where entidad_id = " + entidad_id;
		query += " and nivel_id = " + nivel_id;
		query += " and tipo_presupuesto_id = " + tipo_presupuetso_id;
		query += " and programa_id = " + programa_id;
		query += " and subprograma_id = " + subprograma_id;
		query += " and proyecto_id = " + proyecto_id;
		query += " and producto_id = " + producto_id;
		query += " and producto_presupusto_id = " + producto_id;
		query += " and departamento_id = " + departamento_id;
		query += " and anho = " + anho;
		query += " and mes = " + mes;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean updateAsignacionFinanciera(
			int nivel, int entidad, int tipo, int programa, int subPrograma, int proyecto, int producto, int objetoGasto, int fuenteFinanciamiento, int organismoFinanciador, int pais, int departamento,
			double planificado1, double planificado2, double planificado3, double planificado4, double planificado5, double planificado6, double planificado7, double planificado8, double planificado9, double planificado10, double planificado11, double planificado12, int anho, int version,			
			String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update asignacion_presi set ";
		
		if (planificado1 >= 0.0) query += " planificado1=" + planificado1 + ", ";
		if (planificado2 >= 0.0) query += " planificado2=" + planificado2 + ", ";
		if (planificado3 >= 0.0) query += " planificado3=" + planificado3 + ", ";
		if (planificado4 >= 0.0) query += " planificado4=" + planificado4 + ", ";
		if (planificado5 >= 0.0) query += " planificado5=" + planificado5 + ", ";
		if (planificado6 >= 0.0) query += " planificado6=" + planificado6 + ", ";
		if (planificado7 >= 0.0) query += " planificado7=" + planificado7 + ", ";
		if (planificado8 >= 0.0) query += " planificado8=" + planificado8 + ", ";
		if (planificado9 >= 0.0) query += " planificado9=" + planificado9 + ", ";
		if (planificado10 >= 0.0) query += " planificado10=" + planificado10 + ", ";
		if (planificado11 >= 0.0) query += " planificado11=" + planificado11 + ", ";
		if (planificado12 >= 0.0) query += " planificado12=" + planificado12 + ", ";
		
		query = query.substring(0, query.length() - 2);
		
		query += " where entidad = " + entidad;
		query += " and nivel = " + nivel;
		query += " and tipo = " + tipo;
		query += " and programa= " + programa;
		query += " and subprograma = " + subPrograma;
		query += " and proyecto = " + proyecto;
		query += " and producto = " + producto;
		query += " and anho = " + anho;
		query += " and version = " + version;
		query += " and objeto_gasto= " + objetoGasto;
		query += " and fuente_financiamiento= " + fuenteFinanciamiento;
		query += " and organismo_financiador= " + organismoFinanciador;
		query += " and pais= " + pais;
		query += " and departamento= " + departamento;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void updateCatalogoDestinatario(String id, String nombre,
			String descripcion, String tipo_catalogo_destinatario_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update catalogo_destinatario set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (tipo_catalogo_destinatario_id != "")
			query += "tipo_catalogo_destinatario_id=\""
					+ tipo_catalogo_destinatario_id + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateCatalogoDncp(String id, String nombre,
			String descripcion, String anho, String numero_fila, String precio,
			String objeto_de_gasto_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update catalogo_dncp set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		if (precio != "")
			query += "precio=\"" + precio + "\", ";
		// if (objeto_de_gasto_id!="") query+=
		// "objeto_de_gasto_id=\""+objeto_de_gasto_id+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id + " and objeto_de_gasto_id ="
				+ objeto_de_gasto_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateDemografia(String id, String nombre,
			String descripcion, String tipo_demografica_id, String abrev) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update demografia set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		// if (tipo_demografica_id!="") query+=
		// "tipo_demografica_id=\""+tipo_demografica_id+"\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id + " and tipo_demografica_id="
				+ tipo_demografica_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateDepartamento(String id, String nombre,
			String descripcion, String pais, String numero_fila, String abrev) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update departamento set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (pais != "")
			query += "pais=\"" + pais + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateDiccionarioDato(String id, String clase,
			String nombre, String titulo, String descripcion, String instructivo) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update diccionario_dato set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (clase != "")
			query += "clase=\"" + clase + "\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (titulo != "")
			query += "titulo=\"" + titulo + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (instructivo != "")
			query += "instructivo=\"" + instructivo + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateEjeEstrategico(String id, String nombre,
			String descripcion, String plan_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update eje_estrategico set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		// if (plan_id!="") query+= "plan_id=\""+plan_id+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id + " and plan_id=" + plan_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateEstrategia(String id, String nombre,
			String descripcion, String numero_fila, String eje_estrategico_id,
			String linea_transversal_id, String plan) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update estrategia set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		// if (eje_estrategico_id!="") query+=
		// "eje_estrategico_id=\""+eje_estrategico_id+"\", ";
		// if (linea_transversal_id!="") query+=
		// "linea_transversal_id=\""+linea_transversal_id+"\", ";
		// if (plan!="") query+= "plan=\""+plan+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id + " and eje_estrategico_id="
				+ eje_estrategico_id + " linea_transversal_id="
				+ linea_transversal_id + " and plan=" + plan;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateEstrategiaHasObjetivo(String id,
			String estrategia_id, String estrategia_eje_estrategico_id,
			String estrategia_linea_transversal_id, String objetivo_id,
			String objetivo_tipo_objetivo_id, String es_principal) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update estrategia_has_objetivo set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (estrategia_id != "")
			query += "estrategia_id=\"" + estrategia_id + "\", ";
		if (estrategia_eje_estrategico_id != "")
			query += "estrategia_eje_estrategico_id=\""
					+ estrategia_eje_estrategico_id + "\", ";
		if (estrategia_linea_transversal_id != "")
			query += "estrategia_linea_transversal_id=\""
					+ estrategia_linea_transversal_id + "\", ";
		if (objetivo_id != "")
			query += "objetivo_id=\"" + objetivo_id + "\", ";
		if (objetivo_tipo_objetivo_id != "")
			query += "objetivo_tipo_objetivo_id=\"" + objetivo_tipo_objetivo_id
					+ "\", ";
		if (es_principal != "")
			query += "es_principal=\"" + es_principal + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateFuenteFinanciamiento(String id, String nombre,
			String descripcion, String anho, String numero_fila) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update fuente_financiamiento set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateFuenteVerificacion(String id, String nombre,
			String descripcion, String abrev, String uri) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update fuente_verificacion set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (uri != "")
			query += "uri=\"" + uri + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateFuncional(String id, String numero_fila,
			String nombre, String descripcion, String abrev, String es_imputable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update funcional set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (es_imputable != "")
			query += "es_imputable=\"" + es_imputable + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateLineaTransversal(String id, String nombre,
			String descripcion, String abrev, String plan_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update linea_transversal set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		// if (plan_id!="") query+= "plan_id=\""+plan_id+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id + " and plan_id=" + plan_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/*
	 * public static void updateMes(String id, String nombre, String abrev){
	 * Connection conect=ConnectionConfiguration.conectar(); Statement statement
	 * = null; String query = "update mes set "; //if (id!="") query+=
	 * "id=\""+id+"\", "; if (nombre!="") query+= "nombre=\""+nombre+"\", "; if
	 * (abrev!="") query+= "abrev=\""+abrev+"\", "; query = query.substring(0,
	 * query.length()-2); query+="where id ="+id;
	 * 
	 * try { statement=conect.createStatement(); statement.execute(query);
	 * conect.close(); } catch (SQLException e) {e.printStackTrace();} }
	 */

	public static void updateMetodoCalculo(String id, String nombre,
			String descripcion, String clase) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update metodo_calculo set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (clase != "")
			query += "clase=\"" + clase + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateModulo(String id, String nombre) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update modulo set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id =" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateModuloHasPermiso(String role_id, String modulo_id,
			String permiso_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update modulo_has_permiso set ";
		// if (role_id!="") query+= "role_id=\""+role_id+"\", ";
		// if (modulo_id!="") query+= "modulo_id=\""+modulo_id+"\", ";
		if (permiso_id != "")
			query += "permiso_id=\"" + permiso_id + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where role_id=" + role_id + " and modulo_id=" + modulo_id
				+ "and permiso_id" + permiso_id;// agregue al query permiso_id

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateNivel(String id, String numero_fila,
			String cod_nivel, String anho, String nombre, String descripcion,
			String abrev, String es_imputable, String fecha_creacion,
			String verion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update nivel set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		if (cod_nivel != "")
			query += "cod_nivel=\"" + cod_nivel + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (es_imputable != "")
			query += "es_imputable=\"" + es_imputable + "\", ";
		if (fecha_creacion != "")
			query += "fecha_creacion=\"" + fecha_creacion + "\", ";
		if (verion != "")
			query += "verion=\"" + verion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateObjetoDeGasto(String id, String nombre,
			String descripcion, String abrev, String es_imputable,
			String numero_fila, String anho) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update objeto_de_gasto set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (es_imputable != "")
			query += "es_imputable=\"" + es_imputable + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateOrganismoFinanciador(String id, String nombre,
			String descripcion, String numero_fila, String anho) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update organismo_financiador set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updatePermiso(String id, String nombre) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update permiso set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updatePlan(String id, String nombre, String descripcion,
			String detalle, String entidad_responsable, String fecha_incio,
			String fecha_fin) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update plan set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (detalle != "")
			query += "detalle=\"" + detalle + "\", ";
		if (entidad_responsable != "")
			query += "entidad_responsable=\"" + entidad_responsable + "\", ";
		if (fecha_incio != "")
			query += "fecha_incio=\"" + fecha_incio + "\", ";
		if (fecha_fin != "")
			query += "fecha_fin=\"" + fecha_fin + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// catalogo de productos, productoMeta de hacienda
	public static void updateProducto(String id, String nombre,
			String descripcion, String clase, String unidad_medida_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update producto set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (clase != "")
			query += "clase=\"" + clase + "\", ";
		// if (unidad_medida_id!="") query+=
		// "unidad_medida_id=\""+unidad_medida_id+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and unidad_medida_id=" + unidad_medida_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateProductoPresupuesto(String id, String numero_fila,
			String anho, String producto_id, String producto_unidad_medida_id,
			String proyecto_id, String proyecto_subprograma_id,
			String proyecto_subprograma_programa_id,
			String proyecto_subprograma_programa_tipo_presupuesto_id,
			String proyecto_subprograma_programa_entidad_id,
			String proyecto_subprograma_programa_entidad_nivel_id,
			String version) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update producto_presupusto set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		// if (producto_id!="") query+= "producto_id=\""+producto_id+"\", ";
		// if (producto_unidad_medida_id!="") query+=
		// "producto_unidad_medida_id=\""+producto_unidad_medida_id+"\", ";
		// if (proyecto_id!="") query+= "proyecto_id=\""+proyecto_id+"\", ";
		// if (proyecto_subprograma_id!="") query+=
		// "proyecto_subprograma_id=\""+proyecto_subprograma_id+"\", ";
		// if (proyecto_subprograma_programa_id!="") query+=
		// "proyecto_subprograma_programa_id=\""+proyecto_subprograma_programa_id+"\", ";
		// if (proyecto_subprograma_programa_tipo_presupuesto_id!="") query+=
		// "proyecto_subprograma_programa_tipo_presupuesto_id=\""+proyecto_subprograma_programa_tipo_presupuesto_id+"\", ";
		// if (proyecto_subprograma_programa_entidad_id!="") query+=
		// "proyecto_subprograma_programa_entidad_id=\""+proyecto_subprograma_programa_entidad_id+"\", ";
		// if (proyecto_subprograma_programa_entidad_nivel_id!="") query+=
		// "proyecto_subprograma_programa_entidad_nivel_id=\""+proyecto_subprograma_programa_entidad_nivel_id+"\", ";
		if (version != "")
			query += "version=\"" + version + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and producto_id=" + producto_id
				+ " and producto_unidad_medida_id=" + producto_unidad_medida_id
				+ " and proyecto_id=" + proyecto_id
				+ " and proyecto_subprograma_id=" + proyecto_subprograma_id
				+ " and proyecto_subprograma_programa_id="
				+ proyecto_subprograma_programa_id
				+ " and proyecto_subprograma_programa_tipo_presupuesto_id="
				+ proyecto_subprograma_programa_tipo_presupuesto_id
				+ " and proyecto_subprograma_programa_entidad_id="
				+ proyecto_subprograma_programa_entidad_id
				+ " and proyecto_subprograma_programa_entidad_nivel_id="
				+ proyecto_subprograma_programa_entidad_nivel_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateProgramatico(String id, String nombre,
			String descripcion, String tipo_programatico_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update programatico set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		// if (tipo_programatico_id!="") query+=
		// "tipo_programatico_id=\""+tipo_programatico_id+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and tipo_programatico_id="
				+ tipo_programatico_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateProgramaticoHasObjetivo(String programatico_id,
			String programatico_tipo_programatico_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update programatico_has_objetivo set ";
		// if (programatico_id!="") query+=
		// "programatico_id=\""+programatico_id+"\", ";
		// sacar el where a programatico_tipo_programatico_id
		if (programatico_tipo_programatico_id != "")
			query += "programatico_tipo_programatico_id=\""
					+ programatico_tipo_programatico_id + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where programatico_id=" + programatico_id
				+ " and programatico_tipo_programatico_id="
				+ programatico_tipo_programatico_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateProyectoSnip(String id, String nombre,
			String descripcion, String estado) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update proyecto_snip set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (estado != "")
			query += "estado=\"" + estado + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateProyectoSnipAutorizado(String id, String nombre,
			String descripcion, String anho, String monto, String entidad_id,
			String entidad_nivel_id, String proyecto_snip_id,
			String organismo_financiador_id, String fuente_financiamiento_id) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update proyecto_snip_autorizado set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		if (monto != "")
			query += "monto=\"" + monto + "\", ";
		// if (entidad_id!="") query+= "entidad_id=\""+entidad_id+"\", ";
		// if (entidad_nivel_id!="") query+=
		// "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
		// if (proyecto_snip_id!="") query+=
		// "proyecto_snip_id=\""+proyecto_snip_id+"\", ";
		// if (organismo_financiador_id!="") query+=
		// "organismo_financiador_id=\""+organismo_financiador_id+"\", ";
		// if (fuente_financiamiento_id!="") query+=
		// "fuente_financiamiento_id=\""+fuente_financiamiento_id+"\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and entidad_id=" + entidad_id
				+ " and entidad_nivel_id=" + entidad_nivel_id
				+ " and proyecto_snip_id=" + proyecto_snip_id
				+ " and organismo_financiador_id=" + organismo_financiador_id
				+ " and fuente_financiamiento_id=" + fuente_financiamiento_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateRole(String id, String nombre) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update role set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoCatalogoDestinatario(String id, String nombre,
			String descripcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_catalogo_destinatario set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoDemografica(String id, String nombre,
			String descripcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_demografica set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoIndicador(String id, String nombre,
			String descripcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_indicador set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoObjetivo(String id, String nombre,
			String descripcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_objetivo set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoPresupuesto(String id, String nombre,
			String abrev, String descripcion, String anho, String numero_fila) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_presupuesto set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoProgramatico(String id, String nombre,
			String descripcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_programatico set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTipoZonaGeografica(String id, String nombre,
			String descipcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update tipo_zona_geografica set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descipcion != "")
			query += "descipcion=\"" + descipcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateUnidadJerarquica(String id, String nombre,
			String descipcion, String entidad_id, String entidad_nivel_id,
			String anho, String numero_fila) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update unidad_jerarquica set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descipcion != "")
			query += "descipcion=\"" + descipcion + "\", ";
		// if (entidad_id!="") query+= "entidad_id=\""+entidad_id+"\", ";
		// if (entidad_nivel_id!="") query+=
		// "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and entidad_id=" + entidad_id
				+ " and entidad_nivel_id=" + entidad_nivel_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateUnidadMedida(String id, String nombre,
			String abrev, String simbolo, String descripcion) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update unidad_medida set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (simbolo != "")
			query += "simbolo=\"" + simbolo + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateUnidadResponsable(String id, String nombre,
			String descripcion, String abrev, String numero_fila,
			String entidad_id, String entidad_nivel_id,
			String unidad_jerarquica_id, String anho) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update unidad_responsable set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		if (numero_fila != "")
			query += "numero_fila=\"" + numero_fila + "\", ";
		// if (entidad_id!="") query+= "entidad_id=\""+entidad_id+"\", ";
		// if (entidad_nivel_id!="") query+=
		// "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
		// if (unidad_jerarquica_id!="") query+=
		// "unidad_jerarquica_id=\""+unidad_jerarquica_id+"\", ";
		if (anho != "")
			query += "anho=\"" + anho + "\", ";
		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and entidad_id=" + entidad_id
				+ " and entidad_nivel_id=" + entidad_nivel_id
				+ " and unidad_jerarquica_id=" + unidad_jerarquica_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateUsuario(String id, String correo, String passwd,
			String last_login, String entidad, String role_id,
			String urlimagen, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update usuario set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (correo != "")
			query += "correo=\"" + correo + "\", ";
		if (passwd != "")
			query += "passwd=\"" + passwd + "\", ";
		if (last_login != "")
			query += "last_login=\"" + last_login + "\", ";
		// if (entidad!="") query+= "entidad=\""+entidad+"\", ";
		// if (role_id!="") query+= "role_id=\""+role_id+"\", ";
		if (urlimagen != "")
			query += "urlimagen=\"" + urlimagen + "\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and role_id=" + role_id + " and entidad="
				+ entidad;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean updateProductoPresupuestoDestinatario(
			ProductoPresupuestoDestinatario destinatario,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update producto_presupuesto_destinatario set ";
			PreparedStatement update = null;

			if (destinatario.getCatalogo_destinatario() != 0) {
				query += " catalogo_destinatario = ?, ";
			}
			if (destinatario.getCantidad() > -1.0) {
				query += " cantidad = ?, ";
			}
			if (destinatario.getDescripcion() != "") {
				query += " descripcion = ?, ";
			}
			if (destinatario.getDepartamento() != null) {
				query += " departamento = ?, ";
			}
			{
				query += " usuario_responsable = ?, ";
			}

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);

			if (destinatario.getCatalogo_destinatario() != 0) {
				cantCampos++;
				update.setInt(cantCampos,
						destinatario.getCatalogo_destinatario());
			}
			if (destinatario.getCantidad() > -1.0) {
				cantCampos++;
				update.setDouble(cantCampos, destinatario.getCantidad());
			}
			if (destinatario.getDescripcion() != "") {
				cantCampos++;
				update.setString(cantCampos, destinatario.getDescripcion());
			}
			if (destinatario.getDepartamento() != null) {
				cantCampos++;
				update.setInt(cantCampos, destinatario.getDepartamento().intValue());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, destinatario.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateBorradoProductoPresupuestoDestinatario(
			ProductoPresupuestoDestinatario destinatarioObjeto,
			String usuarioResponsable) throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		destinatarioObjeto.changeBorrado();

		String query = "update producto_presupuesto_destinatario set borrado='"
				+ destinatarioObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where id =" + destinatarioObjeto.getId();
		try {
			statement = conect.createStatement();
			statement.execute(query);

			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean updateDictamenSTP(
			DictamenSTP dictamentSTP,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update dictamen_stp set ";
			PreparedStatement update = null;

			if (dictamentSTP.getEleccion() >= 0 && dictamentSTP.getEleccion() <= 2) {
				query += " eleccion = ?, ";
			}
			
			if (dictamentSTP.getObservacion() != "") {
				query += " observacion = ?, ";
			}
			
			if (dictamentSTP.getUrlDocumento() != "" && dictamentSTP.getUrlDocumento() != null) {
				query += " url_documento = ?, ";
			}

			{
				query += " usuario_responsable = ?, ";
			}

			query = query.substring(0, query.length() - 2);
			query += " where id = ? and justificacion_id = ? ";

			int cantCampos = 0;
			update = conect.prepareStatement(query);

			if (dictamentSTP.getEleccion() >= 0 && dictamentSTP.getEleccion() <=2 ) {
				cantCampos++;
				update.setInt(cantCampos,
						dictamentSTP.getEleccion());
			}
			if (dictamentSTP.getObservacion() != "") {
				cantCampos++;
				update.setString(cantCampos, dictamentSTP.getObservacion());
			}			
			if (dictamentSTP.getUrlDocumento()!= "" && dictamentSTP.getUrlDocumento() != null) {
				cantCampos++;
				update.setString(cantCampos, dictamentSTP.getUrlDocumento());
			}	
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, dictamentSTP.getId());

			cantCampos++;
			update.setInt(cantCampos, dictamentSTP.getJustificacionId());
			
			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean updateBorradoDictamenSTP(DictamenSTP dictamenSTPObjeto,
			String usuarioResponsable) throws ParseException {
		
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		dictamenSTPObjeto.changeBorrado();

		String query = "update dictamen_stp set borrado='"
				+ dictamenSTPObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where id = " + dictamenSTPObjeto.getId();
		try {
			statement = conect.createStatement();
			statement.execute(query);

			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean updateTipoDocumento(TipoDocumento tipoDocumento,String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update tipo_documentos set ";
			PreparedStatement update = null;
			
			if (tipoDocumento.getNombre() != "") {
				query += " nombre = ?, ";
			}
			{
				query += " usuario_responsable = ?, ";
			}

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			
			if (tipoDocumento.getNombre() != "") {
				cantCampos++;
				update.setString(cantCampos, tipoDocumento.getNombre());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, tipoDocumento.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean updateBorradoTipoDocumento(TipoDocumento tipoDocumentoObjeto,
			String usuarioResponsable) throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		tipoDocumentoObjeto.changeBorrado();

		String query = "update tipo_documentos set borrado='" + tipoDocumentoObjeto.isBorrado() + "', ";
		       query += "usuario_responsable='" + usuarioResponsable + "'";

		       query += " where id =" + tipoDocumentoObjeto.getId();
		try {
			statement = conect.createStatement();
			statement.execute(query);

			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean updateBorradoTodosProductoPresupuestoDestinatario(ProductoPresupuestoDestinatario destinatarioObjeto, String usuarioResponsable) throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		destinatarioObjeto.changeBorrado();

		String query = "update producto_presupuesto_destinatario set borrado='"	+ destinatarioObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where nivel =" +destinatarioObjeto.getNivel()+ " and entidad = "+ destinatarioObjeto.getEntidad()+" and tipo_presupuesto = "+destinatarioObjeto.getTipo_presupuesto()+" and programa = "+destinatarioObjeto.getPrograma()+" and subprograma = "+destinatarioObjeto.getSubprograma()+" and proyecto = "+destinatarioObjeto.getProyecto()+" and producto = "+destinatarioObjeto.getProducto();
		try {
			statement = conect.createStatement();
			statement.execute(query);

			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean updateBorradoTodosObjetivoHasObjetivo(ObjetivoHasObjetivo OHOObjeto, String usuarioResponsable) throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();
		
		Statement statement = null;
		OHOObjeto.changeBorrado();

		String query = "update objetivo_has_objetivo set borrado='"	+ OHOObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where producto_concat = '"+OHOObjeto.getProductoConcat()+"'";
		//query += " where nivel =" +OHOObjeto.getNivel()+ " and entidad = "+ OHOObjeto.getEntidad()+" and tipo_presupuesto = "+OHOObjeto.getTipo_presupuesto()+" and programa = "+OHOObjeto.getPrograma()+" and subprograma = "+OHOObjeto.getSubprograma()+" and proyecto = "+OHOObjeto.getProyecto()+" and producto = "+OHOObjeto.getProducto();
		try {
			statement = conect.createStatement();
			statement.execute(query);

			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	public static boolean updateBorradoTodosProductoPresupuestoMeta(ProductoPresupuestoMeta metaObjeto, String usuarioResponsable) throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		metaObjeto.changeBorrado();

		String query = "update producto_presupuesto_meta set borrado='"	+ metaObjeto.isBorrado() + "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where nivel_id =" +metaObjeto.getNivel_id()+ " and entidad_id = "+ metaObjeto.getEntidad_id()+" and tipo_presupuesto_id = "+metaObjeto.getTipo_presupuesto_id()+" and programa_id = "+metaObjeto.getPrograma_id()+" and subprograma_id = "+metaObjeto.getSubprograma_id()+" and proyecto_id = "+metaObjeto.getProyecto_id()+" and producto_id = "+metaObjeto.getProducto_id();
		try {
			statement = conect.createStatement();
			statement.execute(query);

			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	

	public static void updateZonaGeografica(String id, String nombre,
			String descripcion, String abrev, String tipo_zona_geografica_id,
			String cod_geo_unif, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update zona_geografica set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		// if (tipo_zona_geografica_id!="") query+=
		// "tipo_zona_geografica_id=\""+tipo_zona_geografica_id+"\", ";
		if (cod_geo_unif != "")
			query += "cod_geo_unif=\"" + cod_geo_unif + "\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and tipo_zona_geografica_id="
				+ tipo_zona_geografica_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateEstructuraProgramatica(String id, String anho,
			String nivel, String entidad, String tipo, String programa,
			String subprograma, String proyecto, String funcional,
			String diagnostico, String base_legal, String nombre, String abrev,
			String descripcion, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update estructura_programatica set ";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (diagnostico != "")
			query += "diagnostico=\"" + diagnostico + "\", ";
		if (base_legal != "")
			query += "base_legal=\"" + base_legal + "\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (abrev != "")
			query += "abrev=\"" + abrev + "\", ";
		// if (tipo_zona_geografica_id!="") query+=
		// "tipo_zona_geografica_id=\""+tipo_zona_geografica_id+"\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += "where id=" + id + " and anho=" + anho + "and nivel=" + nivel
				+ "and entidad=" + entidad + "and tipo=" + tipo
				+ "and programa" + programa + "and programa=" + subprograma
				+ "and proyecto" + proyecto + "and funcional=" + funcional;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateResultado(String id, String nombre,
			String descripcion, String tipo_objetivo_id,
			String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		String query = "update resultado set";
		// if (id!="") query+= "id=\""+id+"\", ";
		if (nombre != "")
			query += "nombre=\"" + nombre + "\", ";
		if (descripcion != "")
			query += "descripcion=\"" + descripcion + "\", ";
		// if (tipo_objetivo_id!="") query+=
		// "tipo_objetivo_id=\""+tipo_objetivo_id+"\", ";
		query += "usuario_responsable=\"" + usuarioResponsable + "\", ";

		query = query.substring(0, query.length() - 2);
		query += " where id = " + id + " and tipo_objetivo_id="
				+ tipo_objetivo_id;

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateEstructura(Estructura estructuraObj,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update estructura set ";
			PreparedStatement update = null;

			if (estructuraObj.getNivel() != 0) {
				query += " nivel = ?, ";
			}
			if (estructuraObj.getEntidad() != 0) {
				query += " entidad = ?,";
			}
			if (estructuraObj.getTipo() != 0) {
				query += " tipo = ?,";
			}
			if (estructuraObj.getPrograma() != 0) {
				query += " programa = ?, ";
			}
			// if (estructuraObj.getSubprograma()!=0) {
			// query+=" subprograma = ?, ";}
			// if (estructuraObj.getProyecto()!=0) { query+=" proyecto = ?, ";}
			if (estructuraObj.getVersion() != 0) {
				query += " version = ?, ";
			}
			if (estructuraObj.getAnho() != 0) {
				query += " version = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (estructuraObj.getNivel() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getNivel());
			}
			if (estructuraObj.getEntidad() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getEntidad());
			}
			if (estructuraObj.getTipo() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getTipo());
			}
			if (estructuraObj.getPrograma() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getPrograma());
			}
			if (estructuraObj.getSubprograma() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getSubprograma());
			}
			if (estructuraObj.getProyecto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getProyecto());
			}
			if (estructuraObj.getVersion() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getVersion());
			}
			if (estructuraObj.getAnho() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraObj.getAnho());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, estructuraObj.getId());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateEstructuraFinanciera(
			EstructuraFinanciera estructuraFinancieraObj,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update estructura_financiera set ";
			PreparedStatement update = null;

			if (estructuraFinancieraObj.getEstructura() != 0) {
				query += " estructura = ?, ";
			}
			if (estructuraFinancieraObj.getMes() != 0) {
				query += " mes = ?,";
			}
			if (estructuraFinancieraObj.getProducto() != 0) {
				query += " producto = ?,";
			}
			if (estructuraFinancieraObj.getPlanificado() != 0) {
				query += " planificado = ?, ";
			}
			if (estructuraFinancieraObj.getEjecutado() != 0) {
				query += " ejecutado = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (estructuraFinancieraObj.getEstructura() != 0) {
				cantCampos++;
				update.setInt(cantCampos,
						estructuraFinancieraObj.getEstructura());
			}
			if (estructuraFinancieraObj.getMes() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraFinancieraObj.getMes());
			}
			if (estructuraFinancieraObj.getProducto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, estructuraFinancieraObj.getProducto());
			}
			if (estructuraFinancieraObj.getPlanificado() != 0) {
				cantCampos++;
				update.setDouble(cantCampos,
						estructuraFinancieraObj.getPlanificado());
			}
			if (estructuraFinancieraObj.getEjecutado() != 0) {
				cantCampos++;
				update.setDouble(cantCampos,
						estructuraFinancieraObj.getEjecutado());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, estructuraFinancieraObj.getId());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updatePresupuestoIngreso(
			PresupuestoIngreso presupuestoIngresoObj, String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update presupuesto_ingreso set ";
			PreparedStatement update = null;

			if (presupuestoIngresoObj.getNumeroFila() != 0) {
				query += " numero_fila = ?, ";
			}
			if (presupuestoIngresoObj.getVersion() != 0) {
				query += " version = ?,";
			}
			if (presupuestoIngresoObj.getAnho() != 0) {
				query += " anho = ?,";
			}
			if (presupuestoIngresoObj.getNivel() != 0) {
				query += " nivel = ?, ";
			}
			if (presupuestoIngresoObj.getEntidad() != 0) {
				query += " entidad = ?, ";
			}
			if (presupuestoIngresoObj.getOrigen() != 0) {
				query += " origen = ?,";
			}
			if (presupuestoIngresoObj.getDetalle() != 0) {
				query += " detalle = ?,";
			}
			if (presupuestoIngresoObj.getFuente_financiamiento() != 0) {
				query += " fuente_financiamiento = ?, ";
			}
			if (presupuestoIngresoObj.getMonto_presupuestado() != 0) {
				query += " monto_presupuestado = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (presupuestoIngresoObj.getNumeroFila() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoIngresoObj.getNumeroFila());
			}
			if (presupuestoIngresoObj.getVersion() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoIngresoObj.getVersion());
			}
			if (presupuestoIngresoObj.getAnho() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoIngresoObj.getAnho());
			}
			if (presupuestoIngresoObj.getNivel() != 0) {
				cantCampos++;
				update.setDouble(cantCampos, presupuestoIngresoObj.getNivel());
			}
			if (presupuestoIngresoObj.getEntidad() != 0) {
				cantCampos++;
				update.setDouble(cantCampos, presupuestoIngresoObj.getEntidad());
			}
			if (presupuestoIngresoObj.getOrigen() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoIngresoObj.getOrigen());
			}
			if (presupuestoIngresoObj.getDetalle() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoIngresoObj.getDetalle());
			}
			if (presupuestoIngresoObj.getFuente_financiamiento() != 0) {
				cantCampos++;
				update.setDouble(cantCampos,
						presupuestoIngresoObj.getFuente_financiamiento());
			}
			if (presupuestoIngresoObj.getMonto_presupuestado() != 0) {
				cantCampos++;
				update.setDouble(cantCampos,
						presupuestoIngresoObj.getMonto_presupuestado());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, presupuestoIngresoObj.getId());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updatePresupuestoGasto(
			PresupuestoGasto presupuestoGastoObj, String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update presupuesto_gasto set ";
			PreparedStatement update = null;

			if (presupuestoGastoObj.getEstructura() != 0) {
				query += " estructura_id = ?, ";
			}
			if (presupuestoGastoObj.getObjeto_gasto() != 0) {
				query += " objetivo_gasto = ?,";
			}
			if (presupuestoGastoObj.getFuente_financiamiento() != 0) {
				query += " fuente_financiamiento = ?,";
			}
			if (presupuestoGastoObj.getOrganismo_financiador() != 0) {
				query += " organismo_financiador = ?, ";
			}
			if (presupuestoGastoObj.getPais() != 0) {
				query += " pais = ?, ";
			}
			if (presupuestoGastoObj.getDepto() != 0) {
				query += " depto = ?,";
			}
			if (presupuestoGastoObj.getVer_programado() != 0) {
				query += " ver_programado = ?,";
			}
			if (presupuestoGastoObj.getVer_justificado() != null) {
				query += " ver_justificado = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (presupuestoGastoObj.getEstructura() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoGastoObj.getEstructura());
			}
			if (presupuestoGastoObj.getObjeto_gasto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoGastoObj.getObjeto_gasto());
			}
			if (presupuestoGastoObj.getFuente_financiamiento() != 0) {
				cantCampos++;
				update.setInt(cantCampos,
						presupuestoGastoObj.getFuente_financiamiento());
			}
			if (presupuestoGastoObj.getOrganismo_financiador() != 0) {
				cantCampos++;
				update.setInt(cantCampos,
						presupuestoGastoObj.getOrganismo_financiador());
			}
			if (presupuestoGastoObj.getPais() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoGastoObj.getPais());
			}
			if (presupuestoGastoObj.getDepto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, presupuestoGastoObj.getDepto());
			}
			if (presupuestoGastoObj.getVer_programado() != 0) {
				cantCampos++;
				update.setDouble(cantCampos,
						presupuestoGastoObj.getVer_programado());
			}
			if (presupuestoGastoObj.getVer_justificado() != null) {
				cantCampos++;
				update.setString(cantCampos,
						presupuestoGastoObj.getVer_justificado());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, presupuestoGastoObj.getId());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateFundamentacion(Fundamentacion fundamentacionObj,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update fundamentacion set ";
			PreparedStatement update = null;

			if (fundamentacionObj.getEstructura() != 0) {
				query += " estructura_id = ?, ";
			}
			if (fundamentacionObj.getObjetoGasto() != 0) {
				query += " objeto_gasto = ?,";
			}
			if (fundamentacionObj.getFuenteFinanciamiento() != 0) {
				query += " fuente_financiamiento = ?,";
			}
			if (fundamentacionObj.getOrganismoFinanciador() != 0) {
				query += " org_financiador = ?, ";
			}
			if (fundamentacionObj.getPais() != 0) {
				query += " pais = ?, ";
			}
			if (fundamentacionObj.getDepto() != 0) {
				query += " depto = ?,";
			}
			if (fundamentacionObj.getSecuencia() != 0) {
				query += " secuencia = ?,";
			}
			if (fundamentacionObj.getPrecio() != 0) {
				query += " precio = ?, ";
			}
			if (fundamentacionObj.getCantidad() != 0) {
				query += " cantidad = ?, ";
			}
			if (fundamentacionObj.getCantidad_meses() != 0) {
				query += " cantidad_meses = ?,";
			}
			if (fundamentacionObj.getDescripcion() != null) {
				query += " descripcion = ?, ";
			}
			if (fundamentacionObj.getClgCodigo() != 0) {
				query += " clg_codigo = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (fundamentacionObj.getEstructura() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getEstructura());
			}
			if (fundamentacionObj.getObjetoGasto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getObjetoGasto());
			}
			if (fundamentacionObj.getFuenteFinanciamiento() != 0) {
				cantCampos++;
				update.setInt(cantCampos,
						fundamentacionObj.getFuenteFinanciamiento());
			}
			if (fundamentacionObj.getOrganismoFinanciador() != 0) {
				cantCampos++;
				update.setDouble(cantCampos,
						fundamentacionObj.getOrganismoFinanciador());
			}
			if (fundamentacionObj.getPais() != 0) {
				cantCampos++;
				update.setDouble(cantCampos, fundamentacionObj.getPais());
			}
			if (fundamentacionObj.getDepto() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getDepto());
			}
			if (fundamentacionObj.getSecuencia() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getSecuencia());
			}
			if (fundamentacionObj.getPrecio() != 0) {
				cantCampos++;
				update.setDouble(cantCampos, fundamentacionObj.getPrecio());
			}
			if (fundamentacionObj.getCantidad() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getCantidad());
			}
			if (fundamentacionObj.getCantidad_meses() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getCantidad_meses());
			}
			if (fundamentacionObj.getDescripcion() != null) {
				cantCampos++;
				update.setString(cantCampos, fundamentacionObj.getDescripcion());
			}
			if (fundamentacionObj.getClgCodigo() != 0) {
				cantCampos++;
				update.setInt(cantCampos, fundamentacionObj.getClgCodigo());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, fundamentacionObj.getId());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static boolean updateCredenciales(Credenciales objeto,
			String usuarioResponsable) {
		String condition="";
		ResultSet rs = null;
		Credenciales obj = new Credenciales();

		try {
			
			 Connection conectSelect=ConnectionConfiguration.conectar();
	  		 String querySelect = " select * from usuario where correo= '"+objeto.getCorreoUsuario()+"' AND passwd= '"+objeto.getContrasenaVieja()+"' "+condition;
	  		 
	  		 Statement select = null;
	  		 
	  		 List<Credenciales> objetos = new ArrayList<Credenciales>();

	  		try {
	  			select = conectSelect.createStatement();
	  			rs=select.executeQuery(querySelect);
	  			while(rs.next()){
	  				obj.setCorreoUsuario(rs.getString("correo"));
	  				obj.setContrasenaVieja(rs.getString("passwd"));
	  			}
	  		}
	  		catch (SQLException e) {e.printStackTrace();}
	  		finally{
	  			if (select != null) {select.close();}
	  			if (conectSelect != null) {conectSelect.close();}
	  		}
			

		try {
			Connection conect = ConnectionConfiguration.conectar();
			PreparedStatement update = null;

			if ((objeto.getCorreoUsuario().equals(obj.getCorreoUsuario()))
					&& (objeto.getContrasenaVieja().equals(obj
							.getContrasenaVieja()))) {

				String query = "update usuario set ";
				if (objeto.getContrasenaNueva() != null)
					query += "passwd= ?, ";
				query += " usuario_responsable=?";
				query += " where correo = ? ";
				update = conect.prepareStatement(query);
				update.setString(1,objeto.getContrasenaNueva());
				update.setString(2,usuarioResponsable);
				update.setString(3,objeto.getCorreoUsuario());
				update.execute();
				conect.close();

			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		

	} catch (SQLException e) {
		e.printStackTrace();
		return false;
	}
		return true;
	}

	/*
	 * public static boolean updateCredenciales(Credenciales objeto){ Connection
	 * conect=ConnectionConfiguration.conectar(); Statement statement2 = null;
	 * String query2 =
	 * "select * from usuario where correo=\""+objeto.getCorreoUsuario
	 * ()+"\" AND passwd=\""+objeto.getContrasenaVieja()+"\"";
	 * 
	 * 
	 * ResultSet rs=null; Credenciales obj = new Credenciales(); try {
	 * statement2 = conect.createStatement();
	 * rs=statement2.executeQuery(query2); while(rs.next()){
	 * obj.setContrasenaVieja(rs.getString("passwd"));
	 * obj.setCorreoUsuario(rs.getString("correo")); } } catch (SQLException e)
	 * {e.printStackTrace();}
	 * 
	 * 
	 * 
	 * Statement statement = null;
	 * 
	 * if( (objeto.getCorreoUsuario().equals(obj.getCorreoUsuario())) &&
	 * (objeto.getContrasenaVieja().equals(obj.getContrasenaVieja())) ) {
	 * 
	 * String query = "update usuario set ";
	 * if(objeto.getContrasenaNueva()!=null) query+=
	 * "passwd=\""+objeto.getContrasenaNueva()+"\"";
	 * query+=" where correo =\""+objeto.getCorreoUsuario()+"\"";
	 * 
	 * try { statement=conect.createStatement(); statement.execute(query);
	 * conect.close(); } catch (SQLException e) {e.printStackTrace();} return
	 * true;
	 * 
	 * }else{ return false; }
	 * 
	 * }
	 */

	public static void updateIndicadores(Indicador indicadorObjeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update indicador set ";
			PreparedStatement update = null;

			if (indicadorObjeto.getBorradoInt() != 1)
				query += "borrado_int = 1, ";
			query += "usuario_responsable='" + usuarioResponsable + "'";

			query += " where id = ? ";
			update = conect.prepareStatement(query);
			update.setInt(1, indicadorObjeto.getId());

			update.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query2 = "update meta set borrado_int = 1 ,";
			query2 += "usuario_responsable='" + usuarioResponsable + "'";
			PreparedStatement update2 = null;

			query2 = query2.substring(0, query2.length() - 2);
			query2 += " where indicador_id = ? ";
			update2 = conect.prepareStatement(query2);
			update2.setInt(1, indicadorObjeto.getId());

			update2.execute();
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static boolean updateIndicador(Indicador objeto, String usuarioResponsable, String nivel, String entidad) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		objeto.changeBorrado();

		String query = "update indicador set borrado='" + objeto.isBorrado()
				+ "', ";
		query += "usuario_responsable='" + usuarioResponsable + "'";

		query += " where id =" + objeto.getId() + " and tipo_indicador_id="
				+ objeto.getTipo_indicador_id() + " and unidad_medida_id="
				+ objeto.getUnidad_medida_id()
				+ " and desagregacion_tipo_zona_geografica_id="
				+ objeto.getDesagregacion_tipo_zona_geografica_id()
				+ " and tipo_demografica_id=" + objeto.getTipo_demografica_id()
				+ " and objetivo_id=" + objeto.getObjetivo_id()// borre el // where // fuente_verificacion_id
				+ " and nivel=" + nivel
				+ " and entidad=" + entidad;
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/*
	 * public static void updateIndicadores(Indicador indicadorObjeto){
	 * Connection conect=ConnectionConfiguration.conectar(); Statement statement
	 * = null; String query = "update indicador set ";
	 * 
	 * if (indicadorObjeto.getBorrado() !=1 ) query+= "borrado = 1 ";
	 * 
	 * //query = query.substring(0, query.length()-2);
	 * query+="where id = "+indicadorObjeto.id;
	 * 
	 * try { statement=conect.createStatement(); statement.execute(query);
	 * //conect.close(); } catch (SQLException e) {e.printStackTrace();}
	 * 
	 * Statement statement2 = null;
	 * 
	 * 
	 * String query2 = "update meta set borrado = 1 ";
	 * 
	 * 
	 * query2+="where indicador_id = "+indicadorObjeto.id;
	 * 
	 * try { statement2=conect.createStatement(); statement2.execute(query2);
	 * conect.close(); } catch (SQLException e) {e.printStackTrace();}
	 * 
	 * }
	 */

	public static void updateFormularioIndicadores(
			ActualizarFormularioIndicadorMeta indicadorObjeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update indicador set ";
			PreparedStatement update = null;

			if (indicadorObjeto.getUnidadMedidaId() != 0) {
				query += " unidad_medida_id = ?, ";
			}
			if (indicadorObjeto.getFrecuenciaMeses() != 0) {
				query += " frecuencia_meses = ?, ";
			}
			if (indicadorObjeto.getObservaciones() != null) {
				query += " observaciones = ?, ";
			}
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;

			update = conect.prepareStatement(query);
			if (indicadorObjeto.getUnidadMedidaId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, indicadorObjeto.getUnidadMedidaId());
			}
			if (indicadorObjeto.getFrecuenciaMeses() != 0) {
				cantCampos++;
				update.setInt(cantCampos, indicadorObjeto.getFrecuenciaMeses());
			}
			if (indicadorObjeto.getObservaciones() != null) {
				cantCampos++;
				update.setString(cantCampos, indicadorObjeto.getObservaciones());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, indicadorObjeto.getId());

			update.execute();
			conect.close();

			ActualizarFormularioIndicadorMeta objetoMeta = new ActualizarFormularioIndicadorMeta();
			objetoMeta.setCantidad1(indicadorObjeto.getCantidad1());
			objetoMeta.setCantidad2(indicadorObjeto.getCantidad2());
			objetoMeta.setCantidad3(indicadorObjeto.getCantidad3());
			objetoMeta.setCantidad4(indicadorObjeto.getCantidad4());
			objetoMeta.setCantidad5(indicadorObjeto.getCantidad5());
			objetoMeta.setUnidadMedidaId(indicadorObjeto.getUnidadMedidaId());
			objetoMeta.setFrecuenciaMeses(indicadorObjeto.getFrecuenciaMeses());
			objetoMeta.setObservaciones(indicadorObjeto.getObservaciones());
			objetoMeta.setId(indicadorObjeto.getId());

			updateIndicadorMetas(objetoMeta, usuarioResponsable);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean updateIndicadorCrud(Indicador objeto, String usuarioResponsable, String nivel, String entidad) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update indicador set ";
			PreparedStatement update = null;

			if (objeto.getObjetivo_id() != 0) 								{ query += " objetivo_id = ?, ";}
			if (objeto.getNombre() != null) 								{ query += " nombre = ?, ";}
			if (objeto.getTipo_indicador_id() != 0) 						{ query += " tipo_indicador_id = ?, ";}
			if (objeto.getMetodo_calculo_id() != "")						{ query += " metodo_calculo_id = ?, ";}
			if (objeto.getUnidad_medida_id() != 0) 							{ query += " unidad_medida_id = ?, ";}
			if (objeto.getFrecuencia_meses() != 0) 							{ query += " frecuencia_meses = ?, ";}
			if (objeto.getFechaDisponibilidadInformacion() != null) 		{ query += " fecha_disponibilidad_informacion = ?, ";}
			if (objeto.getCoberturaGeograficaAlcance() != 0) 				{ query += " cobertura_geografica_alcance = ?, ";}
			if (objeto.getNivelDespliegueGeograficoDesagregacion() != 0)	{ query += " nivel_despliegue_geografico = ?, ";}
			if (objeto.getCoberturaDemograficaAlcance() != 0) 				{ query += " cobertura_demografica_alcance = ?, ";}
			if (objeto.getNivelDespliegueDemograficoDesagregacion() != 0)	{ query += " nivel_despliegue_demografica = ?, ";}
			if (objeto.getFuente_verificacion_id() != null) 				{ query += " fuente_verificacion_id = ?, ";}
			if (objeto.getInstitucionResponsableCalculoIndicador() != null)	{ query += " institucion_responsable_calculo_indicador = ?, ";}
			if (objeto.getEvaluacionHeci() != null) 						{ query += " evaluacion_heci = ?, ";}
			if (objeto.getObservaciones() != null) 							{ query += " observaciones = ?, ";}
			if (objeto.getContacto() != null) 								{ query += " contacto = ?, ";}
			if (objeto.getNivel() != 0) 									{ query += " nivel = ?, ";}
			if (objeto.getEntidad() != 0) 									{ query += " entidad = ?, ";}
			
			query += " usuario_responsable = ?, ";
			query = query.substring(0, query.length() - 2);
			query += " where id = ? and tipo_indicador_id = ? and unidad_medida_id = ? and desagregacion_tipo_zona_geografica_id = ? and tipo_demografica_id = ? and objetivo_id = ? and nivel = ? and entidad = ?";

			int cantCampos = 0;

			update = conect.prepareStatement(query); 
			if (objeto.getObjetivo_id() != 0) 								{cantCampos++;update.setInt(cantCampos, 	objeto.getObjetivo_id());}
			if (objeto.getNombre() != null) 								{cantCampos++;update.setString(cantCampos,	objeto.getNombre());}
			if (objeto.getTipo_indicador_id() != 0) 						{cantCampos++;update.setInt(cantCampos, 	objeto.getTipo_indicador_id());}
			if (objeto.getMetodo_calculo_id() != "") 						{cantCampos++;update.setString(cantCampos, 	objeto.getMetodo_calculo_id().replaceAll("\"","'"));}
			if (objeto.getUnidad_medida_id() != 0) 							{cantCampos++;update.setInt(cantCampos, 	objeto.getUnidad_medida_id());}
			if (objeto.getFrecuencia_meses() != 0) 							{cantCampos++;update.setInt(cantCampos, 	objeto.getFrecuencia_meses());}
			if (objeto.getFechaDisponibilidadInformacion() != null) 		{cantCampos++;update.setString(cantCampos,	objeto.getFechaDisponibilidadInformacion());}
			if (objeto.getCoberturaGeograficaAlcance() != 0) 				{cantCampos++;update.setInt(cantCampos,		objeto.getCoberturaGeograficaAlcance());}
			if (objeto.getNivelDespliegueGeograficoDesagregacion() != 0) 	{cantCampos++;update.setInt(cantCampos,		objeto.getNivelDespliegueGeograficoDesagregacion());}
			if (objeto.getCoberturaDemograficaAlcance() != 0) 				{cantCampos++;update.setInt(cantCampos,		objeto.getCoberturaDemograficaAlcance());}
			if (objeto.getNivelDespliegueDemograficoDesagregacion() != 0)	{cantCampos++;update.setInt(cantCampos,		objeto.getNivelDespliegueDemograficoDesagregacion());}
			if (objeto.getFuente_verificacion_id() != null) 				{cantCampos++;update.setString(cantCampos, 	objeto.getFuente_verificacion_id());}
			if (objeto.getInstitucionResponsableCalculoIndicador() != null) {cantCampos++;update.setString(cantCampos,	objeto.getInstitucionResponsableCalculoIndicador());}
			if (objeto.getEvaluacionHeci() != null) 						{cantCampos++;update.setString(cantCampos, 	objeto.getEvaluacionHeci());}
			if (objeto.getObservaciones() != null) 							{cantCampos++;update.setString(cantCampos, 	objeto.getObservaciones());}
			if (objeto.getContacto() != null) 								{cantCampos++;update.setString(cantCampos, 	objeto.getContacto());}
			if (objeto.getNivel() != 0) 									{cantCampos++;update.setInt(cantCampos,		objeto.getNivel());}
			if (objeto.getEntidad() != 0) 									{cantCampos++;update.setInt(cantCampos, 	objeto.getEntidad());}
			
			cantCampos++;	update.setString(cantCampos, usuarioResponsable);

			cantCampos++;	update.setInt(cantCampos, objeto.getId());
			cantCampos++;	update.setInt(cantCampos, objeto.getTipoIndicadorId());
			cantCampos++;	update.setInt(cantCampos, objeto.getUnidadMedidaId());
			cantCampos++;	update.setInt(cantCampos, objeto.getDesagregacionTipoZonaGeograficaId());
			cantCampos++;	update.setInt(cantCampos, objeto.getTipoDemograficaId());
			cantCampos++;	update.setInt(cantCampos, objeto.getObjetivoId());
			cantCampos++;	update.setInt(cantCampos, Integer.parseInt(nivel));
			cantCampos++;	update.setInt(cantCampos, Integer.parseInt(entidad));


			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Es invocado desde la funcion updateFormularioIndicadores. Y Actualiza el
	// campo cantidad de la tabla meta
	public static void updateIndicadorMetas(
			ActualizarFormularioIndicadorMeta objetoMeta,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = " ";
			PreparedStatement update = null;
			if (objetoMeta.getCantidad1() != 0) {
				query = "update meta set cantidad ='"
						+ objetoMeta.getCantidad1()
						+ "', usuario_responsable='"
						+ usuarioResponsable
						+ "'"
						+ " Where vencimiento = '2014-12-31' AND indicador_id ='"
						+ objetoMeta.getId() + "'";
				update = conect.prepareStatement(query);
				update.execute();
			}
			if (objetoMeta.getCantidad2() != 0) {
				query = "update meta set cantidad ='"
						+ objetoMeta.getCantidad2()
						+ "', usuario_responsable='"
						+ usuarioResponsable
						+ "'"
						+ " Where vencimiento = '2015-12-31' AND indicador_id ='"
						+ objetoMeta.getId() + "'";
				update = conect.prepareStatement(query);
				update.execute();
			}
			if (objetoMeta.getCantidad3() != 0) {
				query = "update meta set cantidad ='"
						+ objetoMeta.getCantidad3()
						+ "', usuario_responsable='"
						+ usuarioResponsable
						+ "'"
						+ " Where vencimiento = '2016-12-31' AND indicador_id ='"
						+ objetoMeta.getId() + "'";
				update = conect.prepareStatement(query);
				update.execute();
			}
			if (objetoMeta.getCantidad4() != 0) {
				query = "update meta set cantidad ='"
						+ objetoMeta.getCantidad4()
						+ "', usuario_responsable='"
						+ usuarioResponsable
						+ "'"
						+ " Where vencimiento = '2017-12-31' AND indicador_id ='"
						+ objetoMeta.getId() + "'";
				update = conect.prepareStatement(query);
				update.execute();
			}
			if (objetoMeta.getCantidad5() != 0) {
				query = "update meta set cantidad ='"
						+ objetoMeta.getCantidad5()
						+ "', usuario_responsable='"
						+ usuarioResponsable
						+ "'"
						+ " Where vencimiento = '2018-12-31' AND indicador_id ='"
						+ objetoMeta.getId() + "'";
				update = conect.prepareStatement(query);
				update.execute();
			}
			conect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean updateBorradoUsuarios(Usuario fundamentacionObj,
			String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		fundamentacionObj.changeBorrado();

		String query = "update usuario set borrado='"
				+ fundamentacionObj.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";
		query += " where id =" + fundamentacionObj.getId();
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean updateUsuario(Usuario objeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update usuario set ";
			PreparedStatement update = null;

			if (objeto.getNivel_id() != 0) {
				query += " nivel_id = ?, ";
			}
			if (objeto.getEntidad_id() != 0) {
				query += " entidad_id = ?, ";
			}
			if (objeto.getCorreo() != null) {
				query += " correo = ?, ";
			}
			if (objeto.getPasswd() != null) {
				query += " passwd = ?, ";
			}
			query += " unr_id = ?, ";
			if (objeto.getNombre() != null) {
				query += " nombre = ?, ";
			}
			if (objeto.getUrl() != null) {
				query += " url = ?, ";
			}			
			query += " role_id = ?, ";
			query += " role_id_tablero = ?, ";
			query += " role_id_movil = ?, ";
			if (objeto.getEntidad() != null) {
				query += " entidad = ?, ";
			}
			query += " usuario_responsable = ?, ";
			query += " email_real = ?, ";
			

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (objeto.getNivel_id() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getNivel_id());
			}
			if (objeto.getEntidad_id() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getEntidad_id());
			}
			if (objeto.getCorreo() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getCorreo());
			}
			if (objeto.getPasswd() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getPasswd());
			}
			cantCampos++;
			update.setInt(cantCampos, objeto.getUnidadResponsable());			
			
			if (objeto.getNombre() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getNombre());
			}
			if (objeto.getUrl() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getUrl());
			}
			cantCampos++;
			update.setInt(cantCampos, objeto.getRol_id());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRolTablero());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRolMovil());
			if (objeto.getEntidad() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getEntidad());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);
			cantCampos++;
			update.setBoolean(cantCampos, objeto.isCorreoReal());

			cantCampos++;
			update.setInt(cantCampos, objeto.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean updateInstitucion(Institucion objeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update Institucion set ";
			PreparedStatement update = null;

			if (objeto.getNombre() != null) {
				query += " nombre = ?, ";
			}
			if (objeto.getDescripcion() != null) {
				query += " descripcion = ?, ";
			}
			if (objeto.getSigla() != null) {
				query += " sigla = ?,";
			}
			if (objeto.getOrden() != 0) {
				query += " orden = ?,";
			}
			if (objeto.getNivelId() != 0) {
				query += " nivel_id = ?,";
			}
			if (objeto.getEntidadId() != 0) {
				query += " entidad_id = ?,";
			}
			if (objeto.getUnidadJerarquicaId() != 0) {
				query += " unidad_jerarquica_id = ?,";
			}
			if (objeto.getUnidadResponsableId() != 0) {
				query += " unidad_responsable_id = ?,";
			}
			if (objeto.getVersion() != 0) {
				query += " version = ?,";
			}
			// if (objeto.isBorrado()!=null) { query+=" borrado = ?,";}
			if (objeto.getAbrev() != null) {
				query += " abrev = ?,";
			}
			if (objeto.getBaseLegal() != null) {
				query += " base_legal = ?,";
			}
			if (objeto.getMision() != null) {
				query += " mision = ?,";
			}
			if (objeto.getVision() != null) {
				query += " vision = ?,";
			}
			if (objeto.getDiagnostico() != null) {
				query += " diagnostico = ?,";
			}
			if (objeto.getRuc() != null) {
				query += " ruc = ?,";
			}
			if (objeto.getAnho() != 0) {
				query += " anho = ?,";
			}
			if (objeto.getFechaCreacion() != null) {
				query += " fecha_creacion = ?,";
			}
			if (objeto.getPolitica() != null) {
				query += " politica = ?,";
			}
			if (objeto.getObjetivo() != null) {
				query += " objetivo = ?,";
			}
			if (objeto.getNroFila() != 0) {
				query += " nro_fila = ?,";
			}
			query += " usuario_responsable = ?,";

			query = query.substring(0, query.length() - 1);
			query += " where id = ? ";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getNombre());
			}
			if (objeto.getDescripcion() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getDescripcion());
			}
			if (objeto.getSigla() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getSigla());
			}
			if (objeto.getOrden() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getOrden());
			}
			if (objeto.getNivelId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getNivelId());
			}
			if (objeto.getEntidadId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getEntidadId());
			}
			if (objeto.getUnidadJerarquicaId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getUnidadJerarquicaId());
			}
			if (objeto.getUnidadResponsableId() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getUnidadResponsableId());
			}
			if (objeto.getVersion() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getVersion());
			}
			// if (objeto.getVersion()!=0) {
			// cantCampos++;update.setBoolean(cantCampos, objeto.isBorrado());}
			if (objeto.getAbrev() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getAbrev());
			}
			if (objeto.getBaseLegal() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getBaseLegal());
			}
			if (objeto.getMision() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getMision());
			}
			if (objeto.getVision() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getVision());
			}
			if (objeto.getDiagnostico() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getDiagnostico());
			}
			if (objeto.getRuc() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getRuc());
			}
			if (objeto.getAnho() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getAnho());
			}
			if (objeto.getFechaCreacion() != null) {
				cantCampos++;
				update.setDate(cantCampos,
						(java.sql.Date) objeto.getFechaCreacion());
			}
			if (objeto.getPolitica() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getPolitica());
			}
			if (objeto.getObjetivo() != null) {
				cantCampos++;
				update.setString(cantCampos, objeto.getObjetivo());
			}
			if (objeto.getNroFila() != 0) {
				cantCampos++;
				update.setInt(cantCampos, objeto.getNroFila());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);
			cantCampos++;
			update.setInt(cantCampos, objeto.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean borradoInstitucion(Institucion objeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update Institucion set ";
			PreparedStatement update = null;
			objeto.changeBorrado();

			query += " borrado = ?,";
			query += " usuario_responsable = ?,";

			query = query.substring(0, query.length() - 1);
			query += " where id = ? ";

			int cantCampos = 0;
			update = conect.prepareStatement(query);

			cantCampos++;
			update.setBoolean(cantCampos, objeto.isBorrado());
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);
			cantCampos++;
			update.setInt(cantCampos, objeto.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean updateObjetivoHasObjetivo(ObjetivoHasObjetivo objeto, String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update objetivo_has_objetivo set ";
			PreparedStatement update = null;

			query += " colaboracion  = ?, ";
			query += " influencia = ?, ";
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where objetivo_id = ? and objetivo_tipo_objetivo_id = ? and objetivo_anho = ? and objetivo_version = ? and objetivo_rel_id = ? and objetivo_rel_tipo_objetivo_id = ? and objetivo_rel_anho = ? and objetivo_rel_version = ? and producto_concat = ?";

			int cantCampos = 0;

			update = conect.prepareStatement(query);

			cantCampos++;
			update.setDouble(cantCampos, objeto.getColaboracion());
			cantCampos++;
			update.setDouble(cantCampos, objeto.getInfluencia());
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getTipoObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoVersion());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoRelId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRelTipoObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRelAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRelVersion());
			cantCampos++;
			update.setString(cantCampos, objeto.getProductoConcat());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateBorradoObjetivoHasObjetivo(
			ObjetivoHasObjetivo objeto, String usuarioResponsable) {
		/*
		 * try { Connection conect=ConnectionConfiguration.conectar();
		 * 
		 * String query = "update objetivo_has_objetivo set "; PreparedStatement
		 * update =null; objeto.changeBorrado();
		 * 
		 * query+=" borrado = ?,";
		 * 
		 * query = query.substring(0, query.length()-1); query+=
		 * " where objetivo_id = ? and objetivo_tipo_objetivo_id = ? and objetivo_anho = ? and objetivo_version = ? and objetivo_rel_id = ? and objetivo_rel_tipo_objetivo_id = ? and objetivo_rel_anho = ? and objetivo_rel_version = ? and producto_concat = ?"
		 * ;
		 * 
		 * int cantCampos =0; update = conect.prepareStatement(query);
		 * 
		 * cantCampos++; update.setBoolean(cantCampos, objeto.isBorrado());
		 * 
		 * cantCampos++; update.setInt (cantCampos, objeto.getObjetivoId() );
		 * cantCampos++; update.setInt (cantCampos, objeto.getTipoObjetivoId()
		 * ); cantCampos++; update.setInt (cantCampos, objeto.getObjetivoAnho()
		 * ); cantCampos++; update.setInt (cantCampos,
		 * objeto.getObjetivoVersion() ); cantCampos++; update.setInt
		 * (cantCampos, objeto.getObjetivoRelId() ); cantCampos++; update.setInt
		 * (cantCampos, objeto.getRelTipoObjetivoId() ); cantCampos++;
		 * update.setInt (cantCampos, objeto.getRelAnho() ); cantCampos++;
		 * update.setInt (cantCampos, objeto.getRelVersion() ); cantCampos++;
		 * update.setString (cantCampos, objeto.getProductoConcat() );
		 * cantCampos++; update.setString (cantCampos, usuarioResponsable );
		 * 
		 * update.execute(); conect.close(); return true; } catch (SQLException
		 * e) {e.printStackTrace(); return false;}
		 */
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "delete from objetivo_has_objetivo ";
			PreparedStatement update = null;
			objeto.changeBorrado();

			// query+=" borrado = ?,";

			query = query.substring(0, query.length() - 1);
			query += " where objetivo_id = ? and objetivo_tipo_objetivo_id = ? and objetivo_anho = ? and objetivo_version = ? and objetivo_rel_id = ? and objetivo_rel_tipo_objetivo_id = ? and objetivo_rel_anho = ? and objetivo_rel_version = ? and producto_concat = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);

			// cantCampos++; update.setBoolean(cantCampos, objeto.isBorrado());

			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getTipoObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoVersion());
			cantCampos++;
			update.setInt(cantCampos, objeto.getObjetivoRelId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRelTipoObjetivoId());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRelAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getRelVersion());
			cantCampos++;
			update.setString(cantCampos, objeto.getProductoConcat());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean updateBorradoMeta(Meta objeto, String usuarioResponsable, String nivel, String entidad) {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		objeto.changeBorrado();
		String tabla="";
		if(objeto.getAvance().equals("Avance")){
			tabla="avance_indicador ";
		}else{
			if(objeto.getAvance().equals("Metas")){
				tabla="meta ";
			}
		}	

		String query = "update "+tabla+" set borrado='" + objeto.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";

		query += " where id =" + objeto.getId()+" and indicador_id = "+ objeto.getIndicador_id()+" and zona_geografica_id = "+objeto.getZona_geografica_id()+" and demografia_id ="+objeto.getDemografia_id()+" and nivel = "+nivel+" and entidad = "+entidad;                
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	public static boolean updateBorradoTodasMeta(Meta objeto, String usuarioResponsable, String nivel, String entidad) {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		objeto.changeBorrado();

		String query = "update meta set borrado='" + objeto.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";

		query += " where indicador_id = "+ objeto.getIndicador_id()+" and nivel = "+nivel+" and entidad = "+entidad;
		//query += " where id =" + objeto.getId()+" and indicador_id = "+ objeto.getIndicador_id()+" and zona_geografica_id = "+objeto.getZona_geografica_id()+" and demografia_id ="+objeto.getDemografia_id()+" and nivel = "+nivel+" and entidad = "+entidad;                

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean updateBorradoProductoPresupuesto(
			ProductoPresupuesto ProductoPresupuesto, String usuarioResponsable)
			throws ParseException {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		ProductoPresupuesto.changeBorrado();

		String query = "update producto_presupusto set borrado='"
				+ ProductoPresupuesto.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";

		query += " where id =" + ProductoPresupuesto.getId()
				+ " and producto_id=" + ProductoPresupuesto.getProducto_id()
				+ " and producto_unidad_medida_id="
				+ ProductoPresupuesto.getUnidad_medida_id()
				+ " and proyecto_id=" + ProductoPresupuesto.getProyecto_id()
				+ " and proyecto_subprograma_id="
				+ ProductoPresupuesto.getSubprograma_id()
				+ " and proyecto_subprograma_programa_id="
				+ ProductoPresupuesto.getPrograma_id()
				+ " and proyecto_subprograma_programa_tipo_presupuesto_id="
				+ ProductoPresupuesto.getTipo_presupuesto_id()
				+ " and proyecto_subprograma_programa_entidad_id="
				+ ProductoPresupuesto.getEntidad_id()
				+ " and proyecto_subprograma_programa_entidad_nivel_id="
				+ ProductoPresupuesto.getNivel_id();
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateEtiqueta(Etiqueta objeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update etiquetas set ";
			PreparedStatement update = null;

			query += " nombre  = ?, ";
			query += " usuario_responsable = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ? ";

			int cantCampos = 0;

			update = conect.prepareStatement(query);

			cantCampos++;
			update.setString(cantCampos, objeto.getNombre());
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, objeto.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateProductoPresupuesto(ProductoPresupuesto objeto,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update producto_presupusto set ";
			PreparedStatement update = null;

			query += " numero_fila  = ?, ";
			query += " anho  = ?, ";
			query += " version  = ?, ";
			query += " intermedio  = ?, ";
			query += " usuario_responsable  = ?, ";

			query = query.substring(0, query.length() - 2);
			query += " where id = ? ";

			int cantCampos = 0;

			update = conect.prepareStatement(query);

			cantCampos++;
			update.setInt(cantCampos, objeto.getNumero_fila());
			cantCampos++;
			update.setInt(cantCampos, objeto.getAnho());
			cantCampos++;
			update.setInt(cantCampos, objeto.getVersion());
			cantCampos++;
			update.setBoolean(cantCampos, objeto.isIntermedio());
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, objeto.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean updateProductoPresupuestoIntermedio(ProductoPresupuesto objeto, String usuarioResponsable) { 
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update producto_presupusto set ";
			PreparedStatement update = null;

			query += " intermedio = ?, ";
			query += " usuario_responsable = ?, ";
			

			query = query.substring(0, query.length() - 2);
			query += " where id= ? and producto_id= ? and producto_unidad_medida_id= ? "
					+ " and proyecto_id=? and proyecto_subprograma_id=? and proyecto_subprograma_programa_id= ? "
					+ " and proyecto_subprograma_programa_tipo_presupuesto_id= ? and proyecto_subprograma_programa_entidad_id= ? "
					+ " and proyecto_subprograma_programa_entidad_nivel_id= ? ";

			int cantCampos = 0;

			update = conect.prepareStatement(query);

			cantCampos++;update.setBoolean    (cantCampos, objeto.isIntermedio());
			cantCampos++;update.setString    (cantCampos, usuarioResponsable);			
			cantCampos++;update.setInt    (cantCampos, objeto.getId());
			cantCampos++;update.setInt    (cantCampos, objeto.getProducto_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getUnidad_medida_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getProyecto_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getSubprograma_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getPrograma_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getTipo_presupuesto_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getEntidad_id());
			cantCampos++;update.setInt    (cantCampos, objeto.getNivel_id());			

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}
	}

	public static boolean updateBorradoProyecto(Proyecto proyecto,
			String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();
		Statement statement = null;
		proyecto.changeBorrado(); 

		String query = "update proyecto set borrado='"
				+ proyecto.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";

		query += " where id =" + proyecto.getCodigoProyecto()				
				+ " and subprograma_id="
				+ proyecto.getCodigoSubprograma()
				+ " and subprograma_programa_id="
				+ proyecto.getCodigoPrograma()
				+ " and subprograma_programa_tipo_presupuesto_id="
				+ proyecto.getTipoPrograma()
				+ " and subprograma_programa_entidad_id="
				+ proyecto.getEntidad()
				+ " and subprograma_programa_entidad_nivel_id="
				+ proyecto.getNivel()
				+ " and unidad_responsable_id="
				+ proyecto.getCodigoUnidadResponsable()
				+ " and funcional_id="
				+ proyecto.getCodigoFuncional();
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public static boolean updateBorradoDocumento(Documentos objeto, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		objeto.changeBorrado();

		String query = "update documentos set borrado='" + objeto.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";

		query += " where id = "+ objeto.getId();
		//query += " where id =" + objeto.getId()+" and indicador_id = "+ objeto.getIndicador_id()+" and zona_geografica_id = "+objeto.getZona_geografica_id()+" and demografia_id ="+objeto.getDemografia_id()+" and nivel = "+nivel+" and entidad = "+entidad;                

		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean updateDocumentos(Documentos documentos, String usuarioResponsable)throws ParseException{
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update documentos set ";
			PreparedStatement update = null;
			
			String startDate = documentos.getFecha();
		    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date date = sdf1.parse(startDate);
			java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());

			if (documentos.getNombre() != "") 		{	query += "nombre= ?, ";			}
			if (documentos.getDescripcion() != "") 	{	query += "descripcion= ?, ";	}
			if (documentos.getFecha() !="") 		{	query += "fecha_valides= ?, ";	}
			
			query += "usuario_responsable= ?, ";
			query = query.substring(0, query.length() - 2);
			query += " where id = ? ";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (documentos.getNombre() != "") 		{	cantCampos++;update.setString(cantCampos, documentos.getNombre());}
			if (documentos.getDescripcion() != "")	{	cantCampos++;update.setString(cantCampos, documentos.getDescripcion());}
			if (documentos.getFecha() !="") 		{	cantCampos++;update.setDate(cantCampos, sqlStartDate);}
			
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);
			cantCampos++;
			update.setInt(cantCampos, documentos.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e){e.printStackTrace();
				return false;
		}
	}
	public static boolean updatePermisoPorModulo(PermisoPorModulos objeto, String usuarioResponsable)throws ParseException{
		try {
			Connection conect = ConnectionConfiguration.conectar();
			String query = "update permisos_por_modulos set ";
			PreparedStatement update = null;
			
			if (objeto.getModulosId() != 999 ) 		{	query += "modulos_id= ?, ";	}
			if (objeto.getUsuarioId() != 0 )	 	{	query += "usuario_id= ?, ";	}
			if (objeto.getPermisosModulosId() != 999 )	{	query += "permisos_modulos_id= ?, ";	}
			
			query += "usuario_responsable= ?, ";
			query = query.substring(0, query.length() - 2);
			query += " where modulos_id = ? and usuario_id = ? ";

			int cantCampos = 0;
			update = conect.prepareStatement(query);
			if (objeto.getModulosId() != 999 ) 		{	cantCampos++;update.setInt(cantCampos, objeto.getModulosId());}
			if (objeto.getUsuarioId() != 0 )		{	cantCampos++;update.setInt(cantCampos, objeto.getUsuarioId());}
			if (objeto.getPermisosModulosId() != 999 )	{	cantCampos++;update.setInt(cantCampos, objeto.getPermisosModulosId());}
			
			cantCampos++;	update.setString(cantCampos, usuarioResponsable);			
			cantCampos++;	update.setInt(cantCampos, objeto.getModulosId());
			cantCampos++;	update.setInt(cantCampos, objeto.getUsuarioId());
		
			update.execute();
			conect.close();
			return true;
		} catch (SQLException e){e.printStackTrace();
				return false;
		}
	}
	public static boolean updateBorradoJustificacion(Justificacion objeto, String usuarioResponsable) {
		Connection conect = ConnectionConfiguration.conectar();

		Statement statement = null;
		objeto.changeBorrado();

		String query = "update justificacion set borrado='" + objeto.isBorrado() + "'";
		query += ", usuario_responsable='" + usuarioResponsable + "'";

		query += " where id = "+ objeto.getId();
		
		try {
			statement = conect.createStatement();
			statement.execute(query);
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	public static boolean updateJustificacion(
			Justificacion justificacion,
			String usuarioResponsable) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update justificacion set ";
			PreparedStatement update = null;

			if (justificacion.getDescripcion() != "") {
				query += " descripcion = ?, ";
			}
			{
				query += " usuario_responsable = ?, ";
			}

			query = query.substring(0, query.length() - 2);
			query += " where id = ?";

			int cantCampos = 0;
			update = conect.prepareStatement(query);

			if (justificacion.getDescripcion() != "") {
				cantCampos++;
				update.setString(cantCampos, justificacion.getDescripcion());
			}
			cantCampos++;
			update.setString(cantCampos, usuarioResponsable);

			cantCampos++;
			update.setInt(cantCampos, justificacion.getId());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public static boolean actUltimaEtiqueta(Usuario objeto) {
		try {
			Connection conect = ConnectionConfiguration.conectar();

			String query = "update usuario set ultima_etiqueta_id= ? where correo = ? ";
			PreparedStatement update = null;
			
			int cantCampos = 0;
			update = conect.prepareStatement(query);

			cantCampos++;
			update.setInt(cantCampos, objeto.getUltimaEtiquetaId());
						
			cantCampos++;
			update.setString(cantCampos, objeto.getCorreo());

			update.execute();
			conect.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
}
