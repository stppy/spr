package py.gov.stp.mh.tools;


import py.gov.stp.mh.clasificadores.*;
import py.gov.stp.mh.consultas.*;
import py.gov.stp.mh.test.*;
import py.gov.stp.mh.tools.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
public class ajaxSelects extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = user.getAttributes(); 
    	String nivelCas =  attributes.get("nivel_id").toString();
    	String entidadCas =  attributes.get("entidad_id").toString();
    	String userRoleId = attributes.get("role_id_tablero").toString();
    	String userCorreo = user.getName();

       	String accion = request.getParameter("accion");

    	
    	Boolean borrado=null;
    	
    	Integer nivel = null;
    	Integer entidad = null;
    	Integer tipoPresupuesto = null;
    	Integer tipoPrograma = null;
    	Integer unidadResponsable = null;
    	Integer unidadMedida = null;
    	Integer programa = null;
    	Integer subprograma = null;
    	Integer proyecto = null;
    	Integer producto = null;
    	Integer unidadJerarquica = null;
    	Integer anio = null;
    	Integer version = null;
    	Integer mes = null;
    	Integer pais = null;
    	Integer departamento = null;
    	Integer objetivo = null;
    	Integer estrategia = null;
    	Integer indicador = null;
    	Integer tipoDestinatario = null;
    	Integer snip = null;
    	Integer snipAutorizado = null;
    	Integer funcional = null;
    	Integer funcionalId = null;//funcional sin valor preseteado.
    	Integer catalogoDestinatario = null;
    	Integer catalogoProdPresDest = null;
    	Integer codigoPilar = null;
    	Integer idLinea =null;
    	Integer idEje = null;
    	Integer resultadoIndicadorMeta= null;
    	Integer id=null;
    	Integer anho=null;
    	Integer versionReporte=null;
    	Integer tipo=null;
    	Integer tipoDestinatarioId=null;
    	Integer destinatarioId=null;
    	Integer dictamenId=null;
    	Integer cantidad=null;
    	Integer entidadId=null;
    	Integer usuarioId=null;
    	
    	Integer numeroFila=null;
    	Integer codDetalle=null;
    	Integer codOrigen=null;
    	Integer fuenteFinanc=null;
    	Integer montoProgramado=null;
    	
    	Integer origen=null;
    	Integer detalleId=null;
    	Integer fuenteFinanciamiento=null;

    	Integer codigoObjeto = null;
    	Integer deptoPais =  null;
    	Integer codigoFuenteFinanciamiento = null;
    	Integer objetivoId = null;
    	Integer unidadMedidaId = null;
    	Integer indicadorId = null;
    	Integer objetivoVersion = null;
    	Integer tipoObjetivoId = null;
    	Integer versionObjetivoId = null;
    	Integer anhoObjetivoId = null;
    	Integer justificacionId = null;
    	
    	Integer objetivoSugeridoId = null;
    	Integer objetivoSugeridoTipoId = null;
    	Integer objetivoSugeridoAnho = null;
    	Integer objetivoSugeridoVersion = null;
    	Integer objetivoRelId = null;
    	Integer objetivoRelTipoObjetivoId = null;
    	Integer objetivoRelAnho = null;
    	Integer objetivoRelVersion = null;
    	Double colaboracion = null;
    	Double influencia = null;
    	Integer tipoIndicadorId = null;
    	//Integer metodoCalculoId = null;
    	String metodoCalculoId=null;
    	Integer desagregacionTipoZonaGeograficaId = null;
    	Integer tipoDemograficaId = null;
    	//String fuenteVerificacionId = null; ya no es utilizado como entero en los filtrados
    	Integer metaId = null;
    	
    	Integer eje=null;
    	Integer linea=null;

    	String usuario=null;
    	String condition = "";
    	String mision = "";
    	String nombre = "";
    	String vision = "";
    	String resultado = "";
    	String diagnostico = "";
    	String baseLegal = "";
    	String politica = "";
    	String sigla = "";
    	String abrev = "";
    	String descripcion = "";
    	String productoConcat = null;
    	Integer etiquetaId = null;
    	Integer productoId = null;
    	Integer proyectoId = null;
    	Integer subprogramaId = null;
    	Integer programaId = null;    
    	Integer tipoPresupuestoId = null;
    	Integer nivelId = null;
    	Integer idDocumento = null;
    	
    	Integer catalogo_Destinatario = null;
    	Integer depto = null;
    	
    	String objeto=null;
    	String parametro1=null;
    	String parametro2=null;
    	String parametro3=null;
    	String parametro4=null;
    	String parametro5=null;    	
    	String mayorIgual = null;
    	Integer unrId=null;    	
    	Integer mesPND=null;    	
    	Integer moduloId = null;
    	Integer tipoProducto = null;
    	Integer periodoId = null;
    	Integer versionId = null;
    	
    	if (request.getParameter("usuario")!=null) usuario=request.getParameter("usuario");
    	if (request.getParameter("cantidad")!=null) cantidad = Integer.parseInt(request.getParameter("cantidad"));
    	if (request.getParameter("nivel")!=null) nivel = Integer.parseInt(request.getParameter("nivel"));
    	if (request.getParameter("catalogoDestinatario")!=null) nivel = Integer.parseInt(request.getParameter("catalogoDestinatario"));
    	if (request.getParameter("tipoPresupuesto")!=null) tipoPresupuesto = Integer.parseInt(request.getParameter("tipoPresupuesto"));
    	if (request.getParameter("tipoPrograma")!=null) tipoPrograma = Integer.parseInt(request.getParameter("tipoPrograma"));
    	if (request.getParameter("entidad")!=null) entidad = Integer.parseInt(request.getParameter("entidad"));
    	if (request.getParameter("unidadResponsable")!=null) unidadResponsable = Integer.parseInt(request.getParameter("unidadResponsable"));
    	if (request.getParameter("unidadMedida")!=null) unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
    	if (request.getParameter("programa")!=null) programa = Integer.parseInt(request.getParameter("programa"));
    	if (request.getParameter("subprograma")!=null) subprograma = Integer.parseInt(request.getParameter("subprograma"));
    	if (request.getParameter("proyecto")!=null) proyecto = Integer.parseInt(request.getParameter("proyecto"));
    	if (request.getParameter("producto")!=null) producto = Integer.parseInt(request.getParameter("producto"));
    	if (request.getParameter("catalogoProdPresDest")!=null) catalogoProdPresDest = Integer.parseInt(request.getParameter("catalogoProdPresDest"));
    	if (request.getParameter("unidadJerarquica")!=null) unidadJerarquica = Integer.parseInt(request.getParameter("unidadJerarquica"));
    	if (request.getParameter("pais")!=null) pais = Integer.parseInt(request.getParameter("pais")); else pais=1;
    	if (request.getParameter("anio")!=null) anio = Integer.parseInt(request.getParameter("anio")); else anio=2017;
    	if (request.getParameter("version")!=null) version = Integer.parseInt(request.getParameter("version")); else version=50;
    	if (request.getParameter("mes")!=null) mes = Integer.parseInt(request.getParameter("mes")); else mes=0;
    	if (request.getParameter("departamento")!=null) departamento = Integer.parseInt(request.getParameter("departamento")); else departamento=99;
    	if (request.getParameter("objetivo")!=null) objetivo = Integer.parseInt(request.getParameter("objetivo")); else objetivo=0;
    	if (request.getParameter("estrategia")!=null) estrategia = Integer.parseInt(request.getParameter("estrategia")); else estrategia=0;
    	if (request.getParameter("eje")!=null) eje = Integer.parseInt(request.getParameter("eje")); else eje=0;
    	if (request.getParameter("linea")!=null) linea = Integer.parseInt(request.getParameter("linea")); else linea=0;
    	if (request.getParameter("indicador")!=null) indicador = Integer.parseInt(request.getParameter("indicador")); else indicador=0;
    	if (request.getParameter("tipoDestinatario")!=null && !request.getParameter("tipoDestinatario").equals("undefined")) tipoDestinatario = Integer.parseInt(request.getParameter("tipoDestinatario"));
    	if (request.getParameter("catalogoDestinatario")!=null) catalogoDestinatario = Integer.parseInt(request.getParameter("catalogoDestinatario")); else catalogoDestinatario=0;
    	//if (request.getParameter("snip")!=null) snip = Integer.parseInt(request.getParameter("snip")); else snip=0;
    	//if (request.getParameter("snipAutorizado")!=null) snip = Integer.parseInt(request.getParameter("snipAutorizado")); else snipAutorizado=0;
      	if (request.getParameter("funcional")!=null) funcional = Integer.parseInt(request.getParameter("funcional")); else funcional=0;
      	if (request.getParameter("funcionalId")!=null) funcionalId = Integer.parseInt(request.getParameter("funcionalId"));
      	if (request.getParameter("nombre")!=null) nombre = request.getParameter("nombre"); else nombre="";
      	if (request.getParameter("codigoPilar")!=null) codigoPilar = Integer.parseInt(request.getParameter("codigoPilar"));
      	if (request.getParameter("idLinea")!=null) idLinea = Integer.parseInt(request.getParameter("idLinea"));
      	if (request.getParameter("idEje")!=null) idEje = Integer.parseInt(request.getParameter("idEje"));
      	if (request.getParameter("resultadoIndicadorMeta")!=null) resultadoIndicadorMeta = Integer.parseInt(request.getParameter("resultadoIndicadorMeta"));
      	if (request.getParameter("versionReporte")!=null) versionReporte = Integer.parseInt(request.getParameter("versionReporte"));
      	if (request.getParameter("anho")!=null) anho = Integer.parseInt(request.getParameter("anho"));
      	if (request.getParameter("tipo")!=null) tipo = Integer.parseInt(request.getParameter("tipo"));
      	if (request.getParameter("tipoDestinatarioId")!=null) tipoDestinatarioId = Integer.parseInt(request.getParameter("tipoDestinatarioId"));
      	if (request.getParameter("destinatarioId")!=null) destinatarioId = Integer.parseInt(request.getParameter("destinatarioId"));
      	if (request.getParameter("dictamenId")!=null) dictamenId = Integer.parseInt(request.getParameter("dictamenId"));
      	if (request.getParameter("numeroFila")!=null) numeroFila = Integer.parseInt(request.getParameter("numeroFila"));
      	if (request.getParameter("codDetalle")!=null) codDetalle = Integer.parseInt(request.getParameter("codDetalle"));
      	if (request.getParameter("codOrigen")!=null) codOrigen = Integer.parseInt(request.getParameter("codOrigen"));
      	if (request.getParameter("fuenteFinanc")!=null) fuenteFinanc = Integer.parseInt(request.getParameter("fuenteFinanc"));
      	if (request.getParameter("montoProgramado")!=null) montoProgramado = Integer.parseInt(request.getParameter("montoProgramado"));

      	if (request.getParameter("origen")!=null) origen = Integer.parseInt(request.getParameter("origen"));
      	if (request.getParameter("detalleId")!=null) detalleId = Integer.parseInt(request.getParameter("detalleId"));
      	if (request.getParameter("fuenteFinanciamiento")!=null) fuenteFinanciamiento = Integer.parseInt(request.getParameter("fuenteFinanciamiento"));

      	if (request.getParameter("codigoObjeto")!=null) codigoObjeto = Integer.parseInt(request.getParameter("codigoObjeto"));
      	if (request.getParameter("deptoPais")!=null) deptoPais = Integer.parseInt(request.getParameter("deptoPais"));
      	if (request.getParameter("codigoFuenteFinanciamiento")!=null) codigoFuenteFinanciamiento = Integer.parseInt(request.getParameter("codigoFuenteFinanciamiento"));
      	if (request.getParameter("objetivoId")!=null) objetivoId = Integer.parseInt(request.getParameter("objetivoId")); 
      	if (request.getParameter("tipoObjetivoId")!=null) tipoObjetivoId = Integer.parseInt(request.getParameter("tipoObjetivoId")); 
      	if (request.getParameter("versionObjetivoId")!=null) versionObjetivoId = Integer.parseInt(request.getParameter("versionObjetivoId")); 
      	if (request.getParameter("anhoObjetivoId")!=null) anhoObjetivoId = Integer.parseInt(request.getParameter("anhoObjetivoId")); 
      	if (request.getParameter("justificacionId")!=null) justificacionId = Integer.parseInt(request.getParameter("justificacionId"));      	
      	if (request.getParameter("unidadMedidaId")!=null) unidadMedidaId = Integer.parseInt(request.getParameter("unidadMedidaId")); 
      	if (request.getParameter("entidadId")!=null) entidadId = Integer.parseInt(request.getParameter("entidadId")); 
      	if (request.getParameter("usuarioId")!=null) usuarioId = Integer.parseInt(request.getParameter("usuarioId")); 
      	if (request.getParameter("indicadorId")!=null) indicadorId = Integer.parseInt(request.getParameter("indicadorId")); 
      	if (request.getParameter("objetivoVersion")!=null) objetivoVersion = Integer.parseInt(request.getParameter("objetivoVersion")); 
      	if (request.getParameter("tipoObjetivoId")!=null) tipoObjetivoId = Integer.parseInt(request.getParameter("tipoObjetivoId")); 
      	if (request.getParameter("objetivoSugeridoId")!=null) objetivoSugeridoId = Integer.parseInt(request.getParameter("objetivoSugeridoId")); 
      	if (request.getParameter("objetivoSugeridoTipoId")!=null) objetivoSugeridoTipoId = Integer.parseInt(request.getParameter("objetivoSugeridoTipoId")); 
      	if (request.getParameter("objetivoSugeridoAnho")!=null) objetivoSugeridoAnho = Integer.parseInt(request.getParameter("objetivoSugeridoAnho")); 
      	if (request.getParameter("objetivoSugeridoVersion")!=null) objetivoSugeridoVersion = Integer.parseInt(request.getParameter("objetivoSugeridoVersion")); 
      	if (request.getParameter("objetivoRelId")!=null) objetivoRelId = Integer.parseInt(request.getParameter("objetivoRelId")); 
      	if (request.getParameter("objetivoRelTipoObjetivoId")!=null) objetivoRelTipoObjetivoId = Integer.parseInt(request.getParameter("objetivoRelTipoObjetivoId")); 
      	if (request.getParameter("objetivoRelAnho")!=null) objetivoRelAnho = Integer.parseInt(request.getParameter("objetivoRelAnho")); 
      	if (request.getParameter("objetivoRelVersion")!=null) objetivoRelVersion = Integer.parseInt(request.getParameter("objetivoRelVersion")); 
      	if (request.getParameter("colaboracion")!=null) colaboracion = Double.parseDouble(request.getParameter("colaboracion")); 
      	if (request.getParameter("influencia")!=null) influencia = Double.parseDouble(request.getParameter("influencia")); 
      	if (request.getParameter("productoConcat")!=null) productoConcat = request.getParameter("productoConcat").toString(); 
      	if (request.getParameter("tipoIndicadorId")!=null) tipoIndicadorId = Integer.parseInt(request.getParameter("tipoIndicadorId")); 
      	if (request.getParameter("metodoCalculoId")!=null) metodoCalculoId = request.getParameter("metodoCalculoId"); 
      	if (request.getParameter("desagregacionTipoZonaGeograficaId")!=null) desagregacionTipoZonaGeograficaId = Integer.parseInt(request.getParameter("desagregacionTipoZonaGeograficaId")); 
      	if (request.getParameter("tipoDemograficaId")!=null) tipoDemograficaId = Integer.parseInt(request.getParameter("tipoDemograficaId")); 
      	//if (request.getParameter("fuenteVerificacionId")!=null) fuenteVerificacionId = Integer.parseInt(request.getParameter("fuenteVerificacionId"));  ya no es utilizado como condicionante pk en el ajax 
      	if (request.getParameter("borrado")!=null) borrado = Boolean.parseBoolean(request.getParameter("borrado")); 
      	if (request.getParameter("metaId")!=null) metaId = Integer.parseInt(request.getParameter("metaId")); 
      	
      	if (request.getParameter("etiquetaId")!=null) etiquetaId = Integer.parseInt(request.getParameter("etiquetaId"));
      	if (request.getParameter("productoId")!=null) productoId = Integer.parseInt(request.getParameter("productoId"));
      	if (request.getParameter("proyectoId")!=null) proyectoId = Integer.parseInt(request.getParameter("proyectoId"));
      	if (request.getParameter("subprogramaId")!=null) subprogramaId = Integer.parseInt(request.getParameter("subprogramaId"));
      	if (request.getParameter("programaId")!=null) programaId = Integer.parseInt(request.getParameter("programaId"));
      	if (request.getParameter("tipoPresupuestoId")!=null) tipoPresupuestoId = Integer.parseInt(request.getParameter("tipoPresupuestoId"));
      	if (request.getParameter("entidadId")!=null) entidadId = Integer.parseInt(request.getParameter("entidadId"));
      	if (request.getParameter("nivelId")!=null) nivelId = Integer.parseInt(request.getParameter("nivelId"));
      	if (request.getParameter("mayorIgual")!=null) mayorIgual = request.getParameter("mayorIgual").toString(); 
      	if (request.getParameter("unidadResponsableId")!=null) unrId= Integer.parseInt(request.getParameter("unidadResponsableId"));
      	if (request.getParameter("idDocumento")!=null) idDocumento= Integer.parseInt(request.getParameter("idDocumento"));
      	if (request.getParameter("catalogo_Destinatario")!=null) catalogo_Destinatario = Integer.parseInt(request.getParameter("catalogo_Destinatario"));
      	if (request.getParameter("depto")!=null) depto = Integer.parseInt(request.getParameter("depto"));		
      	if (request.getParameter("mesPND")!=null) mesPND = Integer.parseInt(request.getParameter("mesPND"));
      	if (request.getParameter("moduloId")!=null) moduloId= Integer.parseInt(request.getParameter("moduloId"));
      	if (request.getParameter("periodoId")!=null) periodoId= Integer.parseInt(request.getParameter("periodoId"));
      	if (request.getParameter("versionId")!=null) versionId= Integer.parseInt(request.getParameter("versionId"));      	

    	
      	
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
 
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Methods","GET,POST");
        response.addHeader("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "1");
        if ( request.getMethod().equals("OPTIONS") ) {
        	response.setStatus(HttpServletResponse.SC_OK);
            return;
        }
        
        /*response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");*/
        
        Gson gson = new Gson(); 
        JsonObject myObj = new JsonObject();
        String callback = request.getParameter("callback");

        
        if (accion!=null && accion!=""){
        	if (accion.equals("getObjetivosEstrategicos")){
        		List objetos=null;
        		if (estrategia!=0) condition += " and estrategia_id ="+estrategia;
        		if (objetivo!=0) condition += " and objetivo_id ="+objetivo;
				try {objetos = SqlSelects.selectObjetivosPorEstrategiaPnd(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("objetivos", json);
        		
        		out.println(myObj.toString());return;
        	}
        	
        	if (accion.equals("getEntidadesPorEstrategia")){
        		String objetos=null;
        		condition= " where true ";
        		if (estrategia!=0) condition+=" and estrategia_id="+estrategia+" "; 
        		
        		if (nivelId!=null && (nivelId!=0)) condition+=" and nivel_id="+nivelId;
        		if (entidadId!=null && (entidadId!=0)) condition+=" and entidad_id="+entidadId;
        		if (unidadResponsable!=null && (unidadResponsable!=-1)) condition+=" and ur_id="+unidadResponsable;
        		    
        			if (nivelId!=null && (nivelId!=0)) productoConcat=nivelId+"-";
        			if (entidadId!=null && (entidadId!=0)) productoConcat+=entidadId+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	                if (programa!=null) productoConcat+=programa+"-";
	                if (subprograma!= null) productoConcat+=subprograma+"-";                    
	                if (proyecto != null) productoConcat+=proyecto+"-";
	                if (producto != null) productoConcat+=producto;
                
	                if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";	        	
        		
        			
				try {objetos = SqlSelects.selectEntidadesPorEstrategia(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	

        	if (accion.equals("getTotalesPnd")){
        		String objetos=null; String condition2 = null; String condition3 = null; condition = null;
        		
        			condition=" where true";
        			if (nivelId!=null && (nivelId!=0)) condition+=" and nivel_id="+nivelId;
        			if (entidadId!=null && (entidadId!=0)) condition+=" and entidad_id="+entidadId;
        			if (unidadResponsable!=null && (unidadResponsable!=-1)) condition+=" and ur_id="+unidadResponsable;
        			
        			if (nivelId!=null && (nivelId!=0)) productoConcat=nivelId+"-";
        			if (entidadId!=null && (entidadId!=0)) productoConcat+=entidadId+"-";
        			if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
	        			        		

	        		
	        		if (nivelId!=null && (nivelId!=0)) condition2=" and pndpto.nivel_id="+nivelId;
	        		if (entidadId!=null && (entidadId!=0)) condition2+=" and pndpto.entidad_id="+entidadId;
	        		if (unidadResponsable!=null && (unidadResponsable!=-1)) condition2+=" and ur.id="+unidadResponsable;
	        		
	        		if (nivelId!=null && (nivelId!=0)) productoConcat=nivelId+"-";
	        		if (entidadId!=null && (entidadId!=0)) productoConcat+=entidadId+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition2+=" and prod_concat like '"+productoConcat+"%'";
        			
	        		
	        		
	        		if (nivelId!=null && (nivelId!=0)) condition3=" and ppd.nivel="+nivelId;
        			if (entidadId!=null && (entidadId!=0)) condition3+=" and ppd.entidad="+entidadId;
        			if (unidadResponsable!=null && (unidadResponsable!=-1)) condition3+=" and ur.id="+unidadResponsable;
        			if (tipoPrograma!=null) condition3+=" and ppd.tipo_presupuesto="+tipoPrograma;
        			if (programa!=null) condition3+=" and ppd.programa="+programa;
        			if (subprograma!= null) condition3+=" and ppd.subprograma="+subprograma;            		
        			if (proyecto != null) condition3+=" and ppd.proyecto="+proyecto;
        			if (producto != null) condition3+=" and ppd.producto="+producto;  		
        		
				try {objetos = SqlSelects.selectTotalPresupuesto(condition, condition2, condition3);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	
        	if (accion.equals("getTotalesPorEje")){
        		String objetos=null;
        		condition= " where true ";
        		if (nivelId!=null && (nivelId!=0)) condition+=" and nivel_id="+nivelId;
        		if (entidadId!=null && (entidadId!=0)) condition+=" and entidad_id="+entidadId;
        		if (unidadResponsable!=null && (unidadResponsable!=-1)) condition+=" and ur_id="+unidadResponsable;
	        		
        			if (nivelId!=null && (nivelId!=0)) productoConcat=nivelId+"-";
        			if (entidadId!=null && (entidadId!=0)) productoConcat+=entidadId+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
        		
        		
        		
        		
				try {objetos = SqlSelects.selectTotalEjes(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	
        	if (accion.equals("getContadoresPNDporEntidad")){
        		String objetos=null;
        		
        		condition= " where true ";
        		if (estrategia!=null && estrategia!=0) condition+=" and estrategia_id="+estrategia;
        		if (linea!=0) condition+=" and linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and eje_estrategico_id="+eje+" ";
        		
        		if (nivel!=null && (nivel!=0)) condition+=" and nivel_id="+nivel;
        		if (entidad!=null && (entidad!=0)) condition+=" and entidad_id="+entidad;
        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur_id="+unidadResponsable+" ";
        		
        			if (nivel!=null) productoConcat=nivel+"-";
        			if (entidad!=null) productoConcat+=entidad+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
        		
				try {objetos = SqlSelects.selectContadoresPNDporEntidad(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	
        	if (accion.equals("getPNDne")){
        		String objetos=null;
        		
        		condition= " where true and not ent.borrado ";
        		if (nivel!=null) condition+=" and ent.nivel_id="+nivel;
        		//if (entidad!=null) condition+=" and id="+entidad;   		
        		 
				try {objetos = SqlSelects.selectNE(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	if (accion.equals("getContadoresPNDporObjetivos")){
        		String objetos=null;
        		
        		condition= " where true ";
        		if (estrategia!=null && estrategia!=0) condition+=" and estrategia_id="+estrategia;
        		if (linea!=0) condition+=" and linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and eje_estrategico_id="+eje+" ";
        		if (nivel!=null && (nivel!=0)) condition+=" and nivel_id="+nivel;
        		if (entidad!=null && (entidad!=0)) condition+=" and entidad_id="+entidad;
        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur_id="+unidadResponsable+" ";
        		
        			if (nivel!=null) productoConcat=nivel+"-";
        			if (entidad!=null) productoConcat+=entidad+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
	        		
				try {objetos = SqlSelects.selectContadoresPNDporObjetivos(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	if (accion.equals("getPnd")){
        		String objetos=null;
        		condition= " where true ";
        		if (estrategia!=0) condition+=" and estrategia_id="+estrategia+" "; 
        		if (linea!=0) condition+=" and linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and eje_estrategico_id="+eje+" ";
        		if (nivel!=null && (nivel!=0)) condition+=" and nivel_id="+nivel;
    			if (entidad!=null && (entidad!=0)) condition+=" and entidad_id="+entidad;
    			if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur_id="+unidadResponsable+" ";
        		
        			if (nivel!=null) productoConcat=nivel+"-";
        			if (entidad!=null) productoConcat+=entidad+"-";
        			if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
	        		
				try {objetos = SqlSelects.getPnd(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	if (accion.equals("getPndFinanciamiento")){
        		String objetos=null;
        		condition= " where true ";
        		if (estrategia!=0) condition+=" and estrategia_id="+estrategia+" "; 
        		if (linea!=0) condition+=" and linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and eje_estrategico_id="+eje+" ";
        		
        		if (nivel!=null && (nivel!=0)) condition+=" and nivel_id="+nivel;
        		if (entidad!=null && (entidad!=0)) condition+=" and entidad_id="+entidad;
        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur_id="+unidadResponsable+" ";
        		
        			if (nivel!=null) productoConcat=nivel+"-";
        			if (entidad!=null) productoConcat+=entidad+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
	        		
				try {objetos = SqlSelects.getPndFinanciamiento(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}        	
        	if (accion.equals("getPndDestinatarios")){
        		String objetos=null; String condition2 = "";
        		condition= " where true ";        	
        		if (estrategia!=0) condition2+=" and estrategia_id="+estrategia+" "; 
        		if (linea!=0) condition2+=" and linea_transversal_id="+linea+" ";
        		if (eje!=0) condition2+=" and eje_estrategico_id="+eje+" ";
        		
        		if (nivel!=null && (nivel!=0)) condition+=" and nivel_id="+nivel;
    			if (entidad!=null && (entidad!=0)) condition+=" and entidad_id="+entidad;
    			if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur_id="+unidadResponsable+" ";
        		
        			if (nivel!=null) productoConcat=nivel+"-";
        			if (entidad!=null) productoConcat+=entidad+"-";
        			if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and prod_concat like '"+productoConcat+"%'";
	        		
				try {objetos = SqlSelects.getPndDestinatarios(condition, condition2);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
        	
        	if (accion.equals("getPndProductos")){
        		String objetos=null;
        		condition= " where true ";
        		if (estrategia!=0) condition+=" and m.estrategia_id="+estrategia+" "; 
        		if (linea!=0) condition+=" and m.linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and m.eje_estrategico_id="+eje+" ";
        		if (anho!=null) condition +=" and m.anho="+anho+" ";
        		if (nivel!=null && (nivel!=0)) condition+=" and m.nivel_id="+nivel;
        		if (entidad!=null && (entidad!=0)) condition+=" and m.entidad_id="+entidad;
        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and m.ur_id="+unidadResponsable+" ";
        		
        			
        			if (nivel!=null) productoConcat=nivel+"-";
        			if (entidad!=null) productoConcat+=entidad+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		if (productoConcat != null) condition+=" and m.prod_concat like '"+productoConcat+"%'";
	        		
				try {objetos = SqlSelects.getPndProductos(condition);}
				catch (SQLException e) {e.printStackTrace();}      		
        		out.println(objetos);return;
        	}
////////////
        	if (accion.equals("getPndMetas")){
        		String objetos=null;
        		condition= " where true and borrado='false' and anho=2017 and cantidad>0";
        		if (depto!=null) condition+=" and departamento_id="+depto+" "; 
        		if (anho!=null) condition+=" and anho="+anho+" "; 
        		if (mesPND!=null) condition+=" and mes="+mesPND+" "; 
        		//if (productoConcat!="") condition+=" and producto_concat="+productoConcat+" "; 
				try {objetos = SqlSelects.getPndMetas(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;
        	}
        	
        	//OBTENEMOS TODAS LAS METAS PND MAYORES A CERO DESAGREGADOS POR EJE, ESTRATEGIA, LINEA Y MES
        	if (accion.equals("getTotalPndMetas")){
        		String objetos=null; String condition2 = "";
        		condition= " where true and prepmd.cantidad>0";
        		
        		if (estrategia!=0) condition+=" and prepmd.estrategia_id="+estrategia+" "; 
        		if (linea!=0) condition+=" and prepmd.linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and prepmd.eje_estrategico_id="+eje+" ";
        		
        		if (mesPND!=null) {condition+=" and prepmd.mes="+mesPND+" "; condition2 += ", prepmd.mes "; };
        		if (anho!=null) {condition+=" and prepmd.anho="+anho+" "; condition2 += ", prepmd.anho "; };   		 
        		
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			productoConcat = nivel + "-" + entidad+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		condition+=" and prepmd.prod_concat like '"+productoConcat+"%'";
	        		if (unidadResponsable!= null && (unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
        		}
        		
				try {objetos = SqlSelects.getTotalPndMetas(condition,condition2);}
				catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;
        	}
        	
        	//OBTENEMOS TODA LA ASIGNACION FINANCIERA MAYOR A CERO DESAGREGADOS POR EJE, ESTRATEGIA, LINEA Y MES
        	if (accion.equals("getTotalAsignacionFinanciera")){
        		String objetos=null; String condition2 = "";
        		condition = "where true ";
        		if (estrategia!=0) condition+=" and preppd.estrategia_id="+estrategia+" "; 
        		if (linea!=0) condition+=" and preppd.linea_transversal_id="+linea+" ";
        		if (eje!=0) condition+=" and preppd.eje_estrategico_id="+eje+" ";
        		if (anho!=null) {condition+=" and preppd.anho="+anho+" "; condition2 += ", preppd.anho "; };  
        		
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			productoConcat = nivel + "-" + entidad+"-";
	        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
	        		if (programa!=null) productoConcat+=programa+"-";
	        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
	        		if (proyecto != null) productoConcat+=proyecto+"-";
	        		if (producto != null) productoConcat+=producto;
	        		condition+=" and preppd.prod_concat like '"+productoConcat+"%'";
	        		if (unidadResponsable!= null && (unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
        		}
        		
				try {objetos = SqlSelects.totalAsignacionFinanciera(condition,condition2);}
				catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;
        	}
        	
        	if (accion.equals("getObjetivosPorProyecto")){
        		List objetos=null;
        		condition="where true ";
        		if (nivel!=null) condition+="and nivel="+nivel;
        		if (entidad!=null) condition+=" and entidad="+entidad;
        		if (tipoPresupuesto!=null) condition+=" and tipo_presupuesto="+tipoPresupuesto;
        		if (programa!=null) condition+=" and programa="+programa;
        		if (subprograma!= null) condition+=" and sub_programa="+subprograma;
        		//if (funcional!=0) condition+=" and funcional="+funcional;
        		if (proyecto != null) condition+=" and proyecto="+proyecto; 
				try {objetos = SqlSelects.selectObjetivosPorProyecto(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json);return;
        	}
        	
        	if (accion.equals("getSnip")){
        		List objetos=null;
         		if (snip!=null) condition = " where id ="+snip;
				try {objetos = SqlSelects.selectProyectoSnip(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("snip", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getSnipAutorizado")){
        		List objetos=null;
        		if (snipAutorizado!=null) condition = " where id ="+snipAutorizado;
        		if (entidad!=null && nivel!=null && snip!=null ) condition = " where entidad_id ="+entidad+" and entidad_nivel_id="+nivel+" and proyecto_snip_id="+snip;
        		if (entidad!=null && nivel!=null && snip==null ) condition = " where entidad_id ="+entidad+" and entidad_nivel_id="+nivel;
				try {objetos = SqlSelects.selectProyectoSnipAutorizado(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("snipAutorizado", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getUsuarios")){
        		List objetos=null;
        		String condicion = " where true";
        		if (usuarioId != null) condicion += " and id ='"+usuarioId+"'";
        		if (usuario!=null) condicion += " and correo ='"+usuario+"'";
        		if (mayorIgual != null) condicion += " and role_id >= '"+mayorIgual+"'";
        		if (nivelId!=null) condicion += " and nivel_id ="+nivelId;
        		if (entidadId!=null) condicion += " and entidad_id ="+entidadId;
        		if (unrId!=null) condicion += " and unr_id ="+unrId;
				try {objetos = SqlSelects.selectUsuario(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("usuarios", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getIndicadoresPnd")){
        		List objetos=null;
        		if (objetivo!=null) condition = " where objetivo_id ="+objetivo+" and borrado is false and nivel = "+nivelCas+" and entidad = "+entidadCas; //TODO: Verificar
				try {objetos = SqlSelects.selectAllIndicadores(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("indicadores", json);
        		out.println(myObj.toString());return;
        	}
        	
        	if (accion.equals("getMetasPnd")){
        		List objetos=null;
        		if (objetivo!=null) condition = " where indicador_id ="+indicador+" and borrado_int =0";
				try {objetos = SqlSelects.selectMetasPnd(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("metas", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getMetas")){
        		List objetos=null;
        		String condicion = " where true ";
        		
        		if (metaId!=null) condicion += " and id ="+metaId;
        		if (indicadorId!=null) condicion += " and indicador_id ="+indicadorId;        		
        		//if (nivel!=null) condicion += " and nivel ="+nivel;
        		//if (entidad!=null) condicion += " and entidad ="+entidad;
        		//if (productoConcat != null) condicion += " and producto_concat ='"+productoConcat+"'";
        		if (borrado!=null) condicion += " and borrado ="+borrado;
				try {objetos = SqlSelects.selectMetas(condicion,nivelCas,entidadCas);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (accion.equals("getAvanceMetas")){
        		List objetos=null;
        		String condicion = " where true ";
        		
        		if (metaId!=null) condicion += " and id ="+metaId;
        		if (indicadorId!=null) condicion += " and indicador_id ="+indicadorId;        		
        		//if (nivel!=null) condicion += " and nivel ="+nivel;
        		//if (entidad!=null) condicion += " and entidad ="+entidad;
        		//if (productoConcat != null) condicion += " and producto_concat ='"+productoConcat+"'";
        		if (borrado!=null) condicion += " and borrado ="+borrado;
				try {objetos = SqlSelects.selectAvanceMetas(condicion,nivelCas,entidadCas);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (accion.equals("getIndicadores")){
        		List objetos=null;
        		String condicion =" where true "; 
        		if (indicadorId!=null) condicion += "and id = "+indicadorId.toString();
        		if (objetivoId!=null) condicion += " and objetivo_id = "+objetivoId.toString();
				try {objetos = SqlSelects.selectAllIndicadores(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("indicadores", json);
        		out.println(myObj.toString());return;
        	}
        	//Agregue otro getImdicador por que el de arriba en el slq esta fijo borrado = 0
        	if (accion.equals("getIndicador")){
        		List objetos=null;
        		String condicion =" where true "; 
        		if (indicadorId!=null) condicion += "and id = "+indicadorId.toString();
        		if (tipoIndicadorId!=null) condicion += " and tipo_indicador_id = "+tipoIndicadorId.toString();
        		//if (metodoCalculoId!=null) condicion += " and metodo_calculo_id = "+metodoCalculoId.toString();
        		if (unidadMedidaId!=null) condicion += " and unidad_medida_id = "+unidadMedidaId.toString();
        		if (desagregacionTipoZonaGeograficaId!=null) condicion += " and desagregacion_tipo_zona_geografica_id = "+desagregacionTipoZonaGeograficaId.toString();
        		if (tipoDemograficaId!=null) condicion += " and tipo_demografica_id = "+tipoDemograficaId.toString();
        		//if (fuenteVerificacionId!=null) condicion += " and fuente_verificacion_id = "+fuenteVerificacionId.toString();
        		//if (nivel!=null) condicion += " and nivel = "+nivel.toString();
        		//if (entidad!=null) condicion += " and entidad = "+entidad.toString();
        		if (objetivoId!=null) condicion += " and objetivo_id = "+objetivoId.toString();
        		if (borrado!=null) condicion += " and borrado = "+borrado;
				try {objetos = SqlSelects.selectAllIndicador(condicion,nivelCas,entidadCas);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("indicadores", json);
        		out.println(myObj.toString());return; 
        	}
        	
        	if (accion.equals("getProductos")){
        		List productos=null;
        		if (producto!=null ) condition = " where id ="+producto.toString();
				try {productos = SqlSelects.selectAllCatalogProductosHacienda(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(productos );
        		myObj.addProperty("success", true);
        		myObj.add("productos", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	if (accion.equals("getUnidadesMedida")){
        		List objetos=null;
        		if (unidadMedida!=null ) condition = " where id ="+unidadMedida.toString();
				try {objetos = SqlSelects.selectAllUnidadesMedida(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("unidadesMedida", json);
        		out.println(myObj.toString());return;
        	}
        	
        	if (accion.equals("getDepartamentos")){
        		List objetos=null;
        		if (deptoPais!=null) condition = " where id = "+deptoPais; 
				try {objetos = SqlSelects.selectAllDepartamentos(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("departamentos", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	if (accion.equals("getMeses")){
        		List objetos=null;
				try {objetos = SqlSelects.selectAllMeses("");}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("meses", json);
        		out.println(myObj.toString());return;
        	}
        
        	if (accion.equals("getEjes")){
        		List objetos=null;
				try {objetos = SqlSelects.selectAllPLanEje();}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("ejes", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getEjeEstrategico")){
        		List objetos=null;
        		if (idEje!=null) condition = " where id = "+idEje; 
				try {objetos = SqlSelects.selectAllEjeEstrategico(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("ejeEstrategico", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getEntidades")){
        		List objetos=null;
        		String condicion = "where true ";
        		if (entidadId!=null) condicion += " and id = "+entidadId;
        		if (nivel!=null) condicion += " and nivel_id = "+nivel.toString();
				try {objetos = SqlSelects.selectAllEntidades(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("entidades", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        		
        	}
        	if (accion.equals("getEntidad")){
        		List objetos=null;
        		if (nivel!=null && entidad!=null) condition = " where nivel_id = "+nivel.toString()+" and id = "+entidad.toString();
				try {objetos = SqlSelects.selectAllEntidades(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("entidades", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getInstitucion")){
        		List objetos=null;
        		//
        		condition=" where true ";
        		if (nivel!=null ) condition += " and nivel_id = "+nivel.toString();
        		if (entidad!=null) condition += " and entidad_id = "+entidad.toString();
        		if (unidadResponsable!=null) condition += " and unidad_responsable_id = "+unidadResponsable.toString();
        		
				try {objetos = SqlSelects.selectAllInstituciones(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("instituciones", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getFuentesFinanciamiento")){
        		List objetos=null;
        		if (codigoFuenteFinanciamiento!=null) condition = " where id = "+codigoFuenteFinanciamiento;
				try {objetos = SqlSelects.selectAllFuentesFinanciamiento(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("fuentesFinanciamiento", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getFuncionales")){
        		List objetos=null;
				try {objetos = SqlSelects.selectAllFuncionales();}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("funcionales", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getNiveles")){
        		List objetos=null;
        		condition =" where true ";
        		if (nivel!=null) condition += " and id = "+nivel.toString();        		
        		if (borrado!=null) condition += " and borrado = "+borrado;
				try {objetos = SqlSelects.selectAllNiveles(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("niveles", json);

        		//out.println(myObj.toString());return; 		                

        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }

        	}
        	if (accion.equals("getObjetosDeGasto")){
        		List objetos=null;
        		if (codigoObjeto!=null) condition = " where id = "+codigoObjeto;
				try {objetos = SqlSelects.selectAllObjetosDeGasto(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("objetosDeGasto", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getOrganismosFinanciadores")){
        		List objetos=null;
				try {objetos = SqlSelects.selectAllOrganismosFinanciadores();}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("organismosFinanciadores", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getEstrategias")){
        		List objetos=null;
        		if(codigoPilar!=null) condition = "and id = "+codigoPilar;
				try {objetos = SqlSelects.selectAllPilares(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("estrategias", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getLineaTransversal")){
        		List objetos=null;
        		if (idLinea!=null) condition = " and id = "+idLinea; 
				try {objetos = SqlSelects.selectAllLineaTransversal(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("lineaTransversal", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getPlanes")){//complica la fecha
        		List objetos=null;
				try {try {
					objetos = SqlSelects.selectAllPlanes();
				} catch (DatatypeConfigurationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("planes", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getCatalogoDncp")){//complica la fecha
        		List objetos=null;
				try {objetos = SqlSelects.selectAllCatalogoDNCP();}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("getCatalogoDncp", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getTiposPrograma")){
        		condition =" where true ";         		
        		List objetos=null;
        		if(tipoPresupuestoId!=null) condition+=" and numero_fila="+tipoPresupuestoId;
        		if (borrado!=null) condition += " and borrado = "+borrado;
				try {objetos = SqlSelects.selectAllTiposPrograma(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("tiposPrograma", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	
        	if (accion.equals("getTiposProgramaPND")){
        		condition =" where true ";         		
        		List objetos=null;
        		if(tipoPresupuestoId!=null) condition+=" and tp.numero_fila="+tipoPresupuestoId;
        		if (borrado!=null) condition += " and tp.borrado = "+borrado;
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			condition+=" and ur.entidad_nivel_id="+nivel+" and ur.entidad_id="+entidad;
	        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
        		};
        		
				try {objetos = SqlSelects.selectAllTiposProgramaPnd(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("tiposPrograma", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	
        	
        	if (accion.equals("getTiposDestinatarios")){
        		List objetos=null;
        		condition =" where true ";        		
        		if (tipoDestinatarioId!=null) condition += " and id = "+ tipoDestinatarioId.toString();        		
				try {objetos = SqlSelects.selectAllTiposDestinatarios(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("tiposDestinatarios", json);
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	//destinatarios
        	if (accion.equals("getDestinatarios")){
        		List objetos=null;
        		condition =" where true ";
        		if (catalogoProdPresDest!=null) condition += "and id = "+catalogoProdPresDest.toString();
        		if (tipoDestinatario!=null) condition += " and tipo_catalogo_destinatario_id = "+tipoDestinatario.toString();
        		if (borrado!=null) condition += " and borrado = "+borrado.toString();

				try {objetos = SqlSelects.selectAllDestinatarios(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		myObj.addProperty("success", true);
        		myObj.add("destinatarios", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	if (accion.equals("getProgramas")){
        		List objetos=null;
        		if (nivel!=null && entidad!=null && tipoPresupuesto!=null) 
        			condition = " where entidad_nivel_id ="+nivel.toString()+" and entidad_id = "+entidad.toString()+" and tipo_presupuesto_id = "+tipoPresupuesto.toString();
        		if (programa!=null)
        			condition+=" and id="+programa;
				try {objetos = SqlSelects.selectAllProgramas(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("programas", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	//usado para selector de filtros en reporte pnd
        	if (accion.equals("getProgramasPND")){
        		List objetos=null;
        		condition = " where true ";
        		if (nivel!=null && entidad!=null && tipoPrograma!=null) 
        			condition += " and tp.entidad_nivel_id ="+nivel.toString()+" and tp.entidad_id = "+entidad.toString()+" and tp.tipo_presupuesto_id = "+tipoPrograma.toString();
        		if (programa!=null)
        			condition+=" and tp.id="+programa;
        		
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			condition+=" and ur.entidad_nivel_id="+nivel+" and ur.entidad_id="+entidad;
	        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
        		};
        		if (borrado != null) condition += " and tp.borrado = "+borrado;
				try {objetos = SqlSelects.selectAllProgramasPnd(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("programas", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
       	
        	if (accion.equals("getSubprogramas")){
        		List objetos=null;
        		if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null) 
        			condition = " where programa_entidad_nivel_id ="+nivel.toString()+" and programa_entidad_id = "+entidad.toString()+" and programa_tipo_presupuesto_id = "+tipoPresupuesto.toString()+" and programa_id = "+programa.toString();
        		if (subprograma!=null)
        			condition += " and id = "+subprograma.toString();
				try {objetos = SqlSelects.selectAllSubprogramas(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("subprogramas", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	//usado para selector de filtros en reporte pnd
        	if (accion.equals("getSubprogramasPND")){
        		List objetos=null;
        		condition = " where true ";
        		if (nivel!=null && entidad!=null && tipoPrograma!=null && programa!=null) 
        			condition += " and tp.programa_entidad_nivel_id ="+nivel.toString()+" and tp.programa_entidad_id = "+entidad.toString()+" and tp.programa_tipo_presupuesto_id = "+tipoPrograma.toString()+" and tp.programa_id = "+programa.toString();
        		if (subprograma!=null)
        			condition += " and tp.id = "+subprograma.toString();
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			condition+=" and ur.entidad_nivel_id="+nivel+" and ur.entidad_id="+entidad;
	        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
        		};
        		if (borrado != null) condition += " and tp.borrado="+borrado;
				try {objetos = SqlSelects.selectAllSubprogramasPnd(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("subprogramas", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	
        	if (accion.equals("getProyectos")){
        		List objetos=null;
        		String condicion =" where true ";
        		if (nivel != null) condicion += " and subprograma_programa_entidad_nivel_id ="+nivel;
        		if (entidad!=null) condicion += " and subprograma_programa_entidad_id="+entidad;
        		if (tipoPresupuesto!=null) condicion += " and subprograma_programa_tipo_presupuesto_id="+tipoPresupuesto;
        		if (programa!=null) condicion += " and subprograma_programa_id="+programa;
        		if (subprograma!=null) condicion += " and subprograma_id="+subprograma;
        		if (unidadResponsable!=null) condicion += " and unidad_responsable_id="+unidadResponsable;
        		if (funcionalId!=null) condicion += " and funcional_id="+funcionalId;
        		if (proyecto!=null)	condicion+=" and id="+proyecto;
        		if (borrado!=null) condicion += " and borrado is "+ borrado;

				try {objetos = SqlSelects.selectAllProyectos(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("proyectos", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	
        	//usado para selector de filtros en reporte pnd
        	if (accion.equals("getProyectosPND")){
        		String objetos=null;
        		String condicion =" where true ";
        		if (nivel != null) condicion += " and py.subprograma_programa_entidad_nivel_id ="+nivel;
        		if (entidad!=null) condicion += " and py.subprograma_programa_entidad_id="+entidad;
        		if (tipoPrograma!=null) condicion += " and py.subprograma_programa_tipo_presupuesto_id="+tipoPrograma;
        		if (programa!=null) condicion += " and py.subprograma_programa_id="+programa;
        		if (subprograma!=null) condicion += " and py.subprograma_id="+subprograma;
        		if (unidadResponsable!=null) condicion += " and py.unidad_responsable_id="+unidadResponsable;
        		if (funcionalId!=null) condicion += " and funcional_id="+funcionalId;
        		if (proyecto!=null)	condicion+=" and py.id="+proyecto;
        		if (borrado!=null) condicion += " and py.borrado is "+ borrado;

				try {objetos = SqlSelects.selectAllProyectosPND(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		if(callback != null) {
                    out.println(callback + "(" + objetos.toString() + ");");
                }else{
                    out.println(objetos.toString());return;
                }
        	}
        	
        	
        	if (accion.equals("getProductosPresupuesto")){
        		List objetos=null;
        		String condicion =" where true ";

        		if (nivel != null) condicion += "and proyecto_subprograma_programa_entidad_nivel_id ="+nivel;
        		if (entidad!=null) condicion += " and proyecto_subprograma_programa_entidad_id="+entidad;
        		if (tipoPresupuesto!=null) condicion += " and proyecto_subprograma_programa_tipo_presupuesto_id="+tipoPresupuesto;
        		if (programa!=null) condicion += " and proyecto_subprograma_programa_id="+programa;
        		if (subprograma!=null) condicion += " and proyecto_subprograma_id="+subprograma;
        		if (proyecto!=null) condicion += " and proyecto_id="+proyecto;
        		if (producto!=null) condicion += " and producto_id="+producto;
        		if (anho!=null) condicion += " and anho="+anho;
        		if (versionReporte!=null) condicion += " and version="+versionReporte;        		
        		if (borrado!=null) condicion += " and borrado is "+ borrado;
        		try {objetos = SqlSelects.selectAllProductosPresupuesto(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("producto", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}
        	
        	//usado para selector de filtros en reporte pnd
        	if (accion.equals("getProductosPresupuestoPND")){
        		String objetos=null;
        		String condicion =" where true ";

        		if (nivel != null) condicion += " and p.proyecto_subprograma_programa_entidad_nivel_id ="+nivel;
        		if (entidad!=null) condicion += " and p.proyecto_subprograma_programa_entidad_id="+entidad;
        		if (tipoPrograma!=null) condicion += " and p.proyecto_subprograma_programa_tipo_presupuesto_id="+tipoPrograma;
        		if (programa!=null) condicion += " and p.proyecto_subprograma_programa_id="+programa;
        		if (subprograma!=null) condicion += " and p.proyecto_subprograma_id="+subprograma;
        		if (proyecto!=null) condicion += " and p.proyecto_id="+proyecto;
        		if (producto!=null) condicion += " and p.producto_id="+producto;
        		if (anho!=null) condicion += " and p.anho="+anho;
        		if (versionReporte!=null) condicion += " and p.version="+versionReporte;
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			condition+=" and ur.entidad_nivel_id="+nivel+" and ur.entidad_id="+entidad;
	        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condicion+=" and ur.id="+unidadResponsable+" ";
        		};
        		if (borrado!=null) condicion += " and p.borrado is "+ borrado;
        		
        		try {objetos = SqlSelects.selectAllProductosPresupuestoPND(condicion);}
				catch (SQLException e) {e.printStackTrace();}        		
        		
        		out.println(objetos.toString());return;
        	}
        	
        	//usado para reporte pnd
        	if (accion.equals("getUnidadesResponsablesPND")){
        		String objetos=null;
        		String condicion = "";
        		
        		//if (nivel!=null && entidad!=null) condicion += " and entidad_id="+entidad+" and entidad_nivel_id="+nivel;
        		if (nivel!=null) condicion += " and entidad_nivel_id="+nivel;
        		if (entidad!=null) condicion += " and entidad_id="+entidad;
        		if (unrId!=null) condicion += " and not id="+unrId;
        		if (unidadResponsable!=null ) condicion += " and id ="+unidadResponsable.toString();  
				try {objetos = SqlSelects.selectAllUnidadResponsablePND(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		//JsonElement json = new Gson().toJsonTree(objetos );
//        		myObj.addProperty("success", true);
//        		myObj.add("unidadesResponsables", json);
        		out.println(objetos.toString());return;
        	}
        	
        	if (accion.equals("getProductosPresupuestoMeta")){
        		List objetos=null;    
        		String condicion = " where true ";	
        		
        		if (producto != null) condicion += " and producto_id ='"+producto.toString()+"'";
        		if (proyecto != null) condicion += " and proyecto_id ='"+proyecto.toString()+"'";
        		if (subprograma != null) condicion += " and subprograma_id ='"+subprograma.toString()+"'";
        		if (programa != null) condicion += " and programa_id ='"+programa.toString()+"'";
        		if (tipoPresupuesto != null) condicion += " and tipo_presupuesto_id ='"+tipoPresupuesto.toString()+"'";
        		if (entidad!= null) condicion += " and entidad_id ='"+entidad.toString()+"'";
        		if (nivel != null) condicion += " and nivel_id ='"+nivel.toString()+"'";        		
        		if (borrado!=null) condicion += " and borrado is "+ borrado;
        		//if (anio!=null) condicion += " and anho ="+ anio.toString();
        		/*if (productoId != null) condicion += " and producto_id ='"+productoId+"'";
        		if (proyectoId != null) condicion += " and proyecto_id ='"+proyectoId+"'";
        		if (subprogramaId != null) condicion += " and subprograma_id ='"+subprogramaId+"'";
        		if (programaId != null) condicion += " and programa_id ='"+programaId+"'";
        		if (tipoPresupuestoId != null) condicion += " and tipo_presupuesto_id ='"+tipoPresupuestoId+"'";
        		if (entidadId != null) condicion += " and entidad_id ='"+entidadId+"'";
        		if (nivelId != null) condicion += " and nivel_id ='"+nivelId+"'";*/
        		
        		/*if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null && subprograma != null && proyecto != null && producto!=null)        				 
        			condicion = " where nivel_id ="+nivel.toString()+" and entidad_id = "+entidad.toString()+" and tipo_presupuesto_id = "+tipoPresupuesto.toString()+" and programa_id = "+programa.toString()+" and subprograma_id = "+subprograma.toString()+ " and proyecto_id = "+proyecto.toString()+" and producto_id="+producto.toString();       				 
        							
        		if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null && subprograma != null && proyecto != null)        				 
        			condicion = " where nivel_id ="+nivel.toString()+" and entidad_id = "+entidad.toString()+" and tipo_presupuesto_id = "+tipoPresupuesto.toString()+" and programa_id = "+programa.toString()+" and subprograma_id = "+subprograma.toString()+ " and proyecto_id = "+proyecto.toString();*/        				 
        		try {objetos = SqlSelects.selectAllProductosPresupuestoMeta(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("productoPresupuestoMeta", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getProductosPresupuestoMetaDeptoMes")){
        		List objetos=null;
        		if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null && subprograma != null && proyecto != null && producto!=null && departamento!=null && mes!=null)
        			condition = " where nivel_id ="+nivel.toString()+" and entidad_id = "+entidad.toString()+" and tipo_presupuesto_id = "+tipoPresupuesto.toString()+" and programa_id = "+programa.toString()+" and subprograma_id = "+subprograma.toString()+ " and proyecto_id = "+proyecto.toString()+" and producto_id="+producto.toString()+" and mes = "+mes+" and departamento_id= "+departamento;
				try {objetos = SqlSelects.selectAllProductosPresupuestoMeta(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("productoPresupuestoMeta", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getProductoDestinatario")){
        		List objetos=null; 
        		condition = " where true ";
        		
        		if (producto != null) condition += " and producto ='"+producto.toString()+"'";
        		if (proyecto != null) condition += " and proyecto ='"+proyecto.toString()+"'";
        		if (subprograma != null) condition += " and subprograma ='"+subprograma.toString()+"'";
        		if (programa != null) condition += " and programa ='"+programa.toString()+"'";
        		if (tipoPresupuesto != null) condition += " and tipo_presupuesto ='"+tipoPresupuesto.toString()+"'";
        		if (entidad!= null) condition += " and entidad ='"+entidad.toString()+"'";
        		if (nivel != null) condition += " and nivel ='"+nivel.toString()+"'";
        		if (catalogoDestinatario != 0) condition += " and catalogo_destinatario ='"+catalogoDestinatario.toString()+"'"; // != 0 porque tiene por defecto valor 0
        		if (departamento != 99) condition += " and departamento ='"+departamento.toString()+"'"; // != 99 porque tiene por defecto 99
        		if (destinatarioId != null) condition += " and id ="+destinatarioId;
	    		if (borrado != null) condition += " and borrado="+borrado;
				try {objetos = SqlSelects.selectAllProductosDestinatarios(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("productoDestinatarios", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getProductoDestinatarioSinDpto")){
        		List objetos=null; 
        		condition = " where true ";
        		
        		if (producto != null) condition += " and producto ='"+producto.toString()+"'";
        		if (proyecto != null) condition += " and proyecto ='"+proyecto.toString()+"'";
        		if (subprograma != null) condition += " and subprograma ='"+subprograma.toString()+"'";
        		if (programa != null) condition += " and programa ='"+programa.toString()+"'";
        		if (tipoPresupuesto != null) condition += " and tipo_presupuesto ='"+tipoPresupuesto.toString()+"'";
        		if (entidad!= null) condition += " and entidad ='"+entidad.toString()+"'";
        		if (nivel != null) condition += " and nivel ='"+nivel.toString()+"'";        		
        		        		
				try {objetos = SqlSelects.selectAllProductosDestinatarios(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("productoDestinatarios", json);
        		out.println(myObj.toString());return;
        	}
        	
//        	if (accion.equals("getCatalogoDestinatario")){
//        		List objetos=null;
//        		String condicion =" where true";
//        		if (nivel!=null ) condicion = " and nivel ="+nivel;
//        		if (entidad!=null ) condicion = " and entidad ="+entidad;
//        		if (tipoPresupuesto!=null ) condicion = " and tipo_catalogo_destinatario_id ="+tipoCatalogo;        		
//        		if (anho!=null ) condicion = " and anio ="+anho;
//        		if (version!=null ) condicion = " and proyecto ="+version;
//        		
//				try {objetos = SqlSelects.selectAllEstructura(condicion);}
//				catch (SQLException e) {e.printStackTrace();}
//        		JsonElement json = new Gson().toJsonTree(objetos );
//        		
//        		out.println(json.toString());
//        	}
        	if (accion.equals("getUnidadesResponsables")){
        		List objetos=null;
        		String condicion = "";
        		
        		//if (nivel!=null && entidad!=null) condicion += " and entidad_id="+entidad+" and entidad_nivel_id="+nivel;
        		if (nivel!=null) condicion += " and entidad_nivel_id="+nivel;
        		if (entidad!=null) condicion += " and entidad_id="+entidad;
        		if (unrId!=null) condicion += " and not id="+unrId;
        		if (unidadResponsable!=null ) condicion += " and id ="+unidadResponsable.toString();        		
				try {objetos = SqlSelects.selectAllUnidadResponsable(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("unidadesResponsables", json);
        		out.println(myObj.toString());return;
        	}        	
        	
        	
        	
        	if (accion.equals("getUnidadesJerarquicas")){
        		List objetos=null;
        		String condicion = "where true";
        		if (nivel!=null && entidad!=null) condicion += " and entidad_id="+entidad+"  and entidad_nivel_id="+nivel;
        		if (unidadJerarquica!=null ) condicion += " and id ="+unidadJerarquica.toString();
				try {objetos = SqlSelects.selectAllUnidadJerarquica(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("unidadesJerarquicas", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getResultados")){
	    		List objetos=null;
	    		condition = " where tipo_objetivo_id =2 and borrado_int =0";
	    		if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null && subprograma != null && proyecto != null ){
	    			condition += " and nivel="+nivel.toString()+" and entidad = "+entidad.toString()+" and tipo_presupuesto = "+tipoPresupuesto.toString()+" and programa = "+programa.toString()+" and subprograma = "+subprograma.toString()+ " and proyecto = "+proyecto.toString();
	    		}
	    		condition += " and tipo_objetivo_id =2";
	    		if (borrado!=null)condition += " and borrado ="+borrado;
				try {objetos = SqlSelects.selectAllResultados(condition);}
				catch (SQLException e) {e.printStackTrace();}
	    		JsonElement json = new Gson().toJsonTree(objetos );
	    		myObj.addProperty("success", true);
	    		myObj.add("resultados", json);
	    		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getTipoObjetivos")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				try {objetos = SqlSelects.selectAllTiposObjetivos(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getObjetivos")){
	    		List objetos=null;
	    		String condicion = " where true";
	    		
		    		if (objetivoId != null) condicion += " and id="+objetivoId;
		    		if (tipoObjetivoId != null) condicion += " and tipo_objetivo_id="+tipoObjetivoId;
		    		if (versionObjetivoId != null) condicion += " and version="+versionObjetivoId;
		    		if (anhoObjetivoId != null) condicion += " and anho="+anhoObjetivoId;
		    		if (borrado != null) condicion += " and borrado="+borrado;
	    		try {objetos = SqlSelects.selectObjetivos(condicion);}
				catch (SQLException e) {e.printStackTrace();}
	    		JsonElement json = new Gson().toJsonTree(objetos );
	    		myObj.addProperty("success", true);
	    		myObj.add("objetivos", json);
	    		out.println(myObj.toString());return;
    		}
        	if (accion.equals("getResultadoId")){
	    		List objetos=null;
	    		if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null && subprograma != null && proyecto != null && funcional !=null && nombre!=null){
	    			condition += " where tipo_objetivo_id =2 and nombre = \""+nombre+"\" and nivel="+nivel.toString()+" and entidad = "+entidad.toString()+" and tipo_presupuesto = "+tipoPresupuesto.toString()+" and programa = "+programa.toString()+" and subprograma = "+subprograma.toString()+ " and proyecto = "+proyecto.toString()+" and funcional = "+funcional.toString()+" and borrado=0 limit 1";
	    		}
	    		
				try {objetos = SqlSelects.selectAllResultados(condition);}
				catch (SQLException e) {e.printStackTrace();}
	    		JsonElement json = new Gson().toJsonTree(objetos );
	    		myObj.addProperty("success", true);
	    		myObj.add("resultados", json);
	    		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getSumaDepto")){
        		List objetos=null;
        		
        		condition = "where true ";
        		if (nivel!=null) condition += " and nivel_id="+nivel.toString();
        		if (entidad!=null) condition += " and entidad_id="+entidad.toString();
        		if (tipoPresupuesto!=null) condition += " and tipo_presupuesto_id="+tipoPresupuesto.toString();
        		if (programa!=null) condition += " and programa_id="+programa.toString();
        		if (subprograma!=null) condition += " and subprograma_id="+subprograma.toString();
        		if (proyecto!=null) condition += " and proyecto_id="+proyecto.toString();
        		if (producto!=null) condition += " and producto_id="+producto.toString();
        		if (anio!=null) condition += " and anho="+anio.toString();

        		
        		
				try {objetos = SqlSelects.selectAllSumaDepartamentoN(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("sumaDeptoN", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getDeptoMayor")){
        		List objetos=null;
        		if (nivel!=null && entidad!=null && tipoPresupuesto!=null && programa!=null && subprograma != null && proyecto != null && producto != null && anio != null){
        			condition = " where nivel_id = "+nivel.toString()+" and entidad_id = "+entidad.toString()+" and tipo_presupuesto_id = "+tipoPresupuesto.toString()+" and programa_id = "+programa.toString()+" and subprograma_id = "+subprograma.toString()+" and proyecto_id = "+proyecto.toString()+" and producto_id = "+producto.toString()+" and anho = "+anio.toString();
        		}
        		
				try {objetos = SqlSelects.selectAllDeptoTop(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("deptoMayor", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getSumaMes")){
        		List objetos=null;
        		condition = "where true ";
        		if(nivel!=null) condition +=" and nivel_id = "+nivel.toString();
        		if(entidad!=null) condition +=" and entidad_id = "+entidad.toString();
        		if(tipoPresupuesto!=null) condition +=" and tipo_presupuesto_id = "+tipoPresupuesto.toString();
        		if(programa!=null) condition +=" and programa_id = "+programa.toString();
        		if(subprograma!=null) condition +=" and subprograma_id = "+subprograma.toString();
        		if(proyecto!=null) condition +=" and proyecto_id = "+proyecto.toString();
        		if(producto!=null) condition +=" and producto_id = "+producto.toString();
        		if(anio!=null) condition +=" and anho = "+anio.toString();
        		
        		
				try {objetos = SqlSelects.selectAllSumaMes(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("sumaMes", json);
        		out.println(myObj.toString());return;
        	}
        	if (accion.equals("getResultadoIndicadorMeta")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				try {objetos = SqlSelects.selectAllResultadoIndicadorMeta(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getMatrizPnd")){
        		List objetos=null;
				try {objetos = SqlSelects.selectAllMatrizPnd();}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (accion.equals("getEstructura")){
        		List objetos=null;
        		String condicion =" where true";
        		if (nivel!=null ) condicion = " and nivel ="+nivel;
        		if (entidad!=null ) condicion = " and entidad ="+entidad;
        		if (tipoPresupuesto!=null ) condicion = " and tipo ="+tipoPresupuesto;
        		if (programa!=null ) condicion = " and programa ="+programa;
        		if (subprograma!=null ) condicion = " and subprograma ="+subprograma;
        		if (proyecto!=null ) condicion = " and proyecto ="+proyecto;
        		if (anio!=null ) condicion = " and anio ="+anio;
        		if (version!=null ) condicion = " and proyecto ="+version;
        		
				try {objetos = SqlSelects.selectAllEstructura(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getEstructuraFinanciera")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				try {objetos = SqlSelects.selectAllEstructuraFinanciera(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getPresupuestoGasto")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				try {objetos = SqlSelects.selectAllPresupuestoGasto(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getPresupuestoIngreso")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				try {objetos = SqlSelects.selectAllPresupuestoIngreso(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}        	
        	if (accion.equals("getPresupuestoIngresoPresi")){
        		List objetos=null;
        		String condicion =" where true ";
        		if (numeroFila != null) condicion += "and numerofila ="+numeroFila;
        		if (nivel != null) condicion += "and Nivel ="+nivel;
        		if (entidad!=null) condicion += " and Entidad="+entidad;
        		if (codDetalle!=null) condicion += " and coddetalle="+codDetalle;
        		if (codOrigen!=null) condicion += " and codorigen="+codOrigen;     
        		if (fuenteFinanc!=null) condicion += " and fuentefinanc="+fuenteFinanc;
        		if (montoProgramado!=null) condicion += " and montoprogramado="+montoProgramado;           		
        		if (anho!=null) condicion += " and anio="+anho;        		        		
        		if (versionReporte!=null) condicion += " and version="+versionReporte;  
        			

				try {objetos = SqlSelects.selectAllPresupuestoIngresoPresi(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getFundamentacion")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				try {objetos = SqlSelects.selectAllFundamentacion(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}
        	
        	if (accion.equals("getAsing")){
        		List objetos=null;
        		String condicion ="";
        		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
				objetos = ClienteProyectoPresupuesto.obtenerProyectoAsignacionFinancieraProductos(2017, 12, 1, 50);
        		JsonElement json = new Gson().toJsonTree(objetos);
        		
        		out.println(json.toString());
        	}
        	if (accion.equals("getAsignacionPresi")){
        		List objetos=null;
        		String condicion =" where true ";

        		if (nivel != null) condicion += "and nivel ="+nivel;
        		if (entidad!=null) condicion += " and entidad="+entidad;
        		if (tipo!=null) condicion += " and tipo="+tipo; 
        		if (programa!=null) condicion += " and programa="+programa;
        		if (subprograma!=null) condicion += " and subprograma="+subprograma;
        		if (proyecto!=null) condicion += " and proyecto="+proyecto;
        		if (producto!=null) condicion += " and producto="+producto;
        		if (anho!=null) condicion += " and anho="+anho;
        		if (versionReporte!=null) condicion += " and version="+versionReporte;  
     		
				try {objetos = SqlSelects.selectAllAsignacionPresi(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		//out.println(json.toString());
        		if(callback != null) {
                    out.println(callback + "(" + json.toString() + ");");
                }else{
                    out.println(json.toString());
                }
        	}  
        	//Obtenemos la ultima versión en el sql esta de forma estatica la version faltaria mejorar el codigo
//        	if (accion.equals("getAsignacionPresiVersion")){
//        		List objetos=null;
//        		String condicion =" where true ";
//        		String condicion2 =" where true ";
//
//        		if (nivel != null) {
//        			condicion += "and nivel ="+nivel;	
//        			condicion2 += "and p.nivel ="+nivel;
//        		}
//        		if (entidad!=null) {
//        			condicion += " and entidad="+entidad;
//        			condicion2 += " and p.entidad="+entidad;
//        		}
//        		if (tipo!=null){
//        			condicion += " and tipo="+tipo;
//        			condicion2 += " and p.tipo="+tipo;
//        		}
//        		if (programa!=null) {
//        			condicion += " and programa="+programa;
//        			condicion2 += " and p.programa="+programa;
//        		}
//        		if (subprograma!=null){
//        			condicion += " and subprograma="+subprograma;
//        			condicion2 += " and p.subprograma="+subprograma;
//        		}
//        		if (proyecto!=null){ 
//        			condicion += " and proyecto="+proyecto;
//        			condicion2 += " and p.proyecto="+proyecto;
//        		}
//        		if (producto!=null){
//        			condicion += " and producto="+producto;
//        			condicion2 += " and p.producto="+producto;
//        		}
//        		if (anho!=null){
//        			condicion += " and anho="+anho;
//        			condicion2 += " and p.anho="+anho;
//
//        		}
//        		if (versionReporte!=null) condicion += " and version="+versionReporte;  
//     		
//				try {
//					objetos = SqlSelects.selectAllAsignacionPresiVersion(condicion, condicion2);
//					}
//				catch (SQLException e) {e.printStackTrace();}
//        		JsonElement json = new Gson().toJsonTree(objetos );
//        		
//        		//out.println(json.toString());
//        		if(callback != null) {
//                    out.println(callback + "(" + json.toString() + ");");
//                }else{
//                    out.println(json.toString());
//                }
//        	}
        	if (accion.equals("getAsignacionPresiVersion")){
        		List objetos=null;
        		//if (nivel == null) nivel = Integer.parseInt(nivelCas);
        		//if (entidad ==null) entidad =  Integer.parseInt(entidadCas);
				objetos = SqlSelects.selectAllAsignacionPresiVersion(anho,nivel,entidad,versionReporte);
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		if(callback != null) {
                    out.println(callback + "(" + json.toString() + ");");
                }else{
                    out.println(json.toString());
                }
        	}      

        	//Obtenemos solo los anhos de getAsignacionPresi
        	if (accion.equals("getAsignacionPresiAnho")){
        		List objetos=null;
        		String condicion =" where true ";
				try {objetos = SqlSelects.selectAllAsignacionPresiAnho(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}   
        	
        	if (accion.equals("getAsignacionPresiAnhoProyecto")){
        		List objetos=null;
        		String condicion =" where true ";
        		if (nivel != null) condicion += "and nivel ="+nivel;
        		if (entidad!=null) condicion += " and entidad="+entidad;
        		if (tipo!=null) condicion += " and tipo="+tipo; 
        		if (programa!=null) condicion += " and programa="+programa;
        		if (subprograma!=null) condicion += " and subprograma="+subprograma;
        		if (proyecto!=null) condicion += " and proyecto="+proyecto;	
				try {objetos = SqlSelects.getAsignacionPresiAnhoProyecto(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}      

        	if (accion.equals("getPresupuestoGastoPresi")){
        		List objetos=null;
        		String condicion =" where true ";
        		if (nivel != null) condicion += "and Nivel ="+nivel;
        		if (entidad!=null) condicion += " and Entidad="+entidad;
        		if (anho!=null) condicion += " and Anho="+anho;
        		if (programa!=null) condicion += " and Programa="+programa;
        		if (subprograma!=null) condicion += " and Subprograma="+subprograma;
        		if (proyecto!=null) condicion += " and Proyecto="+proyecto;
        		if (versionReporte!=null) condicion += " and version="+versionReporte;  
        		if (tipo!=null) condicion += " and Tipo="+tipo;      		

				try {objetos = SqlSelects.selectAllPresupuestoGastoPresi(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		
        		out.println(json.toString());
        	}      
        	if (accion.equals("getProductoTipoN")){
        		List objetos=null;
        		String condicion = "where true ";

        		if (nivel != null) condicion += "and nivel_id = "+nivel;
        		if (entidad!=null) condicion += " and entidad_id = "+entidad;
        		if (tipo!=null) condicion += " and tipo_presupuesto_id = "+tipo; 
        		if (programa!=null) condicion += " and programa_id = "+programa;
        		if (subprograma!=null) condicion += " and subprograma_id = "+subprograma;
        		if (proyecto!=null) condicion += " and proyecto_id = "+proyecto;
        		if (producto!=null) condicion += " and producto_id = "+producto;
        		if (anho!=null) condicion += " and anho = "+anho;
        		
        		try {objetos = SqlSelects.selectAllProductoTipoN(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("productoTipoN", json);
        		//out.println(myObj.toString());return;
        		if(callback != null) {
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	} 
        	
        	if (accion.equals("getProductoUnidadMedida")){
        		List objetos=null;
        		String condicion = "where true ";
        		
        		if (unidadMedidaId != null) condicion += "and unidad_medida_id = "+unidadMedidaId;
        		try {objetos = SqlSelects.selectAllProductoUnidadMedida(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("producto", json);
        		if(callback != null){
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	} 
        	if (accion.equals("getProductoPresupuestoDestinatario")){
        		List objetos=null;
        		String condicion = "where true ";
        		
        		if (nivel != null) condicion += "and nivel = "+nivel;
        		if (entidad != null) condicion += " and entidad = "+entidad;
        		if (tipoPresupuesto != null) condicion += " and tipo_presupuesto = "+tipoPresupuesto;
        		if (programa != null) condicion += " and programa = "+programa;
        		if (subprograma != null) condicion += " and subprograma = "+subprograma;
        		if (proyecto != null) condicion += " and proyecto = "+proyecto;
        		if (producto != null) condicion += " and producto = "+producto;
        		if (deptoPais != null) condicion += " and departamento = "+deptoPais;

        		try {objetos = SqlSelects.selectProductoPresupuestoDestinatario(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("producto", json);
        		if(callback != null){
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}   
        	
        	if (accion.equals("getProductoPresupuestoFinanciero")){
        		List objetos=null;
        		String condicion = " where true ";
        		
        		if (nivel != null) condicion += "and nivel = "+nivel;
        		if (entidad != null) condicion += " and entidad = "+entidad;
        		if (tipoPresupuesto != null) condicion += " and tipo = "+tipoPresupuesto;
        		if (programa != null) condicion += " and programa = "+programa;
        		if (subprograma != null) condicion += " and subprograma = "+subprograma;
        		if (proyecto != null) condicion += " and proyecto = "+proyecto;
        		if (producto != null) condicion += " and producto_id = "+producto;

        		try {objetos = SqlSelects.selectProductoPresupuestoFinanciero(condicion);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("producto", json);
        		if(callback != null){
                    out.println(callback + "(" + myObj.toString() + ");");
                }else{
                    out.println(myObj.toString());return;
                }
        	}     
        	
        }
        if (accion.equals("getPlanPresupuesto")){
    		List objetos=null;
    		String condicion = " where true ";
    		
    		if (nivel != null) condicion += "and nivel = "+nivel;
    		if (entidad != null) condicion += " and entidad = "+entidad;
    		if (tipoPresupuesto != null) condicion += " and tipo_presupuesto = "+tipoPresupuesto;
    		if (programa != null) condicion += " and programa = "+programa;
    		if (subprograma != null) condicion += " and subprograma = "+subprograma;
    		if (proyecto != null) condicion += " and proyecto = "+proyecto;
    		if (producto != null) condicion += " and producto = "+producto;
    		if (deptoPais != null) condicion += " and departamento = "+deptoPais;

    		try {objetos = SqlSelects.selectAllPresupGastos(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		//myObj.addProperty("success", true);
    		//myObj.add("planPresupuesto", json);
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("planPresupuesto", json);
                out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	}         	
        if (accion.equals("getProductoFisico")){
    		List objetos=null;
    		String condicion = " where true ";
    		
    		if (nivel != null) condicion += "and nivel = "+nivel;
    		if (entidad != null) condicion += " and entidad = "+entidad;
    		if (tipoPresupuesto != null) condicion += " and tipo_presupuesto = "+tipoPresupuesto;
    		if (programa != null) condicion += " and programa = "+programa;
    		if (subprograma != null) condicion += " and subprograma = "+subprograma;
    		if (proyecto != null) condicion += " and proyecto = "+proyecto;
    		if (producto != null) condicion += " and producto = "+producto;
    		if (deptoPais != null) condicion += " and departamento = "+deptoPais;

    		try {objetos = SqlSelects.selectAllProductoFisico(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFisico", json);
                out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	}
        if (accion.equals("getProductoFinanciero")){
    		List objetos=null;
    		String condicion = " where true ";
    		
    		if (nivel != null) condicion += "and nivel = "+nivel;
    		if (entidad != null) condicion += " and entidad = "+entidad;
    		if (tipoPresupuesto != null) condicion += " and tipo_presupuesto = "+tipoPresupuesto;
    		if (programa != null) condicion += " and programa = "+programa;
    		if (subprograma != null) condicion += " and subprograma = "+subprograma;
    		if (proyecto != null) condicion += " and proyecto = "+proyecto;
    		if (producto != null) condicion += " and producto = "+producto;
    		if (deptoPais != null) condicion += " and departamento = "+deptoPais;

    		try {objetos = SqlSelects.selectAllProductoFinanciero(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	}
        if (accion.equals("getFuenteVerificacion")){
    		List objetos=null;
    		String condicion = " where true ";

    		try {objetos = SqlSelects.selectAllFuenteVerificacion(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	} 
        if (accion.equals("getTipoIndicador")){
    		List objetos=null;
    		String condicion = " where true ";

    		try {objetos = SqlSelects.selectAllTipoIndicador(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	} 
        if (accion.equals("getCoberturaGeograficaAlcance")){
    		List objetos=null;
    		String condicion = " where true ";

    		try {objetos = SqlSelects.selectAllCoberturaGeograficaAlcance(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	} 
        if (accion.equals("getCoberturaDemograficaAlcance")){
    		List objetos=null;
    		String condicion = " where true ";

    		try {objetos = SqlSelects.selectAllCoberturaDemograficaAlcance(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	} 
        if (accion.equals("getNivelDespliegueGeografico")){
    		List objetos=null;
    		String condicion = " where true ";

    		try {objetos = SqlSelects.selectAllNivelDespliegueGeografico(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
            }else{
                out.println(json);return;
            }
    	}  
        if (accion.equals("getNivelDespliegueDemografico")){
    		List objetos=null;
    		String condicion = " where true ";

    		try {objetos = SqlSelects.selectAllNivelDespliegueDemografico(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		if(callback != null){
    			myObj.addProperty("success", true);
        		myObj.add("productoFinanciero", json);
    			out.println(callback + "(" + myObj.toString() + ");");
    			return;
            }else{
                out.println(json);return;
            }
    	} 
        if (accion.equals("getObjetivo")){
    		List objetos=null;
    		String condicion ="";
    		if (entidad!=null && nivel!=null) condicion = " where entidad_id ="+entidad+" and nivel_id= "+nivel;
			try {objetos = SqlSelects.selectAllTiposObjetivos(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		
    		out.println(json.toString());
    	}
        if (accion.equals("getObjetivoAbreviacion")){
    		String objetos=null;
    		String condicion ="";
    		if (objetivoId != null) condicion += " and id ='"+objetivoId+"'";	
			try {objetos = SqlSelects.selectAllObjetivosAbreviacion(condicion);}
			catch (SQLException e) {e.printStackTrace();}    		
    		
    		out.println(objetos.toString());
    	}
    	if (accion.equals("getObjetivoSugerido")){
    		List objetos=null;
    		String condicion =" where true "; 
    		if (objetivoId != null) condicion += " and objetivo_id ='"+objetivoId+"'";
    		if (tipoObjetivoId != null) condicion += " and objetivo_tipo_objetivo_id ='"+tipoObjetivoId+"'";
    		if (anho != null) condicion += " and objetivo_anho ='"+anho+"'";
    		if (objetivoVersion != null) condicion += " and objetivo_version ='"+objetivoVersion+"'";
    		if (objetivoSugeridoId != null) condicion += " and objetivo_sugerido_id ='"+objetivoSugeridoId+"'";
    		if (objetivoSugeridoTipoId != null) condicion += " and objetivo_sugerido_tipo_id ='"+objetivoSugeridoTipoId+"'";
    		if (objetivoSugeridoAnho != null) condicion += " and objetivo_sugerido_anho ='"+objetivoSugeridoAnho+"'";
    		if (objetivoSugeridoVersion != null) condicion += " and objetivo_sugerido_version ='"+objetivoSugeridoVersion+"'";
    		if (borrado != null) condicion += " and borrado="+borrado;
    		
    		try {objetos = SqlSelects.selectAllObjetivoSugerido(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("sugeridos", json);
    		out.println(myObj.toString());return; 
    	}
    	if (accion.equals("getObjetivoHasObjetivo")){
    		List objetos=null;
    		String condicion =" where true "; 
    		if (objetivoId != null) condicion += " and objetivo_id ='"+objetivoId+"'";
    		if (tipoObjetivoId != null) condicion += " and objetivo_tipo_objetivo_id ='"+tipoObjetivoId+"'";
    		if (anho != null) condicion += " and objetivo_anho ='"+anho+"'";
    		if (objetivoVersion != null) condicion += " and objetivo_version ='"+objetivoVersion+"'";
    		if (objetivoRelId != null) condicion += " and objetivo_rel_id ='"+objetivoRelId+"'";
    		if (objetivoRelTipoObjetivoId != null) condicion += " and objetivo_rel_tipo_objetivo_id ='"+objetivoRelTipoObjetivoId+"'";
    		if (objetivoRelAnho != null) condicion += " and objetivo_rel_anho ='"+objetivoRelAnho+"'";
    		if (objetivoRelVersion != null) condicion += " and objetivo_rel_version ='"+objetivoRelVersion+"'";
    		if (colaboracion != null) condicion += " and colaboracion ='"+colaboracion+"'";
    		if (influencia != null) condicion += " and influencia ='"+influencia+"'";
    		if (nivel != null) condicion += " and nivel ='"+nivel+"'";
    		if (entidad != null) condicion += " and entidad ='"+entidad+"'";
    		if (tipoPresupuesto != null) condicion += " and tipo_presupuesto ='"+tipoPresupuesto+"'";
    		if (programa != null) condicion += " and programa ='"+programa+"'";
    		if (subprograma != null) condicion += " and subprograma ='"+subprograma+"'";
    		if (proyecto != null) condicion += " and proyecto ='"+proyecto+"'";
    		if (producto != null) condicion += " and producto ='"+producto+"'";
    		if (unidadResponsable != null) condicion += " and unidad_responsable ='"+unidadResponsable+"'";
    		if (productoConcat != null) condicion += " and producto_concat ='"+productoConcat+"'";
    		if (borrado != null) condicion += " and borrado='"+borrado+"'";
    		
    		try {objetos = SqlSelects.selectAllObjetivoHasObjetivo(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("objetivos", json);
    		out.println(myObj.toString());return; 
    	}
    	if (accion.equals("getObjetivoHasIndicador")){
    		List objetos=null;
    		String condicion =" where true "; 
    		if (objetivoId != null) condicion += " and objetivo_id ='"+objetivoId+"'";
    		if (tipoObjetivoId != null) condicion += " and objetivo_tipo_objetivo_id ='"+tipoObjetivoId+"'";
    		if (anho != null) condicion += " and objetivo_anho ='"+anho+"'";
    		if (objetivoVersion != null) condicion += " and objetivo_version ='"+objetivoVersion+"'";
    		if (indicadorId != null) condicion += " and indicador_id ='"+indicadorId+"'";
    		if (tipoIndicadorId != null) condicion += " and indicador_tipo_indicador_id ='"+tipoIndicadorId+"'";
    		//if (metodoCalculoId != null) condicion += " and indicador_metodo_calculo_id ='"+metodoCalculoId+"'";
    		if (unidadMedidaId != null) condicion += " and indicador_unidad_medida_id ='"+unidadMedidaId+"'";
    		if (desagregacionTipoZonaGeograficaId != null) condicion += " and indicador_desagregacion_tipo_zona_geografica_id ='"+desagregacionTipoZonaGeograficaId+"'";
    		if (tipoDemograficaId != null) condicion += " and indicador_tipo_demografica_id ='"+tipoDemograficaId+"'";
    		//if (fuenteVerificacionId != null) condicion += " and indicador_fuente_verificacion_id ='"+fuenteVerificacionId+"'"; ya no es utulizado como pk y cambio del int al string
    		if (productoConcat != null) condicion += " and producto_concat ='"+productoConcat+"'";

    		try {objetos = SqlSelects.selectAllObjetivoHasIndicador(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("indicadores", json);
    		out.println(myObj.toString());return; 
    	}
    	/*if (accion.equals("getUltimaActualizacion")){
    		List objetos=null;
    		String condicion =" where true "; 
    		if (objeto != null) {
				if (parametro1 != null) condicion += " and objetivo_tipo_objetivo_id ='" + tipoObjetivoId + "'";
				if (parametro2 != null) condicion += " and objetivo_anho ='" + anho + "'";
				if (parametro3 != null) condicion += " and objetivo_version ='" + objetivoVersion+ "'";
				if (parametro4 != null) condicion += " and objetivo_sugerido_id ='" + objetivoSugeridoId + "'";
				if (parametro5 != null) condicion += " and objetivo_sugerido_id ='" + objetivoSugeridoId + "'";
				objetos = SqlSelects.selectUltimaActualizacion(objeto, condicion);
				JsonElement json = new Gson().toJsonTree(objetos);
				myObj.addProperty("success", true);
				myObj.add("sugeridos", json);
				out.println(myObj.toString());return;
    		}
    	}*/        
    	if (accion.equals("getRol")){
    		List objetos=null;
    		String condicion =" where true "; 

    		try {objetos = SqlSelects.selectAllRole(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString()); 
    	}
    	if (accion.equals("getEtiquetas")){
    		List objetos=null;
    		String condicion = " where true ";
    		if (etiquetaId != null) condicion += " and id ='"+etiquetaId+"'";
    		try {objetos = SqlSelects.selectAllEtiquetas(condicion);}			
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("etiquetas", json);
    		out.println(myObj.toString());return; 
    	} 
    	if (accion.equals("getPresupuestoEtiquetas")){
    		List objetos=null;
    		String condicion = " where true ";
    		if (etiquetaId != null) condicion += " and etiquetas_id ='"+etiquetaId+"'";
    		if (productoId != null) condicion += " and producto_id ='"+productoId+"'";
    		if (proyectoId != null) condicion += " and proyecto_id ='"+proyectoId+"'";
    		if (subprogramaId != null) condicion += " and subprograma_id ='"+subprogramaId+"'";
    		if (programaId != null) condicion += " and programa_id ='"+programaId+"'";
    		if (tipoPresupuestoId != null) condicion += " and tipo_presupuesto_id ='"+tipoPresupuestoId+"'";
    		if (entidadId != null) condicion += " and entidad_id ='"+entidadId+"'";
    		if (nivelId != null) condicion += " and nivel_id ='"+nivelId+"'";
    		
    		try {objetos = SqlSelects.selectAllPresupuestoEtiquetas(condicion);}
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("presupuestoetiquetas", json);
    		out.println(myObj.toString());return; 
    	}
    	if (accion.equals("getTipoDocumento")){
    		List objetos=null;
    		String condicion = " where true ";
    		if (tipo != null) condicion += " and id ='"+tipo+"'";
    		if (borrado != null) condicion += " and borrado is "+borrado;

    		try {objetos = SqlSelects.selectAllTipoDocumento(condicion);}			
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		if(callback != null) {
                out.println(callback + "(" + json.toString() + ");");
            }else{
                out.println(json.toString());return;
            }	
    	}
    	if (accion.equals("getDocumento")){
    		List objetos=null;
    		String condicion = " where true ";
    		if (tipo != null) condicion += " and tipos_id ='"+tipo+"'";
    		if (idDocumento != null) condicion += " and id ='"+idDocumento+"'";

    		try {objetos = SqlSelects.selectAllDocumento(condicion);}			
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		if(callback != null) {
                out.println(callback + "(" + json.toString() + ");");
            }else{
                out.println(json.toString());return;
            }	
    	}
    	if (accion.equals("getMapaDestinatarioPND")){
    		String objetos=null;
    		String condicion = "";
    		if (catalogo_Destinatario != null) condition += " and ppd.catalogo_destinatario ="+catalogo_Destinatario+" ";
    		if (tipoProducto != null) condition += " and p.id ="+tipoProducto+" ";
    		
    		if (estrategia!=0) condition+=" and est.id="+estrategia+" "; 
    		if (linea!=0) condition+=" and lt.id="+linea+" ";
    		if (eje!=0) condition+=" and ee.id="+eje+" ";
			if (unidadResponsable!= null && (unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
    		
    			
        		if (nivel!=null && (nivel!=0)) productoConcat=nivel+"-";
    			if (entidad!=null && ( entidad!=0)) productoConcat+=entidad+"-";
        		if (tipoPrograma!=null) productoConcat+=tipoPrograma+"-";
        		if (programa!=null) productoConcat+=programa+"-";
        		if (subprograma!= null) productoConcat+=subprograma+"-";            		
        		if (proyecto != null) productoConcat+=proyecto+"-";
        		if (producto != null) productoConcat+=producto;
        		if (productoConcat != null) condition+=" and rev.producto_concat like '"+productoConcat+"%'";
        		
    		

    		try {objetos = SqlSelects.selectAllMapaDestinatarioPND(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
    	if (accion.equals("getCatalogoDestinatario")){
    		List objetos=null;
    		String condicion = " where true ";
    		//if (catalogoDestinatario != null) condicion += " and id ='"+catalogoDestinatario+"'";
    		try {objetos = SqlSelects.selectAllCatalogoDestinatario(condicion);}			
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("catalogo_destinatario", json);
    		out.println(myObj.toString());return;
    	}
/***********usado para el selector del mapa de destinatarios************/
    	if (accion.equals("getCatalogoDestinatarioPND")){
    		List objetos=null;
    		String condicion = "";
    		if (unidadResponsable!= null && (unidadResponsable!= -1)) condicion+=" and ur.id="+unidadResponsable+" ";
    		
			
    		if (nivel != null && (nivel!=0)) condicion += "and ppd.nivel = "+nivel;
    		if (entidad != null && ( entidad!=0)) condicion += " and ppd.entidad = "+entidad;
    		if (tipoPresupuesto != null) condicion += " and ppd.tipo_presupuesto = "+tipoPresupuesto;
    		if (programa != null) condicion += " and ppd.programa = "+programa;
    		if (subprograma != null) condicion += " and ppd.subprograma = "+subprograma;
    		if (proyecto != null) condicion += " and ppd.proyecto = "+proyecto;
    		if (producto != null) condicion += " and ppd.producto = "+producto;
    		
    		try {objetos = SqlSelects.selectAllCatalogoDestinatarioPND(condicion);}			
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		myObj.addProperty("success", true);
    		myObj.add("catalogo_destinatario", json);
    		out.println(myObj.toString());return;
    	}
    	if (accion.equals("getModulos")){
    		List objetos=null;
    		String condicion = " where true";
			try {objetos = SqlSelects.selectAllModulo(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString());return;
    	}
// Es un ejemplo no recuerdo bien por que usa este metodo
//    	if (accion.equals("getPermisosPorModulos")){
//    		List objetos=null;
//    		List<Usuario> usuarios= null;
//    		String condicion = " where true ";
//    		if (userCorreo != null) condicion += "and correo ='"+userCorreo+"'";
//    		try {
//    			usuarios = SqlSelects.selectUsuario(condicion);
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
//    		
//    		condicion = "";
//    		condicion += " where true ";
//
//    		if (usuarios.get(0).getId() != 0) condicion += "and usuario_id ='"+usuarios.get(0).getId()+"'";
//			
//    		try {
//				objetos = SqlSelects.selectAllPermisoPorModulo(condicion);
//				//userInfo.setUserPermisos(objetos);
//			}catch (SQLException e) {
//				e.printStackTrace();
//			}
//    		
//    		JsonElement json = new Gson().toJsonTree(objetos );
//    		//out.println(json.toString());return;
//    		if(callback != null) {
//                out.println(callback + "(" + json.toString() + ");");
//            }else{
//                out.println(json.toString());return;
//            }	
//    	}
    	if (accion.equals("getPermisosPorModulos")){
    		List objetos=null;
    		String condicion = " where true ";
    		if (usuarioId != null) condicion += "and usuario_id ='"+usuarioId+"'";	
    		try {
				objetos = SqlSelects.selectAllPermisoPorModulo(condicion);
				//userInfo.setUserPermisos(objetos);
			}catch (SQLException e) {
				e.printStackTrace();
			}
    		
    		JsonElement json = new Gson().toJsonTree(objetos );
    		//out.println(json.toString());return;
    		if(callback != null) {
                out.println(callback + "(" + json.toString() + ");");
            }else{
                out.println(json.toString());return;
            }	
    	}

    	if (accion.equals("getJustificacion")){
    		List objetos=null;
    		String condicion = " where true ";
    						
    		if (nivel != null && (nivel!=0)) condicion += "and nivel = "+nivel;
    		if (entidad != null && ( entidad!=0)) condicion += " and entidad = "+entidad;
    		if (unidadResponsable!= null && (unidadResponsable!= -1)) condicion+=" and ur.id="+unidadResponsable+" ";
    		if (tipoPresupuesto != null) condicion += " and tipoprograma = "+tipoPresupuesto;
    		if (programa != null) condicion += " and programa = "+programa;
    		if (subprograma != null) condicion += " and subprograma = "+subprograma;
    		if (proyecto != null) condicion += " and proyecto = "+proyecto;
    		if (producto != null) condicion += " and producto = "+producto;	
    		
    		if (anho != null) condicion += " and anho ='"+anho+"'";
    		if (version != null) condicion += " and version ='"+version+"'";
    		
    		try {
    			objetos = SqlSelects.selectAllJustificacion(condicion);
    		}catch (SQLException e) {
    			e.printStackTrace();
    		}
    		
    		JsonElement json = new Gson().toJsonTree(objetos );
    		if(callback != null) {
                out.println(callback + "(" + json.toString() + ");");
            }else{
                out.println(json.toString());return;
            }	
    	}
    	if (accion.equals("getDictamenSTP")){
    		List objetos=null;
    		String condicion = " where true ";
    						
    		if (justificacionId != null) condicion += "and justificacion_id = "+justificacionId;
    		if (dictamenId != null) condicion += "and id = "+dictamenId;
    		if (nivel != null && (nivel!=0)) condicion += "and nivel = "+nivel;
    		if (entidad != null && ( entidad!=0)) condicion += " and entidad = "+entidad;
    		//if (unidadResponsable!= null && (unidadResponsable!= -1)) condicion+=" and ur.id="+unidadResponsable+" ";
    		if (tipoPresupuesto != null) condicion += " and tipoprograma = "+tipoPresupuesto;
    		if (programa != null) condicion += " and programa = "+programa;
    		if (subprograma != null) condicion += " and subprograma = "+subprograma;
    		if (proyecto != null) condicion += " and proyecto = "+proyecto;
    		if (producto != null) condicion += " and producto = "+producto;
    		
    		if (anho != null) condicion += " and anho ='"+anho+"'";
    		if (version != null) condicion += " and version ='"+version+"'";
    		
    		try {
    			objetos = SqlSelects.selectAllDictamenSTP(condicion);
    		}catch (SQLException e) {
    			e.printStackTrace();
    		}
    		
    		JsonElement json = new Gson().toJsonTree(objetos );
    		if(callback != null) {
                out.println(callback + "(" + json.toString() + ");");
            }else{
                out.println(json.toString());return;
            }	
    	}
    	if (accion.equals("getPermisoModulo")){
    		List objetos=null;
    		String condicion = " where true";
			try {objetos = SqlSelects.selectAllPermisoModulo(condicion);}
			catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString());return;
    	}
/*******Pivot Perfil Institucional*****/
    	if (accion.equals("getPivotPerfilInstitucional")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllPivotPerfilInstitucional(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
/*******Pivot Indicadores*****/
    	if (accion.equals("getPivotIndicadores")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllPivotIndicadores(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
/*******Pivot Destinatarios Productos*****/
    	if (accion.equals("getPivotDestinatariosProductos")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllPivotDestinatariosProductos(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
/*******Pivot Cadena Valor*****/
    	if (accion.equals("getPivotCadenaValor")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllPivotCadenaValor(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
/*******Pivot Estructura Programatica*****/
    	if (accion.equals("getPivotEstructuraProgramatica")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllPivotEstructuraProgramatica(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
/*******Pivot Metas de Productos*****/
    	if (accion.equals("getPivotMetaProducto")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllPivotMetaProducto(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
/*======Cadena de Valor======*/    	
    	if (accion.equals("getCadenaValor")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllCadenaValor(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
        /*******Producto fisico*****/
    	if (accion.equals("getPivotProductoFisico")){
    		List objetos=null;
    		objetos = SqlSelects.selectProductoFisico(anho,nivel,entidad,tipoPresupuesto,programa,subprograma,proyecto);
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString());return;
    		//out.println(objetos);return;
    	}
    	if (accion.equals("getFuenteFinanciamiento")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllFuenteFinanciamineto(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
    	if (accion.equals("getOrganismoFinanciador")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllOrganismoFinanciador(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
    	if (accion.equals("getObjetoGasto")){
    		String objetos=null;
    		condition= " where true ";
			try {objetos = SqlSelects.selectAllObjetoGasto(condition);}
			catch (SQLException e) {e.printStackTrace();}      		
    		out.println(objetos);return;
    	}
    	//Consulta a la base de datos tablero
    	if (accion.equals("getPeriodo")){
    		List objetos=null; 
    		condition = " where true ";
    		if (periodoId!=null) condition += " and id ='"+periodoId+"'"; 
       		try {objetos = SqlSelects.selectPeriodo(condition);}
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString());
    	} 
    	if (accion.equals("getVersion")){
    		List objetos=null; 
    		condition = " where true ";
    		if (anho!=null) condition += " and anho ="+anho; 
    		if (versionId!=null) condition += " and nro ='"+versionId+"'"; 
       		try {objetos = SqlSelects.selectVersion(condition);}
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString());
    	}   	
    	//Estado de peticion de publicaciones
    	if (accion.equals("getEstadoPeticion")){
    		List objetos=null; 
    		condition = " where true ";
    		/*if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
				condition += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
	    		if ( !userUnrId.equals("0") ){
	    			condition+= " and unidad_responsable_id="+userUnrId;
	    		}
			};*/
       		try {objetos = SqlSelects.selectEstadoPeticion(condition);}
    		catch (SQLException e) {e.printStackTrace();}
    		JsonElement json = new Gson().toJsonTree(objetos );
    		out.println(json.toString());
    	}
    	out.close();
 
    }    
//    public List<PermisoPorModulo> getPermisosPorModulos(AttributePrincipal user) {
//    
//    	String userCorreo = user.getName();
//    	
//		List<Usuario> usuarios= null;
//		List<PermisoPorModulo> permisos= null;
//		String condicion = " where true ";
//		if (userCorreo != null) condicion += "and correo ='"+userCorreo+"'";
//		try {
//			usuarios = SqlSelects.selectUsuario(condicion);
//			if (usuarios.get(0).getId() != 0) condicion = "where usuario_id ='"+usuarios.get(0).getId()+"'";
//			permisos = SqlSelects.selectAllPermisoPorModulo(condicion);
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		}
//		return permisos;
//	}
    
}
