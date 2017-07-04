package py.gov.stp.mh.tools;

import py.gov.stp.mh.clasificadores.*;
import py.gov.stp.mh.tools.*;
import py.gov.stp.mh.consultas.*;
import py.gov.stp.mh.test.*;
import py.gov.stp.mh.tools.Credenciales;
import py.gov.stp.mh.tools.SqlUpdates;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.datatype.DatatypeConfigurationException;

import org.jasig.cas.client.authentication.AttributePrincipal;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/

public class ajaxUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	request.setCharacterEncoding("UTF-8");
    	
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = user.getAttributes(); 
    	String userCorreo = user.getName(); 
    	String nivelCas =  attributes.get("nivel_id").toString();
    	String entidadCas =  attributes.get("entidad_id").toString();
    	
    	String accion = request.getParameter("accion");
    	Integer nivel = null;
    	Integer entidad = null;
    	Integer tipoPresupuesto = null;
    	Integer unidadResponsable = null;
    	Integer unidadMedida = null;
    	Integer programa = null;
    	Integer subprograma = null;
    	Integer proyecto = null;
    	Integer producto = null;
    	Integer unidadJerarquica = null;
    	Integer anio = null;
    	Integer mes = null;
    	Integer pais = null;
    	Integer departamento = null;
    	Integer cantidad = null;
    	
    	
    	String condition = "";
    	
    	String vision = "";
    	String objetivo = "";
    	String resultado = "";
    	String diagnostico = "";
    	String baseLegal = "";
    	String politica = "";
    	String sigla = "";
    	String abrev = "";
    	String nombre = "";
    	String descripcion = "";
    	String mision = "";
    	
    	if (request.getParameter("vision")!=null)  vision = 			new String(request.getParameter("vision").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("objetivo")!=null) objetivo = 			new String(request.getParameter("objetivo").getBytes("ISO8859_1"), "UTF-8"); 
    	if (request.getParameter("resultado")!=null) resultado = 		new String(request.getParameter("resultado").getBytes("ISO8859_1"), "UTF-8"); 
    	if (request.getParameter("diagnostico")!=null) diagnostico = 	new String(request.getParameter("diagnostico").getBytes("ISO8859_1"), "UTF-8"); 
    	if (request.getParameter("baseLegal")!=null) baseLegal =  		new String(request.getParameter("baseLegal").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("politica")!=null) politica = 			new String(request.getParameter("politica").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("sigla")!=null) sigla = 				new String(request.getParameter("sigla").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("abrev")!=null) abrev = 				new String(request.getParameter("abrev").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("nombre")!=null) nombre = 				new String(request.getParameter("nombre").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("descripcion")!=null) descripcion = 	new String(request.getParameter("descripcion").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("mision")!=null) mision = 	new String(request.getParameter("mision").getBytes("ISO8859_1"), "UTF-8");
    	
    	if (request.getParameter("nivel")!=null) nivel = 				Integer.parseInt(request.getParameter("nivel"));
    	if (request.getParameter("tipoPresupuesto")!=null) tipoPresupuesto = Integer.parseInt(request.getParameter("tipoPresupuesto"));
    	if (request.getParameter("entidad")!=null) entidad = 			Integer.parseInt(request.getParameter("entidad"));
    	if (request.getParameter("unidadResponsable")!=null) unidadResponsable = Integer.parseInt(request.getParameter("unidadResponsable"));
    	if (request.getParameter("unidadMedida")!=null) unidadMedida = 	Integer.parseInt(request.getParameter("unidadMedida"));
    	if (request.getParameter("programa")!=null) programa = 			Integer.parseInt(request.getParameter("programa"));
    	if (request.getParameter("subprograma")!=null) subprograma = 	Integer.parseInt(request.getParameter("subprograma"));
    	if (request.getParameter("proyecto")!=null) proyecto = 			Integer.parseInt(request.getParameter("proyecto"));
    	if (request.getParameter("producto")!=null) producto =			Integer.parseInt(request.getParameter("producto"));
    	if (request.getParameter("unidadJerarquica")!=null) producto = 	Integer.parseInt(request.getParameter("unidadJerarquica"));
    	if (request.getParameter("pais")!=null) pais = 					Integer.parseInt(request.getParameter("pais")); else pais=0;
    	if (request.getParameter("anio")!=null) anio = 					Integer.parseInt(request.getParameter("anio")); else anio=2017;
    	if (request.getParameter("mes")!=null) mes = 					Integer.parseInt(request.getParameter("mes")); else mes=0;
    	if (request.getParameter("departamento")!=null) departamento = 	Integer.parseInt(request.getParameter("departamento")); else departamento=99;
    	if (request.getParameter("cantidad")!=null) cantidad = 			Integer.parseInt(request.getParameter("cantidad")); else cantidad=0;
    	
        Map<String,String[]> solicitud =request.getParameterMap();
        PrintWriter out = response.getWriter();
        
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
 
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Methods", "PUT");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        
        
        
        Gson gson = new Gson(); 
        JsonObject myObj = new JsonObject();
        
        
        
        CatalogoDestinatario catalogoDestinatarioT = new CatalogoDestinatario();
        PrecioDNCP catalogoDncpT = new  PrecioDNCP(); //catalogoDNC
        Demografia demografiaT = new Demografia();
        Departamento departamentoT = new Departamento();
        DiccionarioDato diccionarioDatoT = new DiccionarioDato();
        EjeEstrategico ejeEstrategicoT = new EjeEstrategico();
        Entidad entidadT = new Entidad();
        Estrategia estrategiaT = new Estrategia();
        EstrategiaHasObjetivo estrategiaHasObjetivoT = new EstrategiaHasObjetivo();
        FuenteFinanciamiento fuenteFinanciamientoT = new FuenteFinanciamiento();
        FuenteVerificacion fuenteVerificacionT = new FuenteVerificacion();
        Funcional funcionalT = new Funcional();
        Indicador indicadorT = new Indicador();
        LineaTransversal lineaTransversalT = new LineaTransversal();
        /* Mes mesT = new Mes(); */
        Meta metaT = new Meta();
        MetodoCalculo metodoCalculoT = new MetodoCalculo();
        Modulo moduloT = new Modulo();
        ModuloHasPermiso moduloHasPermisoT = new ModuloHasPermiso();
        Nivel nivelT = new Nivel();
        Objetivo objetivoT = new Objetivo();
        ObjetoDeGasto objetoDeGastoT = new ObjetoDeGasto();
        OrganismoFinanciador organismoFinanciadorT = new OrganismoFinanciador();
        Permiso permisoT = new Permiso();
        Plan planT = new Plan();
        Producto productoT= new Producto();
        ProductoPresupuestoMeta productoPresupuestoMetaT = new ProductoPresupuestoMeta();
        ProductoPresupuesto productoPresupuestoT = new ProductoPresupuesto();
        Programa programaT = new Programa();
        Programatico programaticoT = new Programatico();
        ProgramaticoHasObjetivo programaticoHasObjetivoT = new ProgramaticoHasObjetivo();
        Proyecto proyectoT = new Proyecto();
        ProyectoSNIP proyectoSnipT = new ProyectoSNIP();
        ProyectoSNIPAutorizado proyectoSnipAutorizadoT = new ProyectoSNIPAutorizado();
        Role roleT = new Role();
        SubPrograma subProgramaT = new SubPrograma();
        TipoCatalogoDestinatario tipoCatalogoDestinatarioT = new TipoCatalogoDestinatario();
        TipoDemografica tipoDemograficaT = new TipoDemografica();
        TipoIndicador tipoIndicadorT = new TipoIndicador();
        TipoObjetivo tipoObjetivoT = new TipoObjetivo();
        TipoPresupuesto tipoPresupuestoT = new TipoPresupuesto();
        TipoProgramatico tipoProgramaticoT = new TipoProgramatico();
        TipoZonaGeografica tipoZonaGeograficaT = new TipoZonaGeografica();
        UnidadJerarquica unidadJerarquicaT = new UnidadJerarquica();
        UnidadMedida unidadMedidaT = new UnidadMedida();
        UnidadResponsable unidadResponsableT = new UnidadResponsable();
        Usuario usuarioT = new Usuario();
        ZonaGeografica zonaGeograficaT = new ZonaGeografica();
     

        
        

 
        
        if (accion!=null && accion!=""){
        	if (accion.equals("actEntidad")){
        		List entidades=null;
        		Entidad objeto = new Entidad();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Entidad.class);
				SqlUpdates.updateEntidad(objeto,userCorreo);
        	}

        	
        	if (accion.equals("actProductoPresupuestoDetalle")){
        		int i=0;
        		int j=0;
        		boolean status;
        		ProductoPresupuestoMetas metas = new ProductoPresupuestoMetas();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                metas=gsonInsert.fromJson(json, ProductoPresupuestoMetas.class);
                metas.producto_presupusto_id=metas.tipo_presupuesto_id;              
                
                for(i=0;i<19;i++){
                	for(j=1;j<metas.cantidades[i].length;j++){
                		if (metas.cantidades[i][j]!=null || metas.cantidades[i][j]!="") 
                			status = SqlUpdates.updateProductoPresupuestoMeta(Double.parseDouble(metas.cantidades[i][j].toString()) , "2017",""+j , "1", ""+i, metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
                		else 
                			status = SqlUpdates.updateProductoPresupuestoMeta(0, "2017", ""+j, "1", ""+i, metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
                	}
                }
                for(j=1;j<metas.cantidades[19].length;j++){
	                if (metas.cantidades[19][j]!= null) 
	                	status = SqlUpdates.updateProductoPresupuestoMeta(Double.parseDouble(metas.cantidades[19][j].toString()), "2017", ""+j, "1", "88", metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
	            	else 
	            		status = SqlUpdates.updateProductoPresupuestoMeta(0, "2017", ""+j, "1", "88", metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
                }
	            for(j=1;j<metas.cantidades[20].length;j++){
	            	if (metas.cantidades[20][j]!=null) 
	            		status = SqlUpdates.updateProductoPresupuestoMeta(Double.parseDouble(metas.cantidades[20][j].toString()), "2017", ""+j, "1", "99", metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
	            	else 
	            		status = SqlUpdates.updateProductoPresupuestoMeta(0, "2017", ""+j, "1", "99", metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
                }
	            status = SqlUpdates.updateProductoPresupuestoMeta(Double.parseDouble(metas.anho2.toString()) , "2018", "1", "12", "99", metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
	            status = SqlUpdates.updateProductoPresupuestoMeta(Double.parseDouble(metas.anho3.toString()), "2019", "1", "12", "99", metas.producto_presupusto_id.toString(), metas.producto_id.toString(), metas.unidad_medida_id.toString(), metas.proyecto_id.toString(), metas.subprograma_id.toString(), metas.programa_id.toString(), metas.tipo_presupuesto_id.toString(), metas.entidad_id.toString(), metas.nivel_id.toString(), userCorreo);
	            myObj.addProperty("success", status);
        		out.println(myObj.toString());
	            
	            //SqlUpdates.updateProductoPresupuestoMeta(cantidad, anho, mes, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuetso_id, entidad_id, nivel_id);
				//SqlInserts.insertProductoPresupuestoMeta(meta);
        		//response.sendRedirect("producto.jsp");
        	}
        	
        	if (accion.equals("actAsignacionFinanciera")){        		
        		boolean status=false;        		
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                AsignacionPresi[] obj = gson.fromJson(json, AsignacionPresi[].class);                              
                
                for(int j=0;j<obj.length;j++){                		 
                	status = SqlUpdates.updateAsignacionFinanciera(obj[j].nivel, obj[j].entidad, obj[j].tipo, obj[j].programa, obj[j].subPrograma, obj[j].proyecto, obj[j].producto, obj[j].objetoGasto, obj[j].fuenteFinanciamiento, obj[j].organismoFinanciador, obj[j].pais, obj[j].departamento,
                			obj[j].planificado1, obj[j].planificado2, obj[j].planificado3, obj[j].planificado4, obj[j].planificado5, obj[j].planificado6, obj[j].planificado7,  obj[j].planificado8, obj[j].planificado9, obj[j].planificado10, obj[j].planificado11, obj[j].planificado12, obj[j].anho, obj[j].version, userCorreo);                		
                }
                                
	            myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	
        	if (accion.equals("actProductoPresupuestoDestinatario")){
        		ProductoPresupuestoDestinatario destinatarios = new ProductoPresupuestoDestinatario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                destinatarios=gsonInsert.fromJson(json, ProductoPresupuestoDestinatario.class);							
				try {
					boolean status = SqlUpdates.updateProductoPresupuestoDestinatario(destinatarios,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}
        	if (accion.equals("actBorrarProductoPresupuestoDestinatario")){
        		ProductoPresupuestoDestinatario destinatarios = new ProductoPresupuestoDestinatario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                destinatarios=gsonInsert.fromJson(json, ProductoPresupuestoDestinatario.class);							
				try {
					boolean status = SqlUpdates.updateBorradoProductoPresupuestoDestinatario(destinatarios,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}        	        	
        	if (accion.equals("actBorrarTodosProductoPresupuestoDestinatario")){
        		ProductoPresupuestoDestinatario destinatarios = new ProductoPresupuestoDestinatario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                destinatarios=gsonInsert.fromJson(json, ProductoPresupuestoDestinatario.class);							
				try {
					boolean status = SqlUpdates.updateBorradoTodosProductoPresupuestoDestinatario(destinatarios,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}
        	if (accion.equals("actDictamenSTP")){
        		DictamenSTP dictamenSTP = new DictamenSTP();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                dictamenSTP=gsonInsert.fromJson(json, DictamenSTP.class);							
				try {
					boolean status = SqlUpdates.updateDictamenSTP(dictamenSTP,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}
        	if (accion.equals("actBorrarDictamen")){
        		DictamenSTP dictamenSTP = new DictamenSTP();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                dictamenSTP=gsonInsert.fromJson(json, DictamenSTP.class);							
				try {
					boolean status = SqlUpdates.updateBorradoDictamenSTP(dictamenSTP,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}        	
        	if (accion.equals("actTipoDocumento")){
        		List tipoDocumento=null;
        		TipoDocumento objeto = new TipoDocumento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, TipoDocumento.class);				
				try {
					boolean status = SqlUpdates.updateTipoDocumento(objeto,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        	}    
        	if (accion.equals("actBorrarTipoDocumento")){
        		TipoDocumento tipoDocumento = new TipoDocumento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoDocumento=gsonInsert.fromJson(json, TipoDocumento.class);							
				try {
					boolean status = SqlUpdates.updateBorradoTipoDocumento(tipoDocumento,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}        		
        	}
        	if (accion.equals("actBorrarTodosObjetivoHasObjetivo")){
        		ObjetivoHasObjetivo OHO = new ObjetivoHasObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                OHO=gsonInsert.fromJson(json, ObjetivoHasObjetivo.class);							
				try {
					boolean status = SqlUpdates.updateBorradoTodosObjetivoHasObjetivo(OHO,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}
        	if (accion.equals("actBorrarTodosProductosPresupuestoMeta")){
        		ProductoPresupuestoMeta presupuestoMetas = new ProductoPresupuestoMeta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                presupuestoMetas=gsonInsert.fromJson(json, ProductoPresupuestoMeta.class);							
				try {
					boolean status = SqlUpdates.updateBorradoTodosProductoPresupuestoMeta(presupuestoMetas,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}
        	
        	

        	
        	//ajaxUpdate de Destinatarios por producto.
        	//recibimos todos los parametros 
        	//traemos todos los destinatarios 
        	//por la cantidad de registros que nos devuelve llamamos a la funcion que actualiza borrado de destinatarios
        	//return success.
        	
        	
        	
//        	if (accion.equals("actProductoDestinatarios")){
//        		int i=0;
//        		int j=0;
//        		ProductoPresupuestoDestinatarios destinatarios = new ProductoPresupuestoDestinatarios();
//        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
//                String json = "";
//                if(br != null){ json = br.readLine();}
//                json=json.replace("null","0.0");
//                json=json.replace("\"\"","\"0.0\"");
//                Gson gsonInsert = new Gson();
//                destinatarios=gsonInsert.fromJson(json, ProductoPresupuestoDestinatarios.class);
//              	SqlUpdates.updateProductoPresupuestoDestinatario(destinatarios);
//              	
//                		
//        	}        	              
        	
        	/*if (accion.equals("actProductoPresupuestoMeta")){
        		List entidades=null;
				SqlUpdates.updateProductoPresupuestoMeta(cantidad, 2017, mes, 1, departamento, producto, producto, unidadMedida, proyecto, subprograma, programa, tipoPresupuesto, entidad, nivel);
        		JsonElement json = new Gson().toJsonTree(entidades );
        		myObj.addProperty("success", true);
        		myObj.add("productoPresupuestoMeta", json);
        		out.println(myObj.toString());
        		//response.sendRedirect("producto.jsp");
        	}*/
        	
        	if (accion.equals("actPrograma")){
        		Programa objeto = new Programa();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Programa.class);
				try {
					boolean status = SqlUpdates.updatePrograma(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					e.printStackTrace();
				} 
        	}
        	
        	if (accion.equals("actSubPrograma")){
        		SubPrograma objeto = new SubPrograma();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, SubPrograma.class);
				try {
					boolean status = SqlUpdates.updateSubPrograma(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        	}
        	
        	if (accion.equals("actProyecto")){
        		Proyecto objeto = new Proyecto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Proyecto.class);				
				try {
					boolean status = SqlUpdates.updateProyecto(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}        		
        	}
        	if (accion.equals("actBorrarProyecto")){
        		Proyecto proyectoObj = new Proyecto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                proyectoObj=gsonInsert.fromJson(json, Proyecto.class);							
				try {
					boolean status = SqlUpdates.updateBorradoProyecto(proyectoObj,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}        		
        	}
        	if (accion.equals("actEstructura")){
        		Estructura objeto = new Estructura();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Estructura.class);
				SqlUpdates.updateEstructura(objeto,userCorreo);
        		
        	}
        	if (accion.equals("actEstructuraFinanciera")){
        		EstructuraFinanciera objeto = new EstructuraFinanciera();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, EstructuraFinanciera.class);
				SqlUpdates.updateEstructuraFinanciera(objeto,userCorreo);
        		
        	}
        	if (accion.equals("actPresupuestoIngreso")){
        		PresupuestoIngreso objeto = new PresupuestoIngreso();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, PresupuestoIngreso.class);
				SqlUpdates.updatePresupuestoIngreso(objeto,userCorreo);
        		
        	}
        	if (accion.equals("actPresupuestoGasto")){
        		PresupuestoGasto objeto = new PresupuestoGasto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, PresupuestoGasto.class);
				SqlUpdates.updatePresupuestoGasto(objeto,userCorreo);
        		
        	}
        	if (accion.equals("actFundamentacion")){
        		Fundamentacion objeto = new Fundamentacion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Fundamentacion.class);
				SqlUpdates.updateFundamentacion(objeto,userCorreo);
        		
        	}         	
            if (accion!=null && accion!=""){
            	if (accion.equals("actPass")){
            		List entidades=null;
            		Credenciales entidadObj = new Credenciales();
            		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                    String json = "";
                    if(br != null){ json = br.readLine();}
                    Gson gsonInsert = new Gson();
                    entidadObj=gsonInsert.fromJson(json, Credenciales.class);
                    boolean status = SqlUpdates.updateCredenciales(entidadObj,userCorreo);
            		myObj.addProperty("success", status);
            		out.println(myObj.toString());
            	}
            	
            }  
        	if (accion.equals("actBorrarIndicadoresMeta")){
        		Indicador objeto = new Indicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Indicador.class);
				SqlUpdates.updateIndicadores(objeto,userCorreo);
        	}
			//Cree esta seccion porque la condicional de arriba actualiza otra tabla y no solo el borrado del indicador
        	if (accion.equals("actBorrarIndicador")){
        		Indicador objeto = new Indicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Indicador.class);
				boolean status = SqlUpdates.updateIndicador(objeto,userCorreo,nivelCas,entidadCas);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("actBorrarObjetivos")){
        		Objetivo objeto = new Objetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Objetivo.class);
				try {
					boolean status = SqlUpdates.updateBorradoObjetivos(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
        	} 
        	if (accion.equals("actObjetivoSugerido")){
        		ObjetivoSugerido objeto = new ObjetivoSugerido();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoSugerido.class);
                boolean status = SqlUpdates.updateObjetivoSugerido(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actBorrarObjetivosSugeridos")){
        		ObjetivoSugerido objeto = new ObjetivoSugerido();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoSugerido.class);
				boolean status;
				try {
					status = SqlUpdates.updateBorradoObjetivosSugeridos(objeto,userCorreo);
					myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		
				
        	} 
        	
        	if (accion.equals("actEditarIndicadores")){
        		ActualizarFormularioIndicadorMeta objeto = new ActualizarFormularioIndicadorMeta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ActualizarFormularioIndicadorMeta.class);
				SqlUpdates.updateFormularioIndicadores(objeto,userCorreo);
        	}
        	
        	if (accion.equals("actObjetivos")){
        		Objetivo objeto = new Objetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Objetivo.class);
                try {
					boolean status = SqlUpdates.updateObjetivos(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        	}
        	//Agre este otro if por que el de arriba no solo actualiza la tabla indicador: falta mejorar este codigo que recibe dos objetos
        	if (accion.equals("actEditarIndicador")){
        		Indicador objeto = new Indicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Indicador.class);
		        boolean status = SqlUpdates.updateIndicadorCrud(objeto,userCorreo,nivelCas,entidadCas);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        		
        	}        	
        	if (accion.equals("actBorradoUsuario")){
        		Usuario objeto = new Usuario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Usuario.class);
                boolean status = SqlUpdates.updateBorradoUsuarios(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("actUsuario")){
        		Usuario objeto = new Usuario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Usuario.class);
                boolean status = SqlUpdates.updateUsuario(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	
        	if (accion.equals("actInstitucion")){
        		Institucion objeto = new Institucion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Institucion.class);
                boolean status = SqlUpdates.updateInstitucion(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("borradoInstitucion")){
        		Institucion objeto = new Institucion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Institucion.class);
                boolean status = SqlUpdates.borradoInstitucion(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actObjetivoHasObjetivo")){
        		ObjetivoHasObjetivo objeto = new ObjetivoHasObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoHasObjetivo.class);
                boolean status = SqlUpdates.updateObjetivoHasObjetivo(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actBorradoObjetivoHasObjetivo")){
        		ObjetivoHasObjetivo objeto = new ObjetivoHasObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoHasObjetivo.class);
                boolean status = SqlUpdates.updateBorradoObjetivoHasObjetivo(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actBorradoMetas")){
        		Meta objeto = new Meta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Meta.class);
                boolean status = SqlUpdates.updateBorradoMeta(objeto,userCorreo,nivelCas,entidadCas);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actBorradoTodasMetas")){
        		Meta objeto = new Meta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Meta.class);
                boolean status = SqlUpdates.updateBorradoTodasMeta(objeto,userCorreo,nivelCas,entidadCas);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actMetas")){
        		Meta objeto = new Meta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Meta.class);
                boolean status = SqlUpdates.updateMetaCrud(objeto,userCorreo,nivelCas,entidadCas);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actEtiqueta")){
        		Etiqueta objeto = new Etiqueta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Etiqueta.class);
                boolean status = SqlUpdates.updateEtiqueta(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actProductoPresupuestoIntermedio")){
        		ProductoPresupuesto objeto = new ProductoPresupuesto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ProductoPresupuesto.class);
                boolean status = SqlUpdates.updateProductoPresupuestoIntermedio(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actBorrarProductoPresupuesto")){
        		ProductoPresupuesto objeto = new ProductoPresupuesto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ProductoPresupuesto.class);
				try {
					boolean status = SqlUpdates.updateBorradoProductoPresupuesto(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
        	}
        	if (accion.equals("actDocumento")){
        		Documentos objeto = new Documentos();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Documentos.class);
                try {
					boolean status = SqlUpdates.updateDocumentos(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        	}
        	if (accion.equals("actBorradoDocumento")){
        		Documentos objeto = new Documentos();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Documentos.class);
                boolean status = SqlUpdates.updateBorradoDocumento(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actPermisoPorModulo")){
        		PermisoPorModulos objeto = new PermisoPorModulos();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, PermisoPorModulos.class);
                try {
					boolean status = SqlUpdates.updatePermisoPorModulo(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        	}
        	if (accion.equals("actBorradoJustificacion")){
        		Justificacion objeto = new Justificacion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Justificacion.class);
                boolean status = SqlUpdates.updateBorradoJustificacion(objeto,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actJustificacion")){
        		Justificacion justificacion = new Justificacion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                justificacion=gsonInsert.fromJson(json, Justificacion.class);							
				try {
					boolean status = SqlUpdates.updateJustificacion(justificacion,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
        		
        	}
        	if (accion.equals("actUltEtiqueta")){
        		Usuario usr = new Usuario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                usr=gsonInsert.fromJson(json, Usuario.class);
                try {
	                boolean status = SqlUpdates.actUltimaEtiqueta(usr);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
                } catch (Exception e) {
					e.printStackTrace();
				}
        	}
        }
     
    }
}
