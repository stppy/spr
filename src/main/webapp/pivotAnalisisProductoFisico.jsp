<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
	  	<!--  ISO-8859-1 -->
	  	<%@ include file="/frames/head.jsp" %>
		<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->



		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Pivot Table - SPR</title>
        <link rel="stylesheet" type="text/css" href="tablero_files/pivot.css">
        <script type="text/javascript" src="tablero_files/d3.js"></script>
        <script type="text/javascript" src="tablero_files/jsapi"></script>
        <script type="text/javascript" src="tablero_files/jquery-1.js"></script>
        <script type="text/javascript" src="tablero_files/jquery-ui-1.js"></script>
        <script type="text/javascript" src="tablero_files/pivot.js"></script>
        <script type="text/javascript" src="tablero_files/gchart_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/d3_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/export_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/jquery.js"></script>
        <style>
            * {font-family: Verdana;}
            .node {
              border: solid 1px white;
              font: 10px sans-serif;
              line-height: 12px;
              overflow: hidden;
              position: absolute;
              text-indent: 2px;
            }
        </style>
	    <link type="text/css" rel="stylesheet" href="tablero_files/orgchart.css">
	    <link type="text/css" rel="stylesheet" href="tablero_files/annotatedtimeline.css">
	    <link type="text/css" rel="stylesheet" href="tablero_files/imagesparkline.css">
	    <link type="text/css" rel="stylesheet" href="tablero_files/tooltip.css">
	</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>

  <!-- piwik -->
  <script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.spr.stp.gov.py"]);
  _paq.push(["setDomains", ["*.spr.stp.gov.py"]]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 4]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- /piwik -->


<style>
textarea { text-transform: uppercase; }
</style>
    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="/frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
  			 <%@ include file="/frames/main-sidebar.jsp" %>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <small>
            <!--  Titulo, donde antes estaba dashboard -->
            </small>
          </h1>
         
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
	          <!-- Info row de buscador de productos -->

	         <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	              Análisis de Metas Físicas de Productos (Hacienda)
	              </h3> 
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" style="overflow: auto; display: block;">
	            
	            <div class="container">
								<div class="row">
									<div class="row">
										<div class="col-md-3">
											<select class="form-control" id="selectorDeNivel">
												<option value='0' selected>Nivel</option>
											</select> 
										</div>
										<div class="col-md-3">
											<select class="form-control" id="selectorDeEntidad">
												<option value='0-0' selected>Entidad</option>
											</select> 
										</div>										
										<div class="col-md-3">
											<select class="form-control" id="selectorDeTipoPresupuesto">
												<option value='' selected>Tipo de Programa</option>
											</select> 
										</div>										
									</div>
									<div class="row">
										<div class="col-md-3">
											<select class="form-control" id="selectorDePrograma">
												<option value='' selected>Programa</option>
											</select> 
										</div>										
										<div class="col-md-3">
											<select class="form-control" id="selectorDeSubPrograma">
												<option value='' selected>Sub Programa</option>
											</select> 
										</div>
										<div class="col-md-3">
											<select class="form-control" id="selectorDeProyecto">
												<option value='' selected>Proyecto</option>
											</select> 
										</div>								
									</div>
									<div class="row">										
										<div class="col-md-3">
											<button type="button" class="btn btn-box btn-primary" id="generarPivot"><p align="center">Generar Pivot</p></button>
										</div>										
									</div>
								</div><!-- fin row de selectores -->
							</div><!-- fin container de selectores -->
	            
	          <table class="table table-striped table-bordered table-hover">
	            	<tr>	  					
	  					<td>
							<input type="button" name="btn1" id="btn1" value="Ocultar Columnas">
		<script src="tablero_files/a" type="text/javascript"></script>
		<link href="tablero_files/uientableencharteditoren.css" type="text/css" rel="stylesheet">
		<script src="tablero_files/formatendefaultenuientableenorgchartenmotionchartengaugeenann.js" type="text/javascript"></script>
		<script type="text/javascript">
		$( document ).ready(function() {
			
			inicializar=true;
			$("#output").html("");
			
			function modalError(mensaje, exito) {
				var exito_error="";
				if(exito==true){
					exito_error="modal-body alert-success";
				}else{
					if(exito==false){
						exito_error="modal-body alert-danger";
					}
				}
				var ModalError = '    <div id="modalMensajeError" class="modal fade">'+
			    '        <div class="modal-dialog">'+
			 '            <div class="modal-content">'+
			 '                 <div class="'+exito_error+'">'+                         
			 '                        <h3 class="text-center">'+mensaje+'</h3>'+ 
			 '                </div>'+ 
			 '            </div> '+
			 '        </div>'+
			 '    </div>';
			$("body").append(ModalError);
			$('#modalMensajeError').on('show.bs.modal', function (){
			    var myModal = $(this);
			    clearTimeout(myModal.data('hideInterval'));
			    myModal.data('hideInterval', setTimeout(function(){
			        myModal.modal('hide');
			    }, 1800));
			}).modal('show')
			//$('#modalMensajeError').modal('show');
			}
			
			$("body").on("click", "#generarPivot",function(event){	
				$("#output").html("");
				var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
				var productoConcat = $("#selectorDeProyecto option:selected").val();
				productoConcat=productoConcat.split("-");				
				var nivel = productoConcat[0];
				var entidad = productoConcat[1];
				var tipoPrograma = productoConcat[2];
				var programa = productoConcat[3];
				var subPrograma = productoConcat[4];
				var proyecto = productoConcat[5];
				
				if(productoConcat=="" || productoConcat == undefined || proyecto == undefined || proyecto ==""){
					alert("Debe ingresar todos los datos de la estructura y el año");
					//modalError("Debe ingresar todos los datos de la estructura y el año",false);					
				}else{
					iniciarPivot(periodoSeleccionado,inicializar, nivel, entidad, tipoPrograma, programa, subPrograma, proyecto);	
				}
								
			});
			
			var anho = 2017;
			var version = 2;

			var entidad=0; var nivel=0; var tipoPrograma=0; var programa=0; var subprograma=0; var proyecto=-1; var producto=0; var unidad_responsable=0; 


			/**********selector de niveles***********/
			var datosNiveles = $.ajax({
				url:'/ajaxSelects?accion=getNiveles'+'&borrado=false',
				type:'get',
				dataType:'json',
				async:false       
			}).responseText;
			datosNiveles = JSON.parse(datosNiveles);
			datosNiveles = datosNiveles.niveles;

			var optionPNDnivel="<option value='0' selected>Nivel</option>";

			for(var a = 0; a < datosNiveles.length; a++){
				if (datosNiveles[a].nivel != 1){
					optionPNDnivel+='<option value="'+datosNiveles[a].nivel+'" >'+datosNiveles[a].nivel+' - '+datosNiveles[a].nombreNivel+'</option>';
				}
			}
			$("#selectorDeNivel").html(optionPNDnivel);
			
			//-------------change de nivel-------------//
			$("body").on("change", "#selectorDeNivel",function(event){
				var parametros = $("#selectorDeNivel option:selected").val();
			    var idParsed = parametros.split("-"); 
			    nivel = idParsed[0];
			    var optionPNDentidad="";
			    
			    //limpieza de los selectores dependientes, variables y la matriz
			    $("#selectorDeEntidad").html("<option value='' selected >Entidad</option>");
			    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
		    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
		    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
		      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
		    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");    	
		    	entidad=0; tipoPrograma=0; programa=0; subprograma=0; proyecto=-1; producto=0;
		    	vaciarMatriz();
			    
			    if (parametros != "0"){
				
				    /**********selector de entidades***********/
					var pndNivelEntidad = $.ajax({
						url:'/ajaxSelects?accion=getPNDne&nivel='+nivel, //no requiere parametro de borrado pues la vista ya filtra los borrados.
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;
					pndNivelEntidad = JSON.parse(pndNivelEntidad);
					
					if (pndNivelEntidad != null){
						var optionPNDentidad="<option value='0-0' selected >Entidad</option>";
						for(var e = 0; e < pndNivelEntidad.length; e++){
							optionPNDentidad+='<option value="'+pndNivelEntidad[e].nivel_id+'-'+pndNivelEntidad[e].id+'" >'+pndNivelEntidad[e].id+' - '+pndNivelEntidad[e].nombre+'</option>';
						}
						$("#selectorDeEntidad").html(optionPNDentidad);
					}else{
						var optionPNDentidad="<option value=''>No posee entidades</option>";
						$("#selectorDeEntidad").html(optionPNDentidad);
					}
			    } else {	    	
			    	//Obtiene los totales a nivel pais si se deselecciona un nivel.
			    	nivel=0;
			    	
			    	
					vaciarMatriz();
			    }
					    
			});
			
			
			
			//-------------change de entidad-------------//
			$("body").on("change", "#selectorDeEntidad",function(event){
				var parametros = $("#selectorDeEntidad option:selected").val();
			    var idParsed = parametros.split("-"); 
			    nivel = idParsed[0];
			    entidad = idParsed[1];
			    var optionPNDtipoPrograma = "";
			    
			    //limpieza de los selectores dependientes y la matriz
			    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
		    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
		    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
		      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
		    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
		    	tipoPrograma=0; programa=0; subprograma=0; proyecto=-1; producto=0; 
			    
			    if (parametros != "0-0"){
			    	
					
					//falta actualizar el modal
					vaciarMatriz();		
				
					/**********selector de tipo programa***********/
				    var tiposPrograma = $.ajax({
				    	url:'/ajaxSelects?accion=getTiposPrograma'+'&borrado=false',
				    	type:'get',
				    	dataType:'json',
				    	async:false       
				    }).responseText;
				    tiposPrograma = JSON.parse(tiposPrograma);
				    tiposPrograma = tiposPrograma.tiposPrograma;
				    
				    if (tiposPrograma != null){
				    	var optionPNDtipoPrograma='<option value="'+nivel+'-'+entidad+'" selected >Tipo de Programa</option>';
				    	for(var o = 0; o < tiposPrograma.length; o++){
				    		optionPNDtipoPrograma+='<option value="'+nivel+'-'+entidad+'-'+tiposPrograma[o].numeroFila+'" >'+tiposPrograma[o].numeroFila+' - '+tiposPrograma[o].nombreTipoPrograma+'</option>';
				    	}
				    	$("#selectorDeTipoPresupuesto").html(optionPNDtipoPrograma);
				    }else{
				    	var optionPNDtipoPrograma="<option value=''>No existe tipo</option>";
				    	$("#selectorDeTipoPresupuesto").html(optionPNDtipoPrograma);
				    }
				} else {	    		    		    		    	
					entidad=0;
						    	
			    	
					vaciarMatriz();
			    }
			});
			
		    //-------------change de tipo programa-------------//
			$("body").on("change", "#selectorDeTipoPresupuesto",function(event){
				var parametros = $("#selectorDeTipoPresupuesto option:selected").val();
			    var idParsed = parametros.split("-"); 
			    nivel = idParsed[0];
			    entidad = idParsed[1];
			    tipoPrograma = idParsed[2];
			    var optionPNDprograma ="";
			    
			    //limpieza de los selectores dependientes y la matriz
			    $("#selectorDePrograma").html("<option value='' selected>Programa</option>");
		    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
		      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
		    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
		    	programa=0; subprograma=0; proyecto=-1; producto=0; 
			    
			    if (tipoPrograma != undefined){
				    
					
					//falta actualizar el modal
					vaciarMatriz();
					
					/**********selector de programa***********/
					var datosProgramas = $.ajax({
				    	url:'/ajaxSelects?accion=getProgramasPND&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&borrado=false',
				      	type:'get',
				      	dataType:'json',
				      	async:false       
				    }).responseText;
				    datosProgramas = JSON.parse(datosProgramas);
				    datosProgramas = datosProgramas.programas;
			    		
			    	if (datosProgramas != null){
				    	var optionPNDprograma='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'" selected >Programa</option>';
				    	for(var u = 0; u < datosProgramas.length; u++){
				    		optionPNDprograma+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+datosProgramas[u].codigoPrograma+'" >'+datosProgramas[u].codigoPrograma+' - '+datosProgramas[u].nombrePrograma+'</option>';
				    	}
				    	$("#selectorDePrograma").html(optionPNDprograma);
				    }else{
				    	var optionPNDprograma="<option value=''>No posee programas</option>";
				    	$("#selectorDePrograma").html(optionPNDprograma);
				    }
				} else {		
					tipoPrograma=0;
			    	
					
					vaciarMatriz();
				}
			    
			});
			
			
		    
		    //-------------change de programa-------------//
			$("body").on("change", "#selectorDePrograma",function(event){
				var parametros = $("#selectorDePrograma option:selected").val();
			    var idParsed = parametros.split("-"); 
			    nivel = idParsed[0];
			    entidad = idParsed[1];
			    tipoPrograma = idParsed[2];
			    programa = idParsed[3];
			    var optionPNDsubprograma="";
			    
			    //limpieza de los selectores dependientes y la matriz
			    $("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
		      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
		    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
		    	subprograma=0; proyecto=-1; producto=0; 
			    
			    if (programa != undefined){
			    
				    
					
					//falta actualizar el modal
					vaciarMatriz();
					
					/**********selector de sub programa***********/
					var datosSubProgramas = $.ajax({
				    	url:'/ajaxSelects?accion=getSubprogramasPND&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&borrado=false',
				      	type:'get',
				      	dataType:'json',
				      	async:false       
				    }).responseText;
			
				    datosSubProgramas = JSON.parse(datosSubProgramas);
				    datosSubProgramas = datosSubProgramas.subprogramas;
			    
			    	if (datosSubProgramas != null){
				    	var optionPNDsubprograma='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'" selected >Sub Programa</option>';
				    	for(var u = 0; u < datosSubProgramas.length; u++){
				    		optionPNDsubprograma+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+datosSubProgramas[u].id+'" >'+datosSubProgramas[u].id+' - '+datosSubProgramas[u].nombre+'</option>';
				    	}
				    	$("#selectorDeSubPrograma").html(optionPNDsubprograma);
				    }else{
				    	var optionPNDsubprograma="<option value=''>No posee sub programas</option>";
				    	$("#selectorDeSubPrograma").html(optionPNDsubprograma);
				    }
				} else {			
					programa=0;
			    	
					
					vaciarMatriz();
				}
			});
			
			
		    
		    //-------------change de sub programa-------------//
		    $("body").on("change", "#selectorDeSubPrograma",function(event){
				var parametros = $("#selectorDeSubPrograma option:selected").val();
			    var idParsed = parametros.split("-");  
			    nivel = idParsed[0];
			    entidad = idParsed[1];
			    tipoPrograma = idParsed[2];
			    programa = idParsed[3];
			    subprograma = idParsed[4];
			    var optionPNDproyecto="";
			    
			    //limpieza de los selectores dependientes y la matriz
			    $("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
		    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
		    	proyecto=-1; producto=0; 
			    
			    if (subprograma != undefined){
			    	
					
					//falta actualizar el modal
					vaciarMatriz();
						
					/**********selector de proyecto***********/
					var proyectos = $.ajax({
				    	url:'/ajaxSelects?accion=getProyectosPND&borrado=false&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma,
				      	type:'get',
				      	dataType:'json',
				      	async:false       
				    }).responseText;
			
					proyectos = JSON.parse(proyectos);
					//proyectos = proyectos.proyectos;
			
				    if (proyectos != null){
				    	var optionPNDproyecto='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'" selected >Proyecto</option>';
				    	for(var u = 0; u < proyectos.length; u++){
				    		optionPNDproyecto+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[u].codigoProyecto+'" >'+proyectos[u].codigoProyecto+' - '+proyectos[u].nombreProyecto+'</option>';
				    	}
				    	$("#selectorDeProyecto").html(optionPNDproyecto);
				    }else{
				    	var optionPNDproyecto="<option value=''>No posee proyectos</option>";
				    	$("#selectorDeProyecto").html(optionPNDproyecto);
				    }
				} else {				      		    	
					subprograma=0;
					
					
					vaciarMatriz();
				}
			});
		    
		   
		    
		    //-------------change de proyecto-------------//
		    $("body").on("change", "#selectorDeProyecto",function(event){
				var parametros = $("#selectorDeProyecto option:selected").val();
			    var idParsed = parametros.split("-"); 
			    nivel = idParsed[0];
			    entidad = idParsed[1];
			    tipoPrograma = idParsed[2];
			    programa = idParsed[3];
			    subprograma = idParsed[4];
			    proyecto = idParsed[5];
			    var optionPNDproductos ="";
			    

			    //limpieza de los selectores dependientes y la matriz
			    $("#selectorDeProducto").html("<option value='' selected >Producto</option>");
			    producto=0;
			    
			    if (proyecto != undefined){
			    	
					
					//falta actualizar el modal
					vaciarMatriz();
						
					/**********selector de producto***********/
					var datosProductos = $.ajax({
				      url:'/ajaxSelects?accion=getProductosPresupuestoPND&borrado=false'+'&anho='+anho+'&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto,
				      type:'get',
				      dataType:'json',
				      async:false       
				    }).responseText;
				    datosProductos = JSON.parse(datosProductos);
				    //datosProductos = datosProductos.producto;
			    
				    if (datosProductos != null){
				    	var optionPNDproductos='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'" selected >Producto</option>';
				    	
				    	for(var u = 0; u < datosProductos.length; u++){		    		
				    		var producto = $.ajax({
				  		      url:'/ajaxSelects?accion=getProductos&producto='+datosProductos[u].producto_id,
				  		      type:'get',
				  		      dataType:'json',
				  		      async:false       
				  		    }).responseText;
				  		    producto = JSON.parse(producto);
				  		    producto = producto.productos;
				  		    
				    		optionPNDproductos+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+datosProductos[u].producto_id+'" >'+datosProductos[u].producto_id+' - '+producto[0].nombreCatalogo+'</option>';

				    	}
				    	$("#selectorDeProducto").html(optionPNDproductos);
				    }else{
				    	var optionPNDproductos="<option value=''>No posee productos</option>";
				    	$("#selectorDeProducto").html(optionPNDproductos);
				    }
				} else {				    		    	
					proyecto=-1;
					
					
					vaciarMatriz();
				}
		    });
			
		    var nb = 5; 
		    var f = new Array(4); // crea una matriz de longitud 4
		    function vaciarMatriz(){
			    //var nb = 5; 
			    //var f = new Array(4); // crea una matriz de longitud 4
			    for (var i = 0; i < 4; i++) {
			       f[i] = new Array(nb); // define cada elemento como una matriz de longitud 5
			       for (var j = 0; j < nb; j++) {
			          f[i][j] = "99"; // asigna a cada elemento de la matriz bidimensional los valores de i y j
			       }
			    }
		    }
		    
		    for (var i = 0; i < 4; i++) {
			       f[i] = new Array(nb); // define cada elemento como una matriz de longitud 5
			       for (var j = 0; j < nb; j++) {
			          f[i][j] = "99"; // asigna a cada elemento de la matriz bidimensional los valores de i y j
			       }
			 }
			
			var periodo = $.ajax({
				url:'/ajaxSelects?accion=getPeriodo',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			periodo = JSON.parse(periodo);
			
			var periodoActual = 2018;
					
			var version = $.ajax({
				url:'/ajaxSelects?accion=getVersion&anho='+periodoActual,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			version = JSON.parse(version);
			
			var optionPeriodo;
			var optionVersion;

			for(p = 0;p<periodo.length; p++)
			{
				if(periodo[p].id >= 2014){
					if(periodo[p].id == periodoActual)
					{
						optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
					}else{
						optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
					}
				}
			}	
			
			for(v = 0;v<version.length; v++)
			{
				if(version[v].id == 50)
				{
					optionVersion+='<option value="'+version[v].nro+'" selected>'+version[v].nro+'</option>';
				}else{
					optionVersion+='<option value="'+version[v].nro+'" >'+version[v].nro+'</option>';
				}					
			}
			
			$('#periodoSeleccion').append(optionPeriodo);
			$('#versionSeleccion').append(optionVersion);
			
			$("body").on("change", "#periodoSeleccion",function(event){	
			    
				$("#row-body-programacionfisica").html(""); 
				periodoSeleccionado = $("#periodoSeleccion option:selected").val();
							   	
			   	var version = $.ajax({
					url:'/ajaxSelects?accion=getVersion&anho='+periodoSeleccionado,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				version = JSON.parse(version);
			   	
				var optionVersion = "";
				if (version.length > 0) {
					for(v = 0;v<version.length; v++)
					{
						if(version[v].id == 50)
						{
							optionVersion+='<option value="'+version[v].nro+'" selected>'+version[v].nro+'</option>';
						}else{
							optionVersion+='<option value="'+version[v].nro+'" >'+version[v].nro+'</option>';
						}					
					}
				}
				$('#versionSeleccion').html(optionVersion);
				
			   	var versionSeleccionado = $("#versionSeleccion option:selected").val();			 	

			});
			
			var derivers; var renderers;
			function iniciarPivot(periodo, inicio, nivel, entidad, tipoPrograma, programa, subPrograma, proyecto){
				// "inicializar" es una variable booleana para inicializar "derivers" solo al cargar la página
								
	            google.load("visualization", "1", {packages:["corechart", "charteditor"]});
	            $(function(){
	            	if (inicio==true){
	            		$.noConflict();
		                 derivers = $.pivotUtilities.derivers;
		                 renderers = $.extend($.pivotUtilities.renderers, 
			                        $.pivotUtilities.export_renderers);
		                 inicializar=false;
	            	}
	            	
	                $.getJSON("/ajaxSelects?accion=getPivotProductoFisico&anho="+periodo+"&nivel="+nivel+"&entidad="+entidad+"&tipoPresupuesto="+tipoPrograma+"&programa="+programa+"&subprograma="+subPrograma+"&proyecto="+proyecto+"", function(mps) {
	                	$("#output").pivotUI(mps, {
	                        renderers: $.extend(
	                            $.pivotUtilities.renderers, 
	                            $.pivotUtilities.gchart_renderers, 
	                            $.pivotUtilities.d3_renderers
	                            ),
	                            rendererName: "TSV Export"/*,
	                        derivedAttributes: {
	                            "Age Bin": derivers.bin("Age", 10),
	                            "Gender Imbalance": function(mp) {
	                                return mp["Gender"] == "Male" ? 1 : -1;
	                            }
	                        },
	                        cols: ["Age Bin"], rows: ["Gender"],
	                        rendererName: "Area Chart"
							*/
	                    });
	                });
	             });
			}
			
		});
        </script>

        
        <div id="output" style="margin: 30px;">
        <table cellpadding="5">
			<tbody>
				<tr> 
					<td>
						<select class="pvtRenderer">
							<option selected="selected" value="Table">Table</option>
							<option value="Table Barchart">Table Barchart</option>
							<option value="Heatmap">Heatmap</option>
							<option value="Row Heatmap">Row Heatmap</option>
							<option value="Col Heatmap">Col Heatmap</option>
							<option value="Line Chart">Line Chart</option>
							<option value="Bar Chart">Bar Chart</option>
							<option value="Stacked Bar Chart">Stacked Bar Chart</option>
							<option value="Area Chart">Area Chart</option>
							<option value="Treemap">Treemap</option>							
						</select>
					</td>
					<td class="pvtAxisContainer pvtUnused pvtHorizList ui-sortable"></td>
				</tr><tr>
					<td class="pvtVals">
						<select class="pvtAggregator">
							<option selected="selected" value="Count">Count</option>
							<option value="Count Unique Values">Count Unique Values</option>
							<option value="List Unique Values">List Unique Values</option>
							<option value="Sum">Sum</option>
							<option value="Integer Sum">Integer Sum</option>
							<option value="Average">Average</option>
							<option value="Minimum">Minimum</option>
							<option value="Maximum">Maximum</option>
							<option value="Sum over Sum">Sum over Sum</option>
							<option value="80% Upper Bound">80% Upper Bound</option>
							<option value="80% Lower Bound">80% Lower Bound</option>
							<option value="Sum as Fraction of Total">Sum as Fraction of Total</option>
							<option value="Sum as Fraction of Rows">Sum as Fraction of Rows</option>
							<option value="Sum as Fraction of Columns">Sum as Fraction of Columns</option>
							<option value="Count as Fraction of Total">Count as Fraction of Total</option>
							<option value="Count as Fraction of Rows">Count as Fraction of Rows</option>
							<option value="Count as Fraction of Columns">Count as Fraction of Columns</option>
						</select><br>
					</td>
					<td class="pvtAxisContainer pvtHorizList pvtCols ui-sortable"></td>
				</tr><tr>
					<td class="pvtAxisContainer pvtRows ui-sortable" valign="top"></td>
					<td style="opacity: 1;" class="pvtRendererArea" valign="top">.</td>
				</tr>
			</tbody>
		</table></div> 
		<script>
		document.getElementById('btn1').addEventListener('click',pasarParametro,false);
		function pasarParametro()
		{
        	var t = document.getElementById('output');
        	var boton =document.getElementById('btn1');
        	var p = t.getElementsByTagName('td')
        	//p[4].childNodes[0].nodeValue=p[4].childNodes[0].nodeValue + ' NO PUEDO MAS |'; 
        	if (p[0].style.display != "none" && p[1].style.display != "none" && p[2].style.display != "none" && p[3].style.display != "none" && p[4].style.display != "none") {
   				p[0].style.display = "none"; //ocultar columna 
   				p[1].style.display = "none"; //ocultar columna 
   				p[2].style.display = "none"; //ocultar columna 
   				p[3].style.display = "none"; //ocultar columna 
   				p[4].style.display = "none"; //ocultar columna 
   				boton.value="Ver Columnas";
 			} else {
    			p[0].style.display = ""; //mostrar columna 
    			p[1].style.display = ""; //mostrar columna
    			p[2].style.display = ""; //mostrar columna  
    			p[3].style.display = ""; //mostrar columna 
    			p[4].style.display = ""; //mostrar columna  
    			boton.value="Ocultar Columnas";
  			}
        }
	</script>
	  					</td>
	  				</tr>
			
	  			</table>
	  			
	            </div>
			   </div>
			   </div>
			<!--</div>-->
        
          
          </div><!-- /.row -->
   
          
               
          
    </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
      </footer>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-light">
			<%@ include file="/frames/control-sidebar.jsp"%>
		</aside><!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class='control-sidebar-bg'></div>
	</div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->

    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
