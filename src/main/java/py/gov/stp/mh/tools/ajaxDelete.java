package py.gov.stp.mh.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import py.gov.stp.mh.clasificadores.*;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/

public class ajaxDelete extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
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
    	Integer destinatario = null;
    	Integer objetoGasto = null;
    	Integer catalogoDncp = null;
    	Integer demografia = null;
    	Integer tipoDemografica = null;
    	Integer diccionarioDato = null;
    	Integer ejeEstrategico = null;
    	Integer plan = null;
    	Integer estrategia = null;
    	Integer lineaTransversal = null;
    	Integer estrategiaHasObjetivo = null;
    	Integer fuenteFinanciamiento = null;
    	Integer fuenteVerificacion = null;
    	Integer funcional = null;
    	Integer indicador = null;
    	Integer tipoIndicador = null;
    	Integer metodoCalculo = null;
    	Integer zonaGeografica = null;
    	Integer meta = null;
    	Integer modulo = null;
    	Integer role = null;
    	Integer permiso = null;
       	Integer tipoObjetivo = null;
       	Integer objetoDeGasto = null;
    	Integer organismoFinanciador = null;
    	Integer productoPresupuesto = null;
    	Integer productoPresupuestoMeta = null;
    	Integer programatico = null;
    	Integer tipoProgramatico = null;
    	Integer proyectoSnip = null;
    	Integer proyectoSnipAutorizado = null;
    	Integer usuario = null;
    	Integer tipoZonaGeografica = null;
    	Integer estructura = null;
    	Integer estructuraFinanciera = null;
    	Integer presupuestoIngreso = null;
    	Integer presupuestoGasto = null;
    	Integer fundamentacion = null;
    	Integer objetivoId = null;
    	
    	Integer idObjetivo = null;
    	Integer objetivoTipoObjetivoId = null;
    	Integer objetivoAnho = null;
    	Integer objetivoVersion = null;
    	Integer indicadorId = null;
    	Integer indicadorTipoIndicadorId = null;
    	Integer indicadorMetodoCalculoId = null;
    	Integer indicadorUnidadMedidaId = null;
    	Integer indicadorDesagregacionTipoZonaGeograficaId = null;
    	Integer indicadorTipoDemograficaId = null;
    	Integer indicadorFuenteVerificacionId = null;
    	Integer indicadorObjetivoId = null;
    	Integer objetivoRelId = null;
    	Integer relTipoObjetivoId = null;
    	Integer relAnho = null;
    	Integer relVersion = null;
    	
    	
    	String productoConcat = null;
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
    	
    	Integer productoId=null; 
    	Integer proyectoId=null; 
    	Integer subprogramaId=null; 
    	Integer programaId=null; 
    	Integer tipoPresupuestoId=null; 
    	Integer entidadId=null; 
    	Integer nivelId=null; 
    	Integer anho=null; 
    	Integer version=null; 
    	Integer etiquetaId=null;

    	
    	if (request.getParameter("vision")!=null)  vision = request.getParameter("vision"); 
    	if (request.getParameter("objetivo")!=null) objetivo = request.getParameter("objetivo"); 
    	if (request.getParameter("resultado")!=null) resultado = request.getParameter("resultado"); 
    	if (request.getParameter("diagnostico")!=null) diagnostico = request.getParameter("diagnostico"); 
    	if (request.getParameter("baseLegal")!=null) baseLegal = request.getParameter("baseLegal"); 
    	if (request.getParameter("politica")!=null) politica = request.getParameter("politica");
    	if (request.getParameter("sigla")!=null) sigla = request.getParameter("sigla");
    	if (request.getParameter("abrev")!=null) abrev = request.getParameter("abrev");
    	if (request.getParameter("nombre")!=null) nombre = request.getParameter("nombre");
    	if (request.getParameter("descripcion")!=null) descripcion = request.getParameter("descripcion");
    	
    	if (request.getParameter("nivel")!=null) nivel = Integer.parseInt(request.getParameter("nivel"));
    	if (request.getParameter("tipoPresupuesto")!=null) tipoPresupuesto = Integer.parseInt(request.getParameter("tipoPresupuesto"));
    	if (request.getParameter("entidad")!=null) entidad = Integer.parseInt(request.getParameter("entidad"));
    	if (request.getParameter("unidadResponsable")!=null) unidadResponsable = Integer.parseInt(request.getParameter("unidadResponsable"));
    	if (request.getParameter("unidadMedida")!=null) unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
    	if (request.getParameter("programa")!=null) programa = Integer.parseInt(request.getParameter("programa"));
    	if (request.getParameter("subprograma")!=null) subprograma = Integer.parseInt(request.getParameter("subprograma"));
    	if (request.getParameter("proyecto")!=null) proyecto = Integer.parseInt(request.getParameter("proyecto"));
    	if (request.getParameter("producto")!=null) producto = Integer.parseInt(request.getParameter("producto"));
    	if (request.getParameter("unidadJerarquica")!=null) producto = Integer.parseInt(request.getParameter("unidadJerarquica"));
    	if (request.getParameter("pais")!=null) pais = Integer.parseInt(request.getParameter("pais")); else pais=0;
    	if (request.getParameter("anio")!=null) anio = Integer.parseInt(request.getParameter("anio")); else anio=2017;
    	if (request.getParameter("mes")!=null) mes = Integer.parseInt(request.getParameter("mes")); else mes=0;
    	if (request.getParameter("departamento")!=null) departamento = Integer.parseInt(request.getParameter("departamento")); else departamento=0;
    	if (request.getParameter("cantidad")!=null) cantidad = Integer.parseInt(request.getParameter("cantidad")); else cantidad=0;
    	if (request.getParameter("destinatario")!=null) destinatario = Integer.parseInt(request.getParameter("destinatario")); else destinatario=0;
    	if (request.getParameter("objetoGasto")!=null) objetoGasto = Integer.parseInt(request.getParameter("objetoGasto")); else objetoGasto=0;
    	if (request.getParameter("catalogoDncp")!=null) catalogoDncp = Integer.parseInt(request.getParameter("catalogoDncp")); else catalogoDncp=0;
    	if (request.getParameter("demografia")!=null) demografia = Integer.parseInt(request.getParameter("demografia")); else demografia=0;
    	if (request.getParameter("tipoDemografica")!=null) tipoDemografica = Integer.parseInt(request.getParameter("tipoDemografica")); else tipoDemografica=0;
    	if (request.getParameter("diccionarioDato")!=null) diccionarioDato = Integer.parseInt(request.getParameter("diccionarioDato")); else diccionarioDato=0;
    	if (request.getParameter("ejeEstrategico")!=null) ejeEstrategico = Integer.parseInt(request.getParameter("ejeEstrategico")); else ejeEstrategico=0;
    	if (request.getParameter("plan")!=null) plan = Integer.parseInt(request.getParameter("plan")); else plan=0;
    	if (request.getParameter("estrategia")!=null) estrategia = Integer.parseInt(request.getParameter("estrategia")); else estrategia=0;
    	if (request.getParameter("lineaTransversal")!=null) lineaTransversal = Integer.parseInt(request.getParameter("lineaTransversal")); else lineaTransversal=0;
    	if (request.getParameter("estrategiaHasObjetivo")!=null) estrategiaHasObjetivo = Integer.parseInt(request.getParameter("estrategiaHasObjetivo")); else estrategiaHasObjetivo=0;
    	if (request.getParameter("fuenteFinanciamiento")!=null) fuenteFinanciamiento = Integer.parseInt(request.getParameter("fuenteFinanciamiento")); else fuenteFinanciamiento=0;
    	if (request.getParameter("fuenteVerificacion")!=null) fuenteVerificacion = Integer.parseInt(request.getParameter("fuenteVerificacion")); else fuenteVerificacion=0;
    	if (request.getParameter("funcional")!=null) funcional = Integer.parseInt(request.getParameter("funcional")); else funcional=0;
    	if (request.getParameter("indicador")!=null) indicador = Integer.parseInt(request.getParameter("indicador")); else indicador=0;
    	if (request.getParameter("tipoIndicador")!=null) tipoIndicador = Integer.parseInt(request.getParameter("tipoIndicador")); else tipoIndicador=0;
    	if (request.getParameter("metodoCalculo")!=null) metodoCalculo = Integer.parseInt(request.getParameter("metodoCalculo")); else metodoCalculo=0;
    	if (request.getParameter("zonaGeografica")!=null) zonaGeografica = Integer.parseInt(request.getParameter("zonaGeografica")); else zonaGeografica=0;
    	if (request.getParameter("objetivoId")!=null) objetivoId = Integer.parseInt(request.getParameter("objetivoId")); else objetivoId=0;
    	if (request.getParameter("meta")!=null) meta = Integer.parseInt(request.getParameter("meta")); else meta=0;
    	if (request.getParameter("modulo")!=null) modulo = Integer.parseInt(request.getParameter("modulo")); else modulo=0;
    	if (request.getParameter("role")!=null) role = Integer.parseInt(request.getParameter("role")); else role=0;
    	if (request.getParameter("permiso")!=null) permiso = Integer.parseInt(request.getParameter("permiso")); else permiso=0;
    	if (request.getParameter("tipoObjetivo")!=null) tipoObjetivo = Integer.parseInt(request.getParameter("tipoObjetivo")); else tipoObjetivo=0;
    	if (request.getParameter("ObjetoDeGasto")!=null) objetoDeGasto = Integer.parseInt(request.getParameter("ObjetoDeGasto")); else objetoDeGasto=0;
    	if (request.getParameter("productoPresupuesto")!=null) productoPresupuesto = Integer.parseInt(request.getParameter("productoPresupuesto")); else productoPresupuesto=0;
    	if (request.getParameter("productoPresupuestoMeta")!=null) productoPresupuestoMeta = Integer.parseInt(request.getParameter("productoPresupuestoMeta")); else productoPresupuestoMeta=0;
    	if (request.getParameter("programatico")!=null) programatico = Integer.parseInt(request.getParameter("programatico")); else programatico=0;
    	if (request.getParameter("tipoProgramatico")!=null) tipoProgramatico = Integer.parseInt(request.getParameter("tipoProgramatico")); else tipoProgramatico=0;
    	if (request.getParameter("proyectoSnip")!=null) proyectoSnip = Integer.parseInt(request.getParameter("proyectoSnip")); else proyectoSnip=0;
    	if (request.getParameter("proyectoSnipAutorizado")!=null) proyectoSnipAutorizado = Integer.parseInt(request.getParameter("proyectoSnipAutorizado")); else proyectoSnipAutorizado=0;
    	if (request.getParameter("usuario")!=null) usuario = Integer.parseInt(request.getParameter("usuario")); else usuario=0;
    	if (request.getParameter("tipoZonaGeografica")!=null) tipoZonaGeografica = Integer.parseInt(request.getParameter("tipoZonaGeografica")); else tipoZonaGeografica=0;
    	if (request.getParameter ("estructura")!=null) estructura = Integer.parseInt(request.getParameter("estructura")); else estructura = 0;
    	if (request.getParameter ("estructuraFinanciera")!=null) estructuraFinanciera = Integer.parseInt(request.getParameter("estructuraFinanciera")); else estructuraFinanciera = 0;
    	if (request.getParameter ("presupuestoIngreso")!=null) presupuestoIngreso = Integer.parseInt(request.getParameter("presupuestoIngreso")); else presupuestoIngreso = 0;
    	if (request.getParameter ("presupuestoGasto")!=null) presupuestoGasto = Integer.parseInt(request.getParameter("presupuestoGasto")); else presupuestoGasto = 0;
    	if (request.getParameter ("fundamentacion")!=null) fundamentacion = Integer.parseInt(request.getParameter("fundamentacion")); else fundamentacion = 0;
    	if (request.getParameter("idObjetivo")!=null) idObjetivo = Integer.parseInt(request.getParameter("idObjetivo"));
    	if (request.getParameter("objetivoTipoObjetivoId")!=null) objetivoTipoObjetivoId = Integer.parseInt(request.getParameter("objetivoTipoObjetivoId"));
    	if (request.getParameter("objetivoAnho")!=null) objetivoAnho = Integer.parseInt(request.getParameter("objetivoAnho"));
    	if (request.getParameter("objetivoVersion")!=null) objetivoVersion = Integer.parseInt(request.getParameter("objetivoVersion"));
    	if (request.getParameter("indicadorId")!=null) indicadorId = Integer.parseInt(request.getParameter("indicadorId"));
    	if (request.getParameter("indicadorTipoIndicadorId")!=null) indicadorTipoIndicadorId = Integer.parseInt(request.getParameter("indicadorTipoIndicadorId"));
    	if (request.getParameter("indicadorMetodoCalculoId")!=null) indicadorMetodoCalculoId = Integer.parseInt(request.getParameter("indicadorMetodoCalculoId"));
    	if (request.getParameter("indicadorUnidadMedidaId")!=null) indicadorUnidadMedidaId = Integer.parseInt(request.getParameter("indicadorUnidadMedidaId"));
    	if (request.getParameter("indicadorDesagregacionTipoZonaGeograficaId")!=null) indicadorDesagregacionTipoZonaGeograficaId = Integer.parseInt(request.getParameter("indicadorDesagregacionTipoZonaGeograficaId"));
    	if (request.getParameter("indicadorTipoDemograficaId")!=null) indicadorTipoDemograficaId = Integer.parseInt(request.getParameter("indicadorTipoDemograficaId"));
    	if (request.getParameter("indicadorFuenteVerificacionId")!=null) indicadorFuenteVerificacionId = Integer.parseInt(request.getParameter("indicadorFuenteVerificacionId"));
    	if (request.getParameter("indicadorObjetivoId")!=null) indicadorObjetivoId = Integer.parseInt(request.getParameter("indicadorObjetivoId"));
    	if (request.getParameter("objetivoRelId")!=null) objetivoRelId = Integer.parseInt(request.getParameter("objetivoRelId"));
    	if (request.getParameter("relTipoObjetivoId")!=null) relTipoObjetivoId = Integer.parseInt(request.getParameter("relTipoObjetivoId"));
    	if (request.getParameter("relAnho")!=null) relAnho = Integer.parseInt(request.getParameter("relAnho"));
    	if (request.getParameter("relVersion")!=null) relVersion = Integer.parseInt(request.getParameter("relVersion"));
    	
    	if (request.getParameter("productoConcat")!=null) productoConcat = request.getParameter("productoConcat");
    	
    	if (request.getParameter("productoId")!=null) productoId = Integer.parseInt(request.getParameter("productoId"));
    	if (request.getParameter("proyectoId")!=null) proyectoId = Integer.parseInt(request.getParameter("proyectoId"));
    	if (request.getParameter("subprogramaId")!=null) subprogramaId = Integer.parseInt(request.getParameter("subprogramaId"));
    	if (request.getParameter("programaId")!=null) programaId = Integer.parseInt(request.getParameter("programaId"));
    	if (request.getParameter("tipoPresupuestoId")!=null) tipoPresupuestoId = Integer.parseInt(request.getParameter("tipoPresupuestoId"));
    	if (request.getParameter("entidadId")!=null) entidadId = Integer.parseInt(request.getParameter("entidadId"));
    	if (request.getParameter("nivelId")!=null) nivelId = Integer.parseInt(request.getParameter("nivelId"));
    	if (request.getParameter("anho")!=null) anho = Integer.parseInt(request.getParameter("anho"));
    	if (request.getParameter("version")!=null) version = Integer.parseInt(request.getParameter("version"));
    	if (request.getParameter("etiquetaId")!=null) etiquetaId = Integer.parseInt(request.getParameter("etiquetaId"));
    	
    	
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
        	/*if (accion.equals("delEntidad")){
        		List entidades=null;
				SqlDelete.deleteEntidad(entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(entidades );
        		myObj.addProperty("success", true);
        		myObj.add("entidades", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/entidad.jsp");
        	}
        	/*if (accion.equals("delEntidad")){
        		Entidad objeto = new Entidad();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Entidad.class);
                boolean status = SqlDelete.deleteEntidad(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}*/

        
        	/*if (accion.equals("delPrograma")){
        		List programas=null;
        		SqlDelete.deletePrograma(programa.toString(), tipoPresupuesto.toString(), entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(programas );
        		myObj.addProperty("success", true);
        		myObj.add("programas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}*/
        	/*if (accion.equals("delPrograma")){
        		Programa objeto = new Programa();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Programa.class);
                boolean status = SqlDelete.deletePrograma(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}*/
        	
        	if (accion.equals("delCatalogoDncp")){
        		List catalogoDncps=null;
        		SqlDelete.deleteCatalogoDncp(catalogoDncp.toString(),objetoGasto.toString());
        		JsonElement json = new Gson().toJsonTree(catalogoDncps );
        		myObj.addProperty("success", true);
        		myObj.add("catalogoDncp", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	/*if (accion.equals("delCatalogoDncp")){
        		CatalogoDNCP objeto = new CatalogoDNCP();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, CatalogoDNCP.class);
                boolean status = SqlDelete.deleteCatalogoDncp(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}*/
        	
        	if (accion.equals("delDemografia")){
        		List demografias=null;
        		SqlDelete.deleteDemografia(demografia.toString(), tipoDemografica.toString());
        		JsonElement json = new Gson().toJsonTree(demografias );
        		myObj.addProperty("success", true);
        		myObj.add("demografias", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	/*if (accion.equals("delDepartamento")){
        		List departamentos=null;
        		SqlDelete.deleteDepartamento(departamento.toString());
        		JsonElement json = new Gson().toJsonTree(departamentos );
        		myObj.addProperty("success", true);
        		myObj.add("departamentos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}*/
        	if (accion.equals("delDiccionarioDato")){
        		List diccionarioDatos=null;
        		SqlDelete.deleteDiccionarioDato(diccionarioDato.toString());
        		JsonElement json = new Gson().toJsonTree(diccionarioDatos );
        		myObj.addProperty("success", true);
        		myObj.add("diccionarioDatos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delEjeEstrategico")){
        		List ejeEstrategicos=null;
        		SqlDelete.deleteEjeEstrategico(ejeEstrategico.toString(), plan.toString());
        		JsonElement json = new Gson().toJsonTree(ejeEstrategicos );
        		myObj.addProperty("success", true);
        		myObj.add("ejeEstrategicos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	/*if (accion.equals("delEntidad")){
        		List entidades=null;
        		SqlDelete.deleteEntidad(entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(entidades );
        		myObj.addProperty("success", true);
        		myObj.add("entidades", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}*/
        	if (accion.equals("delEstrategia")){
        		List estrategias=null;
        		SqlDelete.deleteEstrategia(estrategia.toString(), ejeEstrategico.toString(), lineaTransversal.toString(), plan.toString());
        		JsonElement json = new Gson().toJsonTree(estrategias );
        		myObj.addProperty("success", true);
        		myObj.add("estrategias", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delEstrategiaHasObjetivo")){
        		List estrategiaHasObjetivos=null;
        		SqlDelete.deleteEstrategiaHasObjetivo(estrategiaHasObjetivo.toString());
        		JsonElement json = new Gson().toJsonTree(estrategiaHasObjetivos );
        		myObj.addProperty("success", true);
        		myObj.add("estrategiaHasObjetivos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delFuenteFinanciamiento")){
        		List fuenteFinanciamientos=null;
        		SqlDelete.deleteFuenteFinanciamiento(fuenteFinanciamiento.toString());
        		JsonElement json = new Gson().toJsonTree(fuenteFinanciamientos );
        		myObj.addProperty("success", true);
        		myObj.add("fuenteFinanciamientos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delFuenteVerificacion")){
        		List fuenteVerificaciones=null;
        		SqlDelete.deleteFuenteVerificacion(fuenteVerificacion.toString());
        		JsonElement json = new Gson().toJsonTree(fuenteVerificaciones );
        		myObj.addProperty("success", true);
        		myObj.add("fuenteVerificaciones", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delFuncional")){
        		List funcionales=null;
        		SqlDelete.deleteFuncional(funcional.toString());
        		JsonElement json = new Gson().toJsonTree(funcionales );
        		myObj.addProperty("success", true);
        		myObj.add("funcionales", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delIndicador")){
        		List indicadores=null;
        		SqlDelete.deleteIndicador(indicador.toString(), tipoIndicador.toString(), metodoCalculo.toString(), unidadMedida.toString(), zonaGeografica.toString(), tipoDemografica.toString(), fuenteVerificacion.toString(), objetivoId.toString());
        		JsonElement json = new Gson().toJsonTree(indicadores );
        		myObj.addProperty("success", true);
        		myObj.add("indicadores", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delLineaTransversal")){
        		List lineasTransversales=null;
        		SqlDelete.deleteLineaTransversal(lineaTransversal.toString(), plan.toString());
        		JsonElement json = new Gson().toJsonTree(lineasTransversales );
        		myObj.addProperty("success", true);
        		myObj.add("lineasTransversales", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delMes")){
        		List meses=null;
        		SqlDelete.deleteMes(mes.toString());
        		JsonElement json = new Gson().toJsonTree(meses );
        		myObj.addProperty("success", true);
        		myObj.add("meses", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delMeta")){
        		List metas=null;
        		SqlDelete.deleteMeta(meta.toString(), indicador.toString(), zonaGeografica.toString(), demografia.toString());
        		JsonElement json = new Gson().toJsonTree(metas );
        		myObj.addProperty("success", true);
        		myObj.add("metas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delMetodoCalculo")){
        		List metodoCalculos=null;
        		SqlDelete.deleteMetodoCalculo(metodoCalculo.toString());
        		JsonElement json = new Gson().toJsonTree(metodoCalculos );
        		myObj.addProperty("success", true);
        		myObj.add("metodoCalculos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delModulo")){
        		List modulos=null;
        		SqlDelete.deleteModulo(modulo.toString());
        		JsonElement json = new Gson().toJsonTree(modulos );
        		myObj.addProperty("success", true);
        		myObj.add("modulos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delModuloHasPermiso")){
        		List moduloHasPermisos=null;
        		SqlDelete.deleteModuloHasPermiso(role.toString(), modulo.toString(), permiso.toString());
        		JsonElement json = new Gson().toJsonTree(moduloHasPermisos );
        		myObj.addProperty("success", true);
        		myObj.add("moduloHasPermisos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delNivel")){
        		List niveles=null;
        		SqlDelete.deleteNivel(nivel.toString());
        		JsonElement json = new Gson().toJsonTree(niveles );
        		myObj.addProperty("success", true);
        		myObj.add("niveles", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delObjetivo")){
        		List objetivos=null;
        		SqlDelete.deleteObjetivo(objetivoId.toString(), tipoObjetivo.toString());
        		JsonElement json = new Gson().toJsonTree(objetivos );
        		myObj.addProperty("success", true);
        		myObj.add("objetivos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delObjetoDeGasto")){
        		List objetoDeGastos=null;
        		SqlDelete.deleteObjetoDeGasto(objetoDeGasto.toString());
        		JsonElement json = new Gson().toJsonTree(objetoDeGastos );
        		myObj.addProperty("success", true);
        		myObj.add("objetoDeGastos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delOrganismoFinanciador")){
        		List organismosFinanciadores=null;
        		SqlDelete.deleteOrganismoFinanciador(organismoFinanciador.toString());
        		JsonElement json = new Gson().toJsonTree(organismosFinanciadores );
        		myObj.addProperty("success", true);
        		myObj.add("organismosFinanciadores", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delPermiso")){
        		List permisos=null;
        		SqlDelete.deletePermiso(permiso.toString());
        		JsonElement json = new Gson().toJsonTree(permisos );
        		myObj.addProperty("success", true);
        		myObj.add("permisos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delPlan")){
        		List planes=null;
        		SqlDelete.deletePlan(plan.toString());
        		JsonElement json = new Gson().toJsonTree(planes );
        		myObj.addProperty("success", true);
        		myObj.add("planes", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProducto")){
        		List productos=null;
        		SqlDelete.deleteProducto(producto.toString(), unidadMedida.toString());
        		JsonElement json = new Gson().toJsonTree(productos );
        		myObj.addProperty("success", true);
        		myObj.add("productos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProductoPresupuestoMeta")){
        		List productoPresupuestoMetas=null;
        		SqlDelete.deleteProductoPresupuestoMeta(productoPresupuestoMeta.toString(), destinatario.toString(), departamento.toString(), productoPresupuesto.toString(), producto.toString(), unidadMedida.toString(), proyecto.toString(), subprograma.toString(), programa.toString(), tipoPresupuesto.toString(), entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(productoPresupuestoMetas );
        		myObj.addProperty("success", true);
        		myObj.add("productoPresupuestoMetas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProductoPresupuesto")){
        		List productoPresupuestos=null;
        		SqlDelete.deleteProductoPresupuesto(productoPresupuesto.toString(), producto.toString(), unidadMedida.toString(), proyecto.toString(), subprograma.toString(),programa.toString(), tipoPresupuesto.toString(), entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(productoPresupuestos );
        		myObj.addProperty("success", true);
        		myObj.add("productoPresupuestos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	/*if (accion.equals("delPrograma")){
        		List programas=null;
        		SqlDelete.deletePrograma(programa.toString(), tipoPresupuesto.toString(), entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(programas );
        		myObj.addProperty("success", true);
        		myObj.add("programas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}*/
        	if (accion.equals("delProgramatico")){
        		List programaticos=null;
        		SqlDelete.deleteProgramatico(programatico.toString(), tipoProgramatico.toString());
        		JsonElement json = new Gson().toJsonTree(programaticos );
        		myObj.addProperty("success", true);
        		myObj.add("programaticos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProgramaticoHasObjetivo")){
        		List programaticoHasObjetivos=null;
        		SqlDelete.deleteProgramaticoHasObjetivo(programatico.toString(), tipoProgramatico.toString());
        		JsonElement json = new Gson().toJsonTree(programaticoHasObjetivos );
        		myObj.addProperty("success", true);
        		myObj.add("programaticoHasObjetivos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProyecto")){
        		List proyectos=null;
        		SqlDelete.deleteProyecto(proyecto.toString(), subprograma.toString(), programa.toString(), tipoPresupuesto.toString(), entidad.toString(), nivel.toString(), unidadResponsable.toString(), funcional.toString());
        		JsonElement json = new Gson().toJsonTree(proyectos );
        		myObj.addProperty("success", true);
        		myObj.add("proyectos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProyectoSnip")){
        		List proyectoSnips=null;
        		SqlDelete.deleteProyectoSnip(proyectoSnip.toString());
        		JsonElement json = new Gson().toJsonTree(proyectoSnips );
        		myObj.addProperty("success", true);
        		myObj.add("proyectoSnips", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delProyectoSnipAutorizado")){
        		List proyectoSnipAutorizados=null;
        		SqlDelete.deleteProyectoSnipAutorizado(proyectoSnipAutorizado.toString(), entidad.toString(), nivel.toString(), proyectoSnip.toString(), organismoFinanciador.toString(), fuenteFinanciamiento.toString());
        		JsonElement json = new Gson().toJsonTree(proyectoSnipAutorizados );
        		myObj.addProperty("success", true);
        		myObj.add("proyectoSnipAutorizados", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delRole")){
        		List roles=null;
        		SqlDelete.deleteRole(role.toString());
        		JsonElement json = new Gson().toJsonTree(roles );
        		myObj.addProperty("success", true);
        		myObj.add("roles", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	/*if (accion.equals("delSubPrograma")){
        		List subProgramas=null;
        		SqlDelete.deleteSubPrograma(subprograma.toString(), programa.toString(), tipoPresupuesto.toString(), entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(subProgramas );
        		myObj.addProperty("success", true);
        		myObj.add("subProgramas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");

        	}
        	if (accion.equals("delSubPrograma")){
        		SubPrograma objeto = new SubPrograma();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, SubPrograma.class);
                boolean status = SqlDelete.deleteSubPrograma(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}*/
        	if (accion.equals("delCatalogoDestinatario")){
        		List catalogoDestinatarios=null;
        		SqlDelete.deleteCatalogoDestinatario(destinatario.toString());
        		JsonElement json = new Gson().toJsonTree(catalogoDestinatarios );
        		myObj.addProperty("success", true);
        		myObj.add("catalogoDestinatario", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delTipoDemografica")){
        		List tipoDemografias=null;
        		SqlDelete.deleteTipoDemografica(tipoDemografica.toString());
        		JsonElement json = new Gson().toJsonTree(tipoDemografias );
        		myObj.addProperty("success", true);
        		myObj.add("tipoDemografias", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delTipoIndicador")){
        		List tipoIndicadores=null;
        		SqlDelete.deleteTipoIndicador(tipoIndicador.toString());
        		JsonElement json = new Gson().toJsonTree(tipoIndicadores );
        		myObj.addProperty("success", true);
        		myObj.add("tipoIndicadores", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delTipoObjetivo")){
        		List tipoIndicadores=null;
        		SqlDelete.deleteTipoIndicador(tipoObjetivo.toString());
        		JsonElement json = new Gson().toJsonTree(tipoIndicadores );
        		myObj.addProperty("success", true);
        		myObj.add("tipoIndicadores", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delTipoPresupuesto")){
        		List tipoPresupuestos=null;
        		SqlDelete.deleteTipoPresupuesto(tipoPresupuesto.toString());
        		JsonElement json = new Gson().toJsonTree(tipoPresupuestos );
        		myObj.addProperty("success", true);
        		myObj.add("tipoPresupuestos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delTipoProgramatico")){
        		List tipoProgramaticos=null;
        		SqlDelete.deleteTipoProgramatico(tipoProgramatico.toString());
        		JsonElement json = new Gson().toJsonTree(tipoProgramaticos );
        		myObj.addProperty("success", true);
        		myObj.add("tipoProgramaticos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delTipoZonaGeografica")){
        		List tipoZonaGeograficas=null;
        		SqlDelete.deleteTipoZonaGeografica(zonaGeografica.toString());
        		JsonElement json = new Gson().toJsonTree(tipoZonaGeograficas );
        		myObj.addProperty("success", true);
        		myObj.add("tipoZonaGeograficas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delUnidadJerarquica")){
        		List unidadJerarquicas=null;
        		SqlDelete.deleteUnidadJerarquica(unidadJerarquica.toString(), entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(unidadJerarquicas );
        		myObj.addProperty("success", true);
        		myObj.add("unidadJerarquicas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delUnidadMedida")){
        		List unidadMedidas=null;
        		SqlDelete.deleteUnidadMedida(unidadMedida.toString());
        		JsonElement json = new Gson().toJsonTree(unidadMedidas );
        		myObj.addProperty("success", true);
        		myObj.add("unidadMedidas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delUnidadResponsable")){
        		List unidadResponsables=null;
        		SqlDelete.deleteUnidadResponsable(unidadResponsable.toString(), entidad.toString(), nivel.toString(), unidadJerarquica.toString());
        		JsonElement json = new Gson().toJsonTree(unidadResponsables );
        		myObj.addProperty("success", true);
        		myObj.add("unidadResponsables", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delUsuario")){
        		List usuarios=null;
        		SqlDelete.deleteUsuario(usuario.toString(), role.toString());
        		JsonElement json = new Gson().toJsonTree(usuarios );
        		myObj.addProperty("success", true);
        		myObj.add("usuarios", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delZonaGeografica")){
        		List zonaGeograficas=null;
        		SqlDelete.deleteZonaGeografica(zonaGeografica.toString(), tipoZonaGeografica.toString());
        		JsonElement json = new Gson().toJsonTree(zonaGeograficas );
        		myObj.addProperty("success", true);
        		myObj.add("zonaGeograficas", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delResultado")){
        		List resultados=null;
        		SqlDelete.deleteResultado(objetivoId.toString(), "2");
        		JsonElement json = new Gson().toJsonTree(resultados );
        		myObj.addProperty("success", true);
        		myObj.add("resultados", json);
        		out.println(myObj.toString());
        		//response.sendRedirect("/produccion.jsp");
        		//falta borrado de indicadores y metas
        	}
        	if (accion.equals("delEstructura")){
        		List estructuras=null;
        		SqlDelete.deleteEstructura(estructura.toString());
        		JsonElement json = new Gson().toJsonTree(estructuras );
        		myObj.addProperty("success", true);
        		myObj.add("estructuras", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delEstructuraFinanciera")){
        		List estructurasFinancieras=null;
        		SqlDelete.deleteEstructuraFinanciera(estructuraFinanciera.toString());
        		JsonElement json = new Gson().toJsonTree(estructurasFinancieras );
        		myObj.addProperty("success", true);
        		myObj.add("estructurasFinancieras", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}          	
        	if (accion.equals("delPresupuestoIngreso")){
        		List presupuestosIngresos=null;
        		SqlDelete.deletePresupuestoIngreso(presupuestoIngreso.toString());
        		JsonElement json = new Gson().toJsonTree(presupuestosIngresos );
        		myObj.addProperty("success", true);
        		myObj.add("presupuestosIngresos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delPresupuestoGasto")){
        		List presupuestosGastos=null;
        		SqlDelete.deletePresupuestoGasto(presupuestoGasto.toString());
        		JsonElement json = new Gson().toJsonTree(presupuestosGastos );
        		myObj.addProperty("success", true);
        		myObj.add("presupuestosGastos", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}
        	if (accion.equals("delFundamentacion")){
        		List fundamentaciones=null;
        		SqlDelete.deleteFundamentacion(fundamentacion.toString());
        		JsonElement json = new Gson().toJsonTree(fundamentaciones );
        		myObj.addProperty("success", true);
        		myObj.add("fundamentaciones", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/produccion.jsp");
        	}    
        	/*
        	   DELETE PREPARADO CON EL PREPAREDSTATEMENT EN EL CASO DE QUE NO FUNCIONE EL DEL STATEMENT (ABAJO)
        	  
        	  if (accion.equals("delObjetivoHasIndicador")){
        		List objetos=null;
        		String condicion ="where true";
        		if (objetivoId != null) condicion += " and objetivo_id ='"+objetivoId+"'";
        		if (objetivoTipoObjetivoId != null) condicion += " and objetivo_tipo_objetivo_id ='"+objetivoTipoObjetivoId+"'";
        		if (objetivoAnho != null) condicion += " and objetivo_anho ='"+objetivoAnho+"'";
        		if (objetivoVersion != null) condicion += " and objetivo_version ='"+objetivoVersion+"'";
        		if (indicadorId != null) condicion += " and indicador_id ='"+indicadorId+"'";
        		if (indicadorTipoIndicadorId != null) condicion += " and indicador_tipo_indicador_id ='"+indicadorTipoIndicadorId+"'";
        		if (indicadorMetodoCalculoId != null) condicion += " and indicador_metodo_calculo_id ='"+indicadorMetodoCalculoId+"'";
        		if (indicadorUnidadMedidaId != null) condicion += " and indicador_unidad_medida_id ='"+indicadorUnidadMedidaId+"'";
        		if (indicadorDesagregacionTipoZonaGeograficaId != null) condicion += " and indicador_desagregacion_tipo_zona_geografica_id ='"+indicadorDesagregacionTipoZonaGeograficaId+"'";
        		if (indicadorTipoDemograficaId != null) condicion += " and indicador_tipo_demografica_id ='"+indicadorTipoDemograficaId+"'";
        		if (indicadorFuenteVerificacionId != null) condicion += " and indicador_fuente_verificacion_id ='"+indicadorFuenteVerificacionId+"'";
        		if (indicadorObjetivoId != null) condicion += " and indicador_objetivo_id ='"+indicadorObjetivoId+"'";
        		if (productoConcat != null) condicion += " and producto_concat ='"+productoConcat+"'";
        		ObjetivoHasIndicador objeto = new ObjetivoHasIndicador();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, ObjetivoHasIndicador.class);               
                JsonElement jsonDelete = new Gson().toJsonTree(objeto);
        		
        			boolean status;
					try {
						status = SqlDelete.deleteObjetivoHasIndicador(objeto);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
        			myObj.addProperty("success", true);
        			out.println(myObj.toString());
        	}*/
        	if (accion.equals("delObjetivoHasIndicador")){
        		List objetivoHasIndicador=null;
        		SqlDelete.deleteObjetivoHasIndicador(objetivoRelId.toString(), relTipoObjetivoId.toString(), relAnho.toString(), relVersion.toString(), indicadorId.toString(), productoConcat);
        		JsonElement json = new Gson().toJsonTree(objetivoHasIndicador );
        		myObj.addProperty("success", true);
        		myObj.add("objetivos", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("delPresupuestoEtiqueta")){
        		List PresupuestoEtiqueta=null;
        		SqlDelete.deletePresupuestoEtiqueta(productoId.toString(), proyectoId.toString(), subprogramaId.toString(), programaId.toString(), tipoPresupuestoId.toString(), entidadId.toString(), nivelId.toString(), etiquetaId.toString());
        		JsonElement json = new Gson().toJsonTree(PresupuestoEtiqueta);
        		myObj.addProperty("success", true);
        		myObj.add("presupuestoEtiqueta", json);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("delTodosObjetivoHasObjetivo")){
        		List objetivoHasObjetivo=null;
        		SqlDelete.deleteTodosObjetivoHasObjetivo(productoConcat);
        		JsonElement json = new Gson().toJsonTree(objetivoHasObjetivo);
        		myObj.addProperty("success", true);
        		myObj.add("objetivos", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("delTodosObjetivoHasIndicador")){
        		List objetivoHasIndicador=null;
        		SqlDelete.deleteTodosObjetivoHasIndicador(productoConcat);
        		JsonElement json = new Gson().toJsonTree(objetivoHasIndicador);
        		myObj.addProperty("success", true);
        		myObj.add("objetivos", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("delPorResultadoObjetivoHasIndicador")){
        		List objetivoHasIndicador=null;
        		SqlDelete.deletePorResultadoObjetivoHasIndicador(productoConcat, objetivoId);
        		JsonElement json = new Gson().toJsonTree(objetivoHasIndicador);
        		myObj.addProperty("success", true);
        		myObj.add("objetivos", json);
        		out.println(myObj.toString());
        	}
        }     
    }
}
