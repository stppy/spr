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
 	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

   	<script src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/1.2.10/jquery.floatThead.min.js"></script> -->	
        
	<!--<script src="frames/entidad.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>
	
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- bootstrap datepicker css  -->
	<link href="plugins/datepicker/datepicker3.css" rel="stylesheet">

    <style type="text/css">
		/* Example 1 custom styles */
		#ex1Slider .slider-selection {
   			background: #BABABA;
  		}

    	/* Example 3 custom styles */
		#RGB {
    		height: 20px;
    		background: rgb(128, 128, 128);
  		}
		#RC .slider-selection {
		    background: #FF8282;
		}
		#RC .slider-handle {
			background: red;
		}
		#GC .slider-selection {
			background: #428041;
		}
		#GC .slider-handle {
			background: green;
		}
		#BC .slider-selection {
			background: #8283FF;
		}
		#BC .slider-handle {
			border-bottom-color: blue;
		}
		#R, #G, #B {
			width: 300px;
		}
		
		
		#slider12a .slider-track-high, #slider12c .slider-track-high {
			background: #008d4c;
		}
		
		#slider12b .slider-track-low, #slider12c .slider-track-low {
			background: #d33724;
		}
		
		#slider12c .slider-selection {
			background: #db8b0b;
		}
    </style>
    
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>
<body class="skin-blue sidebar-mini sidebar-collapse">



		
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>
	
<script>
<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1")){%>
	$(document).ready(function(){
	
		$('#fechaDocumento').datepicker({  
			language: "es",
			format: 'yyyy-mm-dd',
			todayBtn: "linked",
		    todayHighlight: true});
		
		var rol_jsp=<%=attributes.get("role_id").toString() %>;
			
		function renderTipoDocumento(){
		
			$("#contenedorDocumento").html("");
			var webServicesTipoDocumento = $.ajax({
				url:'/ajaxSelects?accion=getTipoDocumento&borrado=false',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			webServicesTipoDocumento = JSON.parse(webServicesTipoDocumento);
			
			var optionTipoDocumento = '';
			for(var x = 0; x < webServicesTipoDocumento.length; x++){
				optionTipoDocumento += '<option value="'+webServicesTipoDocumento[x].id+'" >'+webServicesTipoDocumento[x].nombre+'</option>';
			}
			
			var cajaTipoDocumento;
	
			for(var m = 0; m < webServicesTipoDocumento.length; m++)
			{
				cajaTipoDocumento="";
				cajaTipoDocumento +=	'<div class="row">'+
								        '	<div class="col-md-12">'+
								        '		<div class="box collapsed-box">'+
								        '			<div class="box-header with-border">'+
								        '				<h4 class="box-title" >'+webServicesTipoDocumento[m].nombre+'</h4>'+
								        '				<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>'+
								        '			</div>'+
								        '			<div class="box-body">';
								        
										var webServiceDocumento = $.ajax({
									    	url:'/ajaxSelects?accion=getDocumento&tipo='+webServicesTipoDocumento[m].id,
									      	type:'get',
									      	dataType:'json',
									      	async:false       
									    }).responseText;
										webServiceDocumento = JSON.parse(webServiceDocumento); 
										
				if(webServiceDocumento.length >= 0){
					
					cajaTipoDocumento +=	'				<div class="table-responsive">'+
											'	            	<table class="table table-hover table-bordered" id="dataTablesUsuarios">'+
											'	                	<thead>'+
											'	                		<tr class="active"><th class="text-center">Nombre</th><th class="text-center">Fecha</th><th class="text-center">Descripción</th><th class="text-center">Administrar</th></tr>'+
											'	                	</thead>'+
											'	                	<tbody">';
											
					for(var p = 0; p < webServiceDocumento.length; p++)
					{
						if(webServiceDocumento[p].borrado == true)
						{
							<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
								cajaTipoDocumento += '<tr><td><del>'+webServiceDocumento[p].nombre+'</del></td><td><del>'+webServiceDocumento[p].fecha+'</del></td><td><del>'+webServiceDocumento[p].descripcion+'</del></td>';
								if(webServiceDocumento[p].url){
									cajaTipoDocumento += '<td class="text-center"><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a><button type="button" class="btn btn-default btn-sm consultaBorrarDocumento" data-toggle="tooltip" data-placement="top" title="Editar" parametros="'+webServiceDocumento[p].id+'"><span class="fa fa-recycle"></span></button></td></tr>';
								}else{
									cajaTipoDocumento += '<td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDocumento" data-toggle="tooltip" data-placement="top" title="Editar" parametros="'+webServiceDocumento[p].id+'"><span class="fa fa-recycle"></span></button></td></tr>';
								}
							<%}%>
						}else{
							<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
									cajaTipoDocumento += '<tr><td>'+webServiceDocumento[p].nombre+'</td><td>'+webServiceDocumento[p].fecha+'</td><td>'+webServiceDocumento[p].descripcion+'</td>';
									if (webServiceDocumento[p].url) {
										cajaTipoDocumento += '<td class="text-center"><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a><button type="button" class="btn btn-default btn-sm consultaEditarDocumento" data-toggle="tooltip" data-placement="top" title="Editar" parametros="'+webServiceDocumento[p].id+'"><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDocumento" data-toggle="tooltip" data-placement="top" title="Borrar" parametros="'+webServiceDocumento[p].id+'"><span class="fa fa-trash"></span></button></td></tr>';
									} else {
										cajaTipoDocumento += '<td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button><button type="button" class="btn btn-default btn-sm consultaEditarDocumento" data-toggle="tooltip" data-placement="top" title="Editar" parametros="'+webServiceDocumento[p].id+'"><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDocumento" data-toggle="tooltip" data-placement="top" title="Borrar" parametros="'+webServiceDocumento[p].id+'"><span class="fa fa-trash"></span></button></td></tr>';
									}				
							<%} if (attributes.get("role_id").toString().equals("3")){%>
									cajaTipoDocumento += '<tr><td>'+webServiceDocumento[p].nombre+'</td><td>'+webServiceDocumento[p].fecha+'</td><td>'+webServiceDocumento[p].descripcion+'</td>';
									if (webServiceDocumento[p].url) {
										cajaTipoDocumento += '<td class="text-center"><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
									}else{
										cajaTipoDocumento += '<td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
									}
							<%}%>
						}
					}
					cajaTipoDocumento +=	'						</tbody>'+
											'	            	</table>'+
											'	         	</div>';
				}
				cajaTipoDocumento +=	'			</div>'+
										'		</div>'+
								     	'	</div>'+
										'</div>';
										
			$('#contenedorDocumento').append(cajaTipoDocumento);
			$('#tipoDocumento').html(optionTipoDocumento);
			}						

		}
		
	renderTipoDocumento();
		
	$("body").on("click", ".guardarDocumento",function(event){
		if (validarFormulario("formInsDocumento")==true){
			
			event.stopPropagation();
			event.preventDefault(); 
			
			var documentoFile = document.getElementById("documentoContenedor").files[0];
		    
			if (documentoFile != null){
			    var formdata = new FormData();
			    formdata.append('documentoEvidencia', documentoFile);
			    
			     $.ajax({
				         type: "POST",
				         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
				         data: formdata, /* + $('#custIdList').val(), */
				         async: false,
				         processData: false,  // tell jQuery not to process the data
				         contentType: false,   // tell jQuery not to set contentType
				         success: function(data){
				               $("#urlDocumento").val(data);
				           }
				     });
			}
		
			var nombre = $("#nombreDocumento").val();
			var tipo = $("#tipoDocumento").val();
			var descripcion = $("#descripcionDocumento").val();
			var fecha = $("#fechaDocumento").val();
			var urlDocumento; 
			if (documentoFile != undefined) urlDocumento = $("#urlDocumento").val();
		
			//Vaciar los inputs
			$("#nombreDocumento").val("");
			$("#tipoDocumento").val("");
			$("#descripcionDocumento").val("");	
			$("#fechaDocumento").val("");
			
			var objeto = new Object();
			
			objeto.nombre = nombre;
			objeto.tipoId = tipo;
			objeto.descripcion = descripcion;
			objeto.fecha = fecha;
			objeto.url = urlDocumento;
				
			var info = JSON.stringify(objeto);
		    $.ajax({
		    	url: "ajaxInserts?accion=insDocumento",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		        		renderTipoDocumento();
		        	}else{
		  				alert("ERROR");
		        	}
		        	
		        },
		        error: function(data,status,er) {
		        	
		        	}
			 });
		}
	});
	
	$("body").on("click", ".consultaBorrarDocumento",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var idDocumento = idParsed[0];
		
		var webServiceDocumento = $.ajax({
	    	url:'/ajaxSelects?accion=getDocumento&idDocumento='+idDocumento,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		webServiceDocumento = JSON.parse(webServiceDocumento); 
		
		if ( $("#modalBorrarDocumento").length )
		{
			$("#modalBorrarDocumento").remove();
		}		
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarDocumento" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close paginaPrincipal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title" ></h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoModalBorrar">'+
							'				<div class="table-responsive">'+
							'					<table class="table table-hover table-bordered">'+
							'					 	<thead>'+
							'							<tr class="active"><th class="text-center">Nombre</th><th class="text-center">Fecha</th><th class="text-center">Descripción</th></tr>'+
							'					    </thead>'+
							'					    <tbody">'+
							'							<tr><td class="text-center">'+webServiceDocumento[0].nombre+'</td><td class="text-center">'+webServiceDocumento[0].fecha+'</td><td class="text-center">'+webServiceDocumento[0].descripcion+'</td></tr>'+
							'						</tbody>'+
							'					</table>'+
							'				</div>'+
							'			<div id="mensajeBorradoDocumento"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoDocumento">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
		
			$("body").append(contenido);
			
			if(webServiceDocumento[0].borrado == true){
				$("#mensajeBorradoDocumento").html("");
				$("#mensajeBorradoDocumento").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este Registro</h3>');
				$("#agregarBotonBorradoDocumento").html("");
				$("#agregarBotonBorradoDocumento").append('<button type="button" class="btn btn-success btn-sm borrarDocumento" id="botonRestaurarDocumento" parametros='+webServiceDocumento[0].id+'-r>Restaurar Documento</button>');
				//$("#agregarBotonBorradoDocumento").append('<button type="button" class="btn btn-success btn-sm agregarAccion"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>');
			}else{
				$("#mensajeBorradoDocumento").html("");
				$("#mensajeBorradoDocumento").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este Registro</h3');
				$("#agregarBotonBorradoDocumento").html("");
				$("#agregarBotonBorradoDocumento").append('<button type="button" class="btn btn-danger btn-sm borrarDocumento" id="botonBorradoDocumento" parametros='+webServiceDocumento[0].id+'-b>Borrar Documento</button>');
				//$("#agregarBotonBorradoDocumento").append('<button type="button" class="btn btn-success btn-sm agregarAccion"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>');
			}
			
			$('#modalBorrarDocumento').modal('show');

	});
		
	$("body").on("click", ".borrarDocumento",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var idDocumento = idParsed[0];
	    var estado = idParsed[1];

		
		var webServiceDocumento = $.ajax({
	    	url:'/ajaxSelects?accion=getDocumento&idDocumento='+idDocumento,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		webServiceDocumento = JSON.parse(webServiceDocumento); 
		
		var objeto = new Object();
		
		objeto.id = idDocumento;
		objeto.borrado = webServiceDocumento[0].borrado;

	
		//objeto.documentoEvidencia = documentoEvidencia;
		
		var info = JSON.stringify(objeto);
	    $.ajax({
	    	url: "ajaxUpdate?accion=actBorradoDocumento",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == true)
	        	{
	                if(estado == "b"){
	            		$("#botonBorradoDocumento").remove();cuerpoModalBorrar
	                	$("#cuerpoModalBorrar").html("");
	                	$("#cuerpoModalBorrar").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
	                }else{
	            		$("#botonRestaurarDocumento").remove();
	                	$("#cuerpoModalBorrar").html("");
	                	$("#cuerpoModalBorrar").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
	            	}    		
	                renderTipoDocumento();
	        	}else{
	  				alert("ERROR");
	        	}
	        	
	        },
	        error: function(data,status,er) {
	        	
	        	}
		 });
	});
		 
		function renderListaTipoDocumento(){
			var webServiceTipoDocumento = $.ajax({
				url:'/ajaxSelects?accion=getTipoDocumento',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;		
			webServiceTipoDocumento=JSON.parse(webServiceTipoDocumento);
			
			
			var cuerpoTipoDocumento = "";
			for(var a = 0; a < webServiceTipoDocumento.length; a++)
			{				
				if(webServiceTipoDocumento[a].borrado == true)
				{
					<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
						cuerpoTipoDocumento += '<tr><td><del>'+webServiceTipoDocumento[a].nombre+'</del></td><td><del>'+webServiceTipoDocumento[a].fechaActualizacion+'</del></td><td><del>'+webServiceTipoDocumento[a].fechaInsercion+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarTipoDocumento" data-toggle="tooltip" data-placement="top" title="Restaurar Tipo de Documento" parametros="'+webServiceTipoDocumento[a].id+'-r" ><span class="fa fa-recycle"></span></button></td></tr>';
					<% }%>
				}else{
					<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
						cuerpoTipoDocumento += '<tr><td>'+webServiceTipoDocumento[a].nombre+'</td><td>'+webServiceTipoDocumento[a].fechaActualizacion+'</td><td>'+webServiceTipoDocumento[a].fechaInsercion+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarTipoDocumento" data-toggle="tooltip" data-placement="top" title="Editar Tipo de Documento" parametros="'+webServiceTipoDocumento[a].id+'" ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarTipoDocumento" data-toggle="tooltip" data-placement="top" title="Borrar Tipo de Documento" parametros="'+webServiceTipoDocumento[a].id+'-b"><span class="fa fa-trash"></span></button></td></tr>';
					<%} if (attributes.get("role_id").toString().equals("3")){%>
						cuerpoTipoDocumento += '<tr><td>'+webServiceTipoDocumento[a].nombre+'</td><td>'+webServiceTipoDocumento[a].fechaActualizacion+'</td><td>'+webServiceTipoDocumento[a].fechaInsercion+'</td><td class="text-center"></td></tr>';
					<%}%>
				}
			
			}
			return cuerpoTipoDocumento;
		}
	
		 $("body").on("click", ".modalTipoDocumento",function(event){
/* 				var parametros = $(this).attr("parametros");
			    var idParsed = parametros.split("-"); 
			    var insLineaAccionId = idParsed[0]; */			    
				
				if ( $("#modalTipoDocumento").length )
				{
					$("#modalTipoDocumento").remove();
				}
				if ( $("#modalEditarTipoDocumento").length )
				{
					$("#modalEditarTipoDocumento").remove();
				}
				if ( $("#modalBorrarTipoDocumento").length )
				{
					$("#modalBorrarTipoDocumento").remove();
				}	
			
				var cuerpoTipoDocumento = "";
				
				cuerpoTipoDocumento = renderListaTipoDocumento();

						
				var cuerpoModalTipoDocumento = "";

				cuerpoModalTipoDocumento =	'<div class="modal fade" id="modalTipoDocumento" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'	<div class="modal-dialog modal-lg">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close paginaPrincipal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
									'		        <h4 class="modal-title">Agregar Tipo Documento</h4>'+   
									'			</div>'+
									'		    <div class="modal-body">'+
									'	      		<div class="row">'+
									<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		
									'		      		<div class="col-md-12">'+
									'						<div class="box box-default box-solid">'+
									'		                	<div class="box-header with-border">'+
									'		                  		<h3 class="box-title"></h3>'+
									'	                  			<div class="box-tools pull-right">'+
									
									'		                  		</div>'+
									'              				</div>'+
									'              				<div class="box-body">'+
									'			      				<form role="form" id="formInsTipoDocumentoModal">'+
									'									<div class="form-group">'+
									'										<label for="nombreTipoDocumento">Nombre</label><input type="text" id="nombreTipoDocumento" class="form-control" placeholder="Ingrese nombre del Tipo de Documento" required/>'+																		
									'									</div>'+
									'									<div class="form-group" align="right">'+
									'					        			<button type="submit" class="btn btn-success btn-sm guardarTipoDocumento">Guardar</button>'+
									'									</div>'+
									'			      				</form>	'+
									'				      		</div>'+
									'						 </div>'+//fin box body						
									'		   			</div>'+//fin col-md
									<% }%>		
									'					<div class="col-md-12">'+
									'						<div class="box box-default box-solid">'+
									'		       				<div class="box-header with-border">'+
									'		       					<h3 class="box-title">Lista de Tipos de Documentos</h3>'+
									'	       						<div class="box-tools pull-right">'+
									'		         				</div>'+
									'              				</div>'+
									'              				<div class="box-body">'+	
									'								<div class="table-responsive">'+
									'									<table class="table table-hover table-bordered" id="dataTableTipoDocumento">'+
									'										<thead>'+
									'											<tr class="active"><th>Nombre</th><th>Fecha Actualización</th><th>Fecha Inserción</th><th class="text-center">Administrar</th></tr>'+
									'										</thead>'+
									'										<tbody id="listaTipoDocumento">'+
									'										</tbody>'+
									'									</table>'+
									'		      					</div>'+
									'				      		</div>'+
									'				      	</div>'+
									'              		</div>'+
									' 				</div>'+//fin row
									'		    </div>'+//fin modal body
 									'			<div class="modal-footer">'+
 									'				<button type="button" class="btn btn-default btn-sm paginaPrincipal" data-dismiss="modal" aria-label="Close">Cerrar</button>'+
							      	'			</div>'+														
									'		</div>'+//fin modal content
									'	</div>'+
									'</div>';
									
				$("#contenedorDocumento").append(cuerpoModalTipoDocumento);
				$("#listaTipoDocumento").html("");
				$("#listaTipoDocumento").html(cuerpoTipoDocumento);
				$('#modalTipoDocumento').modal('show');
				$("#dataTableTipoDocumento").DataTable();
			});
		 
		 function validarFormulario(formId) {	    
			var validacion=true;
			if (document.getElementById(formId).checkValidity() == false) {
				validacion=false;
			}
			return validacion;
		}
		 
	 $("body").on("click", ".guardarTipoDocumento",function(event){
		 if (validarFormulario("formInsTipoDocumentoModal")==true){
				
			event.stopPropagation();
			event.preventDefault(); 
			var nombre = $("#nombreTipoDocumento").val();
	
			//Vaciar los inputs
			$("#nombreTipoDocumento").val("");
			
			var objeto = new Object();
			
			objeto.nombre = nombre;
	
			//objeto.documentoEvidencia = documentoEvidencia;
			
			var info = JSON.stringify(objeto);
		    $.ajax({
		    	url: "ajaxInserts?accion=insTipoDocumento",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
						$("#listaTipoDocumento").html("");
						var cuerpoTipoDocumento = "";						
						cuerpoTipoDocumento = renderListaTipoDocumento();
						$("#listaTipoDocumento").html(cuerpoTipoDocumento);
						//renderTipoDocumento();
					}else{
		  				alert("ERROR");
		        	}
		        	
		        },
		        error: function(data,status,er) {
		        	
		        }
			 });
		 }
	});
	 
	 $("body").on("click", ".consultaEditarTipoDocumento",function(event){
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-");                                                            								
			
			var tipoDocumentoId = idParsed[0];


			if ( $("#modalTipoDocumento").length )
			{
				$("#modalTipoDocumento").remove();
			}	
			
			var tipoDocumento = $.ajax({
				url:'ajaxSelects?accion=getTipoDocumento&tipo='+tipoDocumentoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			tipoDocumento = JSON.parse(tipoDocumento);										
			
			
			var contenido = "";

			contenido +=		'<div class="modal fade" id="modalEditarTipoDocumento" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
								'	<div class="modal-dialog modal-lg">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close modalTipoDocumento"  parametros="" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
								'		        <h4 class="modal-title">Editar Tipo de Documento</h4>'+
								'			</div>'+
								'			<form role="form" id="formActTipoDocumentoModal">'+	
								'		    	<div class="modal-body" id="cuerpoModalEditarTipoDocumento">'+
								'						<div class="form-group">'+
								'							<label for="nombreTipoDocumento">Nombre</label><input type="text" id="nombreTipoDocumento" class="form-control" placeholder="Ingrese nombre del Tipo de Documento" value="'+tipoDocumento[0].nombre+'" required/>'+
								'						</div>'+
								'		    	</div>'+
								'				<div class="modal-footer">'+
								' 					<button type="submit" class="btn btn-success btn-sm editarTipoDocumento" id="botonGuardarTipoDocumento" parametros='+tipoDocumentoId+'>Guardar Cambios</button>'+
								' 					<button type="button" class="btn btn-default btn-sm modalTipoDocumento" parametros="">Cerrar</button>'+						
								'				</div>'+
								'			</form>	'+
								'		</div>'+ 
								'	</div>'+
								'</div>';
										
			
			$("body").append(contenido);										
			
	    	$('#modalEditarTipoDocumento').modal('show');		
	 }); 
	 
	 $("body").on("click", ".editarTipoDocumento",function(event){
		 if (validarFormulario("formActTipoDocumentoModal")==true){
				
				event.stopPropagation();
				event.preventDefault(); 
			var parametros = $(this).attr("parametros");		                                                              
			var idParsed = parametros.split("-");
			
			var tipoDocumentoId = idParsed[0];
			
			var nombre = $("#nombreTipoDocumento").val();

			
			var objeto = new Object();			
			objeto.id = tipoDocumentoId;		
			objeto.nombre = nombre;
			
			
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "ajaxUpdate?accion=actTipoDocumento",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		        		$("#botonGuardarTipoDocumento").remove();
		            	$("#cuerpoModalEditarTipoDocumento").html("");
		            	$("#cuerpoModalEditarTipoDocumento").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
		        	}else{
		        		alert("ERROR");        		
		        	}
		        	
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {
		        		alert("ERROR");
		        }
			 });
		 }
	 });
	 
	 $("body").on("click", ".consultaBorrarTipoDocumento",function(event){
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-");                                                            
								     
			var tipoDocumentoId = idParsed[0];

			if ( $("#modalTipoDocumento").length )
			{
				$("#modalTipoDocumento").remove();
			}		
			
			var tipoDocumento = $.ajax({
				url:'ajaxSelects?accion=getTipoDocumento&tipo='+tipoDocumentoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			tipoDocumento = JSON.parse(tipoDocumento);				
			
			var contenido = "";

			contenido =			'<div class="modal fade" id="modalBorrarTipoDocumento"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
								'	<div class="modal-dialog modal-lg">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close modalTipoDocumento"  parametros="" ><span aria-hidden="true">&times;</span></button>'+
								'		        <h4 class="modal-title">Borrar - Restaurar Tipo de Documento</h4>'+
								'			</div>'+
								'		    <div class="modal-body">'+
								'				<div id="mensajeBorradoTipoDocumento"></div>'+
								'		    </div>'+
								'			<div class="modal-footer" id="agregarBotonBorradoTipoDocumento">'+
								'			</div>'+
								'		</div>'+ 
								'	</div>'+
								'</div>';
								
				$("body").append(contenido);
				
				if(tipoDocumento[0].borrado == true){
					$("#mensajeBorradoTipoDocumento").html("");
					$("#mensajeBorradoTipoDocumento").append('<h3 class="text-center">Ud. está seguro que desea RESTABLACER éste registro</h3>');
					$("#agregarBotonBorradoTipoDocumento").html("");
					$("#agregarBotonBorradoTipoDocumento").append('<button type="button" class="btn btn-success btn-sm borrarTipoDocumento" id="botonRestaurarTipoDocumento" parametros='+tipoDocumentoId+'-r>Restaurar Tipo de Documento</button>');
					$("#agregarBotonBorradoTipoDocumento").append('<button type="button" class="btn btn-default btn-sm modalTipoDocumento" parametros="">Cerrar</button>');
				}else{
					$("#mensajeBorradoTipoDocumento").html("");
					$("#mensajeBorradoTipoDocumento").append('<h3 class="text-center">Ud. está seguro que desea BORRAR éste registro</h3');
					$("#agregarBotonBorradoTipoDocumento").html("");
					$("#agregarBotonBorradoTipoDocumento").append('<button type="button" class="btn btn-danger btn-sm borrarTipoDocumento" id="botonBorradoTipoDocumento" parametros='+tipoDocumentoId+'-b>Borrar Tipo de Documento</button>');
					$("#agregarBotonBorradoTipoDocumento").append('<button type="button" class="btn btn-default btn-sm modalTipoDocumento" parametros="">Cerrar</button>');
				}
				
				$('#modalBorrarTipoDocumento').modal('show');
					
		});
		$("body").on("click", ".borrarTipoDocumento",function(event){	
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-"); 
		    
		    var tipoDocumentoId = idParsed[0];
		    var estado = idParsed[1];
		    
		    var tipoDocumento = $.ajax({
				url:'ajaxSelects?accion=getTipoDocumento&tipo='+tipoDocumentoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			tipoDocumento = JSON.parse(tipoDocumento);
			
		    
		    var objeto = new Object();
		    objeto.id = tipoDocumentoId;
		    objeto.borrado= tipoDocumento[0].borrado;

		    
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "ajaxUpdate?accion=actBorrarTipoDocumento",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	
		        	if(data.success == true){
		            	if(estado == "b"){
			        		$("#botonBorradoTipoDocumento").remove();
			            	$("#mensajeBorradoTipoDocumento").html("");
			            	$("#mensajeBorradoTipoDocumento").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
			            }else{
			        		$("#botonRestaurarTipoDocumento").remove();
			            	$("#mensajeBorradoTipoDocumento").html("");
			            	$("#mensajeBorradoTipoDocumento").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
			        	}
		        	} else {
		        		alert("ERROR");
		        	}

		        },

		        error: function(data,status,er) {
		        	alert("ERROR");
		        }
			 });			
	});
	
//consulta editar documento		 
		 $("body").on("click", ".consultaEditarDocumento",function(event){
			var parametros = $(this).attr("parametros");
			var idParsed = parametros.split("-"); 
			var id = idParsed[0];
			
			if ( $("#modalEditarDocumento").length )
			{
				$("#modalEditarDocumento").remove();
			}
			var webServiceDocumento = $.ajax({
		    	url:'ajaxSelects?accion=getDocumento&idDocumento='+id,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			webServiceDocumento = JSON.parse(webServiceDocumento);
				
				var contenidoModalEditarDocumento = "";

				contenidoModalEditarDocumento +='<div class="modal fade" id="modalEditarDocumento" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
												'	<div class="modal-dialog modal-lg">'+
												'		<div class="modal-content" >'+
												'			<div class="modal-header">'+
												'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
												'		        <h4 class="modal-title">Editar Documentos</h4>'+
												'			</div>'+
												'			<form role="form" id="formActDocumentoModal">'+
												'		    	<div class="modal-body" id="cuerpoModalEditarDocumentos">'+
												'					<div class="form-group">'+
												'						<input type="hidden"  name="documentoId"  id="idDocumento" value="'+webServiceDocumento[0].id+'">'+
												'						<label for="nombreDocumento">Nombre</label><input type="text" id="nombreDocModal" class="form-control" placeholder="Ingrese el Nombre" value="'+webServiceDocumento[0].nombre+'" required/>'+
												'					</div>'+
												'					<div class="form-group">'+
												'						<label for="descripcionDocumento">Descripción</label><input type="text" id="descripcionDocModal" class="form-control" placeholder="Ingrese una Descripción" value="'+webServiceDocumento[0].descripcion+'" required/>'+
												'					</div>'+
												'					<div class="form-group">'+
												'						<label for="fechaDocumento">Fecha</label><input id="fechaDocModal" class="form-control" placeholder="Ingrese una Fecha" value="'+webServiceDocumento[0].fecha+'" required/>'+
												'					</div>'+
												'		    	</div>'+
												'				<div class="modal-footer">'+
												' 					<button type="submit" class="btn btn-success btn-sm editarDocumento" id="botonGuardarDocumento">Guardar Cambios</button>'+
												' 					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cerrar</button>'+						
												'				</div>'+
												'			</form>	'+
												'		</div>'+ 
												'	</div>'+
												'</div>';
				$("body").append(contenidoModalEditarDocumento);
				$('#modalEditarDocumento').modal('show');
				$('#fechaDocumento').datepicker({  
					language: "es",
					format: 'yyyy-mm-dd',
					todayBtn: "linked",
				    todayHighlight: true});
		 });
			
			$("body").on("click", ".editarDocumento",function(event){
				if (validarFormulario("formActDocumentoModal")==true){
					
					event.stopPropagation();
					event.preventDefault(); 
					var objeto = new Object();
					
					objeto.id = $("#idDocumento").val();	
					objeto.nombre = $("#nombreDocModal").val();
					objeto.descripcion = $("#descripcionDocModal").val();
					objeto.fecha = $("#fechaDocModal").val();
					
				  	var info = JSON.stringify(objeto);
				    $.ajax({
				        url: "ajaxUpdate?accion=actDocumento",
				        type: 'POST',
				        dataType: 'json',
				        data: info,
				        contentType: 'application/json',
				        mimeType: 'application/json',
				        success: function (data) {
				        	if(data.success == true){
				        		$("#botonGuardarDocumento").remove();
				            	$("#cuerpoModalEditarDocumentos").html("");
				            	$("#cuerpoModalEditarDocumentos").html("<h3 class='text-center'>Ud ha actualizado exitosamente el registro!!</h3>");        		
				            	renderTipoDocumento();
				        	}else{
				        		alert("ERROR");        		
				        	}
				        	
				        },
				        error: function(data,status,er) {
				        		alert("ERROR");
				        }
					 });
				}
			});
				
			$('#contenedorDocumento').delegate( "[data-widget='collapse']", 'click', function(){
				   //Find the box parent........
			    var box = $(this).parents(".box").first();
			    //Find the body and the footer
			    var bf = box.find(".box-body, .box-footer");
			    if (!$(this).children().hasClass("fa-plus")) {
			        $(this).children(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
			        bf.slideUp();
			    } else {
			        //Convert plus into minus
			        $(this).children(".fa-plus").removeClass("fa-plus").addClass("fa-minus");
			        bf.slideDown();
			    }
			});
	});
	
<%}else{%>
	window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%}%>
</script>

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
        <section class="content">
	    <!-- Info row de buscador de productos -->
	    	<div class="row">
	        	<div class="col-md-12">
	        		<div class="box box-default box-solid">
	           			<div class="box-header with-border">
	            			<h4 class="box-title" >Agregar Documento</h4>
	             			<div class="box-tools pull-right"><button class="btn btn-box-tool cargarProyectos" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
	           			</div>
	           			<div class="box-body">
																				
							<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>	
	            														
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr  class="active"><th>Agregar Tipo de Documento</th><th><button type="button" class="btn btn-default btn-sm pull-right modalTipoDocumento" data-toggle="tooltip" data-placement="top" title="Agregar Nuevo Tipo de Documento"><span class="fa fa-plus-circle"></span></th></tr>
										</thead>
									</table>
		      					</div>
		      					<div>
		      						<form role="form" id="formInsDocumento">
		      							<div class="row">
			      							<div class="form-group col-md-6">
												<label for="nombreDocumento">Nombre</label><input type="text" id="nombreDocumento" class="form-control" placeholder="Ingrese Nombre Documento" required/><input type="hidden" id="urlDocumento" />
											</div>
											<div class="form-group col-md-6">
												<label for="tipoDocumento">Tipo</label><select id="tipoDocumento" class="form-control" required></select>
											</div>
										<!-- </div>
		      							<div class="row"> -->
											<div class="form-group col-md-6">
												<label for="descripcionDocumento">Descripción</label><input type="text" id="descripcionDocumento" class="form-control" placeholder="Ingrese Descripción" />
											</div>
											<div class="form-group col-md-6">
												<label for="fechaDocumento">Fecha Validez</label><input id="fechaDocumento" class="form-control" placeholder="Ingrese Fecha" required/>																	        																				
											</div>
		      							<!-- </div>
		      							<div class="row"> -->
			      							<div class="form-group col-md-12">	
												<label for="documentoContenedor">Adjuntar Documento</label><input type="file" id="documentoContenedor" name="documentoContenedor" required/>
											</div>
											<div class="form-group col-md-12"  align="right">
												<button type="submit" class="btn btn-success btn-sm guardarDocumento pull-right" >Guardar</button>																					
	     									</div>
     									</div>
     								</form>	
		      					</div>
				      					
							<% }%>
						
						</div>
					</div>
	    		 </div>
			</div> 
 	   	<section id="contenedorDocumento">   
			
   		</section>

	          
	                  
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
		<!-- include file="/frames/control-sidebar.jsp"  -->
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
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
    <script src="plugins/datepicker/locales/bootstrap-datepicker.es.js" charset="UTF-8"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    
    
    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->
    
    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
     
        <%  } else { %>
				est<p>Favor Iniciar Sesion</p>
			<%} %>
	

<!-- Piwik -->
<script type="text/javascript">


  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 9]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=9" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code  -->

<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
</body>
</html>
