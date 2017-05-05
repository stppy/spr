package py.gov.stp.mh.tools;

import py.gov.stp.mh.*;
import py.gov.stp.mh.clasificadores.*;
import py.gov.stp.mh.consultas.PresupGastos;
import py.gov.stp.mh.consultas.ProductoFinanciero;
import py.gov.stp.mh.consultas.ProductoFisico;

import java.io.File;
import java.sql.Connection;

import py.gov.stp.mh.proyectopresupuesto.*;
import py.gov.stp.mh.test.Client;
import py.gov.stp.mh.test.ClientConsulta;
import py.gov.stp.mh.test.ClienteProyectoPresupuesto;
import py.gov.stp.mh.tools.ConnectionConfiguration;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/

public class SqlSelects {	
	//SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	/*public static Connection ConnectionConfiguration.conectar(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("com.mysql.jdbc.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        String url = "";
	        String user = "root";
	        String password = "postgres";

	        try {con = DriverManager.getConnection("jdbc:mysql://mysql01.stp.gov.py/spr", "root", "postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}*/
    public static void main() {
    	
       
    }
    public static List<ProyectoSNIP> selectProyectoSnip(String condition) throws SQLException{
     	 Connection conect=ConnectionConfiguration.conectar();
  		 String query = " select * from proyecto_snip "+condition;
  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 List<ProyectoSNIP> objetos = new ArrayList<ProyectoSNIP>();

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				ProyectoSNIP objeto = new ProyectoSNIP();

  				objeto.setCodigoSnip(rs.getShort("id"));
  				objeto.setNombreProyecto(rs.getString("nombre"));
  				objeto.setEstado(rs.getShort("estado"));

  				objetos.add(objeto);
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    }
    public static List<Mes> selectAllMeses(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
 		 String query = " select * from mes "+condition;
 		 
 		 Statement statement = null;
 		 ResultSet rs=null;
 		 List<Mes> objetos = new ArrayList<Mes>();

 		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				Mes objeto = new Mes();

 				objeto.setId(rs.getShort("id"));
 				objeto.setNombre(rs.getString("nombre"));
 				objeto.setAbrev(rs.getString("abrev"));

 				objetos.add(objeto);
 			}
 		}
 		catch (SQLException e) {e.printStackTrace();}
 		finally{
 			if (statement != null) {statement.close();}
 			if (conect != null) {conect.close();}
 		}
 		return objetos;
   }
    public static List<ProyectoSNIPAutorizado> selectProyectoSnipAutorizado(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
 		 String query = " select * from proyecto_snip_autorizado "+condition;
 		 
 		 Statement statement = null;
 		 ResultSet rs=null;
 		 List<ProyectoSNIPAutorizado> objetos = new ArrayList<ProyectoSNIPAutorizado>();

 		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				ProyectoSNIPAutorizado objeto = new ProyectoSNIPAutorizado();

 				objeto.setNumeroFila(rs.getShort("id"));
 				objeto.setAnio(rs.getShort("anho"));
 				objeto.setCodFuenteFinanciamiento(rs.getShort("fuente_financiamiento_id"));
 				objeto.setCodOrganismoFinanciador(rs.getShort("organismo_financiador_id"));
 				objeto.setCodigoSnip(rs.getShort("proyecto_snip_id"));
 				objeto.setEntidad(rs.getShort("entidad_id"));
 				objeto.setNivel(rs.getShort("entidad_nivel_id"));
 				objeto.setMonto(rs.getDouble("monto"));

 				objetos.add(objeto);
 			}
 		}
 		catch (SQLException e) {e.printStackTrace();}
 		finally{
 			if (statement != null) {statement.close();}
 			if (conect != null) {conect.close();}
 		}
 		return objetos;
   }
    public static List<Usuario> selectUsuario(String condition) throws SQLException{
      	 Connection conect=ConnectionConfiguration.conectar();
   		 String query = " select * from usuario "+condition;
   		 
   		 Statement statement = null;
   		 ResultSet rs=null;
   		 List<Usuario> objetos = new ArrayList<Usuario>();

   		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			while(rs.next()){
   				Usuario objeto = new Usuario();

   				objeto.setId(rs.getInt("id"));
   				objeto.setCorreo(rs.getString("correo"));
   				objeto.setPasswd(rs.getString("passwd"));
   				objeto.setNombre(rs.getString("nombre"));
   				objeto.setEntidad_id(rs.getInt("entidad_id"));
   				objeto.setNivel_id(rs.getInt("nivel_id"));
   				objeto.setRol_id(rs.getInt("role_id"));
   				objeto.setEntidad(rs.getString("entidad"));
   				objeto.setUrl(getFileName(rs.getString("url")));
   				objeto.setUnidadResponsable(rs.getInt("unr_id"));
   				objeto.setBorrado(rs.getBoolean("borrado"));
   				objeto.setRolTablero(rs.getInt("role_id_tablero"));
   				objeto.setRolMovil(rs.getInt("role_id_movil"));
   				objeto.setCorreoReal(rs.getBoolean("email_real"));
   				 				
   				objetos.add(objeto);
   			}
   		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
     }
	public static String getFileName (String fullPath){
		String fileName = null;
		if (fullPath != null){
			int index = fullPath.lastIndexOf(File.separator);
			fileName = fullPath.substring(index + 1);
		}
		return fileName;
	}
    
    public static List<ObjetivoEstrategia> selectObjetivosPorEstrategiaPnd(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();

		 String query = " select DISTINCT(objetivo.nombre), objetivo.id as objetivo_id, estrategia.id as estrategia_id from estrategia_has_objetivo "+
				 	"inner join estrategia on estrategia_id=estrategia.id "+
				 	"inner join objetivo on objetivo_id=objetivo.id "+
				 	"where  objetivo.tipo_objetivo_id =1 "+condition;
		 
		 Statement statement = null;
		 ResultSet rs=null;
		 List<ObjetivoEstrategia> objetos = new ArrayList<ObjetivoEstrategia>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

				objeto.setEstrategia_id(rs.getInt("estrategia_id"));
				objeto.setObjetivo_id(rs.getInt("objetivo_id"));
				objeto.setObjetivoNombre(rs.getString("nombre"));
				
				
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
  }
    public static String selectEntidadesPorEstrategia(String condition) throws SQLException{
      	 Connection conect=ConnectionConfiguration.conectar();
      	 
   		 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
   				"	select t_resultados.*, t_entidades.entidades, t_productos.productos, t_destinatarios.destinatarios, t_presupuesto.presupuesto from"+
   				"		(select estrategia_id, count(*) as objetivos from "+
   				"		  	  (SELECT estrategia_id,  objetivo_estrategico_id "+
   				"		  		FROM \"pnd_resul_ent_prod_dest\" "+
   								condition+
   				"		  		group by estrategia_id,  objetivo_estrategico_id "+
   				"		  	   ) tmp "+
   				"		  	   group by estrategia_id "+
   				"		  	   order by estrategia_id"+
   				"		)t_resultados"+
   				"	inner join "+
   				"		(select estrategia_id, count(*) as entidades from "+
   				"		  	  (SELECT estrategia_id, nivel_id, entidad_id, entidad_sigla "+
   				"		  	   FROM \"pnd_resul_ent_prod_dest\" "+
   								condition+
   				"		  	   group by estrategia_id, nivel_id, entidad_id, entidad_sigla "+
   				"		  	  ) tmp "+
   				"		  	group by estrategia_id "+
   				"		  	order by estrategia_id  "+
   				"		) t_entidades"+
   				"	on t_entidades.estrategia_id= t_resultados.estrategia_id"+
   				"	inner join"+
   				"		(select estrategia_id, count(*) as productos from "+
   				"		  	  (SELECT distinct prod_id, producto_nombre, estrategia_id  "+
   				"		  	   FROM \"pnd_resul_ent_prod_dest\" "+
   								condition+
   				"		  	   group by estrategia_id, prod_id, producto_nombre  "+
   				"		  	  ) tmp "+
   				"		  	group by estrategia_id "+
   				"		  	order by estrategia_id  "+
   				"		)t_productos"+
   				"	on t_productos.estrategia_id= t_resultados.estrategia_id"+
   				"	inner join "+
   				"		(select estrategia_id, trunc(sum(cant_dest)) as destinatarios from "+
   				"		  	  (SELECT estrategia_id, CASE WHEN sum (cant_destinatarios)>0 ::double precision THEN sum(cant_destinatarios) ELSE 0::double precision END as cant_dest "+
   				"		  	   FROM \"pnd_resul_ent_prod_dest\" "+
   								condition+
   				"		  	   group by estrategia_id"+
   				"		  	  ) tmp "+
   				"		  	group by estrategia_id "+
   				"		  	order by estrategia_id"+
   				"		)t_destinatarios"+
   				"	on t_destinatarios.estrategia_id= t_resultados.estrategia_id"+
   				"	inner join "+
   				"		(select estrategia_id, sum(presupuesto) as presupuesto from  "+
   				"		  	  (SELECT estrategia_id,prod_concat, sum(presupuesto*colaboracion_resultado*colaboracion_producto) as presupuesto "+
   				"		  	   FROM \"pnd_resul_ent_prod_presupuesto\" "+
   								condition+
   				"		  	   group by estrategia_id,prod_concat"+
   				"		  	  ) tmp "+
   				"		  	group by estrategia_id "+
   				"		  	order by estrategia_id"+
   				"		)t_presupuesto"+
   				"	on t_presupuesto.estrategia_id= t_resultados.estrategia_id"+
   				
   				")t";

   		 
   		 Statement statement = null;
   		 ResultSet rs=null;
   		 String objetos = "";

   		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			while(rs.next()){
   				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

   				objetos+=rs.getString("resultado");
   			}
   		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
     }
    
    public static String selectTotalEjes(String condition) throws SQLException{
    	Connection conect=ConnectionConfiguration.conectar();
     	 

  		 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
  				"select pnd_resul_ent_prod_dest.eje_estrategico_id, pnd_resul_ent_prod_dest.eje_estrategico_nombre, productos.productos, objetivos.objetivos, destinatarios.destinatarios, entidades.entidades, presupuesto.presupuesto "+
  				"from pnd_resul_ent_prod_dest "+
  				"inner join( "+
  				"  select eje_estrategico_id, CASE WHEN sum (cant_destinatarios)>0 ::double precision THEN sum(cant_destinatarios) ELSE 0::double precision END as destinatarios from pnd_resul_ent_prod_dest "+condition+
  				"  group by eje_estrategico_id) destinatarios on "+
  				"        destinatarios.eje_estrategico_id = pnd_resul_ent_prod_dest.eje_estrategico_id "+
  				""+
  				"inner join "+
  				"(select eje_estrategico_id, count(*) as entidades from ( "+
  				"   select eje_estrategico_id,ne_concat  from pnd_resul_ent_prod_dest "+condition+ 
  				"   group by  eje_estrategico_id,ne_concat "+ 
  				"   ) ent "+
  				"group by eje_estrategico_id) entidades on "+ 
  				"        entidades.eje_estrategico_id= pnd_resul_ent_prod_dest.eje_estrategico_id "+
  				"inner join "+
  				"(select eje_estrategico_id, count(*) as objetivos from ( "+
  				"   select eje_estrategico_id,objetivo_estrategico_nombre  from pnd_resul_ent_prod_dest "+condition+ 
  				"   group by  eje_estrategico_id,objetivo_estrategico_nombre "+
  				"   ) objet "+
  				"group by eje_estrategico_id) objetivos on "+ 
  				"        objetivos.eje_estrategico_id= pnd_resul_ent_prod_dest.eje_estrategico_id "+
  				"inner join "+
  				"(select eje_estrategico_id, count(*) as productos from ( "+
  				"   select distinct prod_id, eje_estrategico_id  from pnd_resul_ent_prod_dest "+condition+ 
  				"   group by  eje_estrategico_id,prod_id "+
  				"   ) prod "+
  				"group by eje_estrategico_id) productos on "+ 
  				"       productos.eje_estrategico_id=pnd_resul_ent_prod_dest.eje_estrategico_id "+
  				"inner join "+

  				"   (select eje_estrategico_id,sum(colaboracion_resultado*colaboracion_producto*presupuesto) as presupuesto"+
  				"     from pnd_resul_ent_prod_presupuesto "+condition+ 
  				"     group by  eje_estrategico_id "+
  					") presupuesto on "+ 
  				"       presupuesto.eje_estrategico_id=pnd_resul_ent_prod_dest.eje_estrategico_id "+
  				""+
  				"group by pnd_resul_ent_prod_dest.eje_estrategico_id, pnd_resul_ent_prod_dest.eje_estrategico_nombre, productos.productos, objetivos.objetivos, presupuesto.presupuesto"
  				+ ", destinatarios.destinatarios, entidades.entidades "+
  				")t";

  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				//ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    	
    }
    public static String selectContadoresPNDporObjetivos(String condition) throws SQLException{
    	Connection conect=ConnectionConfiguration.conectar();
     	 

  		 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
  				"select pnd_resul_ent_prod_dest.objetivo_estrategico_id, pnd_resul_ent_prod_dest.objetivo_estrategico_nombre, entidades.entidades, productos.productos, resultados.resultados, destinatarios.destinatarios, presupuesto.presupuesto "+
  				"from pnd_resul_ent_prod_dest "+
  				"inner join( "+
  				"  select objetivo_estrategico_id,  sum(cant_destinatarios) as destinatarios from pnd_resul_ent_prod_dest"+condition+" "+
  				"  group by objetivo_estrategico_id) destinatarios on "+
  				"        destinatarios.objetivo_estrategico_id = pnd_resul_ent_prod_dest.objetivo_estrategico_id "+
  				""+
  				" inner join "+
  				"(select objetivo_estrategico_id, count(*) as resultados from ( "+
  				"   select objetivo_estrategico_id,resultado_esperado_nombre  from pnd_resul_ent_prod_dest"+condition+" "+
  				"   group by  objetivo_estrategico_id,resultado_esperado_nombre "+
  				"   ) resul "+
  				"group by objetivo_estrategico_id) resultados on "+ 
  				"        resultados.objetivo_estrategico_id= pnd_resul_ent_prod_dest.objetivo_estrategico_id "+
  				"inner join "+
  				"(select objetivo_estrategico_id, count(*) as entidades from ( "+
  				"   select objetivo_estrategico_id,ne_concat  from pnd_resul_ent_prod_dest"+condition+" "+
  				"   group by  objetivo_estrategico_id,ne_concat "+
  				"   ) ent "+
  				"group by objetivo_estrategico_id) entidades on "+ 
  				"        entidades.objetivo_estrategico_id= pnd_resul_ent_prod_dest.objetivo_estrategico_id "+
  				""+
  				"inner join "+
  				"(select objetivo_estrategico_id, count(*) as productos from ( "+
  				"   select objetivo_estrategico_id,prod_concat  from pnd_resul_ent_prod_dest" +condition+" "+
  				"   group by  objetivo_estrategico_id,prod_concat "+
  				"   ) prod "+
  				"group by objetivo_estrategico_id) productos on "+ 
  				"       productos.objetivo_estrategico_id=pnd_resul_ent_prod_dest.objetivo_estrategico_id "+
  				""+
  				"inner join "+

  				"   (select objetivo_estrategico_id,sum(colaboracion_resultado*colaboracion_producto*presupuesto) as presupuesto"+
  				"     from pnd_resul_ent_prod_presupuesto" +condition+""+ 
  				"     group by  objetivo_estrategico_id "+
  					") presupuesto on "+ 
  				"       presupuesto.objetivo_estrategico_id=pnd_resul_ent_prod_dest.objetivo_estrategico_id "+
  				""+
  				"group by pnd_resul_ent_prod_dest.objetivo_estrategico_id, pnd_resul_ent_prod_dest.objetivo_estrategico_nombre, entidades.entidades, productos.productos, resultados.resultados, destinatarios.destinatarios, presupuesto.presupuesto"+
  				")t";

  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    	
    }
    public static String selectContadoresPNDporEntidad(String condition) throws SQLException{
    	Connection conect=ConnectionConfiguration.conectar();
     	 

  		 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
  				"select pnd_resul_ent_prod_dest.ne_concat, pnd_resul_ent_prod_dest.entidad_nombre, objetivos.objetivos, productos.productos, resultados.resultados, destinatarios.destinatarios, presupuesto.presupuesto "+
  				"from pnd_resul_ent_prod_dest "+
  				"inner join( "+
  				"  select ne_concat,  sum(cant_destinatarios) as destinatarios from pnd_resul_ent_prod_dest"+condition+" "+
  				"  group by ne_concat) destinatarios on "+
  				"        destinatarios.ne_concat = pnd_resul_ent_prod_dest.ne_concat "+
  				""+
  				" inner join "+
  				"(select ne_concat, count(*) as resultados from ( "+
  				"   select ne_concat,resultado_esperado_nombre  from pnd_resul_ent_prod_dest"+condition+" "+
  				"   group by  ne_concat,resultado_esperado_nombre "+
  				"   ) resul "+
  				"group by ne_concat) resultados on "+ 
  				"        resultados.ne_concat= pnd_resul_ent_prod_dest.ne_concat "+
  				"inner join "+
  				"(select ne_concat, count(*) as objetivos from ( "+
  				"   select ne_concat,objetivo_estrategico_nombre  from pnd_resul_ent_prod_dest"+condition+" "+
  				"   group by  ne_concat,objetivo_estrategico_nombre "+
  				"   ) objet "+
  				"group by ne_concat) objetivos on "+ 
  				"        objetivos.ne_concat= pnd_resul_ent_prod_dest.ne_concat "+
  				""+
  				"inner join "+
  				"(select ne_concat, count(*) as productos from ( "+
  				"   select ne_concat,prod_id  from pnd_resul_ent_prod_dest" +condition+" "+
  				"   group by  ne_concat,prod_id "+
  				"   ) prod "+
  				"group by ne_concat) productos on "+ 
  				"       productos.ne_concat=pnd_resul_ent_prod_dest.ne_concat "+
  				""+
  				"inner join "+
  				"(select ne_concat, sum(presupuesto) as presupuesto from ( "+
  				"   select concat(nivel_id,'-',entidad_id) as ne_concat,prod_concat, sum(colaboracion_resultado*colaboracion_producto*presupuesto) as presupuesto   from pnd_resul_ent_prod_presupuesto" +condition+" "+
  				"   group by  ne_concat,prod_concat "+
  				"   ) presu "+
  				"group by ne_concat) presupuesto on "+ 
  				"       presupuesto.ne_concat=pnd_resul_ent_prod_dest.ne_concat "+
  				"group by pnd_resul_ent_prod_dest.ne_concat, pnd_resul_ent_prod_dest.entidad_nombre, objetivos.objetivos, productos.productos, resultados.resultados, destinatarios.destinatarios, presupuesto.presupuesto"+
  				")t";

  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    	
    }
    
    public static String selectNE(String condition) throws SQLException{
    	Connection conect=ConnectionConfiguration.conectar();
     	 

  		 String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
						"	select ent.id, ent.nombre, ent.nivel_id, ent.abrev, ppd.entidad_sigla  "+
						"	from entidad ent "+
						"	join pnd_resul_ent_prod_dest ppd on ppd.nivel_id = ent.nivel_id "+
						"		and ppd.entidad_id = ent.id  "+condition+ 
						"	group by ent.nivel_id, ent.id, ppd.entidad_sigla "+
						"	order by nivel_id, id  "+
						")t";
  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			while(rs.next()){
   				//ProductoPresupuestoMeta objeto = new ProductoPresupuestoMeta();

   				objetos+=rs.getString("resultado");
   			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    	
    }
    
    
    public static String selectTotalPresupuesto(String condition, String condition2, String condition3) throws SQLException{
     	 Connection conect=ConnectionConfiguration.conectar();
     	 String query = null; 
     	 if(condition != null && condition2 != null && condition3 != null){
     		 query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
       				"	select"+ 
       				"		(select count(*) as entidades from (select distinct(ne_concat) from pnd_resul_ent_prod_dest "+condition+")tmp),"+
       				"		(select count(*) as objetivos from (select distinct(objetivo_estrategico_id) from pnd_resul_ent_prod_dest "+condition+")tmp),"+
       				"		(select count(distinct prod_id) as productos"+
					"			from pnd_resul_ent_prod_presupuesto pndpto"+
					"			join unidad_responsable ur on ur.id = pndpto.ur_id and ur.entidad_id = pndpto.entidad_id and ur.entidad_nivel_id = pndpto.nivel_id"+
					"			where true and not ur.borrado "+condition2+"),"+
					"		(select (CASE WHEN sum (ppd.cant_destinatarios)>0 ::double precision THEN sum(cant_destinatarios)"+
					"		        ELSE 0::double precision"+
					"		    END) as destinatarios "+
					"		  FROM pnd_resul_ent_prod_dest ppd "+condition+"),"+
					"       (select sum(colaboracion_resultado*colaboracion_producto*presupuesto) as presupuesto from pnd_resul_ent_prod_presupuesto "+condition+")"+
       				")t";
     	 }else{
     		query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
      				"	select"+ 
      				"		(select count(*) as entidades from (select distinct(ne_concat) from pnd_resul_ent_prod_dest)tmp),"+
      				"		(select count(*) as objetivos from (select distinct(objetivo_estrategico_id) from pnd_resul_ent_prod_dest)tmp),"+
      				"		(select count(distinct prod_id) as productos from pnd_resul_ent_prod_presupuesto where true),"+
      				"		(select (CASE WHEN sum (ppd.cant_destinatarios)>0 ::double precision THEN sum(cant_destinatarios) ELSE 0::double precision END) as destinatarios FROM pnd_resul_ent_prod_dest ppd ),"+
      				//"		(select sum(planificado1+planificado2+planificado3+planificado4+planificado5+planificado6+planificado7+planificado8+planificado9+planificado10+planificado11+planificado12) as presupuesto from asignacion_presi where not borrado and anho=2017 and version=2)"+
      				"       (select sum(colaboracion_resultado*colaboracion_producto*presupuesto) as presupuesto from pnd_resul_ent_prod_presupuesto)"+
      				")t";
     	 }

  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    }
    public static String getPnd(String condition) throws SQLException{
     	 Connection conect=ConnectionConfiguration.conectar();
     	 
  		 String query = " select array_to_json("+
  				 	"		array_agg(row_to_json(t))"+
  				 	"	) as resultado"+
  				 	"	from("+
  				 	"			select * FROM \"pnd_resul_ent_prod_dest\" "+condition+ 
  				 	"		)t";
		
  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    }
    public static String getPndDestinatarios(String condition, String condition2) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
    	 
//    	 String query = "	select array_to_json("+
//						"			array_agg(row_to_json(t))"+
//						"		) as resultado"+
//						"		from("+
//						"	select *"+ 
//						"	FROM pnd_resul_ent_prod_dest "+condition +
//			 			")t";
    	 
 		 String query = "";
 				if (condition2 == ""){
	 		 		query = " select array_to_json("+
	 				 	    "	array_agg(row_to_json(t))"+
		 				 	"		) as resultado"+
		 				 	"	from("+
		 				 	" 	   select nivel_id, "+
							"      		  entidad_id,"+
							"      		  entidad_sigla,"+
							"      		  prod_concat, "+
							"      		  producto_nombre,"+
							"      		  sum(cant_destinatarios) AS cant_destinatarios,"+
							"      		  cod_catalogo_destinatario,"+
							"      		  nombre_catalogo_destinatario,"+
							"      		  entidad_nombre,"+
							"      		  tipo_nombre_catalogo_destinatario,"+
							"      		  ur_id,"+
							"      		  ur_nombre"+
							"		from pnd_resul_ent_prod_dest "+ condition +   
							"		group by nivel_id, entidad_id, entidad_sigla, prod_concat, producto_nombre, cod_catalogo_destinatario, "+
							"		nombre_catalogo_destinatario, entidad_nombre, tipo_nombre_catalogo_destinatario, ur_id, ur_nombre"+
		 				 	"		)t";
 				} else {
 					query = " select array_to_json("+
	 				 	    "	array_agg(row_to_json(t))"+
		 				 	"		) as resultado"+
		 				 	"	from("+
		 				 	" 	    select eje_estrategico_id,"+
							"      		  eje_estrategico_nombre,"+
							"      		  linea_transversal_id,"+
							"      		  linea_transversal_nombre,"+
							"		      estrategia_id,"+
							"			  estrategia_nombre,"+
							"      		  nivel_id, "+
							"      		  entidad_id,"+
							"      		  entidad_sigla,"+
							"      		  prod_concat, "+
							"      		  producto_nombre,"+
							"      		  sum(cant_destinatarios) AS cant_destinatarios,"+
							"      		  cod_catalogo_destinatario,"+
							"      		  nombre_catalogo_destinatario,"+
							"      		  entidad_nombre,"+
							"      		  tipo_nombre_catalogo_destinatario,"+
							"      		  ur_id,"+
							"      		  ur_nombre"+
							"		from pnd_resul_ent_prod_dest "+ condition + condition2 +
							"		group by eje_estrategico_id, eje_estrategico_nombre, linea_transversal_id, linea_transversal_nombre, estrategia_id, estrategia_nombre,"+ 
							" 		nivel_id, entidad_id, entidad_sigla, prod_concat, producto_nombre, cod_catalogo_destinatario, "+
							"		nombre_catalogo_destinatario, entidad_nombre, tipo_nombre_catalogo_destinatario, ur_id, ur_nombre"+
		 				 	"		)t";
 				};
		
 		 
 		 Statement statement = null;
 		 ResultSet rs=null;
 		 String objetos = "";

 		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

 				objetos+=rs.getString("resultado");
 			}
 		}
 		catch (SQLException e) {e.printStackTrace();}
 		finally{
 			if (statement != null) {statement.close();}
 			if (conect != null) {conect.close();}
 		}
 		return objetos;
   }
    
    public static String getPndProductos(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
    	 
 		 String query = /*" select array_to_json("+
 				 	"		array_agg(row_to_json(t))"+
 				 	"	) as resultado"+
 				 	"	from("+
 				 	"select m.*, (p.colaboracion_resultado*p.colaboracion_producto*p.presupuesto) as presupuesto FROM \"pnd_resul_ent_prod_meta\" m "+
 				 	"inner join pnd_resul_ent_prod_presupuesto p on p.prod_concat=m.prod_concat "+
 				 	condition + 
 				 	"		)t";*/
 				"select array_to_json("+
	 			"			array_agg(row_to_json(t))"+
	 			"		) as resultado"+
	 			"		from("+
	 			"	select m.*, (p.colaboracion_resultado*p.colaboracion_producto*p.presupuesto) as presupuesto"+ 
	 			"	FROM \"pnd_resul_ent_prod_meta\" m "+
	 			"	inner join pnd_resul_ent_prod_presupuesto p on p.prod_concat=m.prod_concat "+
			    " 												and p.eje_estrategico_id = m.eje_estrategico_id "+ 
			    " 												and p.linea_transversal_id = m.linea_transversal_id "+
			    " 												and p.estrategia_id = m.estrategia_id "+
			    " 												and p.objetivo_estrategico_id = m.objetivo_estrategico_id "+
			    " 												and p.resultado_esperado_id = m.resultado_esperado_id "+
			    /*" 											and p.ur_id = m.ur_id " + */ condition +
	 			")t";
 				
 		 
 		 Statement statement = null;
 		 ResultSet rs=null;
 		 String objetos = "";

 		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

 				objetos+=rs.getString("resultado");
 			}
 		}
 		catch (SQLException e) {e.printStackTrace();}
 		finally{
 			if (statement != null) {statement.close();}
 			if (conect != null) {conect.close();}
 		}
 		return objetos;
   }
    
    public static String getPndMetas(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
   	 
		 String query = " select array_to_json("+
				 	"		array_agg(row_to_json(t))"+
				 	"	) as metasPND"+
				 	"	from("+
				 	"			select SUM (cantidad) as total_metas,"+
					"			mes, anho, "+
					"			concat (nivel_id,-entidad_id,-tipo_presupuesto_id,-programa_id,-subprograma_id,-proyecto_id,-producto_id) as producto_concat,"+
					"			departamento_id"+
					"		    from producto_presupuesto_meta "+condition+
					"			group by departamento_id, mes, anho, producto_concat"+
					"			order by departamento_id"+
				 	"		)t";
				
		 
		 Statement statement = null;
		 ResultSet rs=null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				//ProductoPresupuestoMeta objeto = new ProductoPresupuestoMeta();

				objetos+=rs.getString("metasPND");
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
  }
    public static String getTotalPndMetas(String condition, String condition2) throws SQLException{
      	 Connection conect=ConnectionConfiguration.conectar();
      	 
   		 String query = /*" select array_to_json("+
				 		"		array_agg(row_to_json(t))"+
				 		"	) as metasPND"+
				 		"	from("+
   				 		" 		select  SUM (cantidad) as total_metas, eje_estrategico_id, linea_transversal_id, estrategia_id, mes "+
   				 		" 		 		"+condition2+   
   						"			 	, departamento_id, prod_concat, prod_id, anho"+
   						"		 		from pnd_resul_ent_prod_meta_depto "+condition+
   						"		 		group by departamento_id, eje_estrategico_id, linea_transversal_id, estrategia_id, mes, prod_concat, prod_id, anho"+//+condition2+ (comentado debido a que se le pasa de manera permanente los meses y traer de la vista todos de una sola vez)
   						"		 		order by departamento_id"+
   						"	)t";*/
	   				"select array_to_json("+
					"		array_agg(row_to_json(t))"+
					"	) as metasPND"+
					"	from("+
					"		select  SUM (prepmd.cantidad) as total_metas,"+ 
					"			prepmd.eje_estrategico_id,"+ 
					"			prepmd.linea_transversal_id, "+
					"			prepmd.estrategia_id,"+ 
					"			prepmd.mes"+ 
					"			"+condition2+   
					"			, prepmd.departamento_id,"+
					"			prepmd.producto_nombre"+
					"		from pnd_resul_ent_prod_meta_depto prepmd"+
					"		JOIN proyecto py ON py.id = split_part(prepmd.prod_concat, '-'::text, 6)::integer and"+
					"					py.subprograma_id = split_part(prepmd.prod_concat, '-'::text, 5)::integer and"+
					"					py.subprograma_programa_id = split_part(prepmd.prod_concat, '-'::text, 4)::integer and"+
					"					py.subprograma_programa_tipo_presupuesto_id =  split_part(prepmd.prod_concat, '-'::text, 3)::integer and"+
					"					py.subprograma_programa_entidad_id = split_part(prepmd.prod_concat, '-'::text, 2)::integer and"+
					"					py.subprograma_programa_entidad_nivel_id =  split_part(prepmd.prod_concat, '-'::text, 1)::integer"+
					"				JOIN unidad_responsable ur on ur.id = py.unidad_responsable_id and"+ 
					"					ur.entidad_id = split_part(prepmd.prod_concat, '-'::text, 2)::integer and"+ 
					"					ur.entidad_nivel_id = split_part(prepmd.prod_concat, '-'::text, 1)::integer"+
					"		"+condition+ " and not prepmd.departamento_id in (88,99) "+
					"		group by prepmd.departamento_id,"+ 
					"			prepmd.eje_estrategico_id,"+ 
					"			prepmd.linea_transversal_id, "+
					"			prepmd.estrategia_id,"+ 
					"			prepmd.mes,"+ 
					"			prepmd.anho,"+
					"			prepmd.producto_nombre"+
					"		order by prepmd.departamento_id"+
					"	)t";
   		 
   		 Statement statement = null;
   		 ResultSet rs=null;
   		 String objetos = "";

   		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			while(rs.next()){
   				//ProductoPresupuestoMeta objeto = new ProductoPresupuestoMeta();

   				objetos+=rs.getString("metasPND");
   			}
   		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
     }
    
    public static String totalAsignacionFinanciera(String condition, String condition2) throws SQLException{
     	 Connection conect=ConnectionConfiguration.conectar();
     	 // explicito en vista año y version 2017-6
  		 String query = /*" select array_to_json("+
				 		"						array_agg(row_to_json(t))"+
				 		") as asigPND"+
				 		"	from("+
  				 		"		select  eje_estrategico_id, linea_transversal_id, estrategia_id"+
  						""+condition2+   	
  				 		", prod_concat, prod_id, anho, SUM (presupuesto) as total_asignacion"+
  						"		 		from pnd_resul_ent_prod_presupuesto_depto "+condition+
  						"		 		group by eje_estrategico_id, linea_transversal_id, estrategia_id, prod_concat, prod_id, anho"+
  						")t";*/
  				 		
		  				"select array_to_json("+
						"		array_agg(row_to_json(t))"+
						"		) as asigPND"+
						"			from("+
						"				select  preppd.eje_estrategico_id,"+ 
						"					preppd.linea_transversal_id,"+ 
						"					preppd.estrategia_id,"+						   	
						"				    preppd.producto_nombre,"+
						"					SUM (preppd.presupuesto) as total_asignacion"+
						"				from pnd_resul_ent_prod_presupuesto_depto preppd"+
						"				JOIN proyecto py ON py.id = split_part(preppd.prod_concat, '-'::text, 6)::integer and"+
						"					py.subprograma_id = split_part(preppd.prod_concat, '-'::text, 5)::integer and"+
						"					py.subprograma_programa_id = split_part(preppd.prod_concat, '-'::text, 4)::integer and"+
						"					py.subprograma_programa_tipo_presupuesto_id =  split_part(preppd.prod_concat, '-'::text, 3)::integer and"+
						"					py.subprograma_programa_entidad_id = split_part(preppd.prod_concat, '-'::text, 2)::integer and"+
						"					py.subprograma_programa_entidad_nivel_id =  split_part(preppd.prod_concat, '-'::text, 1)::integer"+
						"				JOIN unidad_responsable ur on ur.id = py.unidad_responsable_id and"+ 
						"					ur.entidad_id = split_part(preppd.prod_concat, '-'::text, 2)::integer and"+ 
						"					ur.entidad_nivel_id = split_part(preppd.prod_concat, '-'::text, 1)::integer"+
						"				"+condition+
						"				group by preppd.eje_estrategico_id, preppd.linea_transversal_id, preppd.estrategia_id, preppd.producto_nombre order by preppd.producto_nombre"+
						"		)t";
  		 
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 String objetos = "";

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			while(rs.next()){
  				objetos+=rs.getString("asigPND");
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    }
    
    public static String getPndFinanciamiento(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
    	 
 		 String query = " select array_to_json("+
 				 	"		array_agg(row_to_json(t))"+
 				 	"	) as financiamiento"+
 				 	"	from("+
 				 	"			select * FROM \"pnd_resul_ent_prod_financiamiento\" "+condition+ 
 				 	"		)t";
		
 		 
 		 Statement statement = null;
 		 ResultSet rs=null;
 		 String objetos = "";

 		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				ObjetivoEstrategia objeto = new ObjetivoEstrategia();

 				objetos+=rs.getString("financiamiento");
 			}
 		}
 		catch (SQLException e) {e.printStackTrace();}
 		finally{
 			if (statement != null) {statement.close();}
 			if (conect != null) {conect.close();}
 		}
 		return objetos;
   }
    
    public static List<ObjetivosPorProyecto> selectObjetivosPorProyecto(String condition) throws SQLException{
      	 Connection conect=ConnectionConfiguration.conectar();

   		 String query = "select * from proyecto_has_objetivo "+condition;
   		 
   		 Statement statement = null;
   		 ResultSet rs=null;
   		 List<ObjetivosPorProyecto> objetos = new ArrayList<ObjetivosPorProyecto>();

   		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			while(rs.next()){
   				ObjetivosPorProyecto objeto = new ObjetivosPorProyecto();
   				objeto.setId(rs.getInt("id"));
   				objeto.setNivel(rs.getInt("nivel"));
   				objeto.setEntidad(rs.getInt("entidad"));
   				objeto.setTipoPresupuesto(rs.getInt("tipo_presupuesto"));
   				objeto.setPrograma(rs.getInt("programa"));
   				objeto.setSubPrograma(rs.getInt("sub_programa"));
   				objeto.setFuncional(rs.getInt("funcional"));
   				objeto.setProyecto(rs.getInt("proyecto"));
   				objeto.setObjetivo(rs.getInt("objetivo"));
   				objeto.setValoracion(rs.getInt("valoracion"));
   				objetos.add(objeto);
   			}
   		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
     }
    public static List<Indicador> selectAllIndicadores(String condicion) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from indicador "+condicion+" and borrado_int=0";
		 Statement statement = null;
		 ResultSet rs=null;
		 List<Indicador> objetos = new ArrayList<Indicador>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Indicador objeto = new Indicador();
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setTipo_indicador_id(rs.getInt("tipo_indicador_id"));
				objeto.setMetodo_calculo_id(rs.getString("metodo_calculo_id"));
				objeto.setFrecuencia_meses(rs.getShort("frecuencia_meses"));
				objeto.setUnidad_medida_id(rs.getShort("unidad_medida_id"));
				objeto.setDesagregacion_tipo_zona_geografica_id(rs.getShort("desagregacion_tipo_zona_geografica_id"));
				objeto.setTipo_demografica_id(rs.getShort("tipo_demografica_id"));
				objeto.setFuente_verificacion_id(rs.getString("fuente_verificacion_id"));
				objeto.setObservaciones(rs.getString("observaciones"));
				objeto.setObjetivo_id(rs.getShort("objetivo_id"));
				objeto.setBorradoInt(rs.getShort("borrado_int"));
				objeto.setCoberturaGeograficaAlcance(rs.getInt("cobertura_geografica_alcance"));
				objeto.setNivelDespliegueGeograficoDesagregacion(rs.getInt("nivel_despliegue_geografico"));
				objeto.setCoberturaDemograficaAlcance(rs.getInt("cobertura_demografica_alcance"));
				objeto.setNivelDespliegueDemograficoDesagregacion(rs.getInt("nivel_despliegue_demografica"));				
				
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    
    //El de arriba no utilizo por que en el sql esta fijo el borrado = 0 y no se que parte del sistema se utiliza
    public static List<Indicador> selectAllIndicador(String condicion, String nivel, String entidad) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from indicador "+condicion+" and nivel = "+nivel+" and entidad = "+entidad;
		 Statement statement = null;
		 ResultSet rs=null;
		 List<Indicador> objetos = new ArrayList<Indicador>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Indicador objeto = new Indicador();
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setTipo_indicador_id(rs.getInt("tipo_indicador_id"));
				objeto.setMetodo_calculo_id(rs.getString("metodo_calculo_id"));
				objeto.setFrecuencia_meses(rs.getInt("frecuencia_meses"));
				objeto.setUnidad_medida_id(rs.getShort("unidad_medida_id"));
				objeto.setDesagregacion_tipo_zona_geografica_id(rs.getShort("desagregacion_tipo_zona_geografica_id"));
				objeto.setTipo_demografica_id(rs.getShort("tipo_demografica_id"));
				objeto.setFuente_verificacion_id(rs.getString("fuente_verificacion_id"));
				if(rs.getString("observaciones") != null) objeto.setObservaciones(rs.getString("observaciones"));
				objeto.setObjetivo_id(rs.getShort("objetivo_id"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setCoberturaGeograficaAlcance(rs.getInt("cobertura_geografica_alcance"));
				objeto.setNivelDespliegueGeograficoDesagregacion(rs.getInt("nivel_despliegue_geografico"));
				objeto.setCoberturaDemograficaAlcance(rs.getInt("cobertura_demografica_alcance"));
				objeto.setNivelDespliegueDemograficoDesagregacion(rs.getInt("nivel_despliegue_demografica"));
				if(rs.getString("fecha_disponibilidad_informacion") != null) objeto.setFechaDisponibilidadInformacion(rs.getString("fecha_disponibilidad_informacion"));
				if(rs.getString("institucion_responsable_calculo_indicador") != null) objeto.setInstitucionResponsableCalculoIndicador(rs.getString("institucion_responsable_calculo_indicador"));
				if(rs.getString("evaluacion_heci") != null) objeto.setEvaluacionHeci(rs.getString("evaluacion_heci"));
				if(rs.getString("contacto") != null) objeto.setContacto(rs.getString("contacto"));
				objeto.setNivel(rs.getInt("nivel"));
				objeto.setEntidad(rs.getInt("entidad"));
				
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
  }
    
    public static List<Meta> selectMetasPnd(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from meta "+condition;
		 Statement statement = null;
		 ResultSet rs=null;
		 List<Meta> objetos = new ArrayList<Meta>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				Meta objeto = new Meta();
				objeto.setId(rs.getInt("id"));
				objeto.setCantidad(rs.getDouble("cantidad"));
				objeto.setVencimiento(rs.getString("vencimiento"));
				objeto.setIndicador_id(rs.getInt("indicador_id"));
				objeto.setZona_geografica_id(rs.getInt("zona_geografica_id"));
				objeto.setDemografia_id(rs.getInt("demografia_id"));
				objeto.setBorrado_int(rs.getInt("borrado_int"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
  }
  
    public static List<Meta> selectMetas(String condition, String nivel, String entidad) throws SQLException{
      	 Connection conect=ConnectionConfiguration.conectar();
      	
   		 String query = " select * from meta "+condition+" and nivel = "+nivel+" and entidad = "+entidad;
   		 Statement statement = null;
   		 ResultSet rs=null;
   		 List<Meta> objetos = new ArrayList<Meta>();

   		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			
   			while(rs.next()){
   				Meta objeto = new Meta();
   				objeto.setId(rs.getInt("id"));
   				objeto.setCantidad(rs.getDouble("cantidad"));
   				objeto.setVencimiento(rs.getString("vencimiento"));
   				objeto.setIndicador_id(rs.getInt("indicador_id"));
   				objeto.setZona_geografica_id(rs.getInt("zona_geografica_id"));
   				objeto.setDemografia_id(rs.getInt("demografia_id"));
				objeto.setBorrado_int(rs.getInt("borrado_int"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setNivel(rs.getInt("nivel"));
   				objeto.setEntidad(rs.getInt("entidad"));
   				//objeto.setProductoConcat(rs.getString("producto_concat"));
   				objeto.setObjetivoId(rs.getInt("objetivo_id"));
   				objeto.setTipoObjetivoId(rs.getInt("tipo_objetivo_id"));
   				
   				objetos.add(objeto); 
   			}
   		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
     }
    
    public static List<Meta> selectAvanceMetas(String condition, String nivel, String entidad) throws SQLException{
     	 Connection conect=ConnectionConfiguration.conectar();
     	
  		 String query = " select * from avance_indicador "+condition+" and nivel = "+nivel+" and entidad = "+entidad;
  		 Statement statement = null;
  		 ResultSet rs=null;
  		 List<Meta> objetos = new ArrayList<Meta>();

  		try {
  			statement = conect.createStatement();
  			rs=statement.executeQuery(query);
  			
  			while(rs.next()){
  				Meta objeto = new Meta();
  				objeto.setId(rs.getInt("id"));
  				objeto.setCantidad(rs.getDouble("cantidad"));
  				objeto.setVencimiento(rs.getString("vencimiento"));
  				objeto.setIndicador_id(rs.getInt("indicador_id"));
  				objeto.setZona_geografica_id(rs.getInt("zona_geografica_id"));
  				objeto.setDemografia_id(rs.getInt("demografia_id"));
				objeto.setBorrado_int(rs.getInt("borrado_int"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setNivel(rs.getInt("nivel"));
  				objeto.setEntidad(rs.getInt("entidad"));
  				//objeto.setProductoConcat(rs.getString("producto_concat"));
  				objeto.setObjetivoId(rs.getInt("objetivo_id"));
  				objeto.setTipoObjetivoId(rs.getInt("tipo_objetivo_id"));
  				
  				objetos.add(objeto); 
  			}
  		}
  		catch (SQLException e) {e.printStackTrace();}
  		finally{
  			if (statement != null) {statement.close();}
  			if (conect != null) {conect.close();}
  		}
  		return objetos;
    }
    
    public static List<ProductoPresupuestoMeta> selectAllProductosPresupuestoMeta(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from producto_presupuesto_meta "+condition;
		 Statement statement = null;
		 ResultSet rs=null;
		 List<ProductoPresupuestoMeta> objetos = new ArrayList<ProductoPresupuestoMeta>();		 
		 try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){				
				ProductoPresupuestoMeta objeto = new ProductoPresupuestoMeta();
				
				objeto.setId(rs.getInt("id"));
				objeto.setMes(rs.getShort("mes"));
				objeto.setAnho(rs.getShort("anho"));
				objeto.setCantidad(rs.getDouble("cantidad"));
				objeto.setCatalogo_destianatario_id (rs.getInt("catalogo_destinatario_id"));
				objeto.setDepartamento(rs.getShort("departamento_id"));
				objeto.setProducto_presupusto_id(rs.getShort("producto_presupusto_id"));
				objeto.setProducto_id(rs.getShort("producto_id"));
				objeto.setUnidad_medida_id(rs.getShort("unidad_medida_id"));
				objeto.setProyecto_id(rs.getShort("proyecto_id"));
				objeto.setSubprograma_id(rs.getShort("subprograma_id"));
				objeto.setPrograma_id(rs.getShort("programa_id"));
				objeto.setTipo_presupuesto_id(rs.getShort("tipo_presupuesto_id"));
				objeto.setEntidad_id(rs.getShort("entidad_id"));
				objeto.setNivel_id(rs.getShort("nivel_id"));
				objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<ProductoPresupuestoDestinatario> selectAllProductosDestinatarios(String condition) throws SQLException{
      	 Connection conect=ConnectionConfiguration.conectar();
   		 String query = " select * from producto_presupuesto_destinatario "+condition;
   		 Statement statement = null;
   		 ResultSet rs=null;
   		 List<ProductoPresupuestoDestinatario> objetos = new ArrayList<ProductoPresupuestoDestinatario>();   		 

   		try {
   			statement = conect.createStatement();
   			rs=statement.executeQuery(query);
   			while(rs.next()){
   				ProductoPresupuestoDestinatario objeto = new ProductoPresupuestoDestinatario();
   				
   				objeto.setId(rs.getInt("id"));
   				objeto.setDepartamento(rs.getInt("departamento"));
   				objeto.setCantidad(rs.getDouble("cantidad"));
   				objeto.setCatalogo_destinatario (rs.getInt("catalogo_destinatario"));
   				objeto.setProducto(rs.getShort("producto"));
   				objeto.setProyecto(rs.getShort("proyecto"));
   				objeto.setSubprograma(rs.getShort("subprograma"));
   				objeto.setPrograma(rs.getShort("programa"));
   				objeto.setTipo_presupuesto(rs.getShort("tipo_presupuesto"));
   				objeto.setEntidad(rs.getShort("entidad"));
   				objeto.setNivel(rs.getShort("nivel"));
   				objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
   				if (rs.getString("descripcion") != null) 
   					objeto.setDescripcion((rs.getString("descripcion")));
   				objeto.setBorrado(rs.getBoolean("borrado"));
   				
   				objetos.add(objeto);
   			}
   		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
      }
    
    
    
    public static List<CatalogoProductoMeta> selectAllCatalogProductosHacienda(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from producto "+condition;
		 query += " order by nombre ASC";
		 Statement statement = null;
		 ResultSet rs=null;
		 List<CatalogoProductoMeta> productos = new ArrayList<CatalogoProductoMeta>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				CatalogoProductoMeta producto = new CatalogoProductoMeta();
				producto.setClase(rs.getString("clase"));
				producto.setNombreCatalogo(rs.getString("nombre"));
				producto.setCodigoCatalogo(rs.getShort("id"));
				producto.setCodUnidadMedida(rs.getShort("unidad_medida_id"));
				productos.add(producto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return productos;
    }
    public static List<UnidadMedida> selectAllUnidadesMedida(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from unidad_medida "+condition+" order by nombre ASC";
		 Statement statement = null;
		 ResultSet rs=null;
		 List<UnidadMedida> objetos = new ArrayList<UnidadMedida>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				UnidadMedida objeto = new UnidadMedida();
				objeto.setCodigoUnidadMedida(rs.getShort("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setAbreviacion(rs.getString("abrev"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<Departamento> selectAllDepartamentos(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from departamento"+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<Departamento> objetos = new ArrayList<Departamento>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				Departamento objeto = new Departamento();
				objeto.setAbrevDepartamento(rs.getString("abrev"));
				objeto.setNombreDepartamento(rs.getString("nombre"));
				objeto.setDeptoPais(rs.getShort("id"));
				objeto.setCodigoPais(rs.getShort("pais"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
   
    public static List<PlanEje> selectAllPLanEje() throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from eje_estrategico";
		 Statement statement = null; ResultSet rs=null;
		 List<PlanEje> objetos = new ArrayList<PlanEje>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				PlanEje objeto = new PlanEje();
				objeto.setEjeNombre(rs.getString("nombre"));
				objeto.setEjeDescripcion(rs.getString("descripcion"));
				objeto.setCodigoPlan(rs.getShort("plan_id"));
				objeto.setEjeCodigo(rs.getShort("id"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<EjeEstrategico> selectAllEjeEstrategico(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from eje_estrategico"+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<EjeEstrategico> objetos = new ArrayList<EjeEstrategico>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				EjeEstrategico objeto = new EjeEstrategico();
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setPlan_id(rs.getInt("plan_id"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<py.gov.stp.mh.clasificadores.Entidad> selectAllEntidades(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();String query = " select * from entidad "+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<py.gov.stp.mh.clasificadores.Entidad> objetos = new ArrayList<py.gov.stp.mh.clasificadores.Entidad>();
		 
		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				py.gov.stp.mh.clasificadores.Entidad objeto = new py.gov.stp.mh.clasificadores.Entidad();
				objeto.setEntidad(rs.getShort("id"));
				objeto.setNombreEntidad(rs.getString("nombre"));
				//objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setAnio(rs.getShort("anho"));
				objeto.setAbrevEntidad(rs.getString("abrev"));
				objeto.setBaseLegal(rs.getString("base_legal"));
				objeto.setMision(rs.getString("mision"));
				objeto.setVision(rs.getString("vision"));
				objeto.setNivel(rs.getShort("nivel_id"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				objeto.setDiagnostico(rs.getString("diagnostico"));
				objeto.setObjetivo(rs.getString("objetivo"));
				objeto.setPolitica(rs.getString("politica"));
				objeto.setRuc(rs.getString("ruc"));
				
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<FuenteFinanciamiento> selectAllFuentesFinanciamiento(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from fuente_financiamiento"+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<FuenteFinanciamiento> objetos = new ArrayList<FuenteFinanciamiento>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				FuenteFinanciamiento objeto = new FuenteFinanciamiento();
				objeto.setCodFuenteFinanciamiento(rs.getShort("id"));
				objeto.setNombreFuenteFinanciamiento(rs.getString("nombre"));
				objeto.setSiglaFuenteFinanciamiento(rs.getString("descripcion"));
				objeto.setAnio(rs.getShort("anho"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<Funcional> selectAllFuncionales() throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from funcional where es_imputable ='S' order by id ASC";
		 Statement statement = null; ResultSet rs=null;
		 List<Funcional> objetos = new ArrayList<Funcional>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				Funcional objeto = new Funcional();
				objeto.setCodigoFuncional(rs.getShort("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setAbreviacion(rs.getString("abrev"));
				objeto.setEsImputable(rs.getString("es_imputable"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<Nivel> selectAllNiveles(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from nivel "+condition+" order by id";
		 Statement statement = null; ResultSet rs=null;
		 List<Nivel> objetos = new ArrayList<Nivel>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				Nivel objeto = new Nivel();
				objeto.setNivel(rs.getShort("id"));
				objeto.setNombreNivel(rs.getString("nombre"));
				objeto.setAbrevNivel(rs.getString("abrev"));
				objeto.setEsImputable(rs.getString("es_imputable"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				objeto.setAnio(rs.getShort("anho"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<ObjetoGasto> selectAllObjetosDeGasto(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select id,nombre from objeto_de_gasto"+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<ObjetoGasto> objetos = new ArrayList<ObjetoGasto>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				ObjetoGasto objeto = new ObjetoGasto();
				objeto.setCodObjetoGasto(rs.getShort("id"));
				objeto.setNombre(rs.getString("nombre"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   } 
    public static List<OrganismoFinanciador> selectAllOrganismosFinanciadores() throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from organismo_financiador";
		 Statement statement = null; ResultSet rs=null;
		 List<OrganismoFinanciador> objetos = new ArrayList<OrganismoFinanciador>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				OrganismoFinanciador objeto = new OrganismoFinanciador();
				objeto.setCodOrgFinanciador(rs.getShort("id"));
				objeto.setNombreOrgFinanciador(rs.getString("nombre"));
				objeto.setAnio(rs.getShort("anho"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<Pilar> selectAllPilares(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from estrategia where plan=9 "+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<Pilar> objetos = new ArrayList<Pilar>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				Pilar objeto = new Pilar();
				objeto.setCodigoPilar(rs.getShort("id"));
				objeto.setPilarNombre(rs.getString("nombre"));
				objeto.setCodigoPlan(rs.getShort("plan"));
				objeto.setNumeroFila(rs.getShort("numero_fila"));
				//objeto.setLineaTransversal(rs.getShort("linea_transversal_id"));veeeeeeeeer
			//	objeto.setEjeEstrategico(rs.getShort("eje_estrategico_id"));veeeeeeeeer
			//	objeto.setEje_estrategico(rs.getShort("eje_estrategico_id"));
			//	objeto.setLinea_transversal(rs.getShort("linea_transversal_id"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<LineaTransversal> selectAllLineaTransversal(String condition) throws SQLException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from linea_transversal where plan_id=9"+condition;
		 Statement statement = null; ResultSet rs=null;
		 List<LineaTransversal> objetos = new ArrayList<LineaTransversal>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				LineaTransversal objeto = new LineaTransversal();
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setPlan_id(rs.getInt("plan_id"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<Plan> selectAllPlanes() throws SQLException, DatatypeConfigurationException{
   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from plan";
		 Statement statement = null; ResultSet rs=null;
		 List<Plan> objetos = new ArrayList<Plan>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				GregorianCalendar c = new GregorianCalendar();c.setTime(rs.getDate("fecha_inicio"));
				XMLGregorianCalendar fini = DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
				GregorianCalendar c2 = new GregorianCalendar();c2.setTime(rs.getDate("fecha_fin"));
				XMLGregorianCalendar ffin = DatatypeFactory.newInstance().newXMLGregorianCalendar(c2);
				Plan objeto = new Plan();
				objeto.setCodigoPlan(rs.getShort("id"));
				objeto.setEntidadResponsable(rs.getString("entidad_responsable"));
				objeto.setPlanNombre(rs.getString("nombre"));
				objeto.setPlanDescripcion(rs.getString("descripcion"));
				objeto.setPlanDetalle(rs.getString("detalle"));
				objeto.setPlanDesde(fini);
				objeto.setPlanHasta(ffin);
				
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
   }
    public static List<PrecioDNCP> selectAllCatalogoDNCP()  throws SQLException{
 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from catalogo_dncp";
	 Statement statement = null; ResultSet rs=null;
	 List<PrecioDNCP> objetos = new ArrayList<PrecioDNCP>();

	try {
		statement = conect.createStatement();
		rs=statement.executeQuery(query);
		
		while(rs.next()){
			PrecioDNCP objeto = new PrecioDNCP();
			objeto.setNumeroFila(rs.getShort("numero_fila"));
			objeto.setAnio(rs.getShort("anho"));
			objeto.setCodCatalogo(rs.getInt("id"));
			objeto.setNombreCatalogo(rs.getString("nombre"));
			objeto.setSiglaCatalogo("");
			objeto.setPrecio(rs.getDouble("precio"));
			objeto.setCodObjetoGasto(rs.getShort("objeto_de_gasto_id"));
			objetos.add(objeto);
		}
	}
	catch (SQLException e) {e.printStackTrace();}
	finally{
		if (statement != null) {statement.close();}
		if (conect != null) {conect.close();}
	}
	return objetos;
    }
    public static List<TipoPrograma> selectAllTiposPrograma(String condition)  throws SQLException{
     	Connection conect=ConnectionConfiguration.conectar();String query = " select * from tipo_presupuesto" + condition;
    	 Statement statement = null; ResultSet rs=null;
    	 List<TipoPrograma> objetos = new ArrayList<TipoPrograma>();

    	try {
    		statement = conect.createStatement();
    		rs=statement.executeQuery(query);
    		
    		while(rs.next()){
    			TipoPrograma objeto = new TipoPrograma();
    			objeto.setNumeroFila(rs.getShort("numero_fila"));
    			objeto.setAnio(rs.getShort("anho"));
    			objeto.setAbrevTipoPrograma(rs.getString("abrev"));
    			objeto.setNombreTipoPrograma(rs.getString("nombre"));
    			objetos.add(objeto);
    		}
    	}
    	catch (SQLException e) {e.printStackTrace();}
    	finally{
    		if (statement != null) {statement.close();}
    		if (conect != null) {conect.close();}
    	}
    	return objetos;
        }
    
    
    public static List<TipoPrograma> selectAllTiposProgramaPnd(String condition)  throws SQLException{
     	Connection conect=ConnectionConfiguration.conectar();String query = " select 	tp.numero_fila,"+
																			"		tp.nombre"+
																			"	from tipo_presupuesto tp"+
																			"	join proyecto py ON py.subprograma_programa_tipo_presupuesto_id = tp.id"+
																			"	JOIN unidad_responsable ur on 	ur.id = py.unidad_responsable_id and "+
																			"					ur.entidad_id = py.subprograma_programa_entidad_id and "+
																			"					ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id"+ condition+
																			"	group by tp.id"+
																			"	order by tp.id" ;
    	 Statement statement = null; ResultSet rs=null;
    	 List<TipoPrograma> objetos = new ArrayList<TipoPrograma>();

    	try {
    		statement = conect.createStatement();
    		rs=statement.executeQuery(query);
    		
    		while(rs.next()){
    			TipoPrograma objeto = new TipoPrograma();
    			objeto.setNumeroFila(rs.getShort("numero_fila"));
    			objeto.setNombreTipoPrograma(rs.getString("nombre"));
    			objetos.add(objeto);
    		}
    	}
    	catch (SQLException e) {e.printStackTrace();}
    	finally{
    		if (statement != null) {statement.close();}
    		if (conect != null) {conect.close();}
    	}
    	return objetos;
    }
    
    public static List<Programa> selectAllProgramasPnd(String condition)  throws SQLException{
     	Connection conect=ConnectionConfiguration.conectar();
     	String query = " select tp.id,"+
						"		tp.nombre"+
						"	from programa tp"+
						"	join proyecto py ON py.subprograma_programa_id = tp.id "+
						"                   and py.subprograma_programa_tipo_presupuesto_id = tp.tipo_presupuesto_id"+
						"	JOIN unidad_responsable ur on 	ur.id = py.unidad_responsable_id and "+
						"					ur.entidad_id = py.subprograma_programa_entidad_id and "+
						"					ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id"+ condition+
						"	group by tp.id, tp.nombre"+
						"	order by tp.id" ;
     	
     	Statement statement = null; ResultSet rs=null;
    	List<Programa> objetos = new ArrayList<Programa>();

    	try {
    		statement = conect.createStatement();
    		rs=statement.executeQuery(query);
    		
    		while(rs.next()){
    			Programa objeto = new Programa();
    			objeto.setCodigoPrograma(rs.getShort("id"));
    			objeto.setNombrePrograma(rs.getString("nombre"));
    			
				objetos.add(objeto);
    			
    		}
    	}
    	catch (SQLException e) {e.printStackTrace();}
    	finally{
    		if (statement != null) {statement.close();}
    		if (conect != null) {conect.close();}
    	}
    	return objetos;
    }
    
    public static List<SubPrograma> selectAllSubprogramasPnd(String condition)  throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		//String query = " select * from subprograma "+condition+" order by id";
		
		String query = "  select tp.id, tp.nombre"+
						"	from subprograma tp"+
						"   join proyecto py ON py.subprograma_id = tp.id	"+
						"    and py.subprograma_programa_id = tp.programa_id "+
						"    and py.subprograma_programa_tipo_presupuesto_id = tp.programa_tipo_presupuesto_id "+
						"	JOIN unidad_responsable ur on 	ur.id = py.unidad_responsable_id and "+
						"					ur.entidad_id = py.subprograma_programa_entidad_id and "+
						"					ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id"+ condition+
						"	group by tp.id, tp.nombre"+
						"	order by tp.id" ;
		
		 Statement statement = null; ResultSet rs=null;
		 List<SubPrograma> objetos = new ArrayList<SubPrograma>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				SubPrograma objeto = new SubPrograma();
				objeto.setId(rs.getShort("id"));
				objeto.setNombre(rs.getString("nombre"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
	}
    
    public static List<TipoCatalogoDestinatario> selectAllTiposDestinatarios(String condition)  throws SQLException{
     	Connection conect=ConnectionConfiguration.conectar();String query = " select * from tipo_catalogo_destinatario "+condition;
    	 Statement statement = null; ResultSet rs=null;
    	 List<TipoCatalogoDestinatario> objetos = new ArrayList<TipoCatalogoDestinatario>();

    	try {
    		statement = conect.createStatement();
    		rs=statement.executeQuery(query);
    		
    		while(rs.next()){
    			TipoCatalogoDestinatario objeto = new TipoCatalogoDestinatario();
    			objeto.setId(rs.getInt("id"));
    			objeto.setNombre(rs.getString("nombre"));
    			objeto.setDescripcion(rs.getString("descripcion"));
    			
    			objetos.add(objeto);
    		}
    	}
    	catch (SQLException e) {e.printStackTrace();}
    	finally{
    		if (statement != null) {statement.close();}
    		if (conect != null) {conect.close();}
    	}
    	return objetos;
        }
    // destinatarios
    public static List<CatalogoDestinatario> selectAllDestinatarios(String condition)  throws SQLException{
     	Connection conect=ConnectionConfiguration.conectar();String query = " select * from catalogo_destinatario "+condition;
    	 Statement statement = null; ResultSet rs=null;
    	 List<CatalogoDestinatario> objetos = new ArrayList<CatalogoDestinatario>();

    	try {
    		statement = conect.createStatement();
    		rs=statement.executeQuery(query);
    		
    		while(rs.next()){
    			CatalogoDestinatario objeto = new CatalogoDestinatario();
    			objeto.setId(rs.getShort("id"));
    			objeto.setNombre(rs.getString("nombre"));
    			objeto.setTipo_catalogo_destianatario_id(rs.getInt("tipo_catalogo_destinatario_id"));
    			objeto.setDescripcion(rs.getString("descripcion"));
    			objeto.setBorrado(rs.getBoolean("borrado"));
    			
    			objetos.add(objeto);
    		}
    	}
    	catch (SQLException e) {e.printStackTrace();}
    	finally{
    		if (statement != null) {statement.close();}
    		if (conect != null) {conect.close();}
    	}
    	return objetos;
        }
	public static List<Programa> selectAllProgramas(String condition)  throws SQLException{
	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from programa "+condition+" order by id";
		 Statement statement = null; ResultSet rs=null;
		 List<Programa> objetos = new ArrayList<Programa>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			
			while(rs.next()){
				Programa objeto = new Programa();
				objeto.setNumeroFila(rs.getShort("numeroFila"));
				objeto.setAnio(rs.getShort("anho"));
				objeto.setNivel(rs.getShort("entidad_nivel_id"));
				objeto.setEntidad(rs.getShort("entidad_id"));
				objeto.setTipoPrograma(rs.getShort("tipo_presupuesto_id"));
				objeto.setCodigoPrograma(rs.getShort("id"));
				objeto.setNombrePrograma(rs.getString("nombre"));
				objeto.setAbrevPrograma(rs.getString("abrev"));
				objeto.setDescripcionPrograma(rs.getString("descripcion"));
				objeto.setObjetivo(rs.getString("objetivo"));
				objeto.setDiagnostico(rs.getString("diagnostico"));
				objeto.setBaseLegal(rs.getString("base_legal"));
				objeto.setResultado(rs.getString("resultado"));
				objeto.setCodigoDepartamento(rs.getShort("codigoDepartamento"));
				objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos;
	}
		public static List<SubPrograma> selectAllSubprogramas(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();String query = " select * from subprograma "+condition+" order by id";
			 Statement statement = null; ResultSet rs=null;
			 List<SubPrograma> objetos = new ArrayList<SubPrograma>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					SubPrograma objeto = new SubPrograma();
					//objeto.setNumeroFila(rs.getShort("numeroFila"));
					objeto.setAnho(rs.getShort("anho"));
					objeto.setPrograma_entidad_nivel_id(rs.getShort("programa_entidad_nivel_id"));
					objeto.setPrograma_entidad_id(rs.getShort("programa_entidad_id"));
					objeto.setPrograma_tipo_presupuesto_id(rs.getShort("programa_tipo_presupuesto_id"));
					objeto.setPrograma_id(rs.getShort("programa_id"));
					objeto.setId(rs.getShort("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setAbrev(rs.getString("abrev"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setObjetivo(rs.getString("objetivo"));
					objeto.setCodigo_departamento(rs.getShort("codigo_departamento"));
					objeto.setBaseLegal(rs.getString("baseLegal"));
					objeto.setFechaActualizacion(rs.getDate("fecha_actualizacion"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
		}
		public static List<Proyecto> selectAllProyectos(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();String query = " select * from proyecto "+condition+" order by id";
		 	
			 Statement statement = null; ResultSet rs=null;
			 List<Proyecto> objetos = new ArrayList<Proyecto>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					Proyecto objeto = new Proyecto();
					//objeto.setNumeroFila(rs.getShort("numeroFila"));
					objeto.setAnio(rs.getShort("anho"));
					objeto.setNivel(rs.getShort("subprograma_programa_entidad_nivel_id"));
					objeto.setEntidad(rs.getShort("subprograma_programa_entidad_id"));
					objeto.setTipoPrograma(rs.getShort("subprograma_programa_tipo_presupuesto_id"));
					objeto.setCodigoPrograma(rs.getShort("subprograma_programa_id"));
					objeto.setCodigoSubprograma(rs.getShort("subprograma_id"));
					objeto.setCodigoProyecto(rs.getShort("id"));
					objeto.setNombreProyecto(rs.getString("nombre"));
					objeto.setAbrevProyecto(rs.getString("abrev"));
					objeto.setDescripcionProyecto(rs.getString("descripcion"));
					objeto.setCodigoUnidadResponsable(rs.getShort("unidad_responsable_id"));
					objeto.setCodigoFuncional(rs.getShort("funcional_id"));
					objeto.setDiagnostico(rs.getString("diagnostico"));
					objeto.setResultadoEsperado(rs.getString("resultado_esperado"));
					objeto.setCodigoDepartamento(rs.getShort("codigo_departamento"));
					objeto.setCodigoSnip(rs.getShort("codigo_snip"));
					objeto.setObjetivo_estrategico_id(rs.getShort("objetivo_estrategico_id"));
					objeto.setFechaActualizacion(rs.getDate("fecha_actualizacion"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
		}
		
	    public static String selectAllProyectosPND(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();
					
			String query = " select array_to_json(" + "		array_agg(row_to_json(t))"+
					 "	) as proyectos_pnd" + "	from("+
					"  select py.id AS \"codigoProyecto\", py.nombre AS \"nombreProyecto\" "+
					"	from proyecto py"+
					"	JOIN unidad_responsable ur on 	ur.id = py.unidad_responsable_id and "+
					"					ur.entidad_id = py.subprograma_programa_entidad_id and "+
					"					ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id"+ condition+
					"	group by py.id, py.nombre"+
					"	order by py.id" +
					 "		)t";
			

			
			 Statement statement = null; ResultSet rs=null;
			 String objetos = "";

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					objetos += rs.getString("proyectos_pnd");
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
		}
		
			public static List<Proyecto> selectAllProyectosPresupuestoGasto(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();String query = "SELECT codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma, codigoSubprograma, codigoProyecto  FROM presupuesto_gasto	where date_format(fechaCreacion,'%Y-%m-%d')='2016-03-03' group by codigoNivel, codigoEntidad, tipoPrograma, codigoPrograma, codigoSubprograma, codigoProyecto "; 
			 Statement statement = null; ResultSet rs=null;
			 List<Proyecto> objetos = new ArrayList<Proyecto>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					Proyecto objeto = new Proyecto();
					//objeto.setNumeroFila(rs.getShort("numeroFila"));
					objeto.setAnio((short)2016);
					objeto.setNivel(rs.getShort("codigoNivel"));
					objeto.setEntidad(rs.getShort("codigoEntidad"));
					objeto.setTipoPrograma(rs.getShort("tipoPrograma"));
					objeto.setCodigoPrograma(rs.getShort("codigoPrograma"));
					objeto.setCodigoSubprograma(rs.getShort("codigoSubprograma"));
					objeto.setCodigoProyecto(rs.getShort("codigoProyecto"));
					objeto.setNombreProyecto("");
					objeto.setAbrevProyecto("");
					objeto.setDescripcionProyecto("");
					objeto.setCodigoUnidadResponsable((short)0);
					objeto.setCodigoFuncional((short)0);
					objeto.setDiagnostico("");
					objeto.setResultadoEsperado("");
					objeto.setCodigoDepartamento((short)0);
					objeto.setCodigoSnip((short)0);
					objeto.setObjetivo_estrategico_id((short)0);
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
		}
		public static List<Proyecto> selectAllProducto(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();String query = " select * from proyecto "+condition;
		 	
			 Statement statement = null; ResultSet rs=null;
			 List<Proyecto> objetos = new ArrayList<Proyecto>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					Proyecto objeto = new Proyecto();
					//objeto.setNumeroFila(rs.getShort("numeroFila"));
					objeto.setAnio(rs.getShort("anho"));
					objeto.setNivel(rs.getShort("subprograma_programa_entidad_nivel_id"));
					objeto.setEntidad(rs.getShort("subprograma_programa_entidad_id"));
					objeto.setTipoPrograma(rs.getShort("subprograma_programa_tipo_presupuesto_id"));
					objeto.setCodigoPrograma(rs.getShort("subprograma_programa_id"));
					objeto.setCodigoSubprograma(rs.getShort("subprograma_id"));
					objeto.setCodigoProyecto(rs.getShort("id"));
					objeto.setNombreProyecto(rs.getString("nombre"));
					objeto.setAbrevProyecto(rs.getString("abrev"));
					objeto.setDescripcionProyecto(rs.getString("descripcion"));
					objeto.setCodigoUnidadResponsable(rs.getShort("unidad_responsable_id"));
					objeto.setCodigoFuncional(rs.getShort("funcional_id"));
					objeto.setDiagnostico(rs.getString("diagnostico"));
					objeto.setResultadoEsperado(rs.getString("resultado_esperado"));
					objeto.setCodigoDepartamento(rs.getShort("codigo_departamento"));
					objeto.setCodigoSnip(rs.getShort("codigo_snip"));
					objeto.setObjetivo_estrategico_id(rs.getShort("objetivo_estrategico_id"));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
		}
		public static List<ProductoPresupuesto> selectAllProductosPresupuesto(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();String query = " select * from producto_presupusto "+condition+ " order by producto_id asc";
		 	
			 Statement statement = null; ResultSet rs=null;
			 List<ProductoPresupuesto> objetos = new ArrayList<ProductoPresupuesto>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					ProductoPresupuesto objeto = new ProductoPresupuesto();
					//objeto.setNumeroFila(rs.getShort("numeroFila"));
					objeto.setId(rs.getShort("id"));
					objeto.setNumero_fila(rs.getShort("numero_fila"));
					objeto.setAnho(rs.getShort("anho"));
					objeto.setProducto_id(rs.getShort("producto_id"));
					objeto.setUnidad_medida_id(rs.getShort("producto_unidad_medida_id"));
					objeto.setProyecto_id(rs.getShort("proyecto_id"));
					objeto.setSubprograma_id(rs.getShort("proyecto_subprograma_id"));
					objeto.setPrograma_id(rs.getShort("proyecto_subprograma_programa_id"));
					objeto.setTipo_presupuesto_id(rs.getShort("proyecto_subprograma_programa_tipo_presupuesto_id"));
					objeto.setEntidad_id(rs.getShort("proyecto_subprograma_programa_entidad_id"));
					objeto.setNivel_id(rs.getShort("proyecto_subprograma_programa_entidad_nivel_id"));
					objeto.setIntermedio(rs.getBoolean("intermedio"));
					objeto.setVersion(rs.getShort("version"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
}
		public static String selectAllProductosPresupuestoPND(String condition)  throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();			
			
			String query =  "	select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
							"		select p.id as producto_id " +
							"		from producto_presupusto p " +
							"		join proyecto py " +
							"			ON py.id = p.proyecto_id " +
							"			and py.subprograma_id = p.proyecto_subprograma_id " +
							"			and py.subprograma_programa_id = p.proyecto_subprograma_programa_id " +
							"			and py.subprograma_programa_tipo_presupuesto_id = p.proyecto_subprograma_programa_tipo_presupuesto_id " + 
							"			and py.subprograma_programa_entidad_id = p.proyecto_subprograma_programa_entidad_id " +
							" 			and py.subprograma_programa_entidad_nivel_id = p.proyecto_subprograma_programa_entidad_nivel_id " +
							"		JOIN unidad_responsable ur " +
							"			ON ur.id = py.unidad_responsable_id " +
							"			and ur.entidad_id = py.subprograma_programa_entidad_id " +
							"			and ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id " + condition +
							"		group by p.id " +
							"		order by p.id " +
							"	)t ";
					
					
			Statement statement = null;
	   		ResultSet rs=null;
	   		
	   		String objetos = "";

	    		try {
	    			statement = conect.createStatement();
	    			rs=statement.executeQuery(query);
	    			while(rs.next()){
	    				objetos+=rs.getString("resultado");
	    			}
	    		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
		}

	    public static List<UnidadResponsable> selectAllUnidadResponsable(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select * from unidad_responsable where true and not borrado "+condition+" order by entidad_nivel_id, entidad_id, id";
	   		   		 
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<UnidadResponsable> objetos = new ArrayList<UnidadResponsable>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				UnidadResponsable objeto = new UnidadResponsable();
	   				objeto.setUnrCodigo(rs.getShort("id"));
	   				objeto.setUnrNombre(rs.getString("nombre"));
	   				objeto.setUnrAbrev(rs.getString("abrev"));
	   				objeto.setEntidad(rs.getShort("entidad_id"));
	   				objeto.setNivel(rs.getShort("entidad_nivel_id"));
	   				objeto.setUjeCodigo(rs.getInt("unidad_jerarquica_id"));
	   				
	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }
	    
	    public static String selectAllUnidadResponsablePND(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		   		 
		   		String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
		   				" select distinct(p.unidad_responsable_id) AS \"unrCodigo\", ur.nombre AS \"unrNombre\", ur.abrev AS \"unrAbrev\" "+
	   					" from proyecto as p"+
	   					"	JOIN unidad_responsable as ur ON ur.id = p.unidad_responsable_id and ur.entidad_nivel_id = p.subprograma_programa_entidad_nivel_id and ur.entidad_id = p.subprograma_programa_entidad_id"+
	   					"	where true and not p.borrado and not ur.borrado "+condition+" order by p.unidad_responsable_id"+
		   				")t";

	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		
	   		 String objetos = "";

	    		try {
	    			statement = conect.createStatement();
	    			rs=statement.executeQuery(query);
	    			while(rs.next()){
	    				objetos+=rs.getString("resultado");
	    			}
	    		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }
	    
	    public static List<UnidadJerarquica> selectAllUnidadJerarquica(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select * from unidad_jerarquica "+condition;
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<UnidadJerarquica> objetos = new ArrayList<UnidadJerarquica>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				UnidadJerarquica objeto = new UnidadJerarquica();
	   				objeto.setUnJerId(rs.getInt("id"));
	   				objeto.setUnJerNombre(rs.getString("nombre"));
	   				objeto.setUniJerDescrip(rs.getString("descipcion"));
	   				objeto.setUnJerEntidadId(rs.getInt("entidad_id"));
	   				objeto.setUnJerEntidadNivelId(rs.getInt("entidad_nivel_id"));
	   				objeto.setUnJerAnho(rs.getInt("anho"));
	   				objeto.setUnJeraNumeroFila(rs.getInt("numero_fila"));
	   				objeto.setUnJeraBorrado(rs.getBoolean("borrado"));
	   				
	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }
	    
	    
	    public static List<EstructuraProgramatica> selectAllEstructuraProgramatica(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select * from estructura_programatica "+condition;
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<EstructuraProgramatica> objetos = new ArrayList<EstructuraProgramatica>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				EstructuraProgramatica objeto = new EstructuraProgramatica();
	   				objeto.setId(rs.getShort("id"));
	   				objeto.setAnho(rs.getShort("anho"));
	   				objeto.setNivel(rs.getShort("nivel"));
	   				objeto.setEntidad(rs.getShort("entidad"));
	   				objeto.setTipo(rs.getShort("tipo"));
	   				objeto.setPrograma(rs.getShort("programa"));
	   				objeto.setSubprograma(rs.getShort("subprograma"));
	   				objeto.setProyecto(rs.getShort("proyecto"));
	   				objeto.setNfprograma(rs.getShort("nfprograma"));
	   				objeto.setNfsubprograma(rs.getShort("nfsubprograma"));
	   				objeto.setNfproyecto(rs.getShort("nfproyecto"));
	   				objeto.setDepartamento(rs.getShort("departamento"));
	   				objeto.setUnidad_responsable(rs.getShort("unidad_responsable"));
	   				objeto.setFuncional(rs.getShort("funcional"));
	   				objeto.setDiagnostico(rs.getString("diagnostico"));
	   				objeto.setBase_legal(rs.getString("base_legal"));
	   				objeto.setNombre(rs.getString("nombre"));
	   				objeto.setAbrev(rs.getString("abrev"));
	   				objeto.setDescripcion(rs.getString("descripcion"));
	   				
	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }
	    
	    public static List<Resultado> selectAllResultados(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select * from objetivo "+condition;
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<Resultado> objetos = new ArrayList<Resultado>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				Resultado objeto = new Resultado();
	   				objeto.setId(rs.getShort("id"));
	   				objeto.setNombre(rs.getString("nombre"));
	   				objeto.setDescripcion(rs.getString("descripcion"));
	   				objeto.setTipo_objetivo_id(rs.getShort("tipo_objetivo_id"));
	   				objeto.setVersion(rs.getShort("version"));
	   				objeto.setAnho(rs.getShort("anho"));
	   				objeto.setBorradoInt(rs.getShort("borrado_int"));
	   				objeto.setBorrado(rs.getBoolean("borrado"));
	   				
	   				objeto.setNivel(rs.getShort("nivel"));
	   				objeto.setEntidad(rs.getShort("entidad"));
	   				objeto.setTipo_presupuesto(rs.getShort("tipo_presupuesto"));
	   				objeto.setPrograma(rs.getShort("programa"));
	   				objeto.setSubprograma(rs.getShort("subprograma"));
	   				objeto.setProyecto(rs.getShort("proyecto"));
	   				objeto.setFuncional(rs.getShort("funcional"));

	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }
	    
	    public static List<Resultado> selectAllResultadosParaHacienda(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select objetivo.* from objetivo_has_objetivo oho  "+
	   				 "inner join objetivo on objetivo.id = oho.objetivo_rel_id and objetivo.tipo_objetivo_id= 2 and objetivo.anho=2016"+
	   				 condition+
	   				 "order by oho.colaboracion DESC, oho.influencia DESC";
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<Resultado> objetos = new ArrayList<Resultado>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				Resultado objeto = new Resultado();
	   				objeto.setId(rs.getShort("id"));
	   				objeto.setNombre(rs.getString("nombre"));
	   				objeto.setDescripcion(rs.getString("descripcion"));
	   				objeto.setTipo_objetivo_id(rs.getShort("tipo_objetivo_id"));
	   				objeto.setVersion(rs.getShort("version"));
	   				objeto.setAnho(rs.getShort("anho"));
	   				objeto.setBorradoInt(rs.getShort("borrado_int"));
	   				objeto.setBorrado(rs.getBoolean("borrado"));
	   				
	   				objeto.setNivel(rs.getShort("nivel"));
	   				objeto.setEntidad(rs.getShort("entidad"));
	   				objeto.setTipo_presupuesto(rs.getShort("tipo_presupuesto"));
	   				objeto.setPrograma(rs.getShort("programa"));
	   				objeto.setSubprograma(rs.getShort("subprograma"));
	   				objeto.setProyecto(rs.getShort("proyecto"));
	   				objeto.setFuncional(rs.getShort("funcional"));

	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }	
	    
	    //Utilizado en el CRUD de objetivos
	    public static List<Objetivo> selectObjetivos(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select * from objetivo "+condition+" order by nombre asc";
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<Objetivo> objetos = new ArrayList<Objetivo>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				Objetivo objeto = new Objetivo();
	   				objeto.setId(rs.getInt("id"));
	   				if (rs.getString("nombre") != null) objeto.setNombre(rs.getString("nombre").trim().toUpperCase());
	   				if (rs.getString("descripcion") != null) objeto.setDescripcion(rs.getString("descripcion"));
	   				objeto.setTipo_objetivo_id(rs.getInt("tipo_objetivo_id"));
	   				objeto.setVersion(rs.getInt("version"));
	   				objeto.setAnho(rs.getInt("anho"));
	   				objeto.setBorradoInt(rs.getInt("borrado_int"));
	   				objeto.setBorrado(rs.getBoolean("borrado"));
	   				
	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{

	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	      }	    	  
	    

	    public static List<TipoObjetivo> selectAllTiposObjetivos(String condition) throws SQLException{
	     	 Connection conect=ConnectionConfiguration.conectar();
	  		 String query = " select * from tipo_objetivo "+condition;
	  		 Statement statement = null;
	  		 ResultSet rs=null;
	  		 List<TipoObjetivo> objetos = new ArrayList<TipoObjetivo>();

	  		try {
	  			statement = conect.createStatement();
	  			rs=statement.executeQuery(query);
	  			while(rs.next()){
	  				TipoObjetivo objeto = new TipoObjetivo();
	  				
	  				objeto.setId(rs.getInt("id"));
	   				objeto.setNombre(rs.getString("nombre"));
	   				objeto.setDescripcion(rs.getString("descripcion"));
	   				objeto.setBorrado(rs.getBoolean("borrado"));
	   				
	  				objetos.add(objeto);
	  			}
	  		}
	  		catch (SQLException e) {e.printStackTrace();}
	  		finally{
	  			if (statement != null) {statement.close();}
	  			if (conect != null) {conect.close();}
	  		}
	  		return objetos;
	     }
	    
	    public static String selectAllObjetivosAbreviacion(String condition) throws SQLException{
			Connection conect=ConnectionConfiguration.conectar();
			String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
						   " select * from objetivo_abreviacion "+ condition + 
						   " )t"; 
										
			Statement statement = null;
			ResultSet rs=null;
			String objetos = "";

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){				   				
					objetos+=rs.getString("resultado");
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
	  		
	  	}
	    
	    public static List<ProductoPresupuestoDestinatario> selectProductoPresupuestoDestinatario(String condition) throws SQLException{
	      	 Connection conect=ConnectionConfiguration.conectar();
	   		 String query = " select d.*,c.nombre from catalogo_destinatario c ,producto_presupuesto_destinatario d "+condition+" and c.id = d.catalogo_destinatario";
	   		 
	   		 Statement statement = null;
	   		 ResultSet rs=null;
	   		 List<ProductoPresupuestoDestinatario> objetos = new ArrayList<ProductoPresupuestoDestinatario>();

	   		try {
	   			statement = conect.createStatement();
	   			rs=statement.executeQuery(query);
	   			while(rs.next()){
	   				ProductoPresupuestoDestinatario objeto = new ProductoPresupuestoDestinatario();

	   				objeto.setId(rs.getInt("id"));
	   				objeto.setNivel(rs.getInt("nivel"));
	   				objeto.setEntidad(rs.getInt("entidad"));
	   				objeto.setTipo_presupuesto(rs.getInt("tipo_presupuesto"));
	   				objeto.setPrograma(rs.getInt("programa"));
	   				objeto.setSubprograma(rs.getInt("subprograma"));
	   				objeto.setProyecto(rs.getInt("proyecto"));
	   				objeto.setProducto(rs.getInt("producto"));
	   				objeto.setCatalogo_destinatario(rs.getInt("catalogo_destinatario"));
	   				objeto.setDepartamento(rs.getInt("departamento"));
	   				objeto.setCantidad(rs.getDouble("cantidad")); 
	   				objeto.setNombreCatalogo(rs.getString("nombre"));
	   				
	   				objetos.add(objeto);
	   			}
	   		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	     }
	    
	    public static List<SumaDepartamentoN> selectAllSumaDepartamentoN(String condition) throws SQLException{
	   	 	Connection conect=ConnectionConfiguration.conectar();
	   	 	String query = " select * from v_depto_suma "+condition;
	   	 	
			 Statement statement = null;
			 ResultSet rs=null;
			 List<SumaDepartamentoN> objetos = new ArrayList<SumaDepartamentoN>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					SumaDepartamentoN objeto = new SumaDepartamentoN();
					
					
					objeto.setNivel(rs.getInt("nivel_id"));
					objeto.setEntidad(rs.getInt("entidad_id"));
					objeto.setTipoPresupuesto(rs.getInt("tipo_presupuesto_id"));
					objeto.setPrograma(rs.getInt("programa_id"));
					objeto.setSubprograma(rs.getInt("subprograma_id"));
					objeto.setProyecto(rs.getInt("proyecto_id"));
					objeto.setProducto(rs.getInt("producto_id"));
					objeto.setAnho(rs.getInt("anho"));
					objeto.setDepartamento(rs.getInt("departamento_id"));
					objeto.setSuma(rs.getDouble("sum_cantidad"));
								
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
	   }
	    public static List<DeptoTop> selectAllDeptoTop(String condition) throws SQLException{
	   	 	Connection conect=ConnectionConfiguration.conectar();
	   	 	String query = " select * from v_depto_top "+condition;
	   	 	
			 Statement statement = null;
			 ResultSet rs=null;
			 List<DeptoTop> objetos = new ArrayList<DeptoTop>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					DeptoTop objeto = new DeptoTop();
					
					
					objeto.setNivel(rs.getInt("nivel_id"));
					objeto.setEntidad(rs.getInt("entidad_id"));
					objeto.setTipoPresupuesto(rs.getInt("tipo_presupuesto_id"));
					objeto.setPrograma(rs.getInt("programa_id"));
					objeto.setSubprograma(rs.getInt("subprograma_id"));
					objeto.setProyecto(rs.getInt("proyecto_id"));
					objeto.setProducto(rs.getInt("producto_id"));
					objeto.setAnio(rs.getInt("anho"));
					objeto.setDepartamento(rs.getInt("departamento_id"));
					objeto.setSuma(rs.getDouble("macantidad"));
								
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
	   }
	   
	    public static List<SumaMes> selectAllSumaMes(String condition) throws SQLException{
	   	 	Connection conect=ConnectionConfiguration.conectar();
	   	 	String query = " select * from v_mes_suma "+condition;
	   	 	
			 Statement statement = null;
			 ResultSet rs=null;
			 List<SumaMes> objetos = new ArrayList<SumaMes>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				
				while(rs.next()){
					SumaMes objeto = new SumaMes();
					
					
					objeto.setNivel(rs.getInt("nivel_id"));
					objeto.setEntidad(rs.getInt("entidad_id"));
					objeto.setTipoPresupuesto(rs.getInt("tipo_presupuesto_id"));
					objeto.setPrograma(rs.getInt("programa_id"));
					objeto.setSubprograma(rs.getInt("subprograma_id"));
					objeto.setProyecto(rs.getInt("proyecto_id"));
					objeto.setProducto(rs.getInt("producto_id"));
					objeto.setAnio(rs.getInt("anho"));
					objeto.setMes(rs.getInt("mes"));
					objeto.setSuma(rs.getDouble("sumcantidad"));
								
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			finally{
				
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos;
	   }
	    public static List<ResultadoIndicadorMeta> selectAllResultadoIndicadorMeta (String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from resultado_indicador_meta "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<ResultadoIndicadorMeta> objetos = new ArrayList<ResultadoIndicadorMeta>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
			    	ResultadoIndicadorMeta objeto = new ResultadoIndicadorMeta();
		
		
			    	objeto.setNivelId(rs.getInt("nivel_id"));
			    	objeto.setNivelNombre(rs.getString("nivel_nombre"));
			    	objeto.setEntidadId(rs.getInt("entidad_id"));
			    	objeto.setEntidadNombre(rs.getString("entidad_Nombre"));
			    	objeto.setTipoId(rs.getInt("tipo_id"));
			    	objeto.setTipoNombre(rs.getString("tipo_nombre"));
			    	objeto.setProgramaId(rs.getInt("programa_id"));
			    	objeto.setProgramaNombre(rs.getString("programa_nombre"));
			    	objeto.setProgramaAbrev(rs.getString("programa_abrev"));
			    	objeto.setProgramaDescripcion(rs.getString("programa_descripcion"));
			    	objeto.setProgramaObjetivo(rs.getString("programa_objetivo"));
			    	objeto.setProgramaDiagnostico(rs.getString("programa_diagnostico"));
			    	objeto.setProgramaBaseLegal(rs.getString("programa_base_legal"));
			    	objeto.setProgramaResultado(rs.getString("programa_resultado"));
			    	objeto.setProgramaCodDepartamento(rs.getInt("programa_depto_cod"));
			    	objeto.setProgramaNombreDepartamento(rs.getString("programa_depto_nomb"));
			    	objeto.setSubprogramaId(rs.getInt("subprograma_id"));
			    	objeto.setSubprogramaNombre(rs.getString("subprograma_nombre"));
			    	objeto.setSubprogramaAbrev(rs.getString("subprograma_abrev"));
			    	objeto.setSubprogramaDescripcion(rs.getString("subprograma_descripcion"));
			    	objeto.setSubprogramaObjetivo(rs.getString("subprograma_objetivo"));
			    	objeto.setSubprogramaDeptoCod(rs.getInt("subprograma_depto_cod"));
			    	objeto.setSubprogramaDeptoNomb(rs.getString("subprograma_depto_nomb"));
			    	objeto.setSubprogramaBaseLegal(rs.getString("subprograma_base_legal"));
			    	objeto.setProyectoId(rs.getInt("proyecto_id"));
			    	objeto.setProyectoNombre(rs.getString("proyecto_nombre"));
			    	objeto.setProyectoAbrev(rs.getString("proyecto_abrev"));
			    	objeto.setProyectoUnidadResponsableId(rs.getInt("proyecto_unidad_responsable_id"));
			    	objeto.setProyectoUnidadResponsableNombre(rs.getString("proyecto_unidad_responsable_nombre"));
			    	objeto.setProyectoUnidadResponsableAbrev(rs.getString("proyecto_unidad_responsable_abrev"));
			    	objeto.setProyectoFuncionalId(rs.getInt("proyecto_funcional_id"));
			    	objeto.setProyectoFuncionalNombre(rs.getString("proyecto_funcional_nombre"));
			    	objeto.setProyectoDiagnostico(rs.getString("proyecto_diagnostico")); 
			    	objeto.setProyectoDeptoCod(rs.getInt("proyecto_depto_cod"));
			    	objeto.setProyectoDeptoNomb(rs.getString("proyecto_depto_nomb"));
			    	objeto.setProyectoObjetivoEstrategicoCod(rs.getInt("proyecto_obj_est_id"));
			    	objeto.setProyectoObjetivoEstrategicoNombre(rs.getString("proyecto_obj_est_nomb"));
			    	objeto.setEstrategiaCod(rs.getInt("estrategia_cod"));
			    	objeto.setEstrategiaNombre(rs.getString("estrategia_nombre"));
			    	objeto.setEjeEstrategicoCod(rs.getInt("eje_estrategico_cod"));
			    	objeto.setEjeEstrategicoNombre(rs.getString("eje_estrategico_nombre"));
			    	objeto.setLineaTransversalCod(rs.getInt("linea_transversal_cod"));
			    	objeto.setLineaTransversalNombre(rs.getString("linea_transversal_nombre"));
			    	objeto.setProyectoSnipCod(rs.getInt("proyecto_snip_cod"));
			    	objeto.setProyectoSnipNombre(rs.getString("proyecto_snip_nombre")); 
			    	objeto.setResultadoId(rs.getInt("resultado_id"));
			    	objeto.setResultadoNombre(rs.getString("resultado_nombre"));
			    	objeto.setIndicadorId(rs.getInt("indicador_id"));
			    	objeto.setIndicadorNombre(rs.getString("indicador_nombre"));
			    	objeto.setUnidadMedidaId(rs.getInt("unidad_medida_id"));
			    	objeto.setUnidadMedidaNombre(rs.getString("unidad_medida_nombre"));
			    	objeto.setMetaVencimiento(rs.getString("meta_vencimiento"));
			    	objeto.setMetaCantidad(rs.getString("meta_cantidad"));
		
		
			    	objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}	    
	    
	    
	    public static List<MatrizPnd> selectAllMatrizPnd ()throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = "select linea_transversal.id as linea_id, linea_transversal.nombre as linea_nombre, eje_estrategico.id as eje_id, eje_estrategico.nombre as eje_nombre, estrategia.id as estrategia_id, estrategia.nombre as estrategia_nombre "+
	    				   "from estrategia "+
	    				   "inner join linea_transversal on estrategia.linea_transversal_id = linea_transversal.id "+
	    				   "inner join eje_estrategico on estrategia.eje_estrategico_id = eje_estrategico.id "+
	    				   "where  estrategia.plan =9 "; 

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<MatrizPnd> objetos = new ArrayList<MatrizPnd>();

	    	try {
	    	statement = conect.createStatement();
	    	rs=statement.executeQuery(query);

	    	while(rs.next()){
	    		MatrizPnd objeto = new MatrizPnd();


	    	objeto.setLineaId(rs.getInt("linea_id"));
	    	objeto.setLineaNombre(rs.getString("linea_nombre"));
	    	objeto.setEjeId(rs.getInt("eje_id"));
	    	objeto.setEjeNombre(rs.getString("eje_nombre"));
	    	objeto.setEstrategiaId(rs.getInt("estrategia_id"));
	    	objeto.setEstrategiaNombre(rs.getString("estrategia_nombre"));
	 
	    	objetos.add(objeto);
	    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

	    	if (statement != null) {statement.close();}
	    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}		    
	    
	    public static List<Estructura> selectAllEstructura (String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from estructura "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<Estructura> objetos = new ArrayList<Estructura>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		Estructura objeto = new Estructura();
		    		objeto.setId(rs.getInt("id"));
			    	objeto.setNivel(rs.getInt("nivel"));
			    	objeto.setEntidad(rs.getInt("entidad"));
			    	objeto.setTipo(rs.getInt("tipo"));
			    	objeto.setPrograma(rs.getInt("programa"));
			    	objeto.setSubprograma(rs.getInt("subprograma"));
			    	objeto.setProyecto(rs.getInt("proyecto"));
			    	objeto.setVersion(rs.getInt("version"));
			    	objeto.setAnho(rs.getInt("anho"));

			    	objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}
	   
	    public static List<EstructuraFinanciera> selectAllEstructuraFinanciera (String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from estructura_financiera "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<EstructuraFinanciera> objetos = new ArrayList<EstructuraFinanciera>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		EstructuraFinanciera objeto = new EstructuraFinanciera();
		    		objeto.setId(rs.getInt("id"));
		    		objeto.setEstructura(rs.getInt("estructura"));
			    	objeto.setMes(rs.getInt("mes"));
			    	objeto.setProducto(rs.getInt("producto"));
			    	objeto.setPlanificado(rs.getDouble("ejecutado"));
			    	objeto.setEjecutado(rs.getDouble("programado"));

			    	objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}
	    
	    public static List<PresupuestoIngreso> selectAllPresupuestoIngreso (String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from presupuesto_ingreso "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<PresupuestoIngreso> objetos = new ArrayList<PresupuestoIngreso>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		PresupuestoIngreso objeto = new PresupuestoIngreso();
		    		objeto.setId(rs.getInt("id"));
		    		objeto.setNumeroFila(rs.getInt("numero_fila"));
		    		objeto.setVersion(rs.getInt("version"));
			    	objeto.setAnho(rs.getInt("anho"));
		    		objeto.setNivel(rs.getInt("nivel"));
			    	objeto.setEntidad(rs.getInt("entidad"));
			    	objeto.setOrigen(rs.getInt("origen"));
			    	objeto.setDetalle(rs.getInt("detalle"));
			    	objeto.setFuente_financiamiento(rs.getInt("fuente_financiamiento"));
			    	objeto.setMonto_presupuestado(rs.getDouble("monto_presupuetado"));
			    	

			    	objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}
	    public static List<PresupuestoGasto> selectAllPresupuestoGasto (String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from presupuesto_gasto "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<PresupuestoGasto> objetos = new ArrayList<PresupuestoGasto>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		PresupuestoGasto objeto = new PresupuestoGasto();
		    		objeto.setId(rs.getInt("id"));
		    		objeto.setEstructura(rs.getInt("estructura_id"));
			    	objeto.setFuente_financiamiento(rs.getInt("fuente_financiamiento"));
		    		objeto.setOrganismo_financiador(rs.getInt("organismo_dfinanciador"));
			    	objeto.setPais(rs.getInt("pais"));
			    	objeto.setDepto(rs.getInt("depto"));
			    	objeto.setVer_programado(rs.getDouble("ver_programado"));
			    	objeto.setVer_justificado(rs.getString("ver_justificado"));			    	

			    	objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}
	    
	    public static List<Fundamentacion> selectAllFundamentacion (String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from fundamentacion "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<Fundamentacion> objetos = new ArrayList<Fundamentacion>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		Fundamentacion objeto = new Fundamentacion();
		    		objeto.setId(rs.getInt("id"));
		    		objeto.setEstructura(rs.getInt("estructura_id"));
			    	objeto.setObjetoGasto(rs.getInt("objeto_gasto"));
		    		objeto.setFuenteFinanciamiento(rs.getInt("fuente_financiamiento"));
			    	objeto.setOrganismoFinanciadro(rs.getInt("org_financiador"));
			    	objeto.setPais(rs.getInt("pais"));
			    	objeto.setDepto(rs.getInt("depto"));
			    	objeto.setSecuencia(rs.getInt("secuencia"));
			    	objeto.setPrecio(rs.getDouble("precio"));
			    	objeto.setCantidad(rs.getInt("cantidad"));
			    	objeto.setCantidad_meses(rs.getInt("cantidad_meses"));
			    	objeto.setDescripcion(rs.getString("descripcion"));
			    	objeto.setClgCodigo(rs.getInt("clgCodigo"));
			    	objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}
	    
	    public static List<AsignacionPresi> selectAllAsignacionPresi(String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from asignacion_presi "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<AsignacionPresi> objetos = new ArrayList<AsignacionPresi>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		AsignacionPresi objeto = new AsignacionPresi();
		    		objeto.setFila(rs.getInt("fila"));
		    		objeto.setNivel(rs.getInt("nivel"));
		    		objeto.setEntidad(rs.getInt("entidad"));
		    		objeto.setTipo(rs.getInt("tipo"));
		    		objeto.setPrograma(rs.getInt("programa"));
		    		objeto.setSubPrograma(rs.getInt("subprograma"));
		    		objeto.setProyecto(rs.getInt("proyecto"));
		    		objeto.setObjetoGasto(rs.getInt("objeto_gasto"));
		    		objeto.setFuenteFinanciamiento(rs.getInt("fuente_financiamiento"));
		    		objeto.setOrganismoFinanciador(rs.getInt("organismo_financiador"));	    
		    		objeto.setPais(rs.getInt("pais"));
		    		objeto.setDepartamento(rs.getInt("departamento"));
		    		objeto.setProducto(rs.getInt("producto"));
		    		objeto.setObservacion(rs.getString("observacion"));
		    		objeto.setPlanificado1(rs.getDouble("planificado1"));
		    		objeto.setEjecutado1(rs.getDouble("ejecutado1"));
		    		objeto.setPlanificado2(rs.getDouble("planificado2"));
		    		objeto.setEjecutado2(rs.getDouble("ejecutado2"));
		    		objeto.setPlanificado3(rs.getDouble("planificado3"));
		    		objeto.setEjecutado3(rs.getDouble("ejecutado3"));
		    		objeto.setPlanificado4(rs.getDouble("planificado4"));
		    		objeto.setEjecutado4(rs.getDouble("ejecutado4"));
		    		objeto.setPlanificado5(rs.getDouble("planificado5"));
		    		objeto.setEjecutado5(rs.getDouble("ejecutado5"));
		    		objeto.setPlanificado6(rs.getDouble("planificado6"));
		    		objeto.setEjecutado6(rs.getDouble("ejecutado6"));
		    		objeto.setPlanificado7(rs.getDouble("planificado7"));
		    		objeto.setEjecutado7(rs.getDouble("ejecutado7"));
		    		objeto.setPlanificado8(rs.getDouble("planificado8"));
		    		objeto.setEjecutado8(rs.getDouble("ejecutado8"));
		    		objeto.setPlanificado9(rs.getDouble("planificado9"));
		    		objeto.setEjecutado9(rs.getDouble("ejecutado9"));
		    		objeto.setPlanificado10(rs.getDouble("planificado10"));
		    		objeto.setEjecutado10(rs.getDouble("ejecutado10"));
		    		objeto.setPlanificado11(rs.getDouble("planificado11"));
		    		objeto.setEjecutado11(rs.getDouble("ejecutado11"));
		    		objeto.setPlanificado12(rs.getDouble("planificado12"));
		    		objeto.setEjecutado12(rs.getDouble("ejecutado12"));
		    		objeto.setAnho(rs.getInt("anho"));
		    		objeto.setVersion(rs.getInt("version"));
		    		objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}	
	    
	    //Obtenemos la ultima version esta de manera estatica en el query
//	    public static List<AsignacionPresi> selectAllAsignacionPresiVersion(String condicion, String condicion2)throws SQLException{
//	    	Connection conect=ConnectionConfiguration.conectar();
//
//	    	//String query = " select * from asignacion_presi "+condicion+" and anho = 2016 and version = (select max(p.version) from asignacion_presi p "+condicion2+" and p.anho = 2016)";
//	    	String query = " select * from asignacion_presi "+condicion+" and version = (select max(p.version) from asignacion_presi p "+condicion2+")";
//
//
//
//	    	Statement statement = null;
//	    	ResultSet rs=null;
//	    	List<AsignacionPresi> objetos = new ArrayList<AsignacionPresi>();
//
//	    	try {
//		    	statement = conect.createStatement();
//		    	rs=statement.executeQuery(query);
//	
//		    	while(rs.next()){
//		    		
//		    		AsignacionPresi objeto = new AsignacionPresi();
//		    		objeto.setFila(rs.getInt("fila"));
//		    		objeto.setNivel(rs.getInt("nivel"));
//		    		objeto.setEntidad(rs.getInt("entidad"));
//		    		objeto.setTipo(rs.getInt("tipo"));
//		    		objeto.setPrograma(rs.getInt("programa"));
//		    		objeto.setSubPrograma(rs.getInt("subprograma"));
//		    		objeto.setProyecto(rs.getInt("proyecto"));
//		    		objeto.setObjetoGasto(rs.getInt("objeto_gasto"));
//		    		objeto.setFuenteFinanciamiento(rs.getInt("fuente_financiamiento"));
//		    		objeto.setOrganismoFinanciador(rs.getInt("organismo_financiador"));	    
//		    		objeto.setPais(rs.getInt("pais"));
//		    		objeto.setDepartamento(rs.getInt("departamento"));
//		    		objeto.setProducto(rs.getInt("producto"));
//		    		objeto.setObservacion(rs.getString("observacion"));
//		    		objeto.setPlanificado1(rs.getDouble("planificado1"));
//		    		objeto.setEjecutado1(rs.getDouble("ejecutado1"));
//		    		objeto.setPlanificado2(rs.getDouble("planificado2"));
//		    		objeto.setEjecutado2(rs.getDouble("ejecutado2"));
//		    		objeto.setPlanificado3(rs.getDouble("planificado3"));
//		    		objeto.setEjecutado3(rs.getDouble("ejecutado3"));
//		    		objeto.setPlanificado4(rs.getDouble("planificado4"));
//		    		objeto.setEjecutado4(rs.getDouble("ejecutado4"));
//		    		objeto.setPlanificado5(rs.getDouble("planificado5"));
//		    		objeto.setEjecutado5(rs.getDouble("ejecutado5"));
//		    		objeto.setPlanificado6(rs.getDouble("planificado6"));
//		    		objeto.setEjecutado6(rs.getDouble("ejecutado6"));
//		    		objeto.setPlanificado7(rs.getDouble("planificado7"));
//		    		objeto.setEjecutado7(rs.getDouble("ejecutado7"));
//		    		objeto.setPlanificado8(rs.getDouble("planificado8"));
//		    		objeto.setEjecutado8(rs.getDouble("ejecutado8"));
//		    		objeto.setPlanificado9(rs.getDouble("planificado9"));
//		    		objeto.setEjecutado9(rs.getDouble("ejecutado9"));
//		    		objeto.setPlanificado10(rs.getDouble("planificado10"));
//		    		objeto.setEjecutado10(rs.getDouble("ejecutado10"));
//		    		objeto.setPlanificado11(rs.getDouble("planificado11"));
//		    		objeto.setEjecutado11(rs.getDouble("ejecutado11"));
//		    		objeto.setPlanificado12(rs.getDouble("planificado12"));
//		    		objeto.setEjecutado12(rs.getDouble("ejecutado12"));
//		    		objeto.setAnho(rs.getInt("anho"));
//		    		objeto.setVersion(rs.getInt("version"));
//		    		objetos.add(objeto);
//		    	}
//		    	
//		    	//en vez del sql, cargar de 		    	
//		    	//List<AsignFinanProducto> asignacionFinanciera = ClienteProyectoPresupuesto.obtenerProyectoAsignacionFinancieraProductos(anho, nivel, entidad, version);
//		    	
//	    	}
//	    	catch (SQLException e) {e.printStackTrace();}
//	    	finally{
//
//		    	if (statement != null) {statement.close();}
//		    	if (conect != null) {conect.close();}
//	    	}
//	    	return objetos;
//	    	}
	    
		public static List<AsignacionPresi> selectAllAsignacionPresiVersion(int anio, int nivel, int entidad, int version){

			List<AsignacionPresi> objetos = new ArrayList<AsignacionPresi>();
			
			List<AsignFinanProducto> lista = ClienteProyectoPresupuesto.obtenerProyectoAsignacionFinancieraProductos(anio, nivel, entidad, version);

		  
				for(Iterator<AsignFinanProducto> iterador = lista.iterator(); iterador.hasNext(); ) {
					AsignFinanProducto item = iterador.next();
				
					AsignacionPresi obj = new AsignacionPresi();	

					obj.setFila(item.getNumeroFila());
					obj.setNivel(item.getCodigoNivel());
					obj.setEntidad(item.getCodigoEntidad());
					obj.setTipo(item.getTipoPrograma());
					obj.setPrograma(item.getCodigoPrograma());
					obj.setSubPrograma(item.getCodigoSubprograma());
					obj.setProyecto(item.getCodigoProyecto());
					obj.setProducto(item.getCodigoProducto());
					obj.setObjetoGasto(item.getCodigoObjetoGasto());
					obj.setFuenteFinanciamiento(item.getCodigoFuenteFinan());
					obj.setOrganismoFinanciador(item.getCodigoOrgFinanciador());
					obj.setPais(item.getCodigoPais());
					obj.setDepartamento(item.getCodigoDepartamento());
					obj.setProducto(item.getCodigoProducto());
					obj.setObservacion(item.getObservacion());
					obj.setPlanificado1(item.getPlanificado1());
					obj.setEjecutado1(item.getEjecutado1());
					obj.setPlanificado2(item.getPlanificado2());
					obj.setEjecutado2(item.getEjecutado2());
					obj.setPlanificado3(item.getPlanificado3());
					obj.setEjecutado3(item.getEjecutado3());
					obj.setPlanificado4(item.getPlanificado4());
					obj.setEjecutado4(item.getEjecutado4());
					obj.setPlanificado5(item.getPlanificado5());
					obj.setEjecutado5(item.getEjecutado5());
					obj.setPlanificado6(item.getPlanificado6());
					obj.setEjecutado6(item.getEjecutado6());
					obj.setPlanificado7(item.getPlanificado7());
					obj.setEjecutado7(item.getEjecutado7());
					obj.setPlanificado8(item.getPlanificado8());
					obj.setEjecutado8(item.getEjecutado8());
					obj.setPlanificado9(item.getPlanificado9());
					obj.setEjecutado9(item.getEjecutado9());
					obj.setPlanificado10(item.getPlanificado10());
					obj.setEjecutado10(item.getEjecutado10());
					obj.setPlanificado11(item.getPlanificado11());
					obj.setEjecutado11(item.getEjecutado11());
					obj.setPlanificado12(item.getPlanificado12());
					obj.setEjecutado12(item.getEjecutado12());

					objetos.add(obj); 

				}		
			return objetos;
		}

	    public static List<AsignacionPresi> selectAllAsignacionPresiAnho(String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from version "+condicion+" ORDER BY anho DESC, nro DESC";

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<AsignacionPresi> objetos = new ArrayList<AsignacionPresi>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		AsignacionPresi objeto = new AsignacionPresi();
		    		objeto.setAnho(rs.getInt("anho"));
		    		objeto.setVersion(rs.getInt("nro"));

		    		objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}	
	    
	    public static List<AsignacionPresi> getAsignacionPresiAnhoProyecto(String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select distinct(anho) from asignacion_presi "+condicion+" ORDER BY anho DESC";

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<AsignacionPresi> objetos = new ArrayList<AsignacionPresi>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		AsignacionPresi objeto = new AsignacionPresi();
		    		objeto.setAnho(rs.getInt("anho"));
		    		
		    		objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}	

	    public static List<PresupuestoGastoPresi> selectAllPresupuestoGastoPresi(String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from presupuestogasto_presi "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<PresupuestoGastoPresi> objetos = new ArrayList<PresupuestoGastoPresi>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		PresupuestoGastoPresi objeto = new PresupuestoGastoPresi();
		    		objeto.setNivel(rs.getInt("Nivel"));
		    		objeto.setEntidad(rs.getInt("Entidad"));
		    		objeto.setTipo(rs.getInt("Tipo"));
		    		objeto.setPrograma(rs.getInt("Programa"));
		    		objeto.setProyecto(rs.getInt("Proyecto"));
		    		objeto.setObjeto(rs.getInt("Objeto"));
		    		objeto.setPais(rs.getInt("Pais"));
		    		objeto.setDepartamento(rs.getInt("Departamento"));
		    		objeto.setFuente(rs.getInt("Fuente"));
		    		objeto.setOrganismo(rs.getInt("Organismo"));
		    		objeto.setVerJustifica(rs.getString("VerJustifica"));
		    		objeto.setVerProgramado(rs.getDouble("VerProgramado"));
		    		objeto.setFila(rs.getInt("Fila"));
		    		objeto.setAnho(rs.getInt("Anho"));
		    		objeto.setVersion(rs.getInt("version"));
		    		objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}	    
	    public static List<PresupuestoIngresoPresi> selectAllPresupuestoIngresoPresi(String condicion)throws SQLException{
	    	Connection conect=ConnectionConfiguration.conectar();
	    	String query = " select * from presupuestoingreso_presi "+condicion;

	    	Statement statement = null;
	    	ResultSet rs=null;
	    	List<PresupuestoIngresoPresi> objetos = new ArrayList<PresupuestoIngresoPresi>();

	    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
	
		    	while(rs.next()){
		    		
		    		PresupuestoIngresoPresi objeto = new PresupuestoIngresoPresi();
		    		objeto.setNumeroFila(rs.getInt("numeroFila"));
		    		objeto.setAnio(rs.getInt("anio"));
		    		objeto.setNivel(rs.getInt("nivel"));
		    		objeto.setEntidad(rs.getInt("entidad"));
		    		objeto.setCodDetalle(rs.getInt("codDetalle"));
		    		objeto.setCodOrigen(rs.getInt("codOrigen"));
		    		objeto.setFuenteFinanc(rs.getInt("fuenteFinanc"));
		    		objeto.setMontoProgramado(rs.getDouble("montoProgramado"));
		    		objeto.setVersion(rs.getInt("version"));
		    		
		    		
		    		objetos.add(objeto);
		    	}
	    	}
	    	catch (SQLException e) {e.printStackTrace();}
	    	finally{

		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
	    	}
	    	return objetos;
	    	}

		    public static List<Generica> selectAllProductoTipoN(String condition) throws SQLException{
		      	 Connection conect=ConnectionConfiguration.conectar();
					String query = " select mes, cantidad from producto_presupuesto_meta "+condition+" and cantidad != 0";
		   		 Statement statement = null;
		   		 ResultSet rs=null;
		   		 List<Generica> objetos = new ArrayList<Generica>();
		   		 try {
		   			statement = conect.createStatement();
		   			rs=statement.executeQuery(query);
		   			while(rs.next()){
		   				Generica objeto = new Generica();
		   				
		   				/*objeto.setId(rs.getInt("id"));
		   				objeto.setMes(rs.getShort("mes"));
		   				objeto.setAnho(rs.getShort("anho"));
		   				objeto.setCantidad(rs.getDouble("cantidad"));
		   				objeto.setCatalogo_destianatario_id (rs.getInt("catalogo_destinatario_id"));
		   				objeto.setDepartamento(rs.getShort("departamento_id"));
		   				objeto.setProducto_presupusto_id(rs.getShort("producto_presupusto_id"));
		   				objeto.setProducto_id(rs.getShort("producto_id"));
		   				objeto.setUnidad_medida_id(rs.getShort("unidad_medida_id"));
		   				objeto.setProyecto_id(rs.getShort("proyecto_id"));
		   				objeto.setSubprograma_id(rs.getShort("subprograma_id"));
		   				objeto.setPrograma_id(rs.getShort("programa_id"));
		   				objeto.setTipo_presupuesto_id(rs.getShort("tipo_presupuesto_id"));
		   				objeto.setEntidad_id(rs.getShort("entidad_id"));
		   				objeto.setNivel_id(rs.getShort("nivel_id"));*/
		   				objeto.setClave(rs.getInt("mes"));
		   				objeto.setValor(rs.getDouble("cantidad"));
		   				objetos.add(objeto);
		   			}
		   		}
		   		catch (SQLException e) {e.printStackTrace();}
		   		finally{
		   			if (statement != null) {statement.close();}
		   			if (conect != null) {conect.close();}
		   		}
		   		return objetos;
		      }

		
		    public static List<ProductoUnidadMedida> selectAllProductoUnidadMedida(String condition) throws SQLException{
		      	 Connection conect=ConnectionConfiguration.conectar();
					String query = " select * from producto_unidad_medida "+condition;
		   		 Statement statement = null;
		   		 ResultSet rs=null;
		   		 List<ProductoUnidadMedida> objetos = new ArrayList<ProductoUnidadMedida>();
		   		 try {
		   			statement = conect.createStatement();
		   			rs=statement.executeQuery(query);
		   			while(rs.next()){
		   				ProductoUnidadMedida objeto = new ProductoUnidadMedida();
		   				
		   				objeto.setUnidadMedidaId(rs.getInt("unidad_medida_id"));
		   				objeto.setUnidadMedidaNombre(rs.getString("uni_nombre"));
		   				objetos.add(objeto);
		   			}
		   		}
		   		catch (SQLException e) {e.printStackTrace();}
		   		finally{
		   			if (statement != null) {statement.close();}
		   			if (conect != null) {conect.close();}
		   		}
		   		return objetos;
		      }
		    
		    public static List<ProductoPresupuestoFinanciero> selectProductoPresupuestoFinanciero(String condition) throws SQLException{
		      	 Connection conect=ConnectionConfiguration.conectar();
		   		 String query = " select * from producto_presupuesto_financiero"+condition;
		   		 
		   		 Statement statement = null;
		   		 ResultSet rs=null;
		   		 List<ProductoPresupuestoFinanciero> objetos = new ArrayList<ProductoPresupuestoFinanciero>();

		   		try {
		   			statement = conect.createStatement();
		   			rs=statement.executeQuery(query);
		   			while(rs.next()){
		   				ProductoPresupuestoFinanciero objeto = new ProductoPresupuestoFinanciero();

		   				objeto.setId(rs.getInt("id"));
		   				objeto.setNivel(rs.getInt("nivel"));
		   				objeto.setEntidad(rs.getInt("entidad"));
		   				objeto.setTipoPresupuesto(rs.getInt("tipo"));
		   				objeto.setPrograma(rs.getInt("programa"));
		   				objeto.setSubPrograma(rs.getInt("subprograma"));
		   				objeto.setProyecto(rs.getInt("proyecto"));
		   				objeto.setProducto(rs.getInt("producto_id"));
		   				objeto.setObjetoGastoId(rs.getInt("objeto_gasto_id"));
	   				
		   				objetos.add(objeto);
		   			}
		   		}
		   		catch (SQLException e) {e.printStackTrace();}
		   		finally{
		   			if (statement != null) {statement.close();}
		   			if (conect != null) {conect.close();}
		   		}
		   		return objetos;
		     }		    

		    public static List<ProductoFisico> selectAllProductoFisico(String condition) throws SQLException{
		    	Connection conect=ConnectionConfiguration.conectar();
		    	String query = " select * from producto_fisico "+condition;
		    	Statement statement = null;
		    	ResultSet rs=null;
		    	List<ProductoFisico> objetos = new ArrayList<ProductoFisico>();
		    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
		    	while(rs.next()){
		    	ProductoFisico objeto = new ProductoFisico();

		    	objeto.setNumeroFila(rs.getInt("id"));
		    	objeto.setCodigoNivel(rs.getInt("codigoNivel"));
		    	objeto.setCodigoEntidad(rs.getInt("codigoEntidad"));
		    	objeto.setTipoPrograma(rs.getInt("tipoPrograma"));
		    	objeto.setCodigoPrograma(rs.getInt("codigoPrograma"));
		    	objeto.setCodigoSubprograma(rs.getInt("codigoSubprograma"));
		    	objeto.setCodigoProyecto(rs.getInt("codigoProyecto"));
		    	objeto.setCodigoProducto(rs.getInt("codigoProducto"));
		    	objeto.setDescripcionProducto(rs.getString("descripcionProducto"));
		    	objeto.setUnidadMedida(rs.getString("unidadMedida"));
		    	objeto.setClase(rs.getString("clase"));
		    	objeto.setMeta1(rs.getDouble("meta1"));
		    	objeto.setAvance1(rs.getDouble("avance1"));
		    	objeto.setMeta2(rs.getDouble("meta2"));
		    	objeto.setAvance2(rs.getDouble("avance2"));
		    	objeto.setMeta3(rs.getDouble("meta3"));
		    	objeto.setAvance3(rs.getDouble("avance3"));
		    	objeto.setMeta4(rs.getDouble("meta4"));
		    	objeto.setAvance4(rs.getDouble("avance4"));
		    	objeto.setMeta5(rs.getDouble("meta5"));
		    	objeto.setAvance5(rs.getDouble("avance5"));
		    	objeto.setMeta6(rs.getDouble("meta6"));
		    	objeto.setAvance6(rs.getDouble("avance6"));
		    	objeto.setMeta7(rs.getDouble("meta7"));
		    	objeto.setAvance7(rs.getDouble("avance7"));
		    	objeto.setMeta8(rs.getDouble("meta8"));
		    	objeto.setAvance8(rs.getDouble("avance8"));
		    	objeto.setMeta9(rs.getDouble("meta9"));
		    	objeto.setAvance9(rs.getDouble("avance9"));
		    	objeto.setMeta10(rs.getDouble("meta10"));
		    	objeto.setAvance10(rs.getDouble("avance10"));
		    	objeto.setMeta11(rs.getDouble("meta11"));
		    	objeto.setAvance11(rs.getDouble("avance11"));
		    	objeto.setMeta12(rs.getDouble("meta12"));
		    	objeto.setAvance12(rs.getDouble("avance12"));


		    	objetos.add(objeto);
		    	}
		    	}
		    	catch (SQLException e) {e.printStackTrace();}
		    	finally{
		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
		    	}
		    	return objetos;
		    	}

		    	public static List<ProductoFinanciero> selectAllProductoFinanciero(String condition) throws SQLException{
		    	Connection conect=ConnectionConfiguration.conectar();
		    	String query = " select * from producto_financiero "+condition;
		    	Statement statement = null;
		    	ResultSet rs=null;
		    	List<ProductoFinanciero> objetos = new ArrayList<ProductoFinanciero>();
		    	try {
		    	statement = conect.createStatement();
		    	rs=statement.executeQuery(query);
		    	while(rs.next()){
		    	ProductoFinanciero objeto = new ProductoFinanciero();

		    	objeto.setNumeroFila(rs.getInt("nro_fila"));
		    	objeto.setCodigoNivel(rs.getInt("codigoNivel"));
		    	objeto.setCodigoEntidad(rs.getInt("codigoEntidad"));
		    	objeto.setTipoPrograma(rs.getInt("tipoPrograma"));
		    	objeto.setCodigoPrograma(rs.getInt("codigoPrograma"));
		    	objeto.setCodigoSubprograma(rs.getInt("codigoSubprograma"));
		    	objeto.setCodigoProyecto(rs.getInt("codigoProyecto"));
		    	objeto.setCodigoProducto(rs.getInt("codigoProducto"));
		    	objeto.setDescripcionProducto(rs.getString("descripcionProducto"));
		    	objeto.setCodigoObjetoGasto(rs.getInt("codigoObjetoGasto"));
		    	objeto.setCodigoFuenteFinan(rs.getInt("codigoFuenteFinan"));
		    	objeto.setCodigoOrgFinanciador(rs.getInt("codigoOrgFinanciador"));
		    	objeto.setCodigoDpto(rs.getInt("codigoDpto"));
		    	objeto.setPlanificado1(rs.getDouble("planificado1"));
		    	objeto.setEjecutado1(rs.getDouble("ejecutado1"));
		    	objeto.setPlanificado2(rs.getDouble("planificado2"));
		    	objeto.setEjecutado2(rs.getDouble("ejecutado2"));
		    	objeto.setPlanificado3(rs.getDouble("planificado3"));
		    	objeto.setEjecutado3(rs.getDouble("ejecutado3"));
		    	objeto.setPlanificado4(rs.getDouble("planificado4"));
		    	objeto.setEjecutado4(rs.getDouble("ejecutado4"));
		    	objeto.setPlanificado5(rs.getDouble("planificado5"));
		    	objeto.setEjecutado5(rs.getDouble("ejecutado5"));
		    	objeto.setPlanificado6(rs.getDouble("planificado6"));
		    	objeto.setEjecutado6(rs.getDouble("ejecutado6"));
		    	objeto.setPlanificado7(rs.getDouble("planificado7"));
		    	objeto.setEjecutado7(rs.getDouble("ejecutado7"));
		    	objeto.setPlanificado8(rs.getDouble("planificado8"));
		    	objeto.setEjecutado8(rs.getDouble("ejecutado8"));
		    	objeto.setPlanificado9(rs.getDouble("planificado9"));
		    	objeto.setEjecutado9(rs.getDouble("ejecutado9"));
		    	objeto.setPlanificado10(rs.getDouble("planificado10"));
		    	objeto.setEjecutado10(rs.getDouble("ejecutado10"));
		    	objeto.setPlanificado11(rs.getDouble("planificado11"));
		    	objeto.setEjecutado11(rs.getDouble("ejecutado11"));
		    	objeto.setPlanificado12(rs.getDouble("planificado12"));
		    	objeto.setEjecutado12(rs.getDouble("ejecutado12"));


		    	objetos.add(objeto);
		    	}
		    	}
		    	catch (SQLException e) {e.printStackTrace();}
		    	finally{
		    	if (statement != null) {statement.close();}
		    	if (conect != null) {conect.close();}
		    	}
		    	return objetos;
		    	}

		    	public static List<PresupGastos> selectAllPresupGastos(String condition) throws SQLException{
		    		Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from presupuesto_gasto "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	
			    	List<PresupGastos> objetos = new ArrayList<PresupGastos>();
			    	try {
				    	statement = conect.createStatement();
				    	rs=statement.executeQuery(query);
				    	while(rs.next()){
					    	PresupGastos objeto = new PresupGastos();
			
					    	objeto.setNumeroFila(rs.getInt("id"));
					    	objeto.setCodigoNivel(rs.getInt("codigoNivel"));
					    	objeto.setCodigoEntidad(rs.getInt("codigoEntidad"));
					    	objeto.setTipoPrograma(rs.getInt("tipoPrograma"));
					    	objeto.setCodigoPrograma(rs.getInt("codigoPrograma"));
					    	objeto.setCodigoSubprograma(rs.getInt("codigoSubprograma"));
					    	objeto.setCodigoProyecto(rs.getInt("codigoProyecto"));
					    	objeto.setCodigoObjetoGasto(rs.getInt("codigoObjetoGasto"));
					    	objeto.setCodigoFuenteFinan(rs.getInt("codigoFuenteFinan"));
					    	objeto.setCodigoOrgFinanciador(rs.getInt("codigoOrgFinanciador"));
					    	objeto.setCodigoDpto(rs.getInt("codigoDpto"));
					    	objeto.setCodigoPais(rs.getInt("codigoPais"));
					    	objeto.setAprobado(rs.getDouble("aprobado"));
					    	objeto.setModificaciones(rs.getDouble("modificaciones"));
					    	objeto.setVigente(rs.getDouble("vigente"));
					    	objeto.setPlanFinanciero(rs.getDouble("planFinanciero"));
					    	objeto.setObligado(rs.getDouble("obligado"));
					    	objeto.setPagado(rs.getDouble("pagado"));
					    	objeto.setSaldo(rs.getDouble("saldo"));
			
			
					    	objetos.add(objeto);
					    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    		if (statement != null) {statement.close();}
			    		if (conect != null) {conect.close();}
			    	}
			    	return objetos;
		    	}
				
		    	public static List<Institucion> selectAllInstituciones(String condition) throws SQLException{
		       	 Connection conect=ConnectionConfiguration.conectar();String query = " select * from institucion "+condition;
		   		 Statement statement = null; ResultSet rs=null;
		   		 List<Institucion> objetos = new ArrayList<Institucion>();
		   		 
		   		try {
		   			statement = conect.createStatement();
		   			rs=statement.executeQuery(query);
		   			
		   			while(rs.next()){
		   				Institucion objeto = new Institucion();
		   				objeto.setId(rs.getInt("id"));
		   				objeto.setNombre(rs.getString("nombre"));
		   				objeto.setDescripcion(rs.getString("descripcion"));
		   				objeto.setSigla(rs.getString("sigla"));
		   				objeto.setOrden(rs.getInt("orden"));
		   				objeto.setNivelId((rs.getInt("nivel_id")));
		   				objeto.setEntidadId((rs.getInt("entidad_id")));
		   				objeto.setUnidadJerarquicaId((rs.getInt("unidad_jerarquica_id")));
		   				objeto.setUnidadResponsableId((rs.getInt("unidad_responsable_id")));
		   				objeto.setVersion((rs.getInt("version")));
		   				objeto.setBorrado((rs.getBoolean("borrado")));
		   				objeto.setAbrev(rs.getString("abrev"));
		   				objeto.setBaseLegal(rs.getString("base_legal"));
		   				objeto.setMision(rs.getString("mision"));
		   				objeto.setVision(rs.getString("vision"));
		   				objeto.setPolitica(rs.getString("politica"));
		   				objeto.setDiagnostico(rs.getString("diagnostico"));
		   				objeto.setRuc(rs.getString("ruc"));
		   				objeto.setAnho(rs.getInt("anho"));
		   				objeto.setNroFila(rs.getInt("nro_fila"));
		   				objeto.setObjetivo(rs.getString("objetivo"));
		   				objeto.setFechaCreacion(rs.getDate("fecha_creacion"));
		   				objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
		   				objeto.setFechaInsercion(rs.getDate("fecha_insercion"));		   				
		   				
		   				objetos.add(objeto);
		   			}
		   		}
		   		catch (SQLException e) {e.printStackTrace();}
		   		finally{
		   			if (statement != null) {statement.close();}
		   			if (conect != null) {conect.close();}
		   		}
		   		return objetos;
		      }
		    	public static List<FuenteVerificacion> selectAllFuenteVerificacion(String condition) throws SQLException{
			    	Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from fuente_verificacion "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	List<FuenteVerificacion> objetos = new ArrayList<FuenteVerificacion>();
			    	try {
			    	statement = conect.createStatement();
			    	rs=statement.executeQuery(query);
			    	while(rs.next()){
			    		FuenteVerificacion objeto = new FuenteVerificacion();

			    	objeto.setId(rs.getInt("id"));
			    	objeto.setNombre(rs.getString("nombre"));
			    	objeto.setDescripcion(rs.getString("descripcion"));
			    	objeto.setAbrev(rs.getString("abrev"));
			    	objeto.setUri(rs.getString("uri"));
			    	objeto.setBorrado(rs.getBoolean("borrado"));

			    	objetos.add(objeto);
			    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    	if (statement != null) {statement.close();}
			    	if (conect != null) {conect.close();}
			    	}
			    	return objetos;
			    	}
			    	public static List<TipoIndicador> selectAllTipoIndicador(String condition) throws SQLException{
			    	Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from tipo_indicador "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	List<TipoIndicador> objetos = new ArrayList<TipoIndicador>();
			    	try {
			    	statement = conect.createStatement();
			    	rs=statement.executeQuery(query);
			    	while(rs.next()){
			    		TipoIndicador objeto = new TipoIndicador();

			    	objeto.setId(rs.getInt("id"));
			    	objeto.setNombre(rs.getString("nombre"));
			    	objeto.setDescripcion(rs.getString("descripcion"));
			    	objeto.setBorrado(rs.getBoolean("borrado"));

			    	objetos.add(objeto);
			    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    	if (statement != null) {statement.close();}
			    	if (conect != null) {conect.close();}
			    	}
			    	return objetos;
			    	}
			    	public static List<CoberturaGeograficaAlcance> selectAllCoberturaGeograficaAlcance(String condition) throws SQLException{
			    	Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from cobertura_geografica_alcances "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	List<CoberturaGeograficaAlcance> objetos = new ArrayList<CoberturaGeograficaAlcance>();
			    	try {
			    	statement = conect.createStatement();
			    	rs=statement.executeQuery(query);
			    	while(rs.next()){
			    		CoberturaGeograficaAlcance objeto = new CoberturaGeograficaAlcance();

			    	objeto.setId(rs.getInt("id"));
			    	objeto.setNombre(rs.getString("nombre"));

			    	objetos.add(objeto);
			    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    	if (statement != null) {statement.close();}
			    	if (conect != null) {conect.close();}
			    	}
			    	return objetos;
			    	}
			    	public static List<CoberturaDemograficaAlcance> selectAllCoberturaDemograficaAlcance(String condition) throws SQLException{
			    	Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from cobertura_demografica_alcances "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	List<CoberturaDemograficaAlcance> objetos = new ArrayList<CoberturaDemograficaAlcance>();
			    	try {
			    	statement = conect.createStatement();
			    	rs=statement.executeQuery(query);
			    	while(rs.next()){
			    		CoberturaDemograficaAlcance objeto = new CoberturaDemograficaAlcance();

			    	objeto.setId(rs.getInt("id"));
			    	objeto.setNombre(rs.getString("nombre"));

			    	objetos.add(objeto);
			    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    	if (statement != null) {statement.close();}
			    	if (conect != null) {conect.close();}
			    	}
			    	return objetos;
			    	}
			    	public static List<NivelDespliegueGeografico> selectAllNivelDespliegueGeografico(String condition) throws SQLException{
			    	Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from nivel_despliegue_geografica_desagregaciones "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	List<NivelDespliegueGeografico> objetos = new ArrayList<NivelDespliegueGeografico>();
			    	try {
			    	statement = conect.createStatement();
			    	rs=statement.executeQuery(query);
			    	while(rs.next()){
			    		NivelDespliegueGeografico objeto = new NivelDespliegueGeografico();

			    	objeto.setId(rs.getInt("id"));
			    	objeto.setNombre(rs.getString("nombre"));

			    	objetos.add(objeto);
			    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    	if (statement != null) {statement.close();}
			    	if (conect != null) {conect.close();}
			    	}
			    	return objetos;
			    	}
			    	public static List<NivelDespliegueDemografico> selectAllNivelDespliegueDemografico(String condition) throws SQLException{
			    	Connection conect=ConnectionConfiguration.conectar();
			    	String query = " select * from nivel_despliegue_demografica_desagregacion "+condition;
			    	Statement statement = null;
			    	ResultSet rs=null;
			    	List<NivelDespliegueDemografico> objetos = new ArrayList<NivelDespliegueDemografico>();
			    	try {
			    	statement = conect.createStatement();
			    	rs=statement.executeQuery(query);
			    	while(rs.next()){
			    		NivelDespliegueDemografico objeto = new NivelDespliegueDemografico();

			    	objeto.setId(rs.getInt("id"));
			    	objeto.setNombre(rs.getString("nombre"));

			    	objetos.add(objeto);
			    	}
			    	}
			    	catch (SQLException e) {e.printStackTrace();}
			    	finally{
			    	if (statement != null) {statement.close();}
			    	if (conect != null) {conect.close();}
			    	}
			    	return objetos;
			    	}
					public static List<ObjetivoSugerido> selectAllObjetivoSugerido(String condition) throws SQLException{
						Connection conect=ConnectionConfiguration.conectar();
						String query = " select * from objetivo_sugerido "+condition;
						
						Statement statement = null;
						ResultSet rs=null;
						List<ObjetivoSugerido> objetos = new ArrayList<ObjetivoSugerido>();
						try {
						statement = conect.createStatement();
						rs=statement.executeQuery(query);
							while(rs.next()){
								ObjetivoSugerido objeto = new ObjetivoSugerido();
							
								objeto.setObjetivoId(rs.getInt("objetivo_id"));
								objeto.setTipoObjetivoId(rs.getInt("objetivo_tipo_objetivo_id"));
								objeto.setObjetivoAnho(rs.getInt("objetivo_anho"));
								objeto.setObjetivoVersion(rs.getInt("objetivo_version"));
								objeto.setObjetivoSugeridoId(rs.getInt("objetivo_sugerido_id"));
								objeto.setObjetivoSugeridoTipoId(rs.getInt("objetivo_sugerido_tipo_id"));
								objeto.setObjetivoSugeridoAnho(rs.getInt("objetivo_sugerido_anho"));
								objeto.setObjetivoSugeridoVersion(rs.getInt("objetivo_sugerido_version"));
								objeto.setBorrado((rs.getBoolean("borrado")));

								objetos.add(objeto);
							}
						}
						catch (SQLException e) {e.printStackTrace();}
						finally{
						if (statement != null) {statement.close();}
						if (conect != null) {conect.close();}
						}
					return objetos;
					}		
					public static List<ObjetivoHasObjetivo> selectAllObjetivoHasObjetivo(String condition) throws SQLException{
						Connection conect=ConnectionConfiguration.conectar();
						String query = " select * from objetivo_has_objetivo "+condition+ " order by producto asc";						
						
						Statement statement = null;
						ResultSet rs=null;
						List<ObjetivoHasObjetivo> objetos = new ArrayList<ObjetivoHasObjetivo>();
						try {
						statement = conect.createStatement();
						rs=statement.executeQuery(query);
							while(rs.next()){
								ObjetivoHasObjetivo objeto = new ObjetivoHasObjetivo();
							
								objeto.setObjetivoId(rs.getInt("objetivo_id"));
								objeto.setTipoObjetivoId(rs.getInt("objetivo_tipo_objetivo_id"));
								objeto.setObjetivoAnho(rs.getInt("objetivo_anho"));
								objeto.setObjetivoVersion(rs.getInt("objetivo_version"));
								objeto.setObjetivoRelId(rs.getInt("objetivo_rel_id"));
								objeto.setReltipoObjetivoId(rs.getInt("objetivo_rel_tipo_objetivo_id"));
								objeto.setRelAnho(rs.getInt("objetivo_rel_anho"));
								objeto.setRelVersion(rs.getInt("objetivo_rel_version"));
								objeto.setColaboracion(rs.getDouble("colaboracion"));
								objeto.setInfluencia(rs.getDouble("influencia"));
								objeto.setNivel(rs.getInt("nivel"));
								objeto.setEntidad(rs.getInt("entidad"));
								objeto.setTipoPresupuesto(rs.getInt("tipo_presupuesto"));
								objeto.setPrograma(rs.getInt("programa"));
								objeto.setSubprograma(rs.getInt("subprograma"));
								objeto.setProyecto(rs.getInt("proyecto"));
								objeto.setProducto(rs.getInt("producto"));
								objeto.setProductoConcat(rs.getString("producto_concat"));
								objeto.setBorrado(rs.getBoolean("borrado"));								
								objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
								//objeto.setHoraActualizacion(rs.getTime("fecha_actualizacion"));
								
								objetos.add(objeto);
							}
						}
						catch (SQLException e) {e.printStackTrace();}
						finally{
						if (statement != null) {statement.close();}
						if (conect != null) {conect.close();}
						}
					return objetos;
					}
					
					public static List<ObjetivoHasIndicador> selectAllObjetivoHasIndicador(String condition) throws SQLException{
						Connection conect=ConnectionConfiguration.conectar();
						String query = " select * from objetivo_has_indicador "+condition;
						
						Statement statement = null;
						ResultSet rs=null;
						List<ObjetivoHasIndicador> objetos = new ArrayList<ObjetivoHasIndicador>();
						try {
						statement = conect.createStatement();
						rs=statement.executeQuery(query);
							while(rs.next()){
								ObjetivoHasIndicador objeto = new ObjetivoHasIndicador();
							
								objeto.setObjetivoId(rs.getInt("objetivo_id"));
								objeto.setObjetivoTipoObjetivoId(rs.getInt("objetivo_tipo_objetivo_id"));
								objeto.setObjetivoAnho(rs.getInt("objetivo_anho"));
								objeto.setObjetivoVersion(rs.getInt("objetivo_version"));
								objeto.setIndicadorId(rs.getInt("indicador_id"));
								objeto.setIndicadorTipoIndicadorId(rs.getInt("indicador_tipo_indicador_id"));
								objeto.setIndicadorUnidadMedidaId(rs.getInt("indicador_unidad_medida_id"));
								objeto.setIndicadorDesagregacionTipoZonaGeograficaId(rs.getInt("indicador_desagregacion_tipo_zona_geografica_id"));
								objeto.setIndicadorTipoDemograficaId(rs.getInt("indicador_tipo_demografica_id"));
								objeto.setIndicadorFuenteVerificacionId(rs.getString("indicador_fuente_verificacion_id"));
								objeto.setIndicadorObjetivoId(rs.getInt("indicador_objetivo_id"));
								objeto.setProductoConcat(rs.getString("producto_concat"));

								objetos.add(objeto);
							}
						}
						catch (SQLException e) {e.printStackTrace();}
						finally{
						if (statement != null) {statement.close();}
						if (conect != null) {conect.close();}
						}
					return objetos;
					}
					
					public static List selectUltimaActualizacion(String objeto,
							String condicion) {
						// TODO Auto-generated method stub
						return null;
					}	
					public static List<Role> selectAllRole(String condition) throws SQLException{
						Connection conect=ConnectionConfiguration.conectar();
						String query = " select * from role "+condition;
						
						Statement statement = null;
						ResultSet rs=null;
						List<Role> objetos = new ArrayList<Role>();
						try {
						statement = conect.createStatement();
						rs=statement.executeQuery(query);
							while(rs.next()){
								Role objeto = new Role();
							
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));								

								objetos.add(objeto);
							}
						}
						catch (SQLException e) {e.printStackTrace();}
						finally{
						if (statement != null) {statement.close();}
						if (conect != null) {conect.close();}
						}
					return objetos;
					}
				
					public static List<Etiqueta> selectAllEtiquetas(String condicion)throws SQLException {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from etiquetas " + condicion;
				
						Statement statement = null;
						ResultSet rs = null;
						List<Etiqueta> objetos = new ArrayList<Etiqueta>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								Etiqueta objeto = new Etiqueta();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));
				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					
					public static List<PresupuestoEtiqueta> selectAllPresupuestoEtiquetas(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from producto_presupusto_has_etiquetas " + condicion;
				
						Statement statement = null;
						ResultSet rs = null;
						List<PresupuestoEtiqueta> objetos = new ArrayList<PresupuestoEtiqueta>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								PresupuestoEtiqueta objeto = new PresupuestoEtiqueta();
				
								objeto.setId(rs.getInt("id"));
								objeto.setProductoConcat(rs.getString("producto_concat"));
								objeto.setEtiquetaId(rs.getInt("etiquetas_id"));
								objeto.setProductoId(rs.getInt("producto_id"));
								objeto.setProyectoId(rs.getInt("proyecto_id"));
								objeto.setSubProgramaId(rs.getInt("subprograma_id"));
								objeto.setProgramaId(rs.getInt("programa_id"));
								objeto.setTipoPresupuestoId(rs.getInt("tipo_presupuesto_id"));
								objeto.setEntidadId(rs.getInt("entidad_id"));
								objeto.setNivelId(rs.getInt("nivel_id"));
								objeto.setVersion(rs.getInt("version"));
								objeto.setAnho(rs.getInt("anho"));
				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<TipoDocumento> selectAllTipoDocumento(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from tipo_documentos " + condicion;
				
						Statement statement = null;
						ResultSet rs = null;
						List<TipoDocumento> objetos = new ArrayList<TipoDocumento>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								TipoDocumento objeto = new TipoDocumento();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));
								objeto.setBorrado(rs.getBoolean("borrado"));
								objeto.setFechaActualizacion(rs.getString("fecha_actualizacion"));
								objeto.setFechaInsercion(rs.getString("fecha_insercion"));
				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<Documentos> selectAllDocumento(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from documentos " + condicion;
				
						Statement statement = null;
						ResultSet rs = null;
						List<Documentos> objetos = new ArrayList<Documentos>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								Documentos objeto = new Documentos();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));
				   				objeto.setUrl(getFileName(rs.getString("url")));
								objeto.setDescripcion(rs.getString("descripcion"));
								objeto.setBorrado(rs.getBoolean("borrado"));
								objeto.setFecha(rs.getString("fecha_valides"));
								objeto.setTipoId(rs.getInt("tipos_id"));
								objeto.setUsuarioResponsable(rs.getString("usuario_responsable"));
				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static String selectAllMapaDestinatarioPND(String condition) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query=/*"select array_to_json(array_agg(row_to_json(t))) as resultado from(SELECT"+     
										" ee.id AS eje_estrategico,"+    
										" lt.id AS linea_transversal,"+    
										" est.id AS estrategia,"+
										" ppd.nivel,"+
										" ppd.entidad,"+
										" ppd.departamento as departamento,"+
										" ppd.catalogo_destinatario AS catalogo_destinatario,"+
										" sum(ppd.cantidad) AS cant_destinatarios"+
									" FROM estrategia est"+
									     " JOIN eje_estrategico ee ON ee.id = est.eje_estrategico_id"+
									     " JOIN linea_transversal lt ON lt.id = est.linea_transversal_id"+
									     " JOIN estrategia_has_objetivo eho ON eho.estrategia_id = est.id"+
									     " JOIN objetivo oe ON eho.objetivo_id = oe.id AND eho.objetivo_tipo_objetivo_id = 1 AND oe.tipo_objetivo_id = 1"+
									     " JOIN objetivo_has_objetivo rev ON rev.objetivo_rel_id = oe.id AND rev.objetivo_rel_tipo_objetivo_id = 1 AND rev.objetivo_tipo_objetivo_id = 2"+
									     " JOIN objetivo res ON res.id = rev.objetivo_id AND res.tipo_objetivo_id = 2"+
									     " JOIN entidad ent ON ent.id = rev.entidad AND ent.nivel_id = rev.nivel"+
									     " LEFT JOIN producto_presupuesto_destinatario ppd ON ppd.nivel = split_part(rev.producto_concat, '-'::text, 1)::integer AND ppd.entidad = split_part(rev.producto_concat, '-'::text, 2)::integer AND ppd.tipo_presupuesto = split_part(rev.producto_concat, '-'::text, 3)::integer AND ppd.programa = split_part(rev.producto_concat, '-'::text, 4)::integer AND ppd.subprograma = split_part(rev.producto_concat, '-'::text, 5)::integer AND ppd.proyecto = split_part(rev.producto_concat, '-'::text, 6)::integer AND ppd.producto = split_part(rev.producto_concat, '-'::text, 7)::integer AND NOT ppd.borrado"+
									     " LEFT JOIN producto p ON p.id = split_part(rev.producto_concat, '-'::text, 7)::integer"+
									     " LEFT JOIN catalogo_destinatario cdest ON ppd.catalogo_destinatario = cdest.id"+
									     " LEFT JOIN tipo_catalogo_destinatario tcdest ON cdest.tipo_catalogo_destinatario_id = tcdest.id "+
									" WHERE est.plan = 9 AND NOT oe.borrado AND NOT rev.borrado AND (NOT ppd.borrado OR ppd.borrado IS NULL) and ppd.cantidad>0 and not ppd.departamento in (88,99)  "+condicion+
									" GROUP BY ee.id, lt.id, est.id, ppd.departamento, ppd.catalogo_destinatario"+
									" ORDER BY departamento, ppd.catalogo_destinatario)t";*/
									"select array_to_json(array_agg(row_to_json(t))) as resultado from(SELECT"+
									"		ee.id AS eje_estrategico,"+
									"		lt.id AS linea_transversal,"+
									"		est.id AS estrategia,"+
									"		ppd.departamento as departamento,"+
									"		ppd.catalogo_destinatario AS catalogo_destinatario,"+
									"		cdest.nombre as nombre_catalogo, "+									
									"		sum(ppd.cantidad) AS cant_destinatarios,"+									
									"		p.nombre as tipo_producto "+
									" FROM estrategia est "+
									"		JOIN eje_estrategico ee ON ee.id = est.eje_estrategico_id"+
									"		JOIN linea_transversal lt ON lt.id = est.linea_transversal_id"+
									"		JOIN estrategia_has_objetivo eho ON eho.estrategia_id = est.id"+
									"		JOIN objetivo oe ON eho.objetivo_id = oe.id AND eho.objetivo_tipo_objetivo_id = 1 AND oe.tipo_objetivo_id = 1"+
									"		JOIN objetivo_has_objetivo rev ON rev.objetivo_rel_id = oe.id AND rev.objetivo_rel_tipo_objetivo_id = 1 AND rev.objetivo_tipo_objetivo_id = 2"+
									"		JOIN objetivo res ON res.id = rev.objetivo_id AND res.tipo_objetivo_id = 2"+
									"		JOIN entidad ent ON ent.id = rev.entidad AND ent.nivel_id = rev.nivel"+
									"		LEFT JOIN producto_presupuesto_destinatario ppd ON ppd.nivel = split_part(rev.producto_concat, '-'::text, 1)::integer"+ 
									"								AND ppd.entidad = split_part(rev.producto_concat, '-'::text, 2)::integer"+ 
									"								AND ppd.tipo_presupuesto = split_part(rev.producto_concat, '-'::text, 3)::integer"+ 
									"								AND ppd.programa = split_part(rev.producto_concat, '-'::text, 4)::integer"+ 
									"								AND ppd.subprograma = split_part(rev.producto_concat, '-'::text, 5)::integer"+ 
									"								AND ppd.proyecto = split_part(rev.producto_concat, '-'::text, 6)::integer"+ 
									"								AND ppd.producto = split_part(rev.producto_concat, '-'::text, 7)::integer"+ 
									"		LEFT JOIN producto p ON p.id = split_part(rev.producto_concat, '-'::text, 7)::integer"+
									"		JOIN proyecto py ON py.id = split_part(rev.producto_concat, '-'::text, 6)::integer and"+
									"				py.subprograma_id = split_part(rev.producto_concat, '-'::text, 5)::integer and"+
									"				py.subprograma_programa_id = split_part(rev.producto_concat, '-'::text, 4)::integer and"+
									"				py.subprograma_programa_tipo_presupuesto_id =  split_part(rev.producto_concat, '-'::text, 3)::integer and"+
									"				py.subprograma_programa_entidad_id = split_part(rev.producto_concat, '-'::text, 2)::integer and"+
									"				py.subprograma_programa_entidad_nivel_id =  split_part(rev.producto_concat, '-'::text, 1)::integer"+
									"		JOIN unidad_responsable ur on ur.id = py.unidad_responsable_id and"+ 
									"				ur.entidad_id = split_part(rev.producto_concat, '-'::text, 2)::integer and"+ 
									"				ur.entidad_nivel_id = split_part(rev.producto_concat, '-'::text, 1)::integer"+
									"		LEFT JOIN catalogo_destinatario cdest ON ppd.catalogo_destinatario = cdest.id"+
									"		LEFT JOIN tipo_catalogo_destinatario tcdest ON cdest.tipo_catalogo_destinatario_id = tcdest.id"+ 
									"	WHERE est.plan = 9"+ 
									"		AND NOT oe.borrado"+ 
									"		AND NOT rev.borrado"+ 
									"		AND NOT ppd.borrado"+
									"		AND (NOT ppd.borrado OR ppd.borrado IS NULL)"+ 
									"		and ppd.cantidad>0"+ 
									"		and not ppd.departamento in (88,99)"+
									"		"+condition+
									"	GROUP BY ee.id, lt.id, est.id, ppd.departamento, ppd.catalogo_destinatario, cdest.nombre, p.nombre "+
									"	ORDER BY departamento, ppd.catalogo_destinatario)t";
																
						 Statement statement = null;
				   		 ResultSet rs=null;
				   		 String objetos = "";

				   		try {
				   			statement = conect.createStatement();
				   			rs=statement.executeQuery(query);
				   			while(rs.next()){				   				
				   				objetos+=rs.getString("resultado");
				   			}
				   		}
				   		catch (SQLException e) {e.printStackTrace();}
				   		finally{
				   			if (statement != null) {statement.close();}
				   			if (conect != null) {conect.close();}
				   		}
				   		return objetos;

					}
					
					public static List<CatalogoDestinatario> selectAllCatalogoDestinatario(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = "select * from catalogo_destinatario " + condicion +" order by nombre" ;
				
						Statement statement = null;
						ResultSet rs = null;
						List<CatalogoDestinatario> objetos = new ArrayList<CatalogoDestinatario>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								CatalogoDestinatario objeto = new CatalogoDestinatario();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));				   				
								objeto.setDescripcion(rs.getString("descripcion"));
								objeto.setTipo_catalogo_destianatario_id(rs.getInt("tipo_catalogo_destinatario_id"));								
								objeto.setBorrado(rs.getBoolean("borrado"));				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
/*******************usado para el selector del mapa de destinatarios************/
					public static List<CatalogoDestinatario> selectAllCatalogoDestinatarioPND(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = "SELECT cd.id, "+
										"cd.nombre "+
										"FROM catalogo_destinatario cd "+
										"JOIN producto_presupuesto_destinatario ppd ON cd.id = ppd.catalogo_destinatario "+
										"JOIN proyecto py ON py.id = ppd.proyecto and "+
										"	py.subprograma_id = ppd.subprograma and "+
										"	py.subprograma_programa_id = ppd.programa and "+
										"	py.subprograma_programa_tipo_presupuesto_id = ppd.tipo_presupuesto and "+
										"	py.subprograma_programa_entidad_id = ppd.entidad and "+
										"	py.subprograma_programa_entidad_nivel_id = ppd.nivel "+
										"JOIN unidad_responsable ur on ur.id = py.unidad_responsable_id and	"+			
										"	ur.entidad_id = ppd.entidad and "+		
										"	ur.entidad_nivel_id = ppd.nivel WHERE true "+ condicion +" and not cd.borrado "+
										"group by cd.id, "+
										"	cd.nombre "+
										"order by nombre " ;
															
						Statement statement = null;
						ResultSet rs = null;
						List<CatalogoDestinatario> objetos = new ArrayList<CatalogoDestinatario>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								CatalogoDestinatario objeto = new CatalogoDestinatario();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));		
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<Modulos> selectAllModulo(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from modulos " + condicion + " ORDER BY id ASC";
				
						Statement statement = null;
						ResultSet rs = null;
						List<Modulos> objetos = new ArrayList<Modulos>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								Modulos objeto = new Modulos();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombeModulo(rs.getString("nombre"));

				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<PermisoPorModulo> selectAllPermisoPorModulo(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from permisos_por_modulos " + condicion + " ORDER BY modulos_id asc";
				
						Statement statement = null;
						ResultSet rs = null;
						List<PermisoPorModulo> objetos = new ArrayList<PermisoPorModulo>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								PermisoPorModulo objeto = new PermisoPorModulo();
				
								objeto.setId(rs.getInt("id"));
								objeto.setModuloId(rs.getInt("modulos_id"));
								objeto.setUsuarioId(rs.getInt("usuario_id"));
								objeto.setPermisoModuloId(rs.getInt("permisos_modulos_id"));
								objeto.setBorrado(rs.getBoolean("borrado"));
								
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<PermisoModulo> selectAllPermisoModulo(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from permisos_modulos " + condicion + " ORDER BY id ASC";
				
						Statement statement = null;
						ResultSet rs = null;
						List<PermisoModulo> objetos = new ArrayList<PermisoModulo>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								PermisoModulo objeto = new PermisoModulo();
				
								objeto.setId(rs.getInt("id"));
								objeto.setNombre(rs.getString("nombre"));

				
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<Justificacion> selectAllJustificacion(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from justificacion " + condicion + " ORDER BY id asc";
				
						Statement statement = null;
						ResultSet rs = null;
						List<Justificacion> objetos = new ArrayList<Justificacion>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								Justificacion objeto = new Justificacion();
												
								objeto.setId(rs.getInt("id"));								
								objeto.setDescripcion(rs.getString("descripcion"));
								objeto.setNivel(rs.getInt("nivel"));
								objeto.setEntidad(rs.getInt("entidad"));
								objeto.setTipoPresupuesto(rs.getInt("tipoprograma"));
								objeto.setPrograma(rs.getInt("programa"));
								objeto.setSubprograma(rs.getInt("subprograma"));
								objeto.setProyecto(rs.getInt("proyecto"));
								objeto.setProducto(rs.getInt("producto"));
								objeto.setAnho(rs.getInt("anho"));
								objeto.setVersion(rs.getInt("version"));								
								objeto.setUsuarioResponsable(rs.getString("usuario_responsable"));
								objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
								objeto.setBorrado(rs.getBoolean("borrado"));
								
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					public static List<DictamenSTP> selectAllDictamenSTP(String condicion) throws SQLException  {
						Connection conect = ConnectionConfiguration.conectar();
						String query = " select * from dictamen_stp " + condicion + " ORDER BY id asc";
				
						Statement statement = null;
						ResultSet rs = null;
						List<DictamenSTP> objetos = new ArrayList<DictamenSTP>();
						try {
							statement = conect.createStatement();
							rs = statement.executeQuery(query);
							while (rs.next()) {
								DictamenSTP objeto = new DictamenSTP();
												
								objeto.setId(rs.getInt("id"));								
								objeto.setEleccion(rs.getInt("eleccion"));								
								objeto.setNivel(rs.getInt("nivel"));
								objeto.setUrlDocumento(rs.getString("url_documento"));
								objeto.setEntidad(rs.getInt("entidad"));
								objeto.setTipoPresupuesto(rs.getInt("tipoprograma"));
								objeto.setPrograma(rs.getInt("programa"));
								objeto.setSubprograma(rs.getInt("subprograma"));
								objeto.setProyecto(rs.getInt("proyecto"));
								objeto.setProducto(rs.getInt("producto"));
								objeto.setAnho(rs.getInt("anho"));
								objeto.setVersion(rs.getInt("version"));	
								objeto.setObservacion(rs.getString("observacion"));
								objeto.setUsuarioResponsable(rs.getString("usuario_responsable"));
								objeto.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
								objeto.setBorrado(rs.getBoolean("borrado"));
								
								objetos.add(objeto);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (statement != null) {
								statement.close();
							}
							if (conect != null) {
								conect.close();
							}
						}
						return objetos;
					}
					
/********************SQL PARA PIVOT PERFIL INSTITUCIONAL	***********************/					
	public static String selectAllPivotPerfilInstitucional(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as entidades" + "	from("
				+ "			select * FROM pivot_perfil_institucional " + condition
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("entidades");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
/********************SQL PARA PIVOT INDICADORES	***********************/					
	public static String selectAllPivotIndicadores(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as indicadores" + "	from("
				+ "			select * FROM pivot_indicadores " + condition + "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("indicadores");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
/********************SQL PARA PIVOT DESTINATARIOS DE PRODUCTOS	***********************/					
	public static String selectAllPivotDestinatariosProductos(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as destinatarios" + "	from("
				+ "			select * FROM pivot_destinatarios_producto" + condition
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("destinatarios");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
/********************SQL PARA PIVOT CADENA DE VALOR	***********************/					
	public static String selectAllPivotCadenaValor(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as cadena_valor" + "	from("
				+ "			select * FROM pivot_cadena_valor" + condition
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("cadena_valor");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
/********************SQL PARA PIVOT ESTRUCTURA PROGRAMATICA	***********************/					
	public static String selectAllPivotEstructuraProgramatica(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as estructura_programatica" + "	from("
				+ "			select * FROM pivot_estructura_programatica" + condition
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("estructura_programatica");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
/********************SQL PARA PIVOT METAS DE PRODUCTOS	***********************/					
	public static String selectAllPivotMetaProducto(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as meta_producto" + "	from("
				+ "			select * FROM pivot_metas_productos" + condition
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("meta_producto");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
/*=====SQL PARA PIVOT METAS DE PRODUCTOS=====*/
	public static String selectAllCadenaValor(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as cadena_valor" + "	from("
				+ "			select * FROM 36" + condition
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("cadena_valor");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static List<ProductoFisico> selectProductoFisico(int ano, int nivel, int entidad, int tipo, int programa, int subprograma, int proyecto){
		List<ProductoFisico> objetos = new ArrayList<ProductoFisico>();

			List lista = ClientConsulta.getProductosFisicos(ano, nivel, entidad, tipo, programa, subprograma, proyecto);
	  
			for(Iterator<ProductoFisico> iterador = lista.iterator(); iterador.hasNext(); ) {
				ProductoFisico item = iterador.next();
			
				ProductoFisico obj = new ProductoFisico();	

				obj.setCodigoNivel(item.getNumeroFila());
				obj.setCodigoNivel(item.getCodigoNivel());
				obj.setCodigoEntidad(item.getCodigoEntidad());

				obj.setTipoPrograma(item.getTipoPrograma());
				obj.setCodigoPrograma(item.getCodigoPrograma());
				obj.setCodigoSubprograma(item.getCodigoSubprograma());
				obj.setCodigoProyecto(item.getCodigoProyecto());
				obj.setCodigoProducto(item.getCodigoProducto());
				obj.setDescripcionProducto(item.getDescripcionProducto());
				obj.setUnidadMedida(item.getUnidadMedida());
				obj.setClase(item.getClase());
				obj.setMeta1(item.getMeta1());
				obj.setAvance1(item.getAvance1());
				obj.setMeta2(item.getMeta2());
				obj.setAvance2(item.getAvance2());
				obj.setMeta3(item.getMeta3());
				obj.setAvance3(item.getAvance3());
				obj.setMeta4(item.getMeta4());
				obj.setAvance4(item.getAvance4());
				obj.setMeta5(item.getMeta5());
				obj.setAvance5(item.getAvance5());
				obj.setMeta6(item.getMeta6());
				obj.setAvance6(item.getAvance6());
				obj.setMeta7(item.getMeta7());
				obj.setAvance7(item.getAvance7());
				obj.setMeta8(item.getMeta8());
				obj.setAvance8(item.getAvance8());
				obj.setMeta9(item.getMeta9());
				obj.setAvance9(item.getAvance9());
				obj.setMeta10(item.getMeta10());
				obj.setAvance10(item.getAvance10());
				obj.setMeta11(item.getMeta11());
				obj.setAvance11(item.getAvance11());
				obj.setMeta12(item.getMeta12());
				obj.setAvance12(item.getAvance12());
				
				objetos.add(obj);

			}		
		return objetos;
	}
	public static String selectAllFuenteFinanciamineto(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as resultado" + "	from("
				+ "			select id, nombre, descripcion, anho, numero_fila, borrado, version, usuario_responsable from fuente_financiamiento order by id " 
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("resultado");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	public static String selectAllOrganismoFinanciador(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as resultado" + "	from("
				+ "			select id, nombre, descripcion, numero_fila, anho, borrado, version, usuario_responsable from organismo_financiador order by id " 
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("resultado");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	public static String selectAllObjetoGasto(String condition)
			throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();

		String query = " select array_to_json(" + "		array_agg(row_to_json(t))"
				+ "	) as resultado" + "	from("
				+ "			select id, nombre, descripcion, abrev, es_imputable, numero_fila, anho, borrado, version, usuario_responsable from objeto_de_gasto order by id " 
				+ "		)t";

		Statement statement = null;
		ResultSet rs = null;
		String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				objetos += rs.getString("resultado");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
}
