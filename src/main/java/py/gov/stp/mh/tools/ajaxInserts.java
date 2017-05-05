package py.gov.stp.mh.tools;

import py.gov.stp.mh.clasificadores.*;
import py.gov.stp.mh.consultas.*;
import py.gov.stp.mh.test.*;
import py.gov.stp.mh.tools.SqlInserts;

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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ajaxInserts  extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = user.getAttributes(); 
    	String userCorreo = user.getName();
    	String nivelCas =  attributes.get("nivel_id").toString();
    	String entidadCas =  attributes.get("entidad_id").toString();
    	
    	String accion = request.getParameter("accion");

        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
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
        
        if (accion!=null && accion!=""){
        	if (accion.equals("insProductoPresupuesto")){
        		ProductoPresupuesto objeto = new ProductoPresupuesto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ProductoPresupuesto.class);               
				try {
					boolean status = SqlInserts.insertProductoPresupuesto(objeto, userCorreo);					
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if (accion.equals("insProductoPresupuestoMetas")){
        		ProductoPresupuestoMeta productoMetaObj = new ProductoPresupuestoMeta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
               // productoObj=gsonInsert.fromJson(json, ProductoPresupuesto.class);
			   //SqlInserts.insertProductoPresupuesto(productoObj,userCorreo);
        	}
        	if (accion.equals("insPrograma")){
        		Programa programaObj = new Programa();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                programaObj=gsonInsert.fromJson(json, Programa.class);
				SqlInserts.insertPrograma(programaObj);
        	}
        	if (accion.equals("insProgramaCompleto")){
        		Programa programaObj = new Programa();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                programaObj=gsonInsert.fromJson(json, Programa.class);
				SqlInserts.insertProgramaCompleto(programaObj);
        	}
        	if (accion.equals("insPrecioDncp")){
        		PrecioDNCP precioDNCPObj = new PrecioDNCP();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                precioDNCPObj=gsonInsert.fromJson(json, PrecioDNCP.class);
				SqlInserts.insertPrecioDncp(precioDNCPObj);
        	}
        	if (accion.equals("insCatalogoDestinatario")){
        		CatalogoDestinatario catalogoDestinatarioObj = new CatalogoDestinatario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                catalogoDestinatarioObj=gsonInsert.fromJson(json, CatalogoDestinatario.class);                
				SqlInserts.insertCatalogoDestinatario(catalogoDestinatarioObj,userCorreo);
        	}
        	if (accion.equals("insProductoPresupuestoDestinatario")) {
				ProductoPresupuestoDestinatario productoPresupuestoDestinatario = new ProductoPresupuestoDestinatario();
				BufferedReader br = new BufferedReader(new InputStreamReader(
						request.getInputStream()));
				String json = "";
				if (br != null) {
					json = br.readLine();
				}
				Gson gsonInsert = new Gson();
				productoPresupuestoDestinatario = gsonInsert.fromJson(json,ProductoPresupuestoDestinatario.class);
				try {
					String status = SqlInserts.insertProductoPresupuestoDestinatario(productoPresupuestoDestinatario, userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
        	if (accion.equals("insDemografia")){
        		Demografia demografiaObj = new Demografia();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                demografiaObj=gsonInsert.fromJson(json, Demografia.class);                
				SqlInserts.insertDemografia(demografiaObj,userCorreo);
        	}
        	if (accion.equals("insDepartamento")){
        		Departamento departamentoObj = new Departamento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                departamentoObj=gsonInsert.fromJson(json, Departamento.class);
				SqlInserts.insertDepartamento(departamentoObj);
        	}
        	if (accion.equals("insDiccionarioDato")){
        		DiccionarioDato diccionarioDatoObj = new DiccionarioDato();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                diccionarioDatoObj=gsonInsert.fromJson(json, DiccionarioDato.class);                
				SqlInserts.insertDiccionarioDato(diccionarioDatoObj,userCorreo);
        	}
        	if (accion.equals("insEjeEstrategico")){
        		EjeEstrategico ejeEstrategicoObj = new EjeEstrategico();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                ejeEstrategicoObj=gsonInsert.fromJson(json, EjeEstrategico.class);
				SqlInserts.insertEjeEstrategico(ejeEstrategicoObj,userCorreo);
        	}
        	if (accion.equals("insEstrategia")){
        		Estrategia estrategiaObj = new Estrategia();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                estrategiaObj=gsonInsert.fromJson(json, Estrategia.class);                
				SqlInserts.insertEstrategia(estrategiaObj,userCorreo);
        	}
        	if (accion.equals("insEstrategiaHasObjetivo")){
        		EstrategiaHasObjetivo estrategiaHasObjetivoObj = new EstrategiaHasObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                estrategiaHasObjetivoObj=gsonInsert.fromJson(json, EstrategiaHasObjetivo.class);                
				SqlInserts.insertEstrategiaHasObjetivo(estrategiaHasObjetivoObj, userCorreo);
        	}
        	if (accion.equals("insFuenteFinanciamiento")){
        		FuenteFinanciamiento fuenteFinanciamientoObj = new FuenteFinanciamiento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                fuenteFinanciamientoObj=gsonInsert.fromJson(json, FuenteFinanciamiento.class);
				SqlInserts.insertFuenteFinanciamiento(fuenteFinanciamientoObj);
        	}
        	if (accion.equals("insFuenteVerificacion")){
        		FuenteVerificacion fuenteVerificacionObj = new FuenteVerificacion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                fuenteVerificacionObj=gsonInsert.fromJson(json, FuenteVerificacion.class);                
				SqlInserts.insertFuenteVerificacion(fuenteVerificacionObj, userCorreo);
        	}
        	if (accion.equals("insFuncional")){
        		Funcional funcionalObj = new Funcional();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                funcionalObj=gsonInsert.fromJson(json, Funcional.class);
				SqlInserts.insertFuncional(funcionalObj);
        	}
        	if (accion.equals("insIndicador")){
        		Indicador indicadorObj = new Indicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                indicadorObj=gsonInsert.fromJson(json, Indicador.class);
				try {
					boolean status = SqlInserts.insertIndicador(indicadorObj,userCorreo,nivelCas,entidadCas);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if (accion.equals("insIndicadorResultado")){
        		IndicadorResultado indicadorResultadoObj = new IndicadorResultado();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                indicadorResultadoObj=gsonInsert.fromJson(json, IndicadorResultado.class);                
				SqlInserts.insertIndicadorResultado(indicadorResultadoObj, userCorreo);
        	}
           	if (accion.equals("insLineaTransversal")){
        		LineaTransversal lineaTransversalObj = new LineaTransversal();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                lineaTransversalObj=gsonInsert.fromJson(json, LineaTransversal.class);                
				SqlInserts.insertLineaTransversal(lineaTransversalObj, userCorreo);
        	}
        	/*
           	if (accion.equals("insMes")){
        		Mes mesObj = new Mes();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                mesObj=gsonInsert.fromJson(json, Mes.class);
				SqlInserts.insertMes(mesObj);
        	}
        	*/
        	if (accion.equals("insMeta")){
        		Meta metaObj = new Meta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                metaObj=gsonInsert.fromJson(json, Meta.class);                
				SqlInserts.insertMeta(metaObj,userCorreo);
        	}   
        	if (accion.equals("insMetasCrud")){
        		Meta metaObj = new Meta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                metaObj=gsonInsert.fromJson(json, Meta.class);
    			try {
					boolean status = SqlInserts.insertMetaCrud(metaObj,userCorreo,nivelCas,entidadCas);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}   
				
        	}       
        	if (accion.equals("insMetodoCalculo")){
        		MetodoCalculo metodoCalculoObj = new MetodoCalculo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                metodoCalculoObj=gsonInsert.fromJson(json, MetodoCalculo.class);                
				SqlInserts.insertMetodoCalculo(metodoCalculoObj, userCorreo);
        	}
        	if (accion.equals("insModulo")){
        		Modulo moduloObj = new Modulo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                moduloObj=gsonInsert.fromJson(json, Modulo.class);
				SqlInserts.insertModulo(moduloObj, userCorreo);
        	}
        	if (accion.equals("insModuloHasPermiso")){
        		ModuloHasPermiso moduloHasPermisoObj = new ModuloHasPermiso();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                moduloHasPermisoObj=gsonInsert.fromJson(json, ModuloHasPermiso.class);
				SqlInserts.insertModuloHasPermiso(moduloHasPermisoObj,userCorreo);
        	}
        	if (accion.equals("insPermisoPorModulos")){
        		PermisoPorModulos moduloHasPermisoObj = new PermisoPorModulos();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                moduloHasPermisoObj=gsonInsert.fromJson(json, PermisoPorModulos.class);
				boolean status = SqlInserts.insertPermisoPorModulos(moduloHasPermisoObj,userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("insNivel")){
        		Nivel nivelObj = new Nivel();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                nivelObj=gsonInsert.fromJson(json, Nivel.class);
				SqlInserts.insertNivel(nivelObj);
        	}
        	if (accion.equals("insObjetivo")){
        		Objetivo objetivoObj = new Objetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objetivoObj=gsonInsert.fromJson(json, Objetivo.class);
    			try {
					boolean status = SqlInserts.insertObjetivo(objetivoObj,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}          				
        	}
        	if (accion.equals("insObjetivoSugerido")){
        		ObjetivoSugerido objetivoObj = new ObjetivoSugerido();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objetivoObj=gsonInsert.fromJson(json, ObjetivoSugerido.class);                
    			boolean status = SqlInserts.insertObjetivoSugerido(objetivoObj, userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("insObjetoDeGasto")){
        		ObjetoDeGasto objetoDeGastoObj = new ObjetoDeGasto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objetoDeGastoObj=gsonInsert.fromJson(json, ObjetoDeGasto.class);
				SqlInserts.insertObjetoDeGasto(objetoDeGastoObj,userCorreo);
        	}
        	if (accion.equals("insOrganismoFinanciador")){
        		OrganismoFinanciador organismoFinanciadorObj = new OrganismoFinanciador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                organismoFinanciadorObj=gsonInsert.fromJson(json, OrganismoFinanciador.class);
				SqlInserts.insertOrganismoFinanciador(organismoFinanciadorObj);
        	}
        	if (accion.equals("insPermiso")){
        		Permiso permisoObj = new Permiso();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                permisoObj=gsonInsert.fromJson(json, Permiso.class);                
				SqlInserts.insertPermiso(permisoObj,userCorreo);
        	}
        	if (accion.equals("insPlan")){
        		Plan planObj = new Plan();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                planObj=gsonInsert.fromJson(json, Plan.class);
				SqlInserts.insertPlan(planObj);
        	}
        	if (accion.equals("insProducto")){
        		Producto productoObj = new Producto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                productoObj=gsonInsert.fromJson(json, Producto.class);
				SqlInserts.insertProducto(productoObj,userCorreo);
        	}
        	/*if (accion.equals("insProductoPresupuesto")){//wtf
        		ProductoPresupuesto productoPresupuestoObj = new ProductoPresupuesto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                productoPresupuestoObj=gsonInsert.fromJson(json, ProductoPresupuesto.class);
				SqlInserts.insertProductoPresupuesto(productoPresupuestoObj);
        	}*/
        	if (accion.equals("insProductoPresupuestoMeta")){
        		ProductoPresupuestoMeta productoPresupuestoMetaObj = new ProductoPresupuestoMeta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                productoPresupuestoMetaObj=gsonInsert.fromJson(json, ProductoPresupuestoMeta.class);                
				SqlInserts.insertProductoPresupuestoMeta(productoPresupuestoMetaObj,userCorreo);
        	}
        	if (accion.equals("insProgramatico")){
        		Programatico programaticoObj = new Programatico();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                programaticoObj=gsonInsert.fromJson(json, Programatico.class);                
				SqlInserts.insertProgramatico(programaticoObj,userCorreo);
        	}
        	if (accion.equals("insProgramaticoHasObjetivo")){
        		ProgramaticoHasObjetivo programaticoHasObjetivoObj = new ProgramaticoHasObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                programaticoHasObjetivoObj=gsonInsert.fromJson(json, ProgramaticoHasObjetivo.class);                
				SqlInserts.insertProgramaticoHasObjetivo(programaticoHasObjetivoObj, userCorreo);
        	}
        	if (accion.equals("insProyecto")){
        		Proyecto proyectoObj = new Proyecto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                proyectoObj=gsonInsert.fromJson(json, Proyecto.class);                
				SqlInserts.insertProyecto(proyectoObj, userCorreo);
        	}
        	if (accion.equals("insProyectoSnip")){
        		ProyectoSNIP proyectoSNIPObj = new ProyectoSNIP();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                proyectoSNIPObj=gsonInsert.fromJson(json, ProyectoSNIP.class);
				SqlInserts.insertProyectoSnip(proyectoSNIPObj);
        	}
        	if (accion.equals("insProyectoSnipAutorizado")){
        		ProyectoSNIPAutorizado proyectoSNIPAutorizadoObj = new ProyectoSNIPAutorizado();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                proyectoSNIPAutorizadoObj=gsonInsert.fromJson(json, ProyectoSNIPAutorizado.class);
				SqlInserts.insertProyectoSnipAutorizado(proyectoSNIPAutorizadoObj);
        	}
        	if (accion.equals("insRole")){
        		Role roleObj = new Role();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                roleObj=gsonInsert.fromJson(json, Role.class);                
				SqlInserts.insertRole(roleObj,userCorreo);
        	}
        	if (accion.equals("insSubPrograma")){
        		SubPrograma subProgramaObj = new SubPrograma();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                subProgramaObj=gsonInsert.fromJson(json, SubPrograma.class);                
				SqlInserts.insertSubPrograma(subProgramaObj,userCorreo);
        	}
        	if (accion.equals("insTipoCatalogoDestinatario")){
        		TipoCatalogoDestinatario tipoCatalogoDestinatarioObj = new TipoCatalogoDestinatario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoCatalogoDestinatarioObj=gsonInsert.fromJson(json, TipoCatalogoDestinatario.class);                
				SqlInserts.insertTipoCatalogoDestinatario(tipoCatalogoDestinatarioObj,userCorreo);
        	}
        	if (accion.equals("insTipoDemografica")){
        		TipoDemografica tipoDemograficaObj = new TipoDemografica();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoDemograficaObj=gsonInsert.fromJson(json, TipoDemografica.class);                
				SqlInserts.insertTipoDemografica(tipoDemograficaObj,userCorreo);
        	}
        	if (accion.equals("insTipoIndicador")){
        		TipoIndicador tipoIndicadorObj = new TipoIndicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoIndicadorObj=gsonInsert.fromJson(json, TipoIndicador.class);                
				SqlInserts.insertTipoIndicador(tipoIndicadorObj,userCorreo);
        	}
        	if (accion.equals("insTipoObjetivo")){
        		TipoObjetivo tipoObjetivoObj = new TipoObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoObjetivoObj=gsonInsert.fromJson(json, TipoObjetivo.class);
				SqlInserts.insertTipoObjetivo(tipoObjetivoObj,userCorreo);
        	}
        	if (accion.equals("insTipoPresupuesto")){
        		TipoPresupuesto tipoPresupuestoObj = new TipoPresupuesto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoPresupuestoObj=gsonInsert.fromJson(json, TipoPresupuesto.class);                
				SqlInserts.insertTipoPresupuesto(tipoPresupuestoObj,userCorreo);
        	}
        	if (accion.equals("insTipoProgramatico")){
        		TipoProgramatico tipoProgramaticoObj = new TipoProgramatico();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoProgramaticoObj=gsonInsert.fromJson(json, TipoProgramatico.class);                
				SqlInserts.insertTipoProgramatico(tipoProgramaticoObj, userCorreo);
        	}
        	if (accion.equals("insTipoZonaGeografica")){
        		TipoZonaGeografica tipoZonaGeograficaObj = new TipoZonaGeografica();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                tipoZonaGeograficaObj=gsonInsert.fromJson(json, TipoZonaGeografica.class);                
				SqlInserts.insertTipoZonaGeografica(tipoZonaGeograficaObj,userCorreo);
        	}
        	if (accion.equals("insUnidadJerarquica")){
        		py.gov.stp.mh.clasificadores.UnidadJerarquica unidadJerarquicaObj = new py.gov.stp.mh.clasificadores.UnidadJerarquica();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                unidadJerarquicaObj=gsonInsert.fromJson(json, py.gov.stp.mh.clasificadores.UnidadJerarquica.class);
				SqlInserts.insertUnidadJerarquica(unidadJerarquicaObj);
        	}
        	if (accion.equals("insUsuario")){
        		Usuario usuarioObj = new Usuario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                usuarioObj=gsonInsert.fromJson(json, Usuario.class);
				try {
					boolean status = SqlInserts.insertUsuario(usuarioObj,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if (accion.equals("insUnidadMedida")){
        		UnidadMedida unidadMedidaObj = new UnidadMedida();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                unidadMedidaObj=gsonInsert.fromJson(json, UnidadMedida.class);
				SqlInserts.insertUnidadMedida(unidadMedidaObj);
        	}
        	if (accion.equals("insUnidadResponsable")){
        		UnidadResponsable unidadResponsableObj = new UnidadResponsable();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                unidadResponsableObj=gsonInsert.fromJson(json, UnidadResponsable.class);
				SqlInserts.insertUnidadResponsable(unidadResponsableObj);
        	}
        	if (accion.equals("insZonaGeografica")){
        		ZonaGeografica zonaGeograficaObj = new ZonaGeografica();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                zonaGeograficaObj=gsonInsert.fromJson(json, ZonaGeografica.class);                
				SqlInserts.insertZonaGeografica(zonaGeograficaObj,userCorreo);
        	}
        	if (accion.equals("insResultado")){
        		Resultado resultadoObj = new Resultado();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                resultadoObj=gsonInsert.fromJson(json, Resultado.class);
    			try {
					boolean status = SqlInserts.insertResultado(resultadoObj, userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}          				
        	}
        	if (accion.equals("insEstructura")){
        		Estructura estructuraObj = new Estructura();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                estructuraObj=gsonInsert.fromJson(json, Estructura.class);
				SqlInserts.insertEstructura(estructuraObj,userCorreo);
        	}
        	if (accion.equals("insEstructuraFinanciera")){
        		EstructuraFinanciera estructuraFinancieraObj = new EstructuraFinanciera();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                estructuraFinancieraObj=gsonInsert.fromJson(json, EstructuraFinanciera.class);
				SqlInserts.insertEstructuraFinanciera(estructuraFinancieraObj, userCorreo);
        	}
//        	if (accion.equals("insPresupuestoIngreso")){
//        		PresupuestoIngreso presupuestoIngresoObj = new PresupuestoIngreso();
//        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
//                String json = "";
//                if(br != null){ json = br.readLine();}
//                Gson gsonInsert = new Gson();
//                presupuestoIngresoObj=gsonInsert.fromJson(json, PresupuestoIngreso.class);
//				SqlInserts.insertPresupuestoIngreso(presupuestoIngresoObj);
//        	}         	
        	if (accion.equals("insPresupuestoGasto")){
        		PresupuestoGasto presupuestoGastoObj = new PresupuestoGasto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                presupuestoGastoObj=gsonInsert.fromJson(json, PresupuestoGasto.class);
				SqlInserts.insertPresupuestoGasto(presupuestoGastoObj, userCorreo);
        	}
        	if (accion.equals("insFundamentacion")){
        		Fundamentacion fundamentacionObj = new Fundamentacion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                fundamentacionObj=gsonInsert.fromJson(json, Fundamentacion.class);                
				SqlInserts.insertFundamentacion(fundamentacionObj,userCorreo);
        	}
        	if (accion.equals("insInstitucion")){
        		Institucion institucionObj = new Institucion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                institucionObj=gsonInsert.fromJson(json, Institucion.class);                
				SqlInserts.insertInstitucion(institucionObj, userCorreo);
        	}
        	if (accion.equals("insObjetivoHasObjetivo")){
        		ObjetivoHasObjetivo objeto = new ObjetivoHasObjetivo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoHasObjetivo.class);               
				try {
					boolean status = SqlInserts.insertObjetivoHasObjetivo(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}    
        	if (accion.equals("insObjetivoHasIndicador")){
        		ObjetivoHasIndicador objeto = new ObjetivoHasIndicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoHasIndicador.class);               
				try {
					boolean status = SqlInserts.insertObjetivoHasIndicador(objeto,userCorreo);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	} 
        	if (accion.equals("insEtiqueta")){
        		Etiqueta objeto = new Etiqueta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Etiqueta.class);               
				try {
					boolean status = SqlInserts.insertEtiqueta(objeto);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}        	
        	if (accion.equals("insPresupuestoEtiquetas")){
        		PresupuestoEtiqueta objeto = new PresupuestoEtiqueta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, PresupuestoEtiqueta.class);               
				try {
					boolean status = SqlInserts.insertPresupuestoEtiqueta(objeto);
	        		myObj.addProperty("success", status);
	        		out.println(myObj.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if (accion.equals("insDocumento")){
        		Documentos objeto = new Documentos();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                //Gson gsonInsert = new Gson();
                Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();            
                objeto=gsonInsert.fromJson(json, Documentos.class);
    			try {
    				boolean status = SqlInserts.insertDocumento(objeto);
            		myObj.addProperty("success", status);
            		out.println(myObj.toString());
    			} catch (ParseException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
        	}
        	if (accion.equals("insTipoDocumento")){
        		TipoDocumento objeto = new TipoDocumento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                //Gson gsonInsert = new Gson();
                Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();            
                objeto=gsonInsert.fromJson(json, TipoDocumento.class);
    			try {
    				boolean status = SqlInserts.insertTipoDocumento(objeto,userCorreo);
            		myObj.addProperty("success", status);
            		out.println(myObj.toString());
    			} catch (ParseException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
        	}
        	if (accion.equals("insJustificacion")) {
				Justificacion justificacion = new Justificacion();
				BufferedReader br = new BufferedReader(new InputStreamReader(
						request.getInputStream()));
				String json = "";
				if (br != null) {
					json = br.readLine();
				}
				Gson gsonInsert = new Gson();
				justificacion = gsonInsert.fromJson(json,Justificacion.class);
				try {
					String status = SqlInserts.insertJustificacion(justificacion, userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
        	if (accion.equals("insDictamenSTP")){
        		DictamenSTP dictamenObj = new DictamenSTP();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                dictamenObj=gsonInsert.fromJson(json, DictamenSTP.class);				
				try {
					String status = SqlInserts.insertarDictamenSTP(dictamenObj,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {					
					e.printStackTrace();
				}
												
        	}
        	if (accion.equals("insAsignacionPresi")){
        		AsignacionPresi obj = new AsignacionPresi();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                obj=gsonInsert.fromJson(json, AsignacionPresi.class);				
				try {
					String status = SqlInserts.insertarAsignacionPresi(obj,userCorreo);
					myObj.addProperty("success", status);
					out.println(myObj.toString());
				} catch (Exception e) {					
					e.printStackTrace();
				}												
        	}
}
    
    
}
}
