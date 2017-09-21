package py.gov.stp.mh.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
//import java.sql.Date;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import py.gov.stp.mh.clasificadores.Departamento;
import py.gov.stp.mh.clasificadores.FuenteFinanciamiento;
import py.gov.stp.mh.clasificadores.Funcional;
import py.gov.stp.mh.clasificadores.IngresoOrigen;
/* import py.gov.stp.mh.clasificadores.Mes; */
import py.gov.stp.mh.clasificadores.Nivel;
import py.gov.stp.mh.clasificadores.OrganismoFinanciador;
import py.gov.stp.mh.clasificadores.Plan;
import py.gov.stp.mh.clasificadores.PrecioDNCP;
import py.gov.stp.mh.clasificadores.Programa;
import py.gov.stp.mh.clasificadores.ProyectoSNIP;
import py.gov.stp.mh.clasificadores.ProyectoSNIPAutorizado;
import py.gov.stp.mh.clasificadores.UnidadJerarquica;
import py.gov.stp.mh.clasificadores.UnidadMedida;
import py.gov.stp.mh.clasificadores.UnidadResponsable;
import py.gov.stp.mh.consultas.PresupGastos;
import py.gov.stp.mh.consultas.ProductoFinanciero;
import py.gov.stp.mh.consultas.ProductoFisico;
import py.gov.stp.mh.proyectopresupuesto.AsignFinanProducto;
import py.gov.stp.mh.proyectopresupuesto.FundamentacionGasto;
import py.gov.stp.mh.proyectopresupuesto.PresupuestoGasto;
import py.gov.stp.mh.proyectopresupuesto.PresupuestoIngreso;
import py.gov.stp.mh.tools.Proyecto;
//import py.gov.stp.mh.tools.PresupuestoGasto;
import py.gov.stp.mh.tools.SqlSelects;
import py.gov.stp.mh.consultas.*;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class SqlInserts {
	
	private static final String UnidadJerarquica = null;
	public static final String POSTGRESQL_DUPLICATE_PK = "23505";
	
	public static void insertPresupGastos(PresupGastos presupGastos){
		try {
		Connection conn=ConnectionConfiguration.conectar();
		Integer anio=2016;
		Integer version=50;
		String query = " insert into presupuesto_gasto (codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma,  codigoSubprograma, codigoProyecto, codigoObjetoGasto, codigoFuenteFinan, codigoOrgFinanciador, codigoDpto, codigoPais, aprobado, modificaciones, vigente, planFinanciero, obligado, pagado, saldo, anho, version)"
		+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setInt (1, presupGastos.getCodigoNivel());
		insert.setInt (2, presupGastos.getCodigoEntidad());
		insert.setInt (3, presupGastos.getTipoPrograma());
		insert.setInt (4, presupGastos.getCodigoPrograma());
		insert.setInt (5, presupGastos.getCodigoSubprograma());
		insert.setInt (6, presupGastos.getCodigoProyecto());
		insert.setInt (7, presupGastos.getCodigoObjetoGasto());
		insert.setInt (8, presupGastos.getCodigoFuenteFinan());
		insert.setInt (9, presupGastos.getCodigoOrgFinanciador());
		insert.setInt (10, presupGastos.getCodigoDpto());
		insert.setInt (11, presupGastos.getCodigoPais());
		insert.setDouble (12, presupGastos.getAprobado());
		insert.setDouble (13, presupGastos.getModificaciones());
		insert.setDouble (14, presupGastos.getVigente());
		insert.setDouble (15, presupGastos.getPlanFinanciero());
		insert.setDouble (16, presupGastos.getObligado());
		insert.setDouble (17, presupGastos.getPagado());
		insert.setDouble (18, presupGastos.getSaldo());
		insert.setInt (19, anio);
		insert.setInt (20, version);



		insert.execute();

		conn.close();
		} catch (SQLException e) {e.printStackTrace();}

		}
		public static void insertProductoFinanciero(ProductoFinanciero productoFinanciero){
		try {
		Connection conn=ConnectionConfiguration.conectar();

		String query = " insert into producto_financiero (nro_fila, codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma, codigoSubprograma, codigoProyecto, codigoProducto, descripcionProducto, codigoObjetoGasto, codigoFuenteFinan, codigoOrgFinanciador, codigoDpto, planificado1, ejecutado1, planificado2, ejecutado2, planificado3, ejecutado3, planificado4, ejecutado4, planificado5, ejecutado5, planificado6, ejecutado6, planificado7, ejecutado7, planificado8, ejecutado8, planificado9, ejecutado9, planificado10, ejecutado10, planificado11, ejecutado11, planificado12, ejecutado12)"
		+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement insert = conn.prepareStatement(query);

		insert.setInt (1, productoFinanciero.getNumeroFila());
		insert.setInt (2, productoFinanciero.getCodigoNivel());
		insert.setInt (3, productoFinanciero.getCodigoEntidad());
		insert.setInt (4, productoFinanciero.getTipoPrograma());
		insert.setInt (5, productoFinanciero.getCodigoPrograma());
		insert.setInt (6, productoFinanciero.getCodigoSubprograma());
		insert.setInt (7, productoFinanciero.getCodigoProyecto());
		insert.setInt (8, productoFinanciero.getCodigoProducto());
		insert.setString (9, productoFinanciero.getDescripcionProducto());
		insert.setInt (10, productoFinanciero.getCodigoObjetoGasto());
		insert.setInt (11, productoFinanciero.getCodigoFuenteFinan());
		insert.setInt (12, productoFinanciero.getCodigoOrgFinanciador());
		insert.setInt (13, productoFinanciero.getCodigoDpto());
		insert.setDouble (14, productoFinanciero.getPlanificado1());
		insert.setDouble (15, productoFinanciero.getEjecutado1());
		insert.setDouble (16, productoFinanciero.getPlanificado2());
		insert.setDouble (17, productoFinanciero.getEjecutado2());
		insert.setDouble (18, productoFinanciero.getPlanificado3());
		insert.setDouble (19, productoFinanciero.getEjecutado3());
		insert.setDouble (20, productoFinanciero.getPlanificado4());
		insert.setDouble (21, productoFinanciero.getEjecutado4());
		insert.setDouble (22, productoFinanciero.getPlanificado5());
		insert.setDouble (23, productoFinanciero.getEjecutado5());
		insert.setDouble (24, productoFinanciero.getPlanificado6());
		insert.setDouble (25, productoFinanciero.getEjecutado6());
		insert.setDouble (26, productoFinanciero.getPlanificado7());
		insert.setDouble (27, productoFinanciero.getEjecutado7());
		insert.setDouble (28, productoFinanciero.getPlanificado8());
		insert.setDouble (29, productoFinanciero.getEjecutado8());
		insert.setDouble (30, productoFinanciero.getPlanificado9());
		insert.setDouble (31, productoFinanciero.getEjecutado9());
		insert.setDouble (32, productoFinanciero.getPlanificado10());
		insert.setDouble (33, productoFinanciero.getEjecutado10());
		insert.setDouble (34, productoFinanciero.getPlanificado11());
		insert.setDouble (35, productoFinanciero.getEjecutado11());
		insert.setDouble (36, productoFinanciero.getPlanificado12());
		insert.setDouble (37, productoFinanciero.getEjecutado12());




		insert.execute();

		conn.close();
		} catch (SQLException e) {e.printStackTrace();}

		}
		public static void insertProductoFisico(ProductoFisico productoFisico){
		try {
		Connection conn=ConnectionConfiguration.conectar();

		String query = " insert into producto_fisico ( codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma, codigoSubprograma, codigoProyecto, codigoProducto, descripcionProducto, unidadMedida, clase, meta1, avance1, meta2, avance2, meta3, avance3, meta4, avance4, meta5, avance5, meta6, avance6, meta7, avance7, meta8, avance8, meta9, avance9, meta10, avance10, meta11, avance11, meta12, avance12)"
		+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement insert = conn.prepareStatement(query);

		insert.setInt (1, productoFisico.getCodigoNivel());
		insert.setInt (2, productoFisico.getCodigoEntidad());
		insert.setInt (3, productoFisico.getTipoPrograma());
		insert.setInt (4, productoFisico.getCodigoPrograma());
		insert.setInt (5, productoFisico.getCodigoSubprograma());
		insert.setInt (6, productoFisico.getCodigoProyecto());
		insert.setInt (7, productoFisico.getCodigoProducto());
		insert.setString (8, productoFisico.getDescripcionProducto());
		insert.setString (9, productoFisico.getUnidadMedida());
		insert.setString (10, productoFisico.getClase());
		insert.setDouble (11, productoFisico.getMeta1());
		insert.setDouble (12, productoFisico.getAvance1());
		insert.setDouble (13, productoFisico.getMeta2());
		insert.setDouble (14, productoFisico.getAvance2());
		insert.setDouble (15, productoFisico.getMeta3());
		insert.setDouble (16, productoFisico.getAvance3());
		insert.setDouble (17, productoFisico.getMeta4());
		insert.setDouble (18, productoFisico.getAvance4());
		insert.setDouble (19, productoFisico.getMeta5());
		insert.setDouble (20, productoFisico.getAvance5());
		insert.setDouble (21, productoFisico.getMeta6());
		insert.setDouble (22, productoFisico.getAvance6());
		insert.setDouble (23, productoFisico.getMeta7());
		insert.setDouble (24, productoFisico.getAvance7());
		insert.setDouble (25, productoFisico.getMeta8());
		insert.setDouble (26, productoFisico.getAvance8());
		insert.setDouble (27, productoFisico.getMeta9());
		insert.setDouble (28, productoFisico.getAvance9());
		insert.setDouble (29, productoFisico.getMeta10());
		insert.setDouble (30, productoFisico.getAvance10());
		insert.setDouble (31, productoFisico.getMeta11());
		insert.setDouble (32, productoFisico.getAvance11());
		insert.setDouble (33, productoFisico.getMeta12());
		insert.setDouble (34, productoFisico.getAvance12());




		insert.execute();

		conn.close();
		} catch (SQLException e) {e.printStackTrace();}

		}
	
	
	public static void insertarIngresoOrigne(IngresoOrigen objeto, int anho){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into ingreso_origen "
			+ " values (?, ?, ?,?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getCodOrigen());
			insert.setString (2, objeto.getNombre());
			insert.setString (3, objeto.getNombreAbrev());
			insert.setString (4, objeto.getImputable());
			insert.setInt (1, anho);

			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertarPresupuestoGasto(PresupuestoGasto objeto, int anho, int version){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into presupuestogasto_presi "
			+ " values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getNivel());
			insert.setInt (2, objeto.getEntidad());
			insert.setInt (3, objeto.getTipoPrograma());
			insert.setInt (4, objeto.getCodigoPrograma());
			insert.setInt (5, objeto.getCodigoSubprograma());
			insert.setInt (6, objeto.getCodigoProyecto());
			insert.setInt (7, objeto.getCodigoObjetoGasto());
			insert.setInt (8, objeto.getCodigoPais());
			insert.setInt (9, objeto.getCodigoDepto());
			insert.setInt (10, objeto.getCodigoFuenteFinanc());
			insert.setInt (11, objeto.getCodigoOrganismoFinanc());
			insert.setString (12, objeto.getVerJustifica());
			insert.setDouble (13, objeto.getVerProgramado());
			insert.setInt (14, objeto.getNumeroFila());
			insert.setInt (15, anho);
			insert.setInt (16, version);
						
			insert.execute();
			   
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
			
	}
	public static void insertarPresupuestoIngreso(PresupuestoIngreso objeto, int anho, int version){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into PresupuestoIngreso_presi "
			+ " values (?, ?, ?, ?,?, ?, ?, ?,?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (3, objeto.getNivel());
			insert.setInt (4, objeto.getEntidad());
			insert.setInt (5, objeto.getCodOrigen());
			insert.setInt (6, objeto.getCodDetalle());
			insert.setInt (7, objeto.getFuenteFinanc());
			insert.setDouble (8, objeto.getMontoProgramado());
			insert.setInt (1, objeto.getNumeroFila());
			insert.setInt (2, anho);
			insert.setInt (9, version);

			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	public static void insertarAsignacionPresi(AsignFinanProducto objeto, int anho, int version) throws SQLException{
		Connection conn=null;
		PreparedStatement insert = null;
		try {
			conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into asignacion_presi "
			+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getNumeroFila());
			insert.setInt (2, objeto.getCodigoNivel());
			insert.setInt (3, objeto.getCodigoEntidad());
			insert.setInt (4, objeto.getTipoPrograma());
			insert.setInt (5, objeto.getCodigoPrograma());
			insert.setInt (6, objeto.getCodigoSubprograma());
			insert.setInt (7, objeto.getCodigoProyecto());
			insert.setInt (8, objeto.getCodigoObjetoGasto());
			insert.setInt (9, objeto.getCodigoFuenteFinan());
			insert.setInt (10, objeto.getCodigoOrgFinanciador());
			insert.setInt (11, objeto.getCodigoPais());
			insert.setInt (12, objeto.getCodigoDepartamento());
			insert.setInt (13, objeto.getCodigoProducto());
			insert.setString (14, objeto.getObservacion());
			insert.setDouble (15, objeto.getPlanificado1());
			insert.setDouble (16, objeto.getEjecutado1());
			insert.setDouble (17, objeto.getPlanificado2());
			insert.setDouble (18, objeto.getEjecutado2());
			insert.setDouble (19, objeto.getPlanificado3());
			insert.setDouble (20, objeto.getEjecutado3());
			insert.setDouble (21, objeto.getPlanificado4());
			insert.setDouble (22, objeto.getEjecutado4());
			insert.setDouble (23, objeto.getPlanificado5());
			insert.setDouble (24, objeto.getEjecutado5());
			insert.setDouble (25, objeto.getPlanificado6());
			insert.setDouble (26, objeto.getEjecutado6());
			insert.setDouble (27, objeto.getPlanificado7());
			insert.setDouble (28, objeto.getEjecutado7());
			insert.setDouble (29, objeto.getPlanificado8());
			insert.setDouble (30, objeto.getEjecutado8());
			insert.setDouble (31, objeto.getPlanificado9());
			insert.setDouble (32, objeto.getEjecutado9());
			insert.setDouble (33, objeto.getPlanificado10());
			insert.setDouble (34, objeto.getEjecutado10());
			insert.setDouble (35, objeto.getPlanificado11());
			insert.setDouble (36, objeto.getEjecutado11());
			insert.setDouble (37, objeto.getPlanificado12());
			insert.setDouble (38, objeto.getEjecutado12());
			insert.setInt (39, anho);
			insert.setInt (40, version);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			conn.close();
			insert.close();
		}
	}
	
	public static void insertarFundamentacionPresi(FundamentacionGasto objeto, int anho, int version){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into fundamentacion_presi "
			+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getNumeroFila());
			insert.setInt (2, objeto.getNivel());
			insert.setInt (3, objeto.getEntidad());
			insert.setInt (4, objeto.getTipoPrograma());
			insert.setInt (5, objeto.getCodigoPrograma());
			insert.setInt (6, objeto.getCodigoSubprograma());
			insert.setInt (7, objeto.getCodigoProyecto());
			insert.setInt (8, objeto.getObjetoGasto());
			insert.setInt (9, objeto.getFuente());
			insert.setInt (10, objeto.getOrgFinanciador());
			insert.setInt (11, objeto.getPais());
			insert.setInt (12, objeto.getDepartamento());
			insert.setInt (13, objeto.getSecuencia());
			insert.setDouble (14, objeto.getPrecio());
			insert.setInt (15, objeto.getCantidad());
			insert.setInt (16, objeto.getCantidad());
			insert.setString (17, objeto.getDescripcion());
			insert.setInt (18, objeto.getClgCodigo());
			insert.setInt (19, anho);
			insert.setInt (20, version);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertCatalogoDestinatario(CatalogoDestinatario catalogoDestinatario, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into catalogo_destinatario (id,nombre,descripcion,tipo_catalogo_destinatario_id,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, catalogoDestinatario.getId());
			insert.setString (2, catalogoDestinatario.getNombre());
			insert.setString (4, catalogoDestinatario.getDescripcion());
			insert.setInt (3, catalogoDestinatario.getTipo_catalogo_destianatario_id());
			insert.setString (5, usuarioResponsable);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static String insertProductoPresupuestoDestinatario(ProductoPresupuestoDestinatario objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into producto_presupuesto_destinatario "
			+ "(nivel,entidad,tipo_presupuesto,programa,subprograma,proyecto,producto,catalogo_destinatario,departamento,cantidad, descripcion, usuario_responsable)"		
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			 PreparedStatement insert = conn.prepareStatement(query);
			 insert.setInt    (1,  objeto.getNivel());
			 insert.setInt    (2,  objeto.getEntidad());
			 insert.setInt    (3,  objeto.getTipo_presupuesto());
			 insert.setInt    (4,  objeto.getPrograma());
			 insert.setInt    (5,  objeto.getSubprograma());
			 insert.setInt    (6,  objeto.getProyecto());
			 insert.setInt    (7,  objeto.getProducto());
			 insert.setInt    (8,  objeto.getCatalogo_destinatario());
			 insert.setInt(9,  objeto.getDepartamento().intValue());
			 insert.setDouble (10, objeto.getCantidad());			
			 insert.setString (11, objeto.getDescripcion());
			 insert.setString (12, usuarioResponsable);
			
			insert.execute();
			
			conn.close();
			return "Exito";
		} catch (SQLException e) {
			e.printStackTrace();
			if(e.getSQLState().equals(POSTGRESQL_DUPLICATE_PK)){// Clave duplicada
				return "Error. Este registro ya existe en la base de datos.";
			} else {
				return "Error";
			}
			
		}
	}

	public static void insertPrecioDncp(PrecioDNCP preciodncp){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into catalogo_dncp (id,nombre,descripcion,anho,numero_fila,precio,objeto_de_gasto_id)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, preciodncp.getCodCatalogo());
			insert.setString (2, preciodncp.getNombreCatalogo());
			insert.setString (3, preciodncp.getSiglaCatalogo());
			insert.setInt (4, preciodncp.getAnio());
			insert.setInt (5, preciodncp.getNumeroFila());
			insert.setDouble (6, preciodncp.getPrecio());
			insert.setInt (7, preciodncp.getCodObjetoGasto());
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	
	
	public static void insertDemografia(Demografia demografia, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into demografia (id,nombre,descipcion,tipo_demografica_id_abrev,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, demografia.getId());
			insert.setString (2, demografia.getNombre());
			insert.setString (3, demografia.getDescripcion());
			insert.setInt (4, demografia.getTipo_demografica_id());
			insert.setString (5, demografia.getAbrev());
			insert.setString (6, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertDepartamento(Departamento departamento){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into departamento (id,nombre,descripcion,pais,numero_fila,abrev)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, departamento.getDeptoPais());
			insert.setString (2, departamento.getNombreDepartamento());
			insert.setInt (3, departamento.getCodigoPais());
			insert.setInt (4, departamento.getNumeroFila());
			insert.setString (5, departamento.getAbrevDepartamento());
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertDiccionarioDato(DiccionarioDato diccionarioDato, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into diccionario_dato (id,clase,nombre,titulo,descripcion,instructivo,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, diccionarioDato.getId());
			insert.setString (2, diccionarioDato.getClase());
			insert.setString (3, diccionarioDato.getNombre());
			insert.setString (4, diccionarioDato.getTitulo());
			insert.setString (5, diccionarioDato.getDescripcion());
			insert.setString (6, diccionarioDato.getInstructivo());
			insert.setString (7, usuarioResponsable);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}

	public static void insertEjeEstrategico(EjeEstrategico ejeEstrategico, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into eje_estrategico (id,nombre,descripcion,plan_id,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, ejeEstrategico.getId());
			insert.setString (2, ejeEstrategico.getNombre());
			insert.setString (3, ejeEstrategico.getDescripcion());
			insert.setInt (4, ejeEstrategico.getPlan_id());
			insert.setString (5, usuarioResponsable);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}	
	
	public static void insertEstrategia(Estrategia estrategia, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into estrategia (id,nombre,descripcion,numero_fila,eje_estrategico_id,linea_transversal_id,plan, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, estrategia.getEje_estrategico_id());
			insert.setString (2, estrategia.getNombre());
			insert.setString (3, estrategia.getDescripcion());
			insert.setInt (4, estrategia.getNumero_fila());
			insert.setInt (5, estrategia.getEje_estrategico_id());
			insert.setInt (6, estrategia.getLinea_transversal_id());
			insert.setInt (7, estrategia.getPlan());
			insert.setString (8, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertEstrategiaHasObjetivo(EstrategiaHasObjetivo estrategiaHasObjetivo, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into estrategia_has_objetivo (id,estrategia_id,estrategia_eje_estrategico_id,estrategia_linea_transversal_id,objetivo_id,objetivo_tipo_objetivo_id,es_principal,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, estrategiaHasObjetivo.getId());
			insert.setInt (2, estrategiaHasObjetivo.getEstrategia_id());
			insert.setInt (3, estrategiaHasObjetivo.getEstrategia_eje_estrategico_id());
			insert.setInt (4, estrategiaHasObjetivo.getEstrategia_linea_transversal_id());
			insert.setInt (5, estrategiaHasObjetivo.getObjetivo());
			insert.setInt (6, estrategiaHasObjetivo.getObjetivo_tipo_objetivo_id());
			insert.setInt (7, estrategiaHasObjetivo.getEs_principal());
			insert.setString (8, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//en el campo descripcion de la tabla lleva getAbrevFuenteFinanciamiento ademas hay 6 variable en la clase y 5 campos en la bd
	public static void insertFuenteFinanciamiento(FuenteFinanciamiento fuenteFinanciamiento){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into fuente_financiamiento (id,nombre,descripcion,anho,numero_fila)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, fuenteFinanciamiento.getCodFuenteFinanciamiento());
			insert.setString (2, fuenteFinanciamiento.getNombreFuenteFinanciamiento());
			insert.setString (3, fuenteFinanciamiento.getAbrevFuenteFinanciamiento());
			insert.setInt (4, fuenteFinanciamiento.getAnio());
			insert.setInt (5, fuenteFinanciamiento.getNumeroFila());
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertFuenteVerificacion(FuenteVerificacion fuenteVerificacion, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into fuente_verificacion (id,nombre,descripcion,abrev,uri,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, fuenteVerificacion.getId());
			insert.setString (2, fuenteVerificacion.getNombre());
			insert.setString (3, fuenteVerificacion.getDescripcion());
			insert.setString (4, fuenteVerificacion.getAbrev());
			insert.setString (5, fuenteVerificacion.getUri());
			insert.setString (6, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//No se inserta descripcion en la bd no es importante segun RP
	public static void insertFuncional(Funcional funcional){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into funcional (id,numero_fila,nombre,abrev,es_imputable)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, funcional.getCodigoFuncional());
			insert.setInt (2, funcional.getNumeroFila());
			insert.setString (3, funcional.getNombre());
			insert.setString (4, funcional.getAbreviacion());
			insert.setString (5, funcional.getEsImputable());
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static boolean insertIndicador(Indicador indicador, String usuarioResponsable, String nivelCas, String entidadCas )throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into indicador (nombre,descripcion,tipo_indicador_id,metodo_calculo_id,unidad_medida_id,frecuencia_meses,desagregacion_tipo_zona_geografica_id,tipo_demografica_id,fuente_verificacion_id,observaciones,objetivo_id,institucion_responsable_calculo_indicador,evaluacion_heci,contacto,fecha_disponibilidad_informacion,cobertura_geografica_alcance,nivel_despliegue_geografico,cobertura_demografica_alcance,nivel_despliegue_demografica,nivel,entidad,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setString (1, indicador.getNombre());
			insert.setString (2, indicador.getDescripcion());
			insert.setInt (3, indicador.getTipo_indicador_id());
			insert.setString (4, indicador.getMetodo_calculo_id().replaceAll("\"","'"));
			insert.setInt (5, indicador.getUnidad_medida_id());
			insert.setInt (6, indicador.getFrecuencia_meses());
			insert.setInt (7, indicador.getDesagregacion_tipo_zona_geografica_id());
			insert.setInt (8, indicador.getTipo_demografica_id());
			insert.setString (9, indicador.getFuente_verificacion_id());
			insert.setString (10, indicador.getObservaciones());
			insert.setInt (11, indicador.getObjetivo_id());
			insert.setString(12, indicador.getInstitucionResponsableCalculoIndicador());
			insert.setString(13, indicador.getEvaluacionHeci());
			insert.setString(14, indicador.getContacto());
			insert.setString(15, indicador.getFechaDisponibilidadInformacion()); 
			insert.setInt(16, indicador.getCoberturaGeograficaAlcance());
			insert.setInt(17, indicador.getNivelDespliegueGeograficoDesagregacion());
			insert.setInt(18, indicador.getCoberturaDemograficaAlcance());
			insert.setInt(19, indicador.getNivelDespliegueDemograficoDesagregacion());
			insert.setInt(20, Integer.parseInt(nivelCas));
			insert.setInt(21, Integer.parseInt(entidadCas));
			insert.setString(22, usuarioResponsable);

			insert.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	//inserta los indicadores al modal de Resultados Esperados
	public static void insertIndicadorResultado(IndicadorResultado indicador, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into indicador (nombre,descripcion,tipo_indicador_id,metodo_calculo_id,unidad_medida_id,frecuencia_meses,desagregacion_tipo_zona_geografica_id,tipo_demografica_id,fuente_verificacion_id,observaciones,objetivo_id,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			//insert.setInt (1, indicador.getId());
			insert.setString (1, indicador.getNombre());
			insert.setString (2, indicador.getDescripcion());
			insert.setInt (3, indicador.getTipo_indicador_id());
			insert.setString (4, indicador.getMetodo_calculo_id().replaceAll("\"","'"));
			insert.setInt (5, indicador.getUnidad_medida_id());
			insert.setInt (6, indicador.getFrecuencia_meses());
			insert.setInt (7, indicador.getDesagregacion_tipo_zona_geografica_id());
			insert.setInt (8, indicador.getTipo_demografica_id()); 
			insert.setString (9, indicador.getFuente_verificacion());
			insert.setString (10, indicador.getObservaciones());
			insert.setInt (11, indicador.getObjetivo_id());
			insert.setString (12, usuarioResponsable);
			
			insert.execute();
			
			List<Indicador> objetos = new ArrayList<Indicador>();
			int id=0;
			try {
				objetos = SqlSelects.selectAllIndicadores("where objetivo_id="+indicador.getObjetivo_id()+" and nombre LIKE '%"+indicador.getNombre()+"%'");
				id=objetos.get(0).getId();
				
				//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        String fecha2014 = "2014-12-31";
		        String fecha2015 =  "2015-12-31";
		        String fecha2016 =  "2016-12-31";
		        String fecha2017 =  "2017-12-31";
		        String fecha2018 =  "2018-12-31";
				
				Meta meta2014 = new Meta();
				meta2014.setCantidad(indicador.getMeta2014());
				meta2014.setDemografia_id(1);
				meta2014.setIndicador_id(id);
				meta2014.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
				meta2014.setVencimiento(fecha2014);
				insertMeta(meta2014,usuarioResponsable);
				
				Meta meta2015 = new Meta();
				meta2015.setCantidad(indicador.getMeta2015());
				meta2015.setDemografia_id(1);
				meta2015.setIndicador_id(id);
				meta2015.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
				meta2015.setVencimiento(fecha2015);
				insertMeta(meta2015,usuarioResponsable);
				
				Meta meta2016 = new Meta();
				meta2016.setCantidad(indicador.getMeta2016());
				meta2016.setDemografia_id(1);
				meta2016.setIndicador_id(id);
				meta2016.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
				meta2016.setVencimiento(fecha2016);
				insertMeta(meta2016,usuarioResponsable);
				
				Meta meta2017 = new Meta();
				meta2017.setCantidad(indicador.getMeta2017());
				meta2017.setDemografia_id(1);
				meta2017.setIndicador_id(id);
				meta2017.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
				meta2017.setVencimiento(fecha2017);
				insertMeta(meta2017,usuarioResponsable);
				
				Meta meta2018 = new Meta();
				meta2018.setCantidad(indicador.getMeta2018());
				meta2018.setDemografia_id(1);
				meta2018.setIndicador_id(id);
				meta2018.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
				meta2018.setVencimiento(fecha2018);
				
//				insertMeta(meta2014);
//				insertMeta(meta2015);
//				insertMeta(meta2016);
//				insertMeta(meta2017);
				insertMeta(meta2018,usuarioResponsable);
				
				
			}
			catch (SQLException e) {e.printStackTrace();}
			
			//insert.execute(); //se coloco aqui para su uso a futuro aun no tiene un fin especifico
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	/*  Fragmento original de codigo
	public static void insertIndicadorResultado(IndicadorResultado indicador){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into indicador (id,nombre,descripcion,tipo_indicador_id,metodo_calculo_id,unidad_medida_id,frecuencia_meses,desagregacion_tipo_zona_geografica_id,tipo_demografica_id,fuente_verificacion_id,observaciones,objetivo_id)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, indicador.getId());
			insert.setString (2, indicador.getNombre());
			insert.setString (3, indicador.getDescripcion());
			insert.setInt (4, indicador.getTipo_indicador_id());
			insert.setInt (5, indicador.getMetodo_calculo_id());
			insert.setInt (6, indicador.getUnidad_medida_id());
			insert.setInt (7, indicador.getFrecuencia_meses());
			insert.setInt (8, indicador.getDesagregacion_tipo_zona_geografica_id());
			insert.setInt (9, indicador.getTipo_demografica_id());
			insert.setInt (10, indicador.getFuente_verificacion_id());
			insert.setString (11, indicador.getObservaciones());
			insert.setInt (12, indicador.getObjetivo_id());
			
			insert.execute();
			
			List<Indicador> objetos = new ArrayList<Indicador>();
			int id=0;
			try {
			objetos = SqlSelects.selectAllIndicadores("where objetivo_id="+indicador.getObjetivo_id()+" and nombre LIKE '%"+indicador.getNombre()+"%'");
			id=objetos.get(0).getId();
			
			//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        String fecha2014 = "2014-12-31";
	        String fecha2015 =  "2015-12-31";
	        String fecha2016 =  "2016-12-31";
	        String fecha2017 =  "2017-12-31";
	        String fecha2018 =  "2018-12-31";
			
			Meta meta2014 = new Meta();
			meta2014.setCantidad(indicador.getMeta2014());
			meta2014.setDemografia_id(1);
			meta2014.setIndicador_id(id);
			meta2014.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
			meta2014.setVencimiento(fecha2014);
			insertMeta(meta2014);
			
			Meta meta2015 = new Meta();
			meta2015.setCantidad(indicador.getMeta2015());
			meta2015.setDemografia_id(1);
			meta2015.setIndicador_id(id);
			meta2015.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
			meta2015.setVencimiento(fecha2015);
			insertMeta(meta2015);
			
			Meta meta2016 = new Meta();
			meta2016.setCantidad(indicador.getMeta2016());
			meta2016.setDemografia_id(1);
			meta2016.setIndicador_id(id);
			meta2016.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
			meta2016.setVencimiento(fecha2016);
			insertMeta(meta2016);
			
			Meta meta2017 = new Meta();
			meta2017.setCantidad(indicador.getMeta2017());
			meta2017.setDemografia_id(1);
			meta2017.setIndicador_id(id);
			meta2017.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
			meta2017.setVencimiento(fecha2017);
			insertMeta(meta2017);
			
			Meta meta2018 = new Meta();
			meta2018.setCantidad(indicador.getMeta2018());
			meta2018.setDemografia_id(1);
			meta2018.setIndicador_id(id);
			meta2018.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
			meta2018.setVencimiento(fecha2018);
			insertMeta(meta2018);
			
			
			
			}
			catch (SQLException e) {e.printStackTrace();}
			
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}*/
	

	public static void insertLineaTransversal(LineaTransversal lineaTransversal, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into linea_transversal (id,nombre,descripcion,plan_id,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, lineaTransversal.getId());
			insert.setString (2, lineaTransversal.getNombre());
			insert.setString (3, lineaTransversal.getDescripcion());
			insert.setInt (4, lineaTransversal.getPlan_id());
			insert.setString (5, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}	

	public static void insertMeta(Meta meta, String usuarioResponsable){ 
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into meta (cantidad,vencimiento,indicador_id,zona_geografica_id,demografia_id,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
	//		insert.setInt (1, meta.getId());
			insert.setDouble (1, meta.getCantidad());
			insert.setString (2, meta.getVencimiento());
			insert.setInt (3, meta.getIndicador_id());
			insert.setInt (4, meta.getZona_geografica_id()); 
			insert.setInt (5, meta.getDemografia_id());
			insert.setString (6, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}	
	
	public static boolean insertMetaCrud(Meta meta, String usuarioString, String nivel, String entidad)throws ParseException{ 
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	String tabla="";
			if(meta.getAvance().equals("Avance")){
				tabla="avance_indicador ";
			}else{
				if(meta.getAvance().equals("Metas")){
					tabla="meta ";
				}
			}
			String query = " insert into "+tabla+" (cantidad,vencimiento,indicador_id,zona_geografica_id,demografia_id,nivel,entidad,usuario_responsable,objetivo_id,tipo_objetivo_id)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
	//		insert.setInt (1, meta.getId());
			insert.setDouble (1, meta.getCantidad());
			insert.setString (2, meta.getVencimiento());
			insert.setInt (3, meta.getIndicador_id());
			insert.setInt (4, meta.getZona_geografica_id()); 
			insert.setInt (5, meta.getDemografia_id());
			insert.setInt (6, Integer.parseInt(nivel));
			insert.setInt (7, Integer.parseInt(entidad));
			insert.setString (8, usuarioString);
			//insert.setString (9, meta.getProductoConcat());
			insert.setInt (9, meta.getObjetivoId());
			insert.setInt(10, meta.getTipoObjetivoId());
			
			insert.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}
	}	
	
	public static void insertMetodoCalculo(MetodoCalculo metodoCalculo, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into metodo_calculo (nombre,descripcion,clase,usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			//insert.setInt (1, metodoCalculo.getId());
			insert.setString (1, metodoCalculo.getNombre());
			insert.setString (2, metodoCalculo.getDescripcion());
			insert.setString (3, metodoCalculo.getClase());
			insert.setString (4, usuarioResponsable);
		
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertModulo(Modulo modulo, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into modulo (id,nombre,usuario_responsable)"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, modulo.getId());
			insert.setString (2, modulo.getNombre());
			insert.setString (3, usuarioResponsable);
		
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertModuloHasPermiso(ModuloHasPermiso moduloHasPermiso, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into modulo_has_permiso (role_id,modulo_id,permiso_id, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, moduloHasPermiso.getRole_id());
			insert.setInt (2, moduloHasPermiso.getModulo_id());
			insert.setInt (3, moduloHasPermiso.getPermiso_id());
			insert.setString (4, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static boolean insertPermisoPorModulos(PermisoPorModulos objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into permisos_por_modulos (modulos_id,usuario_id,permisos_modulos_id, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, objeto.getModulosId());
			insert.setInt (2, objeto.getUsuarioId());
			insert.setInt (3, objeto.getPermisosModulosId());
			insert.setString (4, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
			
	}
	
	//getNivel = cod_nivel de la tabla y no al id de la tabla veerificar si esta correcto
	public static void insertNivel(Nivel nivel){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into nivel (numero_fila,anho,cod_nivel,nombre,abrev,es_imputable)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, nivel.getNumeroFila());
			insert.setInt (2, nivel.getAnio());
			insert.setInt (3, nivel.getNivel());
			insert.setString (4, nivel.getNombreNivel());
			insert.setString (5, nivel.getAbrevNivel());
			insert.setString (6, nivel.getEsImputable());
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertObjetoDeGasto(ObjetoDeGasto objetoDeGasto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into objeto_de_gasto (id,nombre,descripcion,abrev,es_imputable,numero_fila,anho,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, objetoDeGasto.getId());
			insert.setString (2, objetoDeGasto.getNombre());
			insert.setString (3, objetoDeGasto.getDescripcion());
			insert.setString (4, objetoDeGasto.getAbrev());
			insert.setString (5, objetoDeGasto.getEs_imputable());
			insert.setInt (6, objetoDeGasto.getNumero_fila());
			insert.setInt (7, objetoDeGasto.getAnho());
			insert.setString (8, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	//no insertamos descripcion verificar si hace falta y crear la clase en el paquete tools
	public static void insertOrganismoFinanciador(OrganismoFinanciador organismoFinanciador){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into organismo_financiador (id,nombre,numero_fila,anho)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, organismoFinanciador.getCodOrgFinanciador());
			insert.setString (2, organismoFinanciador.getNombreOrgFinanciador());
			insert.setInt (3, organismoFinanciador.getNumeroFila());
			insert.setInt (4, organismoFinanciador.getAnio());
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertPermiso(Permiso permiso, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into permiso (id,nombre,usuario_responsable)"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, permiso.getId());
			insert.setString (2, permiso.getNombre());
			insert.setString (3, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	//verificar entidad_responsable en la table es int y en la clase string ademas las fechas desde y hasta
	public static void insertPlan(Plan plan){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into plan (id,nombre,descripcion,detalle,entidad_responsable,fecha_inicio,fecha_fin)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, plan.getCodigoPlan());
			insert.setString (2, plan.getPlanNombre());
			insert.setString (3, plan.getPlanDescripcion());
			insert.setString (4, plan.getPlanDetalle());
			insert.setString (5, plan.getEntidadResponsable());
			//insert.setDate (6, plan.getPlanDesde());
			//insert.setDate (7, plan.getPlanHasta());
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	//Cree una clase nueva en tools porque en clasificadores no tenia todos los campos verificar si esta bien.
	public static void insertProducto(Producto producto,String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into producto (id,nombre,descripcion,clase,unidad_medida_id, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, producto.getId());
			insert.setString (2, producto.getNombre());
			insert.setString (3, producto.getDescripcion());
			insert.setString (4, producto.getClase());
			insert.setInt (5, producto.getUnidad_medida_id());			
			insert.setString (6, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertProductoPresupuestoMeta( ProductoPresupuestoMeta productoPresupuestoMeta, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into producto_presupuesto_meta (id, mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, productoPresupuestoMeta.getId());
			insert.setInt (2, productoPresupuestoMeta.getMes());
			insert.setInt (3, productoPresupuestoMeta.getAnho());
			insert.setDouble (4, productoPresupuestoMeta.getCantidad());
			insert.setInt (5, productoPresupuestoMeta.getCatalogo_destianatario_id());
			insert.setInt (6, productoPresupuestoMeta.getDepartamento());
			insert.setInt (7, productoPresupuestoMeta.getProducto_presupusto_id());
			insert.setInt (8, productoPresupuestoMeta.getProducto_id());
			insert.setInt (9, productoPresupuestoMeta.getUnidad_medida_id());
			insert.setInt (10, productoPresupuestoMeta.getProyecto_id());
			insert.setInt (11, productoPresupuestoMeta.getSubprograma_id());
			insert.setInt (12, productoPresupuestoMeta.getPrograma_id());
			insert.setInt (13, productoPresupuestoMeta.getTipo_presupuesto_id());
			insert.setInt (14, productoPresupuestoMeta.getEntidad_id());
			insert.setInt (15, productoPresupuestoMeta.getNivel_id());
			insert.setString (16, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static boolean insertProductoPresupuesto(ProductoPresupuesto productoPresupuesto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
			String query = " insert into producto_presupusto (id, numero_fila, anho, producto_id, producto_unidad_medida_id, proyecto_id, proyecto_subprograma_id, proyecto_subprograma_programa_id, proyecto_subprograma_programa_tipo_presupuesto_id,proyecto_subprograma_programa_entidad_id, proyecto_subprograma_programa_entidad_nivel_id, version, usuario_responsable, intermedio)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, productoPresupuesto.getId());
			insert.setInt (2, productoPresupuesto.getNumero_fila());
			insert.setInt (3, productoPresupuesto.getAnho());
			insert.setInt (4, productoPresupuesto.getProducto_id());
			insert.setInt (5, productoPresupuesto.getUnidad_medida_id());
			insert.setInt (6, productoPresupuesto.getProyecto_id());
			insert.setInt (7, productoPresupuesto.getSubprograma_id());
			insert.setInt (8, productoPresupuesto.getPrograma_id());
			insert.setInt (9, productoPresupuesto.getTipo_presupuesto_id());
			insert.setInt (10, productoPresupuesto.getEntidad_id());
			insert.setInt (11, productoPresupuesto.getNivel_id());
			insert.setInt (12, productoPresupuesto.getVersion());			
			insert.setString (13, usuarioResponsable);
			insert.setBoolean (14, productoPresupuesto.isIntermedio());
			
			insert.execute();
			for (int mes = 1; mes < 13; mes++){
				for (int departamento = 0; departamento<= 17; departamento++){
					String query2 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id, usuario_responsable)"
						+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						
						PreparedStatement insert2 = conn.prepareStatement(query2);
						insert2.setInt (1, mes);
						insert2.setInt (2, productoPresupuesto.getAnho());
						insert2.setInt (3, 0);
						insert2.setInt (4, 1);
						insert2.setInt (5, departamento);
						insert2.setInt (6, productoPresupuesto.getId());
						insert2.setInt (7, productoPresupuesto.getId());
						insert2.setInt (8, productoPresupuesto.getUnidad_medida_id());
						insert2.setInt (9, productoPresupuesto.getProyecto_id());
						insert2.setInt (10, productoPresupuesto.getSubprograma_id());
						insert2.setInt (11, productoPresupuesto.getPrograma_id());
						insert2.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
						insert2.setInt (13, productoPresupuesto.getEntidad_id());
						insert2.setInt (14, productoPresupuesto.getNivel_id());
						insert2.setString(15, usuarioResponsable);
						
						insert2.execute();
				}
				String query2 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id, usuario_responsable)"
						+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						
						PreparedStatement insert2 = conn.prepareStatement(query2);
						insert2.setInt (1, mes);
						insert2.setInt (2, productoPresupuesto.getAnho());
						insert2.setInt (3, 0);
						insert2.setInt (4, 1);
						insert2.setInt (5, 88);
						insert2.setInt (6, productoPresupuesto.getId());
						insert2.setInt (7, productoPresupuesto.getId());
						insert2.setInt (8, productoPresupuesto.getUnidad_medida_id());
						insert2.setInt (9, productoPresupuesto.getProyecto_id());
						insert2.setInt (10, productoPresupuesto.getSubprograma_id());
						insert2.setInt (11, productoPresupuesto.getPrograma_id());
						insert2.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
						insert2.setInt (13, productoPresupuesto.getEntidad_id());
						insert2.setInt (14, productoPresupuesto.getNivel_id());
						insert2.setString (15, usuarioResponsable);
						
						insert2.execute();
				String query3 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id, usuario_responsable)"
						+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						
						PreparedStatement insert3 = conn.prepareStatement(query3);
						insert3.setInt (1, mes);
						insert3.setInt (2, productoPresupuesto.getAnho());
						insert3.setInt (3, 0);
						insert3.setInt (4, 1);
						insert3.setInt (5, 99);
						insert3.setInt (6, productoPresupuesto.getId());
						insert3.setInt (7, productoPresupuesto.getId());
						insert3.setInt (8, productoPresupuesto.getUnidad_medida_id());
						insert3.setInt (9, productoPresupuesto.getProyecto_id());
						insert3.setInt (10, productoPresupuesto.getSubprograma_id());
						insert3.setInt (11, productoPresupuesto.getPrograma_id());
						insert3.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
						insert3.setInt (13, productoPresupuesto.getEntidad_id());
						insert3.setInt (14, productoPresupuesto.getNivel_id());
						insert3.setString (15, usuarioResponsable);
						
						insert3.execute();
				
			}
			String query3 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id, usuario_responsable)"
					+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					
					PreparedStatement insert3 = conn.prepareStatement(query3);
					insert3.setInt (1, 1);
					insert3.setInt (2, 2018);
					insert3.setInt (3, 0);
					insert3.setInt (4, 1);
					insert3.setInt (5, 99);
					insert3.setInt (6, productoPresupuesto.getId());
					insert3.setInt (7, productoPresupuesto.getId());
					insert3.setInt (8, productoPresupuesto.getUnidad_medida_id());
					insert3.setInt (9, productoPresupuesto.getProyecto_id());
					insert3.setInt (10, productoPresupuesto.getSubprograma_id());
					insert3.setInt (11, productoPresupuesto.getPrograma_id());
					insert3.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
					insert3.setInt (13, productoPresupuesto.getEntidad_id());
					insert3.setInt (14, productoPresupuesto.getNivel_id());
					insert3.setString (15, usuarioResponsable);
					
					insert3.execute();
			String query4 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id, usuario_responsable)"
					+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					
					PreparedStatement insert4 = conn.prepareStatement(query4);
					insert4.setInt (1, 1);
					insert4.setInt (2, 2019);
					insert4.setInt (3, 0);
					insert4.setInt (4, 1);
					insert4.setInt (5, 99);
					insert4.setInt (6, productoPresupuesto.getId());
					insert4.setInt (7, productoPresupuesto.getId());
					insert4.setInt (8, productoPresupuesto.getUnidad_medida_id());
					insert4.setInt (9, productoPresupuesto.getProyecto_id());
					insert4.setInt (10, productoPresupuesto.getSubprograma_id());
					insert4.setInt (11, productoPresupuesto.getPrograma_id());
					insert4.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
					insert4.setInt (13, productoPresupuesto.getEntidad_id());
					insert4.setInt (14, productoPresupuesto.getNivel_id());
					insert4.setString (15, usuarioResponsable);
					
					insert4.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}
			
	}
	
	public static void insertPrograma(Programa programa){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into programa (id, numeroFila, anho, cod_programa, nombre, abrev, descripcion, objetivo, diagnostico, base_legal, resultado, codigoDepartamento, tipo_presupuesto_id, entidad_id, entidad_nivel_id)"
			+ " values (?, ?, ?, ?, ?, ?, '*', ?, ?, ?, '*', ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, programa.getCodigoPrograma());
			insert.setInt (2, programa.getNumeroFila());
			insert.setInt (3, programa.getAnio());
			insert.setInt (4, programa.getCodigoPrograma());
			insert.setString (5, programa.getNombrePrograma());
			insert.setString (6, programa.getAbrevPrograma());
			//insert.setString (7, programa.getDescripcionPrograma());
			insert.setString (8, programa.getObjetivo());
			insert.setString (9, programa.getDiagnostico());
			insert.setString (10, programa.getBaseLegal());
			//insert.setString (11, programa.getResultado());
			insert.setInt (12, programa.getCodigoDepartamento());
			insert.setInt (13, programa.getTipoPrograma());
			insert.setInt (14, programa.getEntidad());
			insert.setInt (15, programa.getNivel());			
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertProgramaCompleto(Programa programa){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into programa (id, numeroFila, anho, cod_programa, nombre, abrev, descripcion, objetivo, diagnostico, base_legal, resultado, codigoDepartamento, tipo_presupuesto_id, entidad_id, entidad_nivel_id)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, programa.getCodigoPrograma());
			insert.setInt (2, programa.getNumeroFila());
			insert.setInt (3, programa.getAnio());
			insert.setInt (4, programa.getCodigoPrograma());
			insert.setString (5, programa.getNombrePrograma());
			insert.setString (6, programa.getAbrevPrograma());
			insert.setString (7, programa.getDescripcionPrograma());
			insert.setString (8, programa.getObjetivo());
			insert.setString (9, programa.getDiagnostico());
			insert.setString (10, programa.getBaseLegal());
			insert.setString (11, programa.getResultado());
			insert.setInt (12, programa.getCodigoDepartamento());
			insert.setInt (13, programa.getTipoPrograma());
			insert.setInt (14, programa.getEntidad());
			insert.setInt (15, programa.getNivel());			
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertProgramatico(Programatico programatico, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into programatico (id, nombre, descripcion, tipo_programatico_id, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, programatico.getId());
			insert.setString (2, programatico.getNombre());
			insert.setString (3, programatico.getDescripcion());
			insert.setInt (4, programatico.getTipo_programatico_id());
			insert.setString (5, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertProgramaticoHasObjetivo(ProgramaticoHasObjetivo programaticoHasObjetivo,String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into programatico_has_objetivo (programatico_id, programatico_tipo_programatico_id, usuario_responsable)"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, programaticoHasObjetivo.getProgramatico_id());
			insert.setInt (2, programaticoHasObjetivo.getProgramatico_tipo_programatico_id());
			insert.setString (3, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}	

	//subprograma_programa_tipo_presupuesto_id = getTipoPrograma, 
	public static void insertProyecto(Proyecto proyectoObj, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into proyecto (id, nombre, descripcion, abrev, anho, subprograma_id, subprograma_programa_id, subprograma_programa_tipo_presupuesto_id, subprograma_programa_entidad_id, subprograma_programa_entidad_nivel_id, unidad_responsable_id, funcional_id, diagnostico, resultado_esperado, codigo_departamento, usuario_responsable )"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, proyectoObj.getCodigoProyecto());
			insert.setString (2, proyectoObj.getNombreProyecto());
			insert.setString (3, proyectoObj.getDescripcionProyecto());
			insert.setString (4, proyectoObj.getAbrevProyecto());
			insert.setInt (5, proyectoObj.getAnio());
			insert.setInt (6, proyectoObj.getCodigoSubprograma());
			insert.setInt (7, proyectoObj.getCodigoPrograma());
			insert.setInt (8, proyectoObj.getTipoPrograma());
			insert.setInt (9, proyectoObj.getEntidad());
			insert.setInt (10, proyectoObj.getNivel());
			insert.setInt (11, proyectoObj.getCodigoUnidadResponsable());
			insert.setInt (12, proyectoObj.getCodigoFuncional());
			insert.setString (13, proyectoObj.getDiagnostico());
			insert.setString (14, proyectoObj.getResultadoEsperado());
			insert.setInt (15, proyectoObj.getCodigoDepartamento() );
			insert.setString (16, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}

	public static void insertProyectoSnip(ProyectoSNIP proyectoSnip){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into proyecto_snip (id, nombre, estado )"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt    (1, proyectoSnip.getCodigoSnip());
			insert.setString (2, proyectoSnip.getNombreProyecto());
			insert.setInt    (3, proyectoSnip.getEstado());
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertProyectoSnipAutorizado(ProyectoSNIPAutorizado proyectoSnipAutorizado){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into proyecto_snip_autorizado (anho, monto, entidad_id, entidad_nivel_id, proyecto_snip_id, organismo_financiador_id, fuente_financiamiento_id )"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, proyectoSnipAutorizado.getAnio());
			insert.setDouble (2, proyectoSnipAutorizado.getMonto());
			insert.setDouble (3, proyectoSnipAutorizado.getEntidad());
			insert.setDouble (4, proyectoSnipAutorizado.getNivel());
			insert.setDouble (5, proyectoSnipAutorizado.getCodigoSnip());
			insert.setInt (6, proyectoSnipAutorizado.getCodOrganismoFinanciador());
			insert.setInt (7, proyectoSnipAutorizado.getCodFuenteFinanciamiento());
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}	
	
	public static void insertRole(Role role, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into role (id, nombre, usuario_responsable)"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, role.getId());
			insert.setString (2, role.getNombre());
			insert.setString (3, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertSubPrograma(SubPrograma subPrograma, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into subprograma (id, programa_id, programa_tipo_presupuesto_id, programa_entidad_id, programa_entidad_nivel_id, anho, nombre, abrev, descripcion, objetivo, codigo_departamento, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, subPrograma.getId());
			insert.setInt (2, subPrograma.getPrograma_id());
			insert.setInt (3, subPrograma.getPrograma_tipo_presupuesto_id());
			insert.setInt (4, subPrograma.getPrograma_entidad_id());
			insert.setInt (5, subPrograma.getPrograma_entidad_nivel_id());
			insert.setInt (6, subPrograma.getAnho());
			insert.setString (7, subPrograma.getNombre());
			insert.setString (8, subPrograma.getAbrev());
			insert.setString (9, subPrograma.getDescripcion());
			insert.setString (10, subPrograma.getObjetivo());
			insert.setInt (11, subPrograma.getCodigo_departamento());
			insert.setString (12, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertTipoCatalogoDestinatario(TipoCatalogoDestinatario tipoCatalogoDestinatario, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_catalogo_destinatario (id, nombre, descripcion, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoCatalogoDestinatario.getId());
			insert.setString (2, tipoCatalogoDestinatario.getNombre());
			insert.setString (3, tipoCatalogoDestinatario.getDescripcion());
			insert.setString (4, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertTipoDemografica(TipoDemografica tipoDemografica, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_demografica (id, nombre, descripcion, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoDemografica.getId());
			insert.setString (2, tipoDemografica.getNombre());
			insert.setString (3, tipoDemografica.getDescripcion());
			insert.setString (4, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertTipoIndicador(TipoIndicador tipoIndicador, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_indicador (id,nombre,descripcion, usuario_responsable)"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoIndicador.getId());
			insert.setString (2, tipoIndicador.getNombre());
			insert.setString (3, tipoIndicador.getDescripcion());
			insert.setString (4, usuarioResponsable);
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static boolean insertObjetivo(Objetivo objetivo, String usuarioResponsable)throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
			String query = " insert into objetivo (nombre, descripcion, tipo_objetivo_id, version, anho, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?)";
			PreparedStatement insert = conn.prepareStatement(query);
			//no se inserta el id de la tabla debido a que da un error en el DB ya que duplica con el id de tipo_objetivo_id
			insert.setString (1, objetivo.getNombre());
			insert.setString (2, objetivo.getDescripcion());
			insert.setInt (3, objetivo.getTipo_objetivo_id());
			insert.setInt (4, objetivo.getVersion());
			insert.setInt (5, objetivo.getAnho());
			insert.setString (6, usuarioResponsable);
			
			insert.execute();
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static void insertTipoObjetivo(TipoObjetivo tipoObjetivo, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_objetivo (id,nombre,descripcion, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoObjetivo.getId());
			insert.setString (2, tipoObjetivo.getNombre());
			insert.setString (3, tipoObjetivo.getDescripcion());
			insert.setString (4, usuarioResponsable);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	public static boolean insertObjetivoSugerido(ObjetivoSugerido objetivoSugerido, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
			String query = " insert into objetivo_sugerido (objetivo_id, objetivo_tipo_objetivo_id, objetivo_anho, objetivo_version, objetivo_sugerido_id, objetivo_sugerido_tipo_id, objetivo_sugerido_anho, objetivo_sugerido_version, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, objetivoSugerido.getObjetivoId());
			insert.setInt (2, objetivoSugerido.getTipoObjetivoId());
			insert.setInt (3, objetivoSugerido.getObjetivoAnho());
			insert.setInt (4, objetivoSugerido.getObjetivoVersion());
			insert.setInt (5, objetivoSugerido.getObjetivoSugeridoId());
			insert.setInt (6, objetivoSugerido.getObjetivoSugeridoTipoId());
			insert.setInt (7, objetivoSugerido.getObjetivoSugeridoAnho());
			insert.setInt (8, objetivoSugerido.getObjetivoSugeridoVersion());
			insert.setString (9, usuarioResponsable);
			
			insert.execute();
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static void insertTipoPresupuesto(TipoPresupuesto tipoPresupuesto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_presupuesto (id,nombre,abrev,descipcion,anho,numero_fila, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoPresupuesto.getId());
			insert.setString (2, tipoPresupuesto.getNombre());
			insert.setString (3, tipoPresupuesto.getAbrev());
			insert.setString (4, tipoPresupuesto.getDescripcion());
			insert.setInt (5, tipoPresupuesto.getAnho());
			insert.setInt (6, tipoPresupuesto.getNumero_fila());
			insert.setString (7, usuarioResponsable);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertTipoProgramatico(TipoProgramatico tipoProgramatico, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_programatico (id,nombre,descripcion, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoProgramatico.getId());
			insert.setString (2, tipoProgramatico.getNombre());
			insert.setString (3, tipoProgramatico.getDescripcion());
			insert.setString (4, usuarioResponsable);
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertTipoZonaGeografica(TipoZonaGeografica tipoZonaGeografica, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into tipo_zona_geografica (id,nombre,descipcion, usuario_responsable)"
			+ " values (?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, tipoZonaGeografica.getId());
			insert.setString (2, tipoZonaGeografica.getNombre());
			insert.setString (3, tipoZonaGeografica.getDescripcion());
			insert.setString (4, usuarioResponsable);			

			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertUnidadJerarquica(UnidadJerarquica unidadJerarquica){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into unidad_jerarquica (id,nombre,entidad_id,entidad_nivel_id,anho,numero_fila)"
			+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, unidadJerarquica.getUjeCodigo());
			insert.setString (2, unidadJerarquica.getUjeNombre());
			insert.setInt (3, unidadJerarquica.getEntidad());
			insert.setInt (4, unidadJerarquica.getNivel());
			insert.setInt (5, unidadJerarquica.getAnio());
			insert.setInt (6, unidadJerarquica.getNumeroFila());
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//No tiene simbolo y descripcion creo que rafa dijo que no es importante incluir esos campos
	public static void insertUnidadMedida(UnidadMedida unidadMedida){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into unidad_medida (id,nombre,abrev)"
			+ " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, unidadMedida.getCodigoUnidadMedida());
			insert.setString (2, unidadMedida.getNombre());
			insert.setString (3, unidadMedida.getAbreviacion());
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//No tiene descripcion y anho 
	public static void insertUnidadResponsable(UnidadResponsable unidadResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into unidad_responsable (id,nombre,abrev,numero_fila,entidad_id,entidad_nivel_id,unidad_jerarquica_id)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, unidadResponsable.getUnrCodigo());
			insert.setString (2, unidadResponsable.getUnrNombre());
			insert.setString (3, unidadResponsable.getUnrAbrev());
			insert.setInt (4, unidadResponsable.getNumeroFila());
			insert.setInt (5, unidadResponsable.getEntidad());
			insert.setInt (6, unidadResponsable.getNivel());
			insert.setInt (7, unidadResponsable.getUjeCodigo());
						
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static boolean insertUsuario(Usuario usuario, String usuarioResponsable)throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	

			String query = " insert into usuario (nivel_id,entidad_id,correo,passwd,unr_id,nombre,url,role_id,entidad, usuario_responsable, role_id_tablero, role_id_movil, email_real)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, usuario.getNivel_id());
			insert.setInt(2, usuario.getEntidad_id());
			insert.setString(3, usuario.getCorreo());
			insert.setString (4, usuario.getPasswd());
			insert.setInt(5, usuario.getUnidadResponsable());
			insert.setString(6, usuario.getNombre());
			insert.setString (7, usuario.getUrl());
			insert.setInt (8, usuario.getRol_id());
			insert.setString(9, usuario.getEntidad());
			insert.setString (10, usuarioResponsable);
			insert.setInt (11, usuario.getRolTablero());
			insert.setInt (12, usuario.getRolMovil());
			insert.setBoolean(13, usuario.isCorreoReal());
			
			insert.execute(); 
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}
		
	}

	
	
	public static void insertZonaGeografica(ZonaGeografica zonaGeografica, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into zona_geografica (id,nombre,descripcion,abrev,tipo_zona_geografica_id,cod_geo_unif, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, zonaGeografica.getId());
			insert.setString (2, zonaGeografica.getNombre());
			insert.setString (3, zonaGeografica.getDescripcion());
			insert.setString (4, zonaGeografica.getAbrev());
			insert.setInt (5, zonaGeografica.getTipo_zona_geografica_id());
			insert.setString (6, zonaGeografica.getCod_geo_unif());
			insert.setString (7, usuarioResponsable);

			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void insertEstructuraProgramatica(EstructuraProgramatica estructuraProgramatica){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into estructura_programatica (id, anho, nivel, entidad, tipo, programa, proyecto, nfprograma, nfsubprograma, nfproyecto, departamento, unidad_responsable, funcional)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, estructuraProgramatica.getId());
			insert.setInt (2, estructuraProgramatica.getAnho());
			insert.setInt (3, estructuraProgramatica.getNivel());
			insert.setInt (4, estructuraProgramatica.getEntidad());
			insert.setInt (5, estructuraProgramatica.getTipo());
			insert.setInt (6, estructuraProgramatica.getPrograma());
			insert.setInt (7, estructuraProgramatica.getProyecto());
			insert.setInt (8, estructuraProgramatica.getNfprograma());
			insert.setInt (9, estructuraProgramatica.getNfsubprograma());
			insert.setInt (10, estructuraProgramatica.getNfproyecto());
			insert.setInt (11, estructuraProgramatica.getDepartamento());
			insert.setInt (12, estructuraProgramatica.getUnidad_responsable());
			insert.setInt (13, estructuraProgramatica.getFuncional());
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static boolean insertResultado(Resultado resultado, String usuarioResponsable)throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
			String query = " insert into objetivo (nombre, descripcion, tipo_objetivo_id, nivel, entidad, tipo_presupuesto, programa, subprograma, proyecto, funcional, version, anho, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement insert = conn.prepareStatement(query);
			//no se inserta el id de la tabla debido a que da un error en el DB ya que duplica con el id de tipo_objetivo_id
			insert.setString (1, resultado.getNombre());
			insert.setString (2, resultado.getDescripcion());
			insert.setInt (3, resultado.getTipo_objetivo_id());
			insert.setInt (4, resultado.getNivel());
			insert.setInt (5, resultado.getEntidad());
			insert.setInt (6, resultado.getTipo_presupuesto());
			insert.setInt (7, resultado.getPrograma());
			insert.setInt (8, resultado.getSubprograma());
			insert.setInt (9, resultado.getProyecto());
			insert.setInt (10, resultado.getFuncional());
			insert.setInt (11, resultado.getVersion());
			insert.setInt (12, resultado.getAnho());
			insert.setString (13, usuarioResponsable);
			
			insert.execute();
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
//	public static void insertTipoObjetivo(TipoObjetivo TipoObjetivo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//			String query = " insert into tipo_objetivo (id, nombre, descripcion)"
//			+ " values (?, ?, ?)";
//			PreparedStatement insert = conn.prepareStatement(query);
//			//no se inserta el id de la tabla debido a que da un error en el DB ya que duplica con el id de tipo_objetivo_id
//
//			insert.setInt (3, TipoObjetivo.getId()());
//			insert.setString (1, TipoObjetivo.getNombre());
//			insert.setString (2, TipoObjetivo.getDescripcion());
//			
//			
//			insert.execute();
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
	public static void insertEstructura(Estructura estructura, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into estructura (id,nivel,entidad,tipo,programa,subprograma,proyecto,version,anho,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, estructura.getId());
			insert.setInt (2, estructura.getNivel());
			insert.setInt (3, estructura.getEntidad());
			insert.setInt (4, estructura.getTipo());
			insert.setInt (5, estructura.getPrograma());
			insert.setInt (6, estructura.getSubprograma());
			insert.setInt (7, estructura.getProyecto());
			insert.setInt (8, estructura.getVersion());
			insert.setInt (9, estructura.getAnho());
			insert.setString (10, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	public static void insertEstructuraFinanciera(EstructuraFinanciera estructuraFinanciera, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into estructura_financiera (id,estructura,mes,producto,ejecutado,programado,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, estructuraFinanciera.getId());
			insert.setInt (2, estructuraFinanciera.getEstructura());
			insert.setInt (3, estructuraFinanciera.getMes());
			insert.setInt (4, estructuraFinanciera.getProducto());
			insert.setDouble (5, estructuraFinanciera.getEjecutado());
			insert.setDouble (6, estructuraFinanciera.getPlanificado());
			insert.setString (7, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	/*public static void insertPresupuestoIngreso(PresupuestoIngreso presupuestoIngreso){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into presupuesto_ingreso (id, numero_fila, version, anho, nivel, entidad, origen, detalle, fuente_financiamiento, monto_presupuestado)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, presupuestoIngreso.getId());
			insert.setInt (2, presupuestoIngreso.getNumeroFila());
			insert.setInt (3, presupuestoIngreso.getVersion());
			insert.setInt (4, presupuestoIngreso.getAnho());
			insert.setInt (5, presupuestoIngreso.getNivel());
			insert.setInt (6, presupuestoIngreso.getEntidad());
			insert.setInt (7, presupuestoIngreso.getOrigen());
			insert.setInt (8, presupuestoIngreso.getDetalle());
			insert.setInt (9, presupuestoIngreso.getFuente_financiamiento());
			insert.setDouble (10, presupuestoIngreso.getMonto_presupuestado());



								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}*/
	public static void insertPresupuestoGasto(py.gov.stp.mh.tools.PresupuestoGasto presupuestoGasto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into presupuesto_gasto (id, estructura_id, fuente_financiamiento, organismo_dfinanciador, pais, depto, ver_programado, ver_justificado,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, presupuestoGasto.getId());
			insert.setInt (2, presupuestoGasto.getEstructura());
			insert.setInt (3, presupuestoGasto.getFuente_financiamiento());
			insert.setInt (4, presupuestoGasto.getOrganismo_financiador());
			insert.setInt (5, presupuestoGasto.getPais());
			insert.setInt (6, presupuestoGasto.getDepto());
			insert.setDouble (7, presupuestoGasto.getVer_programado());
			insert.setString (8, presupuestoGasto.getVer_justificado());
			insert.setString (9, usuarioResponsable);
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	public static void insertFundamentacion(Fundamentacion fundamentacion, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into fundamentacion (id, estructura_id, objeto_gasto, fuente_financiamiento, org_financiador, pais, depto, secuencia, precio, cantidad, cantidad_meses, descripcion, clgCodigo, usuarioResponsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, fundamentacion.getId());
			insert.setInt (2, fundamentacion.getEstructura());
			insert.setInt (3, fundamentacion.getObjetoGasto());
			insert.setInt (4, fundamentacion.getFuenteFinanciamiento());
			insert.setInt (5, fundamentacion.getOrganismoFinanciador());
			insert.setInt (6, fundamentacion.getPais());
			insert.setInt (7, fundamentacion.getDepto());
			insert.setInt (8, fundamentacion.getSecuencia());
			insert.setDouble (9, fundamentacion.getPrecio());
			insert.setInt (10, fundamentacion.getCantidad());
			insert.setInt (11, fundamentacion.getCantidad_meses());
			insert.setString (12, fundamentacion.getDescripcion());
			insert.setInt (13, fundamentacion.getClgCodigo());
			insert.setString (14, usuarioResponsable);	
								
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
			
	}
	
	public static void insertInstitucion(Institucion institucion, String usuarioResponsable) {
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = "insert into Institucion(id serial, nombre, descripcion, sigla, orden, nivel_id, entidad_id, unidad_jerarquica_id, unidad_responsable_id, version, borrado, abrev, base_legal, mision, vision, diagnostico, ruc, anho,fecha_creacion, politica, objetivo, nro_fila, usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, institucion.getId());
			insert.setString (2, institucion.getNombre());
			insert.setString (3, institucion.getDescripcion());
			insert.setString (4, institucion.getSigla());
			insert.setInt (5, institucion.getOrden());
			insert.setInt (6, institucion.getNivelId());
			insert.setInt (7, institucion.getEntidadId());
			insert.setInt (8, institucion.getUnidadJerarquicaId());
			insert.setInt (9, institucion.getUnidadResponsableId());
			insert.setInt (10, institucion.getVersion());
			insert.setBoolean (11, institucion.isBorrado());
			insert.setString (12, institucion.getAbrev());
			insert.setString (13, institucion.getBaseLegal());
			insert.setString (14, institucion.getMision());
			insert.setString (15, institucion.getVision());
			insert.setString (16, institucion.getDiagnostico());
			insert.setString (17, institucion.getRuc());
			insert.setInt (18, institucion.getAnho());
			insert.setDate (19, (java.sql.Date) institucion.getFechaCreacion());
			insert.setString (20, institucion.getPolitica());
			insert.setString (21, institucion.getObjetivo());
			insert.setInt (22, institucion.getNroFila());
			insert.setString (23, usuarioResponsable);
			
			insert.execute();
			   
			conn.close();
		} catch (SQLException e) {e.printStackTrace();}
		
	}	
	public static boolean insertObjetivoHasObjetivo(ObjetivoHasObjetivo objeto, String usuarioResponsable)throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into objetivo_has_objetivo (objetivo_id,objetivo_tipo_objetivo_id,objetivo_anho,objetivo_version,objetivo_rel_id,objetivo_rel_tipo_objetivo_id,objetivo_rel_anho,objetivo_rel_version,colaboracion,influencia,nivel,entidad,tipo_presupuesto,programa,subprograma,proyecto,producto,unidad_responsable,producto_concat,usuario_responsable)"
			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getObjetivoId());
			insert.setInt (2, objeto.getTipoObjetivoId());
			insert.setInt (3, objeto.getObjetivoAnho());
			insert.setInt (4, objeto.getObjetivoVersion());
			insert.setInt (5, objeto.getObjetivoRelId());
			insert.setInt (6, objeto.getRelTipoObjetivoId());
			insert.setInt (7, objeto.getRelAnho());
			insert.setInt (8, objeto.getRelVersion());
			insert.setDouble (9, objeto.getColaboracion());
			insert.setDouble (10, objeto.getInfluencia());
			insert.setInt (11, objeto.getNivel());
			insert.setInt (12, objeto.getEntidad());
			insert.setInt (13, objeto.getTipoPresupuesto());
			insert.setInt (14, objeto.getPrograma());
			insert.setInt (15, objeto.getSubprograma());
			insert.setInt (16, objeto.getProyecto());
			insert.setInt (17, objeto.getProducto());
			insert.setInt (18, objeto.getUnidadResponable());
			insert.setString (19, objeto.getProductoConcat());			
			insert.setString (20, usuarioResponsable);

			insert.execute(); 
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}
		
	}
	
	public static boolean insertObjetivoHasIndicador(ObjetivoHasIndicador objeto, String usuarioResponsable)throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
		 
			String query = " insert into objetivo_has_indicador (objetivo_id, objetivo_tipo_objetivo_id, objetivo_anho, objetivo_version, indicador_id, indicador_tipo_indicador_id, indicador_unidad_medida_id, indicador_desagregacion_tipo_zona_geografica_id, indicador_tipo_demografica_id, indicador_fuente_verificacion_id, indicador_objetivo_id, producto_concat, usuario_responsable)"

			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getObjetivoId());
			insert.setInt (2, objeto.getObjetivoTipoObjetivoId());
			insert.setInt (3, objeto.getObjetivoAnho());
			insert.setInt (4, objeto.getObjetivoVersion());
			insert.setInt (5, objeto.getIndicadorId());
			insert.setInt (6, objeto.getIndicadorTipoIndicadorId());
			//insert.setString (7, objeto.getIndicadorMetodoCalculoId());
			insert.setInt (7, objeto.getIndicadorUnidadMedidaId());
			insert.setInt (8, objeto.getIndicadorDesagregacionTipoZonaGeograficaId());
			insert.setInt (9, objeto.getIndicadorTipoDemograficaId());
			insert.setString (10, objeto.getIndicadorFuenteVerificacionId());
			insert.setInt (11, objeto.getIndicadorObjetivoId());
			insert.setString (12, objeto.getProductoConcat());
			insert.setString (13, usuarioResponsable);

			insert.execute(); 
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}
		
	}
	
	public static boolean insertEtiqueta(Etiqueta objeto) throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
		 
			String query = " insert into etiquetas (id, nombre)"

			+ " values (?, ? )";
			
			PreparedStatement insert = conn.prepareStatement(query);
			insert.setInt (1, objeto.getId());
			insert.setString (2, objeto.getNombre());						

			insert.execute(); 
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}

	}
	
	public static boolean insertPresupuestoEtiqueta(PresupuestoEtiqueta objeto) throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();
		 
			String query = " insert into producto_presupusto_has_etiquetas (producto_concat,etiquetas_id,producto_id,proyecto_id,subprograma_id,programa_id,tipo_presupuesto_id,entidad_id,nivel_id,version,anho)"
			+ " values (?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			//insert.setInt (1, objeto.getId());
			insert.setString (1, objeto.getProductoConcat());
			insert.setInt (2, objeto.getEtiquetaId());
			insert.setInt (3, objeto.getProductoId());
			insert.setInt (4, objeto.getProyectoId());
			insert.setInt (5, objeto.getSubProgramaId());
			insert.setInt (6, objeto.getProgramaId());
			insert.setInt (7, objeto.getTipoPresupuestoId());
			insert.setInt (8, objeto.getEntidadId());
			insert.setInt (9, objeto.getNivelId());
			insert.setInt (10, objeto.getVersion());
			insert.setInt (11, objeto.getAnho());

			insert.execute(); 
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace();return false;}

	}
	public static boolean insertDocumento(Documentos objeto) throws ParseException{
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into documentos (nombre,url,fecha_valides,tipos_id,descripcion,usuario_responsable)"
	+ " values (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		String startDate = objeto.getFecha();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = sdf1.parse(startDate);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
				
		insert.setString (1, objeto.getNombre());
		insert.setString (2, objeto.getUrl());
		insert.setDate (3, sqlStartDate);
		insert.setInt(4, objeto.getTipoId());
		insert.setString(5, objeto.getDescripcion());
		insert.setString (6, objeto.getUsuarioResponsable());
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}
		
}
	public static boolean insertTipoDocumento(TipoDocumento objeto, String usuarioResponsable ) throws ParseException{
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into tipo_documentos (nombre,usuario_responsable)"
	+ " values (?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
				
		insert.setString (1, objeto.getNombre());
		insert.setString (2, usuarioResponsable);
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}	
		
}
	public static String insertJustificacion(Justificacion objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " INSERT INTO justificacion("+
						   "         nivel, entidad, tipoprograma, programa, subprograma, "+
						   "         proyecto, producto, descripcion"+
						   "         , usuario_responsable, version)"+
						   " VALUES (?, ?, ?, ?, ?, ?, ?, "+
						   "         ?, ?, 50);";
			
			 PreparedStatement insert = conn.prepareStatement(query);
			 insert.setInt    (1,  objeto.getNivel());
			 insert.setInt    (2,  objeto.getEntidad());
			 insert.setInt    (3,  objeto.getTipoPresupuesto());
			 insert.setInt    (4,  objeto.getPrograma());
			 insert.setInt    (5,  objeto.getSubprograma());
			 insert.setInt    (6,  objeto.getProyecto());
			 insert.setInt    (7,  objeto.getProducto());
			 insert.setString (8, objeto.getDescripcion());		
			 insert.setString (9, usuarioResponsable);
			
			insert.execute();
			
			conn.close();
			return "Exito";
		} catch (SQLException e) {
			e.printStackTrace();
			if(e.getSQLState().equals(POSTGRESQL_DUPLICATE_PK)){// Clave duplicada
				return "Error. Este registro ya existe en la base de datos.";
			} else {
				return "Error";
			}
			
		}
	}
	
	public static String insertarDictamenSTP(DictamenSTP objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into dictamen_stp "
					+ " ( eleccion, observacion, url_documento, nivel, entidad, tipoprograma, programa, "
					+ "   subprograma, proyecto, producto, usuario_responsable, anho, version, justificacion_id ) "
					+ "   values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, objeto.getEleccion());
			insert.setString (2, objeto.getObservacion());
			insert.setString (3, objeto.getUrlDocumento());
			insert.setInt (4, objeto.getNivel());
			insert.setInt (5, objeto.getEntidad());
			insert.setInt (6, objeto.getTipoPresupuesto());
			insert.setInt (7, objeto.getPrograma());
			insert.setInt (8, objeto.getSubprograma());
			insert.setInt (9, objeto.getProyecto());
			insert.setInt (10, objeto.getProducto());
			insert.setString (11, usuarioResponsable);			
			insert.setInt (12, objeto.getAnho());
			insert.setInt (13, objeto.getVersion());
			insert.setInt(14, objeto.getJustificacionId());

			insert.execute();
			   
			conn.close();
			return "Exito";
		} catch (SQLException e) {
			e.printStackTrace();
			if(e.getSQLState().equals(POSTGRESQL_DUPLICATE_PK)){// Clave duplicada
				return "Error. Este registro ya existe en la base de datos.";
			} else {
				return "Error";
			}
		}
	}
	
	public static String insertarAsignacionPresi(AsignacionPresi objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = "insert into asignacion_presi(fila, nivel, entidad, tipo, programa, subprograma, proyecto, objeto_gasto, fuente_financiamiento, organismo_financiador, pais, departamento, producto, observacion, "+
					" planificado1, ejecutado1, planificado2, ejecutado2, planificado3, ejecutado3, planificado4, ejecutado4, planificado5, ejecutado5, planificado6, ejecutado6, planificado7, ejecutado7, "+
					" planificado8, ejecutado8, planificado9, ejecutado9, planificado10, ejecutado10, planificado11, ejecutado11, planificado12, ejecutado12, anho, version) "+
					" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, objeto.getFila());
			insert.setInt (2, objeto.getNivel());
			insert.setInt (3, objeto.getEntidad());
			insert.setInt (4, objeto.getTipo());
			insert.setInt (5, objeto.getPrograma());
			insert.setInt (6, objeto.getSubPrograma());
			insert.setInt (7, objeto.getProyecto());
			insert.setInt (8, objeto.getObjetoGasto());
			insert.setInt (9, objeto.getFuenteFinanciamiento());
			insert.setInt (10, objeto.getOrganismoFinanciador());
			insert.setInt (11, objeto.getPais());
			insert.setInt (12, objeto.getDepartamento());
			insert.setInt (13, objeto.getProducto());
			insert.setString (14, objeto.getObservacion());
			insert.setDouble(15, objeto.getPlanificado1());
			insert.setDouble(16, objeto.getEjecutado1());
			insert.setDouble(17, objeto.getPlanificado2());
			insert.setDouble(18, objeto.getEjecutado2());
			insert.setDouble(19, objeto.getPlanificado3());
			insert.setDouble(20, objeto.getEjecutado3());
			insert.setDouble(21, objeto.getPlanificado4());
			insert.setDouble(22, objeto.getEjecutado4());
			insert.setDouble(23, objeto.getPlanificado5());
			insert.setDouble(24, objeto.getEjecutado5());
			insert.setDouble(25, objeto.getPlanificado6());
			insert.setDouble(26, objeto.getEjecutado6());
			insert.setDouble(27, objeto.getPlanificado7());
			insert.setDouble(28, objeto.getEjecutado7());
			insert.setDouble(29, objeto.getPlanificado8());
			insert.setDouble(30, objeto.getEjecutado8());
			insert.setDouble(31, objeto.getPlanificado9());
			insert.setDouble(32, objeto.getEjecutado9());
			insert.setDouble(33, objeto.getPlanificado10());
			insert.setDouble(34, objeto.getEjecutado10());
			insert.setDouble(35, objeto.getPlanificado11());
			insert.setDouble(36, objeto.getEjecutado11());
			insert.setDouble(37, objeto.getPlanificado12());
			insert.setDouble(38, objeto.getEjecutado12());
			insert.setInt (39, objeto.getAnho());
			insert.setInt (40, objeto.getVersion());			

			insert.execute();
			   
			conn.close();
			return "Exito";
		} catch (SQLException e) {
			e.printStackTrace();
			if(e.getSQLState().equals(POSTGRESQL_DUPLICATE_PK)){// Clave duplicada
				return "Error. Este registro ya existe en la base de datos.";
			} else {
				return "Error";
			}
		}
	}
	
//	public static void insertPresupGastos(PresupGastos presupGastos){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into presupuesto_gasto (numeroFila, codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma, codigoProyecto, codigoObjetoGasto, codigoFuenteFinan, codigoOrgFinanciador, codigoDpto, codigoPais, aprobado, modificaciones, vigente, planFinanciero, obligado, pagado, saldo)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//					
//			insert.setInt (1, presupGastos.getNumeroFila());
//			insert.setInt (2, presupGastos.getCodigoNivel());
//			insert.setInt (3, presupGastos.getCodigoEntidad());
//			insert.setInt (4, presupGastos.getTipoPrograma());
//			insert.setInt (5, presupGastos.getCodigoPrograma());
//			insert.setInt (6, presupGastos.getCodigoSubprograma());
//			insert.setInt (7, presupGastos.getCodigoProyecto());
//			insert.setInt (8, presupGastos.getCodigoObjetoGasto());
//			insert.setInt (9, presupGastos.getCodigoFuenteFinan());
//			insert.setInt (10, presupGastos.getCodigoOrgFinanciador());
//			insert.setInt (11, presupGastos.getCodigoDpto());
//			insert.setInt (12, presupGastos.getCodigoPais());
//			insert.setDouble (13, presupGastos.getAprobado());
//			insert.setDouble (14, presupGastos.getModificaciones());
//			insert.setDouble (15, presupGastos.getVigente());
//			insert.setDouble (16, presupGastos.getPlanFinanciero());
//			insert.setDouble (17, presupGastos.getObligado());
//			insert.setDouble (18, presupGastos.getPagado());
//			insert.setDouble (19, presupGastos.getSaldo());
//			
//
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	public static void insertProductoFinanciero(ProductoFinanciero productoFinanciero){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into producto_financiero (nro_fila, codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma, codigoSubprograma, codigoProyecto, codigoProducto, descripcionProducto, codigoObjetoGasto, codigoFuenteFinan, codigoOrgFinanciador, codigoDpto, planificado1, ejecutado1, planifiado2, ejecutado2, planificado3, ejecutado3, planificado4, ejecutado4, planificado5, ejecutado5, planificado6, ejecutado6, planificado7, ejecutado7, planificado8, ejecutado8, planificado9, ejecutado9, planificado10, ejecutado10, planificado11, ejecutado11, planificado12, ejecutado12)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, productoFinanciero.getNumeroFila());
//			insert.setInt (2, productoFinanciero.getCodigoNivel());
//			insert.setInt (3, productoFinanciero.getCodigoEntidad());
//			insert.setInt (4, productoFinanciero.getTipoPrograma());
//			insert.setInt (5, productoFinanciero.getCodigoPrograma());
//			insert.setInt (6, productoFinanciero.getCodigoSubprograma());
//			insert.setInt (7, productoFinanciero.getCodigoProyecto());
//			insert.setInt (8, productoFinanciero.getCodigoProducto());
//			insert.setString (9, productoFinanciero.getDescripcionProducto());
//			insert.setInt (10, productoFinanciero.getCodigoObjetoGasto());
//			insert.setInt (11, productoFinanciero.getCodigoFuenteFinan());
//			insert.setInt (12, productoFinanciero.getCodigoOrgFinanciador());
//			insert.setInt (13, productoFinanciero.getCodigoDpto());
//			insert.setDouble (14, productoFinanciero.getPlanificado1());
//			insert.setDouble (15, productoFinanciero.getEjecutado1());
//			insert.setDouble (16, productoFinanciero.getPlanificado2());
//			insert.setDouble (17, productoFinanciero.getEjecutado2());
//			insert.setDouble (18, productoFinanciero.getPlanificado3());
//			insert.setDouble (19, productoFinanciero.getEjecutado3());
//			insert.setDouble (20, productoFinanciero.getPlanificado4());
//			insert.setDouble (21, productoFinanciero.getEjecutado4());
//			insert.setDouble (22, productoFinanciero.getPlanificado5());
//			insert.setDouble (23, productoFinanciero.getEjecutado5());
//			insert.setDouble (24, productoFinanciero.getPlanificado6());
//			insert.setDouble (25, productoFinanciero.getEjecutado6());
//			insert.setDouble (26, productoFinanciero.getPlanificado7());
//			insert.setDouble (27, productoFinanciero.getEjecutado7());
//			insert.setDouble (28, productoFinanciero.getPlanificado8());
//			insert.setDouble (29, productoFinanciero.getEjecutado8());
//			insert.setDouble (30, productoFinanciero.getPlanificado9());
//			insert.setDouble (31, productoFinanciero.getEjecutado9());
//			insert.setDouble (32, productoFinanciero.getPlanificado10());
//			insert.setDouble (33, productoFinanciero.getEjecutado10());
//			insert.setDouble (34, productoFinanciero.getPlanificado11());
//			insert.setDouble (35, productoFinanciero.getEjecutado11());
//			insert.setDouble (36, productoFinanciero.getPlanificado12());
//			insert.setDouble (37, productoFinanciero.getEjecutado12());
//			
//
//
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	public static void insertProductoFisico(ProductoFisico productoFisico){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into producto_fisico (id, codigoNivel, codigoEntidad, tipoPrograma, codigoSubprograma, codigoProyecto, codigoProducto, descripcionProducto, unidadMedida, clase, meta1, avance1, meta2, avance2, meta3, avance3, meta4, avance4, meta5, avance5, meta6, avance6, meta7, avance7, meta8, avance8, meta9, avance9, meta10, avance10, meta11, avance11, meta12, avance12)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, productoFisico.getNumeroFila());
//			insert.setInt (2, productoFisico.getCodigoNivel());
//			insert.setInt (3, productoFisico.getCodigoEntidad());
//			insert.setInt (4, productoFisico.getTipoPrograma());
//			insert.setInt (5, productoFisico.getCodigoPrograma());
//			insert.setInt (6, productoFisico.getCodigoSubprograma());
//			insert.setInt (7, productoFisico.getCodigoProyecto());
//			insert.setInt (8, productoFisico.getCodigoProducto());
//			insert.setString (9, productoFisico.getDescripcionProducto());
//			insert.setString (10, productoFisico.getUnidadMedida());
//			insert.setString (11, productoFisico.getClase());
//			insert.setDouble (12, productoFisico.getMeta1());
//			insert.setDouble (13, productoFisico.getAvance1());
//			insert.setDouble (14, productoFisico.getMeta2());
//			insert.setDouble (15, productoFisico.getAvance2());
//			insert.setDouble (16, productoFisico.getMeta3());
//			insert.setDouble (17, productoFisico.getAvance3());
//			insert.setDouble (18, productoFisico.getMeta4());
//			insert.setDouble (19, productoFisico.getAvance4());
//			insert.setDouble (20, productoFisico.getMeta5());
//			insert.setDouble (21, productoFisico.getAvance5());
//			insert.setDouble (22, productoFisico.getMeta6());
//			insert.setDouble (23, productoFisico.getAvance6());
//			insert.setDouble (24, productoFisico.getMeta7());
//			insert.setDouble (25, productoFisico.getAvance7());
//			insert.setDouble (26, productoFisico.getMeta8());
//			insert.setDouble (27, productoFisico.getAvance8());
//			insert.setDouble (28, productoFisico.getMeta9());
//			insert.setDouble (29, productoFisico.getAvance9());
//			insert.setDouble (30, productoFisico.getMeta10());
//			insert.setDouble (31, productoFisico.getAvance10());
//			insert.setDouble (32, productoFisico.getMeta11());
//			insert.setDouble (33, productoFisico.getAvance11());
//			insert.setDouble (34, productoFisico.getMeta12());
//			insert.setDouble (35, productoFisico.getAvance12());
//
//
//
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}		
	
}
