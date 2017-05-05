package py.gov.stp.mh.test;

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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.datatype.DatatypeConfigurationException;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

public class ajaxSelectsHacienda  extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String accion = request.getParameter("accion");
		Integer anho=null; 
		Integer version=null;
		Integer pais=null;
		
		if (request.getParameter("anho")!=null) anho = Integer.parseInt(request.getParameter("anho")); else anho=0;
		if (request.getParameter("version")!=null) version = Integer.parseInt(request.getParameter("version")); else version=0;
		if (request.getParameter("pais")!=null) pais = Integer.parseInt(request.getParameter("pais")); else pais=1;
    	
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
	     
	    Gson gson = new Gson(); 
	    JsonObject myObj = new JsonObject();
	    String callback = request.getParameter("callback");
	
	     
	    if (accion!=null && accion!=""){
	    	if (accion.equals("getUnidadMedida")){
	    		List objetos = Client.getUnidadesDeMedida();
	    		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("unidad_medida", json);
        		out.println(myObj.toString());
	     	}
	     }
    	
    }
}
