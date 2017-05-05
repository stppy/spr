<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<!--  UTF-8 -->
  	<%@ include file="/frames/head.jsp" %>
	<script src="dist/canvasjs/canvasjs.min.js" type="text/javascript"></script>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">  	
</head>
<body class="skin-blue sidebar-mini">

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>
	
<script>
var entidad=<%=attributes.get("entidad_id") %>;
var nivel=<%=attributes.get("nivel_id") %>;
var entidades;

$(document).ready(function(){
	
		function renderObjetivos(){
			
			var tablaObjetivos = "";
			var cuerpoTabla = "";
			$("#cuerpoObjetivos").html("");
			
		  	var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	objetivos = JSON.parse(objetivos);
			objetivos = objetivos.objetivos
			
		  	var tipoObjetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getTipoObjetivos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	tipoObjetivos = JSON.parse(tipoObjetivos);
		  	
		  	var cuerpoTabla="";
			var tipoObjetivo;
			
		  	for(var q = 0; q < objetivos.length; q++){
		  		
		  		tipoObjetivo = "";
		  		
				for(var p = 0; p < tipoObjetivos.length; p++){
					if (objetivos[q].tipo_objetivo_id == tipoObjetivos[p].id){
						tipoObjetivo = tipoObjetivos[p].nombre;
					}
				}
				
				if(objetivos[q].borrado == 1)
				{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
						cuerpoTabla += '<tr><td><del>'+objetivos[q].id+'</del></td><td><del>'+objetivos[q].nombre+'</del></td><td><del>'+objetivos[q].descripcion+'</del></td><td><del>'+tipoObjetivo+'</del></td><td><del>'+objetivos[q].version+'</del></td><td><del>'+objetivos[q].anho+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarObjetivo" data-toggle="tooltip" data-placement="top" title="Restaurar Objetivo" parametros="'+objetivos[q].id+'-'+objetivos[q].tipo_objetivo_id+'-'+objetivos[q].version+'-'+objetivos[q].anho+'"><span class="fa fa-recycle"></span></button></td></tr>';
					<%}%>
				}else{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
						cuerpoTabla += '<tr><td>'+objetivos[q].id+'</td><td>'+objetivos[q].nombre+'</td><td>'+objetivos[q].descripcion+'</td><td>'+tipoObjetivo+'</td><td>'+objetivos[q].version+'</td><td>'+objetivos[q].anho+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm editarObjetivo" data-toggle="tooltip" data-placement="top" title="Editar Objetivo" parametros="'+objetivos[q].id+'-'+objetivos[q].tipo_objetivo_id+'-'+objetivos[q].version+'-'+objetivos[q].anho+'" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarObjetivo" data-toggle="tooltip" data-placement="top" title="Borrar Objetivo" parametros="'+objetivos[q].id+'-'+objetivos[q].tipo_objetivo_id+'-'+objetivos[q].version+'-'+objetivos[q].anho+'"><span class="glyphicon glyphicon-trash"></span></button></td></tr>';
					<%} if (attributes.get("role_id").toString().equals("3")){%>
						cuerpoTabla += '<tr><td>'+objetivos[q].id+'</td><td>'+objetivos[q].nombre+'</td><td>'+objetivos[q].descripcion+'</td><td>'+tipoObjetivo+'</td><td>'+objetivos[q].version+'</td><td>'+objetivos[q].anho+'</td><td></td></tr>';
					<%}%>
				}	
			}
			

		  	
			var tablaObjetivos ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesObjetivos">'+
			'	                	<thead>'+
			'	                		<tr class="active"><th class="text-center" colspan="6">Agregar Nuevo Objetivo</th><th class="text-center">';
										<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
					tablaObjetivos += '	<button type="button" class="btn btn-default btn-sm agregarObjetivo" data-toggle="tooltip" data-placement="top" title="Agregar Objetivo"><span class="glyphicon glyphicon-plus"></span></button></th></tr>';
										<%}%>
					tablaObjetivos += '	<tr class="active"><th class="text-center">Id</th><th class="text-center">Nombre</th><th class="text-center">Descripcion</th><th class="text-center">T. Objetivo</th><th class="text-center">Version</th><th class="text-center">Año</th><th class="text-center">Adminitrar</th></tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaObjetivosPrecargados">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoObjetivos').append(tablaObjetivos);
			$('#tablaObjetivosPrecargados').append(cuerpoTabla);
			$("#dataTablesObjetivos").DataTable();

		}
		
		renderObjetivos();


////>>                 Modal para agregar nuevo Objetivo                 <<////

	$("body").on("click", ".agregarObjetivo",function(event){
		
		if ( $("#modalObjetivo").length )
		{
			$("#modalObjetivo").remove();
		}	
		
		var objetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getObjetivos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	objetivos = JSON.parse(objetivos);
	  	objetivos = objetivos.objetivos
		
		var tipoObjetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getTipoObjetivos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	tipoObjetivos = JSON.parse(tipoObjetivos);
	  	
		var optionTipoObjetivo = "";
	 		
	 	for(var p = 0; p <tipoObjetivos.length; p++){
			optionTipoObjetivo += '<option value="'+tipoObjetivos[p].id+'">'+tipoObjetivos[p].nombre+'</option>';
		}
	  	
		var cuerpoModalObjetivo = "";
		
		cuerpoModalObjetivo =	'<div class="modal fade" id="modalObjetivo" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
								'		        <h4 class="modal-title">Agregar Objetivo</h4>'+   
								'			</div>'+
								'		    <div class="modal-body" id="objetivoCuerpo" >'+
								
								'		      	<div class="row">'+ 
								'		      		<div class="col-md-12">'+
								'						<div class="box box-warning">'+
								'		                	<div class="box-header with-border">'+
								'		                  		<h3 class="box-title"></h3>'+
								'	                  			<div class="box-tools pull-right">'+
								'		                  		</div>'+
								'               			</div>'+//fin box-heder
								'               			<div class="box-body" id="cuerpoModalUsuario">'+
								
								'								<form role="form" id="formularioObjetivo">'+
								'									<div class="table-responsive">'+
								'										<table class="table table-hover">'+
								'											<tbody>'+
								'												<form class="form-horizontal" role="form" id="formulario">'+
								'													<input type="hidden"  name="objetivo_id" value="">'+
								'													<input type="hidden"  name="tipo_objetivo_id" value="">'+
								'													<input type="hidden"  name="metodo_calculo_id" value="">'+
								'													<input type="hidden"  name="desagregacion_tipo_zona_geografica_id" value="">'+
								'													<input type="hidden"  name="tipo_demografica_id" value="">'+
								'													<input type="hidden"  name="fuente_verificacion_id" value="">'+
								'													<input type="hidden"  name="observaciones" value="">'+
								'													<input type="hidden"  name="descripcion" value="">'+ 
								'													<div class="form-group">'+
								'												           <label>Nombre</label>'+
								'												           <input type= "text" class="form-control" placeholder="" id="nombreObjetivo" name="nombre">'+
								'												         </div>'+
								'												          <div class="form-group">'+
								'												           <label>Descripcion</label>'+
								'												           <input type= "text" class="form-control" placeholder="" id="descripcionObjetivo" name="descripcion">'+
								'												         </div>'+
								'												         <div class="form-group">'+
								'												           <label>T. Objetivo</label>'+
								'												           <select class="form-control" placeholder="" id="tipoObjetivo" >'+optionTipoObjetivo+'</select>'+
								'												         </div>'+
								'												          <div class="form-group">'+
								'												           <label>Version</label>'+
								'												           <input type= "number" class="form-control" placeholder="" id="versionObjetivo" name="version">'+
								'												         </div>'+
								'												         <div class="form-group">'+
								'												           <label>Año</label>'+
								'												           <input type= "number" class="form-control" placeholder="" id="anoObjetivo" name="anho">'+
								'												         </div>'+
																				         
								'												         <div class="box-footer">'+
								'												         	<button type="button" class="btn btn-warning guardarObjetivo">Guardar</button>'+
								'												         </div>'+
								'													</form>	'+	
					
								'											</tbody>'+							           
								'										</table>'+
								'									</div>'+
								'								</form>'+
								'               			</div>'+//fin box-body
								'							<div class="modal-footer">'+
	
								'							</div>'+
								'                		</div>'+	
								'                	</div>'+
								'                </div>'+											
					
								'		    </div>'+
						
								'		</div>'+ 
								'	</div>'+
								'</div>'; 
		
		$("body").append(cuerpoModalObjetivo);
		$("#modalObjetivo").modal('show');
	});


////>> Modal para Editar Objetivo  <<////
$("body").on("click", ".editarObjetivo",function(event){
	var parametros = $(this).attr("parametros");
	var idParsed = parametros.split("-"); 
    var objetivoId = idParsed[0];
    var tipoObjetivoId = idParsed[1];
	var version = idParsed[2];
	var anho = idParsed[3];
	
	if ( $("#modalObjetivo").length )
	{
		$("#modalObjetivo").remove();
	}	
	
	var objetivos = $.ajax({
    	url:'/ajaxSelects?accion=getObjetivos&objetivoId='+objetivoId+'&tipoObjetivoId='+tipoObjetivoId+'&versionObjetivoId='+version+'&anhoObjetivoId='+anho,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	objetivos = JSON.parse(objetivos);
  	objetivos = objetivos.objetivos
	
	var tipoObjetivos = $.ajax({
    	url:'/ajaxSelects?accion=getTipoObjetivos',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	tipoObjetivos = JSON.parse(tipoObjetivos);
  	
	var optionTipoObjetivo = "";
 		
 	for(var p = 0; p <tipoObjetivos.length; p++){
		optionTipoObjetivo += '<option value="'+tipoObjetivos[p].id+'">'+tipoObjetivos[p].nombre+'</option>';
	}
  	
 	var objetivoNombre = objetivos[0].nombre.replace(/['""]+/g, '');
 	var objetivoDescripcion = objetivos[0].descripcion.replace(/['""]+/g, '');
 	
	var cuerpoModalObjetivo = "";
	
	cuerpoModalObjetivo =	'<div class="modal fade" id="modalObjetivo" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Editar Objetivo</h4>'+   
							'			</div>'+
							'		    <div class="modal-body" id="objetivoCuerpo" >'+
							
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title"></h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body" id="cuerpoModalUsuario">'+
							
							'								<form role="form" id="formularioObjetivo">'+
							'									<div class="table-responsive">'+
							'										<table class="table table-hover">'+
							'											<tbody>'+
							'												<form class="form-horizontal" role="form" id="formulario">'+

							'													<input type="hidden"  name="objetivo_id"  id="idObjetivo" value="'+objetivos[0].id+'">'+
							'													<input type="hidden"  name="tipo_objetivo_id"  id="tipoObjetivo" value="'+objetivos[0].tipo_objetivo_id+'">'+
							'													<input type="hidden"  name="version"  id="versionObjetivo" value="'+objetivos[0].version+'">'+
							'													<input type="hidden"  name="anho" id="anoObjetivo" value="'+objetivos[0].anho+'">'+							
							
							'													<div class="form-group">'+
							'												           <label>Nombre</label>'+
							'												           <input type= "text" class="form-control" placeholder="" id="nombreObjetivo" name="nombre" value="'+objetivoNombre+'">'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Descripcion</label>'+
							'												           <input type= "text" class="form-control" placeholder="" id="descripcionObjetivo" name="descripcion" value="'+objetivoDescripcion+'">'+
							'												         </div>'+
							/* '												         <div class="form-group">'+
							'												           <label>T. Objetivo</label>'+
							'												           <select class="form-control" placeholder="" id="tipoObjetivo" >'+optionTipoObjetivo+'</select>'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Version</label>'+
							'												           <input type= "number" class="form-control" placeholder="" id="versionObjetivo" name="version" value="'+objetivos[0].version+'">'+
							'												         </div>'+
							'												         <div class="form-group">'+
							'												           <label>Año</label>'+
							'												           <input type= "number" class="form-control" placeholder="" id="anoObjetivo" name="anho" value="'+objetivos[0].anho+'">'+
							'												         </div>'+ */
																			         
							'												         <div class="box-footer">'+
							'												         	<button type="button" class="btn btn-warning actualizarObjetivo">Actualizar</button>'+
							'												         </div>'+
							'													</form>	'+	
				
							'											</tbody>'+							           
							'										</table>'+
							'									</div>'+
							'								</form>'+
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+

							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+											
				
							'		    </div>'+
					
							'		</div>'+ 
							'	</div>'+
							'</div>'; 
	
	$("body").append(cuerpoModalObjetivo);
	//$('#tipoObjetivo > option[value="'+objetivos[0].tipoObjetivo+'"]').attr('selected', 'selected');
	$("#modalObjetivo").modal('show');
});


////>>                 Funcion de Guardado Objetivo                 <<////

	$("body").on("click", ".guardarObjetivo",function(event){
		
		var objetoObj = new Object();
		
		//como esta en la clase 
		objetoObj.nombre = $("#nombreObjetivo").val();
		objetoObj.descripcion = $("#descripcionObjetivo").val(); 
		objetoObj.tipo_objetivo_id = $("#formularioObjetivo").find('select[id="tipoObjetivo"]').val();
		objetoObj.version = $("#versionObjetivo").val();
		objetoObj.anho = $("#anoObjetivo").val();
	
		$.ajax({
			    url: "ajaxInserts?accion=insObjetivo",
			    type: 'POST',
			    dataType: 'json',
			    data: JSON.stringify(objetoObj),
			    contentType: 'application/json',
			    mimeType: 'application/json',
			    success: function (data) {
			    	if(data.success == true){
						alert("Exito!");
						renderObjetivos();
		    		}else{
						alert("ERROR");
					}
			   	},
			    error: function(data,status,er) {}
		});
		 
	});

////>>  Funcion de actualizado de Objetivo <<////
	$("body").on("click", ".actualizarObjetivo",function(event){
		
		var objetoObj = new Object();
		
		//como esta en la clase 
		objetoObj.id = $("#idObjetivo").val();
		objetoObj.nombre = $("#nombreObjetivo").val();
		objetoObj.descripcion = $("#descripcionObjetivo").val(); 
		objetoObj.tipo_objetivo_id = $("#tipoObjetivo").val();
		objetoObj.version = $("#versionObjetivo").val();
		objetoObj.anho = $("#anoObjetivo").val();
	
		$.ajax({
			    url: "ajaxUpdate?accion=actObjetivos",
			    type: 'POST',
			    dataType: 'json',
			    data: JSON.stringify(objetoObj),
			    contentType: 'application/json',
			    mimeType: 'application/json',
			    success: function (data) {
			    	if(data.success == true){
						alert("Exito!");
		    		}else{
						alert("ERROR");
					}
			    	renderObjetivos();
			   	},
			    error: function(data,status,er) {}
		});
		 
	});

////>>                 Funcion de Borrado del Objetivo                 <<////

	$("body").on("click", ".consultaBorrarObjetivo",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		var tipoObjetivoId = idParsed[1];
		var version = idParsed[2];
		var anho = idParsed[3];

		
		if ( $("#consultaModalBorrarObjetivo").length )
		{
			$("#consultaModalBorrarObjetivo").remove();
		}	
		
	  	var objetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getObjetivos&objetivoId='+id+'&tipoObjetivoId='+tipoObjetivoId+'&versionObjetivoId='+version+'&anhoObjetivoId='+anho,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	objetivos = JSON.parse(objetivos);
	  	objetivos = objetivos.objetivos;
	  	
	  	
		var cuerpoModalObjetivo = "";
		
		cuerpoModalObjetivo =	'<div class="modal fade" id="consultaModalBorrarObjetivo" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header" id="agregarTituloModal">'+
								
								'			</div>'+
								'		    <div class="modal-body" id="cuerpoModalBorrarObjetivo" >'+
								'				<h3 class="text-center" id="mensajeBorradoObjetivo"></h3>'+									
								'		    </div>'+
								'		    <div class="modal-body" id="cuerpoModalBorrarObjetivo" >'+
								'				<h3 class="text-center" id="mensajeRestaurarObjetivo"></h3>'+									
								'		    </div>'+
								'			<div class="modal-footer" id="agregarBotonBorradoObjetivo">'+
								
								'			</div>'+
								'			<div class="modal-footer" id="agregarBotonRestaurarObjetivo">'+
								
								'			</div>'+ 
								'		</div>'+ 
								'	</div>'+
								'</div>';
					
		$("body").append(cuerpoModalObjetivo);
		
		if(objetivos[0].borrado == 1){
			$("#agregarTituloModal").html("");
			$("#agregarTituloModal").append('<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">RETAURAR OBJETIVO</h4>');
			$("#mensajeRestaurarObjetivo").html("");
			$("#mensajeRestaurarObjetivo").append('<h3 class="text-center">Ud. esta seguro que desea Restaurar : <strong> '+objetivos[0].nombre+'</strong></h3>');
			$("#agregarBotonRestaurarObjetivo").html("");
			$("#agregarBotonRestaurarObjetivo").append('<button type="button" class="btn btn-success btn-sm borrarObjetivo" id="botonRestaurarObjetivo" parametros='+id+'-'+objetivos[0].tipo_objetivo_id+'-'+objetivos[0].version+'-'+objetivos[0].anho+'-r>Restaurar Objetivo</button>');
			
		}else{
			$("#agregarTituloModal").html("");
			$("#agregarTituloModal").append('<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">BORRAR OBJETIVO</h4>');
			$("#mensajeBorradoObjetivo").html("");
			$("#mensajeBorradoObjetivo").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR : <strong> '+objetivos[0].nombre+'</strong></h3');
			$("#agregarBotonBorradoObjetivo").html("");
			$("#agregarBotonBorradoObjetivo").append('<button type="button" class="btn btn-danger btn-sm borrarObjetivo" id="botonBorradoObjetivo" parametros='+id+'-'+objetivos[0].tipo_objetivo_id+'-'+objetivos[0].version+'-'+objetivos[0].anho+'-b>Borrar Objetivo</button>');
		}
		
		$("#consultaModalBorrarObjetivo").modal('show');
		 
	});
	$("body").on("click", ".borrarObjetivo",function(event){
	var parametros = $(this).attr("parametros");
	var idParsed = parametros.split("-");
	var id = idParsed[0];
	var tipoObjetivoId = idParsed[1];
	var version = idParsed[2];
	var anho = idParsed[3];
	var estado = idParsed[4];
	
	var objetivo = $.ajax({
		url:'/ajaxSelects?accion=getObjetivos&objetivoId='+id+'&tipoObjetivoId='+tipoObjetivoId+'&versionObjetivoId='+version+'&anhoObjetivoId='+anho,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	objetivo = JSON.parse(objetivo);
	objetivo = objetivo.objetivos;
	var objeto = new Object();

	objeto.id = id;
	objeto.tipo_objetivo_id = objetivo[0].tipo_objetivo_id;
	objeto.version = objetivo[0].version;
	objeto.anho = objetivo[0].anho;
	objeto.borrado = objetivo[0].borrado;
	
		$.ajax({
		    url: "ajaxUpdate?accion=actBorrarObjetivos",
		    type: 'POST',
		    dataType: 'json',
		    data: JSON.stringify(objeto),
		    contentType: 'application/json',
		    mimeType: 'application/json',
		    success: function (data) {
		    	if(data.success == true){
					if(estado == "b"){
						$('#mensajeBorradoObjetivo').html('');
						$('#mensajeBorradoObjetivo').append('<h3 class="text-center">SE BORRÓ CON EXITO EL REGISTRO!</h3>');
						$('#agregarBotonBorradoObjetivo').html('');
					}else{
						$('#mensajeRestaurarObjetivo').html('');
						$('#mensajeRestaurarObjetivo').append('<h3 class="text-center">SE RESTAURO CON EXITO EL REGISTRO!</h3>');
						$('#agregarBotonRestaurarObjetivo').html('');
					}
					renderObjetivos();
		    	}else{
					$("#mensajeBorradoObjetivo").html("");
					$("#mensajeBorradoObjetivo").append('<h3 class="text-center">Error al intentar Borrar este Registro!!</h3>');
					$('#agregarBotonBorradoObjetivo').html('');
				}
		    	
		    },
		    //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		    error: function(data,status,er) {}
		});		
		
	});

});


</script>

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
          <ol class="breadcrumb">
            <li id="f1c2"><i class="fa fa-dashboard"></i> </li>
            <li id="f2c2" ></li>
            <li id="f3c2" ></li>
            <li id="f4c2" ></li>
            <li id="f5c2"></li>
            <li id="f6c2" class="active"></li>
          </ol>
        </section>

	<!-- Main content -->
	<section class="content" id="cuerpoObjetivo">

	<div class="row">
		<div class="col-md-12">
        	<div class="box" height="1000px">
          		<div class="box-header with-border" height="1000px">
            		<h3 class="box-title">Objetivos</h3>
            		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
          		</div>
          		<div class="box-body" id="cuerpoObjetivos">
          		</div>		
   			</div>
		</div>
	</div>     
           
      
	</section><!-- /.content/section -->
	
</div><!-- /.content-wrapper -->

      <footer class="main-footer"> 
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
      </footer>

      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
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
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>
    
    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>

    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
    <%  } else { %>
			<p>Favor Iniciar Sesion</p>
	<%  } %>



























<%-- <% AttributePrincipalImpl user = (AttributePrincipalImpl) request.getUserPrincipal();
if (user != null) { %>
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
 --%>
<%-- 
<style>
textarea { text-transform: uppercase; }
</style>
<script>
var entidad;
var entidades;

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
          <ol class="breadcrumb">
            <li id="f1c2"><i class="fa fa-dashboard"></i> </li>
            <li id="f2c2" ></li>
            <li id="f3c2" ></li>
            <li id="f4c2" ></li>
            <li id="f5c2"></li>
            <li id="f6c2" class="active"></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
          <!-- Info row de buscador de productos -->
         <div class="row">
			<%@ include file="/frames/objetivo-formulario.jsp" %>
          </div><!-- /.row -->

          --%> 
       
     


  </body>
</html>
