package py.gov.stp.mh.tools;


import py.gov.stp.mh.clasificadores.*;
import py.gov.stp.mh.consultas.*;
import py.gov.stp.mh.test.*;

import java.io.IOException;
import java.io.PrintWriter;
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
 

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ajaxHelper extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    	
    	String accion = request.getParameter("accion");
    	Integer nivel = null;
    	Integer entidad = null;
    	Integer tipoPresupuesto = null;
    	Integer unidadResponsable = null;
    	Integer programa = null;
    	Integer subprograma = null;
    	Integer proyecto = null;
    	Integer producto = null;
    	Integer unidadJerarquica = null;
    	Integer anio = null;
    	Integer pais = null;
    	Integer departamento = null;
    	Integer version = null;
    	if (request.getParameter("nivel")!=null) nivel = Integer.parseInt(request.getParameter("nivel"));
    	if (request.getParameter("tipoPresupuesto")!=null) tipoPresupuesto = Integer.parseInt(request.getParameter("tipoPresupuesto"));
    	if (request.getParameter("entidad")!=null) entidad = Integer.parseInt(request.getParameter("entidad"));
    	if (request.getParameter("unidadResponsable")!=null) unidadResponsable = Integer.parseInt(request.getParameter("unidadResponsable"));
    	if (request.getParameter("programa")!=null) programa = Integer.parseInt(request.getParameter("programa"));
    	if (request.getParameter("subprograma")!=null) subprograma = Integer.parseInt(request.getParameter("subprograma"));
    	if (request.getParameter("proyecto")!=null) proyecto = Integer.parseInt(request.getParameter("proyecto"));
    	if (request.getParameter("producto")!=null) producto = Integer.parseInt(request.getParameter("producto"));
    	if (request.getParameter("unidadJerarquica")!=null) producto = Integer.parseInt(request.getParameter("unidadJerarquica"));
    	if (request.getParameter("pais")!=null) pais = Integer.parseInt(request.getParameter("pais")); else pais=0;
    	if (request.getParameter("anio")!=null) anio = Integer.parseInt(request.getParameter("anio")); else anio=2017;
    	if (request.getParameter("departamento")!=null) departamento = Integer.parseInt(request.getParameter("departamento")); else departamento=0;
    	if (request.getParameter("version")!=null) version = Integer.parseInt(request.getParameter("version")); else version=50;
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
 
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        
        Gson gson = new Gson(); 
        JsonObject myObj = new JsonObject();
 
        
        if (accion!=null && accion!=""){
        	if (accion.equals("getNiveles")){
        		List niveles = Client.getNiveles(anio);
        		JsonElement json = new Gson().toJsonTree(niveles );
        		Iterator<Nivel> iterador = niveles.iterator(); iterador.hasNext();
        		if(iterador.next().getNombreNivel()==null){
        			myObj.addProperty("success", false);
        		}else{
        			myObj.addProperty("success", true);
        		}
        		myObj.add("niveles", json);
        		out.println(myObj.toString());
        		
        	}
        	if (accion.equals("getDepartamentos")){/*no funciona*/
        		List departamentos = Client.getDepartamentos(pais, anio);
        		JsonElement json = new Gson().toJsonTree(departamentos );
        		myObj.addProperty("success", true);
        		myObj.add("departamentos", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getObjetosDeGasto")){
        		List objetosDeGasto = Client.getObjetosDeGasto(anio);
        		JsonElement json = new Gson().toJsonTree(objetosDeGasto);
        		myObj.addProperty("success", true);
        		myObj.add("objetosDeGasto", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getOrganismosFinanciadores")){
        		List organismosFinanciadores = Client.getOrganismosFinanciadores(anio);
        		JsonElement json = new Gson().toJsonTree(organismosFinanciadores);
        		myObj.addProperty("success", true);
        		myObj.add("organismosFinanciadores", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getEntidadesPorNivel")){
        		List entidades = Client.getEntidadesPorNivel(nivel,anio);
        		JsonElement json = new Gson().toJsonTree(entidades );
        		myObj.addProperty("success", true);
        		myObj.add("entidades", json);
         		//SqlHelper.main();
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getTiposPrograma")){
        		List tiposPrograma = Client.getTiposPrograma(anio);
        		JsonElement json = new Gson().toJsonTree(tiposPrograma);
        		myObj.addProperty("success", true);
        		myObj.add("tiposPrograma", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getUnidadesJerarquicas")){
        		List unidadesJerarquicas = Client.getUnidadesJerarquicas(anio, nivel, entidad);
        		JsonElement json = new Gson().toJsonTree(unidadesJerarquicas);
        		myObj.addProperty("success", true);
        		myObj.add("unidadesJerarquicas", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getProgramas")){
        		List programas = Client.getProgramas(anio, nivel, entidad, tipoPresupuesto);
        		JsonElement json = new Gson().toJsonTree(programas);
        		myObj.addProperty("success", true);
        		myObj.add("programas", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("countProgramas")){
        		List programas = Client.getProgramas(anio, nivel, entidad, tipoPresupuesto);
        		JsonElement json = new Gson().toJsonTree(programas.size());
        		myObj.add("programas", json);
        		out.println(myObj.toString());
        	}
        		
        	
        	if (accion.equals("getSubprogramas")){
        		List subprogramas = Client.getSubprogramas(anio, nivel, entidad, tipoPresupuesto, programa);
        		JsonElement json = new Gson().toJsonTree(subprogramas);
        		myObj.addProperty("success", true);
        		myObj.add("subprogramas", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("countSubprogramas")){
        		List subprogramas = Client.getSubprogramas(anio, nivel, entidad, tipoPresupuesto, programa);
        		JsonElement json = new Gson().toJsonTree(subprogramas.size());
        		myObj.add("subprogramas", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getProyectos")){
        		List proyectos = Client.getProyectos(anio, nivel, entidad, tipoPresupuesto, programa, subprograma);
        		JsonElement json = new Gson().toJsonTree(proyectos);
        		myObj.addProperty("success", true);
        		myObj.add("proyectos", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("countProyectos")){
        		List proyectos = Client.getProyectos(anio, nivel, entidad, tipoPresupuesto, programa, subprograma);
        		proyectos.size();
        		JsonElement json = new Gson().toJsonTree(proyectos.size());
        		myObj.add("proyectos", json);
        		out.println(myObj.toString());
        	}
        	/*if (accion.equals("getProductos")){
        		List productos = Client.getProductos(anio, nivel, entidad, tipoPresupuesto);
        		JsonElement json = new Gson().toJsonTree(productos);
        		Iterator<Producto> iterador = productos.iterator(); iterador.hasNext();
        		if(iterador.next().getDescripcion()==null){
        			myObj.addProperty("success", false);
        		}else{
        			myObj.addProperty("success", true);
        		}
        		myObj.add("productos", json);
        		out.println(myObj.toString());
        	}
        	*/
        	/*
        	if (accion.equals("countProductos")){
        		List productos = Client.getProductos(anio, nivel, entidad, tipoPresupuesto);
        		productos.size();
        		JsonElement json = new Gson().toJsonTree(productos.size());
        		myObj.add("productos", json);
        		out.println(myObj.toString());
        	}
        	*/
        	if (accion.equals("getCatalgoDncp")){
        		List catalogosDNC = Client.getCatalgoDncp(anio);
        		JsonElement json = new Gson().toJsonTree(catalogosDNC);
        		myObj.addProperty("success", true);
        		myObj.add("getCatalgoDncp", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getCatalogosProductoMetas")){
        		List catalogosProductoMetas = Client.getCatalogosProductoMetas(2016);
        		JsonElement json = new Gson().toJsonTree(catalogosProductoMetas);
        		myObj.addProperty("success", true);
        		myObj.add("catalogosProductoMetas", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getEjesPorPlan")){
        		List ejesPorPlan = Client.getEjesPorPlans();
        		JsonElement json = new Gson().toJsonTree(ejesPorPlan);
        		myObj.addProperty("success", true);
        		myObj.add("ejesPorPlan", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getFuncionales")){
        		List funcionales = Client.getFuncionales(anio);
        		JsonElement json = new Gson().toJsonTree(funcionales);
        		myObj.addProperty("success", true);
        		myObj.add("funcionales", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getPilares")){
        		List pilares = Client.getPilares();
        		JsonElement json = new Gson().toJsonTree(pilares);
        		myObj.addProperty("success", true);
        		myObj.add("pilares", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getPlanes")){
        		List planes = Client.getPlanes();
        		JsonElement json = new Gson().toJsonTree(planes);
	        	myObj.addProperty("success", true);
        		myObj.add("pilares", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getProyectoSNIP")){
        		List proyectoSNIP = Client.getProyectosSNIP();
        		JsonElement json = new Gson().toJsonTree(proyectoSNIP);
	        	myObj.addProperty("success", true);
        		myObj.add("proyectoSNIP", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getProyectoSNIPAutorizado")){
        		List proyectoSNIP = Client.getProyectoSNIPPAutorizado(anio);
        		JsonElement json = new Gson().toJsonTree(proyectoSNIP);
	        	myObj.addProperty("success", true);
        		myObj.add("proyectoSNIPautorizado", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getFuentesDeFinanciamiento")){
        		List fuenteDeFinanciamiento = Client.getFuentesDeFinanciamiento(anio);
        		JsonElement json = new Gson().toJsonTree(fuenteDeFinanciamiento);
        	    myObj.addProperty("success", true);
        		myObj.add("fuenteDeFinanciamiento", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getUnidadesResponsables")){
        		List unidadesResponsables = Client.getUnidadesResponsables(anio);
        		JsonElement json = new Gson().toJsonTree(unidadesResponsables);
        	    myObj.addProperty("success", true);
        		myObj.add("unidadesResponsables", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("getUnidadesDeMedida")){
        		List unidadesResponsables = Client.getUnidadesDeMedida();
        		JsonElement json = new Gson().toJsonTree(unidadesResponsables);
        	    myObj.addProperty("success", true);
        		myObj.add("unidadesResponsables", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("todosLosProductosPorAnio")){
        		List todosLosProductosPorAnio = Client.todosLosProductosPorAnio(anio, version);
        		JsonElement json = new Gson().toJsonTree(todosLosProductosPorAnio);
        	    myObj.addProperty("success", true);
        		myObj.add("todosLosProductosPorAnio", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("todosLosProyectosPorAnio")){
        		List todosLosProyectosPorAnio = Client.todosLosProyectosPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todosLosProyectosPorAnio);
        	    myObj.addProperty("success", true);
        		myObj.add("todosLosProyectosPorAnio", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("todosLosSubprogramasPorAnio")){
        		List todosLosSubprogramasPorAnio = Client.todosLosSubprogramasPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todosLosSubprogramasPorAnio);
        	    myObj.addProperty("success", true);
        		myObj.add("todosLosSubprogramasPorAnio", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("todosLosProgramasPorAnio")){
        		List todosLosProgramasPorAnio = Client.todosLosProgramasPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todosLosProgramasPorAnio);
        	    myObj.addProperty("success", true);
        		myObj.add("todosLosProgramasPorAnio", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("todasLasEntidadesPorAnio")){
        		List todasLasEntidadesPorAnio = Client.todasLasEntidadesPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todasLasEntidadesPorAnio);
        	    myObj.addProperty("success", true);
        		myObj.add("todasLasEntidadesPorAnio", json);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("todasLasEntidadesPorAnioPt")){
        		List todasLasEntidadesPorAnio = Client.todosLosProgramasPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todasLasEntidadesPorAnio);
        		out.println(json.toString());
        	}
        	if (accion.equals("todosLosProgramasPorAnioPt")){
        		List todosLosProgramasPorAnio = Client.todosLosProgramasPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todosLosProgramasPorAnio);
        		out.println(json.toString());
        	}
        	if (accion.equals("todosLosSubprogramasPorAnioPt")){
        		List todosLosSubprogramasPorAnio = Client.todosLosSubprogramasPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todosLosSubprogramasPorAnio);
        		out.println(json.toString());
        	}
        	if (accion.equals("todosLosProyectosPorAnioPt")){
        		List todosLosProyectosPorAnio = Client.todosLosProyectosPorAnio(anio);
        		JsonElement json = new Gson().toJsonTree(todosLosProyectosPorAnio);
        		out.println(json.toString());
        	}
        	if (accion.equals("todosLosProductosPorAnioPt")){
        		List todosLosProductosPorAnio = Client.todosLosProductosPorAnio(anio,version);
        		JsonElement json = new Gson().toJsonTree(todosLosProductosPorAnio);
        		out.println(json.toString());
        	}
        	
        }
        out.close();
    }
}
