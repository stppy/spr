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

/////////TABLA DE OBJETIVOS SUGERIDOS CARGADOS		
		function renderObjetivos(){
			
			var tablaObjetivosSugeridos = "";
			var cuerpoTablaSugeridos = "";
			$("#cuerpoObjetivosSugeridos").html("");
			
		  	var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	objetivos = JSON.parse(objetivos);
			objetivos = objetivos.objetivos
			
			var objetivoSugerido = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivoSugerido',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			objetivoSugerido = JSON.parse(objetivoSugerido);
			objetivoSugerido = objetivoSugerido.sugeridos
			
		  	var tipoObjetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getTipoObjetivos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	tipoObjetivos = JSON.parse(tipoObjetivos);
		  	
		  	var cuerpoTablaSugeridos="";
		  	var nombreObjetivo;
			var tipoObjetivo;
			var nombreObjetivoSugerido;
			var tipoObjetivoSugerido;
			
			
		  	for(var q = 0; q < objetivoSugerido.length; q++){
		  		
		  		//cambio del id del objetivo por el nombre del mismo
				nombreObjetivo = "";
		  		
				for(var p = 0; p < objetivos.length; p++){
					if (objetivoSugerido[q].objetivoId == objetivos[p].id && objetivoSugerido[q].tipoObjetivoId==objetivos[p].tipo_objetivo_id){
						nombreObjetivo = objetivos[p].nombre;
					}
				}
		  		//cambio del id del tipo objetivo por el nombre del mismo
		  		tipoObjetivo = "";
		  		
				for(var p = 0; p < tipoObjetivos.length; p++){
					if (objetivoSugerido[q].tipoObjetivoId == tipoObjetivos[p].id){
						tipoObjetivo = tipoObjetivos[p].nombre;
					}
				}
				
				//cambio del id del objetivo sugerido por el nombre del mismo
				nombreObjetivoSugerido = "";
		  		
				for(var p = 0; p < objetivos.length; p++){
					if (objetivoSugerido[q].objetivoSugeridoId == objetivos[p].id && objetivoSugerido[q].objetivoSugeridoTipoId==objetivos[p].tipo_objetivo_id){
						nombreObjetivoSugerido = objetivos[p].nombre;
					}
				}
				//cambio del id del objetivo sugerido por el nombre del mismo
				tipoObjetivoSugerido = "";
		  		
				for(var p = 0; p < tipoObjetivos.length; p++){
					if (objetivoSugerido[q].objetivoSugeridoTipoId == tipoObjetivos[p].id){
						tipoObjetivoSugerido = tipoObjetivos[p].nombre;
					}
				}
				
				
				if(objetivoSugerido[q].borrado == true)
				{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
					cuerpoTablaSugeridos += '<tr><td><del>'+objetivoSugerido[q].objetivoId+'</del></td><td><del>'+nombreObjetivo+'</del></td><td><del>'+tipoObjetivo+'</del></td><td><del>'+objetivoSugerido[q].objetivoAnho+'</del></td><td><del>'+objetivoSugerido[q].objetivoVersion+'</del></td><td><del>'+objetivoSugerido[q].objetivoSugeridoId+'</del></td><td><del>'+nombreObjetivoSugerido+'</del></td><td><del>'+tipoObjetivoSugerido+'</del></td><td><del>'+objetivoSugerido[q].objetivoSugeridoAnho+'</del></td><td><del>'+objetivoSugerido[q].objetivoSugeridoVersion+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarObjetivoSugerido" data-toggle="tooltip" data-placement="top" title="Restaurar Objetivo" parametros="'+objetivoSugerido[q].objetivoId+'-'+objetivoSugerido[q].tipoObjetivoId+'-'+objetivoSugerido[q].objetivoAnho+'-'+objetivoSugerido[q].objetivoVersion+'-'+objetivoSugerido[q].objetivoSugeridoId+'-'+objetivoSugerido[q].objetivoSugeridoTipoId+'-'+objetivoSugerido[q].objetivoSugeridoAnho+'-'+objetivoSugerido[q].objetivoSugeridoVersion+'"><span class="fa fa-recycle"></span></button></td></tr>';
					<%}%>
				}else{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
					cuerpoTablaSugeridos += '<tr><td>'+objetivoSugerido[q].objetivoId+'</td><td>'+nombreObjetivo+'</td><td>'+tipoObjetivo+'</td><td>'+objetivoSugerido[q].objetivoAnho+'</td><td>'+objetivoSugerido[q].objetivoVersion+'</td><td>'+objetivoSugerido[q].objetivoSugeridoId+'</td><td>'+nombreObjetivoSugerido+'</td><td>'+tipoObjetivoSugerido+'</td><td>'+objetivoSugerido[q].objetivoSugeridoAnho+'</td><td>'+objetivoSugerido[q].objetivoSugeridoVersion+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarObjetivoSugerido" data-toggle="tooltip" data-placement="top" title="Borrar Objetivo" parametros="'+objetivoSugerido[q].objetivoId+'-'+objetivoSugerido[q].tipoObjetivoId+'-'+objetivoSugerido[q].objetivoAnho+'-'+objetivoSugerido[q].objetivoVersion+'-'+objetivoSugerido[q].objetivoSugeridoId+'-'+objetivoSugerido[q].objetivoSugeridoTipoId+'-'+objetivoSugerido[q].objetivoSugeridoAnho+'-'+objetivoSugerido[q].objetivoSugeridoVersion+'"><span class="glyphicon glyphicon-trash"></span></button></td></tr>';
					<%} if (attributes.get("role_id").toString().equals("3")){%>
					cuerpoTablaSugeridos += '<tr><td>'+objetivoSugerido[q].objetivoId+'</td><td>'+nombreObjetivo+'</td><td>'+tipoObjetivo+'</td><td>'+objetivoSugerido[q].objetivoAnho+'</td><td>'+objetivoSugerido[q].objetivoVersion+'</td><td>'+objetivoSugerido[q].objetivoSugeridoId+'</td><td>'+nombreObjetivoSugerido+'</td><td>'+tipoObjetivoSugerido+'</td><td>'+objetivoSugerido[q].objetivoSugeridoAnho+'</td><td>'+objetivoSugerido[q].objetivoSugeridoVersion+'</td><td></td></tr>';
					<%}%>
				}	 
				
			}
			
			var tablaObjetivosSugeridos ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesObjetivosSugeridos">'+
			'	                	<thead>'+
									'	<tr class="active"><th class="text-center">Id Objetivo</th><th class="text-center">Nombre Objetivo</th><th class="text-center">Tipo Objetivo</th><th class="text-center">Año Objetivo</th><th class="text-center">Versión Objetivo</th><th class="text-center">Id Objetivo Sugerido</th><th class="text-center">Nombre Sugerido</th><th class="text-center">Tipo Sugerido</th><th class="text-center">Año Sugerido</th><th class="text-center">Versión Sugerido</th><th class="text-center"></th></tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaObjetivosSugeridosPrecargados">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoObjetivosSugeridos').append(tablaObjetivosSugeridos);
			$('#tablaObjetivosSugeridosPrecargados').append(cuerpoTablaSugeridos);
			$("#dataTablesObjetivosSugeridos").DataTable();
			

		}
		
		renderObjetivos();//TODO: dos renders para lo mismo no esta bueno, hay que areglar esto
		
////////SELECT PARA Resultado Esperado Sugerido
	function renderSeleccionador1(){
			
			var tablaObjetivos1 = "";
			var cuerpoTabla1 = "";
			$("#cuerpoObjetivos1").html("");
			
		  	var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos&borrado='+false,
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
		  	
		  	var cuerpoTabla1="";
			
			//condicion para cargar el select
			var optionObjetivosGestion ="";
			var optionObjetivosResultado1 ="";
			
			
		  	for(var q = 0; q < objetivos.length; q++){
		  		
					if(objetivos[q].tipo_objetivo_id == 3){
						optionObjetivosGestion += '<option value="'+objetivos[q].id+'">'+objetivos[q].id+') '+objetivos[q].nombre+'</option>';
					}
					if(objetivos[q].tipo_objetivo_id == 2){
						optionObjetivosResultado1 += '<option value="'+objetivos[q].id+'">'+objetivos[q].id+') '+objetivos[q].nombre+'</option>';
					}
		  		
			}
			 var tablaObjetivos1 ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesObjetivos1">'+
			'	                	<thead>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaObjetivosPrecargados1">'+
										'<tr>'+
											'<td class="col-md-5">'+
												'<label>Objetivos por Gestión</label>'+
												'<select class="form-control select-objetivos-gestion" id="objetivosGestion">'+optionObjetivosGestion+'</select>'+
											'</td>'+
											'<td class="col-md-6">'+
												'<label>Objetivos por Resultado</label>'+
												'<select class="form-control select-objetivos-resultados" id="objetivosResultados1">'+optionObjetivosResultado1+'</select>'+
											'</td>'+
											'<td class="col-md-1">';
												<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
												tablaObjetivos1 += '<button type="button" class="btn btn-default btn-sm guardarResultadoEsperadoSugerido1" data-toggle="tooltip" data-placement="top" title="Agregar Objetivo"><span class="glyphicon glyphicon-plus"></span></button>';
												<%}%>
						tablaObjetivos1 += 	'</td>'+
										'</tr>'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoObjetivos1').append(tablaObjetivos1);
			//$('#tablaObjetivosPrecargados1').append(cuerpoTabla1);
			//$("#dataTablesObjetivos1").DataTable(); 
			
		}
		
		renderSeleccionador1();
		
////////SELECT PARA Objetivo Estrategico Sugerido
function renderSeleccionador2(){
			
			var tablaObjetivos2 = "";
			var cuerpoTabla2 = "";
			$("#cuerpoObjetivos2").html("");
			
		  	var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos&borrado='+false,
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
		  	
		  	var cuerpoTabla2="";
		  	
		  	//condicion para cargar el select
			var optionObjetivosResultado2 ="";
			var optionObjetivosEstrategico ="";
			
		  	for(var q = 0; q < objetivos.length; q++){
		  		
					if(objetivos[q].tipo_objetivo_id == 2){
						optionObjetivosResultado2 += '<option value="'+objetivos[q].id+'">'+objetivos[q].id+') '+objetivos[q].nombre+'</option>';
					}
					if(objetivos[q].tipo_objetivo_id == 1){
						optionObjetivosEstrategico += '<option value="'+objetivos[q].id+'">'+objetivos[q].id+') '+objetivos[q].nombre+'</option>';
					}
		  		
				
			}
			

		  	
			 var tablaObjetivos2 ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesObjetivos2">'+
			'	                	<thead>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaObjetivosPrecargados2">'+
										'<tr>'+
											'<td class="col-md-5">'+
												'<label>Objetivos por Resultado</label>'+
												'<select class="form-control select-objetivos-resultados" id="objetivosResultados2">'+optionObjetivosResultado2+'</select>'+
											'</td>'+
											'<td class="col-md-6">'+
												'<label>Objetivos Estrategicos</label>'+
												'<select class="form-control select-objetivos-estrategicos" id="objetivosEstrategicos">'+optionObjetivosEstrategico+'</select>'+
											'</td>'+
											'<td class="col-md-1">';
												<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
												tablaObjetivos2 += '<button type="button" class="btn btn-default btn-sm guardarResultadoEsperadoSugerido2" data-toggle="tooltip" data-placement="top" title="Agregar Objetivo"><span class="glyphicon glyphicon-plus"></span></button>';
												<%}%>	
						tablaObjetivos2 += 	'</td>'+
										'</tr>'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoObjetivos2').append(tablaObjetivos2);
			//$('#tablaObjetivosPrecargados2').append(cuerpoTabla2);
			//$("#dataTablesObjetivos2").DataTable(); 
			

		}
		
		renderSeleccionador2();

		
///>>                 Funcion de Guardado Resultado Esperado Sugerido               <<////

		$("body").on("click", ".guardarResultadoEsperadoSugerido1",function(event){
			
			var objetoObj = new Object();
						
			//como esta en la clase 
			var objetivoId = $("#tablaObjetivosPrecargados1").find('select[id="objetivosGestion"]').val();
			var objetivoSugeridoId = $("#tablaObjetivosPrecargados1").find('select[id="objetivosResultados1"]').val();
			
			objetoObj.objetivoId = objetivoId
			objetoObj.objetivoSugeridoId = objetivoSugeridoId
		
		  	var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos&objetivoId='+objetivoId+'&tipoObjetivoId=3',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	objetivos = JSON.parse(objetivos);
			objetivos = objetivos.objetivos
			
			objetoObj.objetivoAnho = objetivos[0].anho;
			objetoObj.objetivoVersion = objetivos[0].version;
			objetoObj.tipoObjetivoId = objetivos[0].tipo_objetivo_id;
			
		  	var objetivosSugerido = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos&objetivoId='+objetivoSugeridoId+'&tipoObjetivoId=2',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	objetivosSugerido = JSON.parse(objetivosSugerido);
		  	objetivosSugerido = objetivosSugerido.objetivos
			
			objetoObj.objetivoSugeridoAnho = objetivosSugerido[0].anho;
			objetoObj.objetivoSugeridoVersion = objetivosSugerido[0].version;
			objetoObj.objetivoSugeridoTipoId = objetivosSugerido[0].tipo_objetivo_id;
			
			$.ajax({
				    url: "ajaxInserts?accion=insObjetivoSugerido",
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
							alert("ERROR! Registro duplicado.");
						}
				   	},
				    error: function(data,status,er) {}
			});
			 
		});
		
$("body").on("click", ".guardarResultadoEsperadoSugerido2",function(event){
			
			var objetoObj = new Object();
						
			//como esta en la clase 
			var objetivoId = $("#tablaObjetivosPrecargados2").find('select[id="objetivosResultados2"]').val();
			var objetivoSugeridoId = $("#tablaObjetivosPrecargados2").find('select[id="objetivosEstrategicos"]').val();
			
			objetoObj.objetivoId = objetivoId
			objetoObj.objetivoSugeridoId = objetivoSugeridoId
		
		  	var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos&objetivoId='+objetivoId+'&tipoObjetivoId=2',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	objetivos = JSON.parse(objetivos);
			objetivos = objetivos.objetivos
			
			objetoObj.objetivoAnho = objetivos[0].anho;
			objetoObj.objetivoVersion = objetivos[0].version;
			objetoObj.tipoObjetivoId = objetivos[0].tipo_objetivo_id;
			
		  	var objetivosSugerido = $.ajax({
		    	url:'/ajaxSelects?accion=getObjetivos&objetivoId='+objetivoSugeridoId+'&tipoObjetivoId=1',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	objetivosSugerido = JSON.parse(objetivosSugerido);
		  	objetivosSugerido = objetivosSugerido.objetivos
			
			objetoObj.objetivoSugeridoAnho = objetivosSugerido[0].anho;
			objetoObj.objetivoSugeridoVersion = objetivosSugerido[0].version;
			objetoObj.objetivoSugeridoTipoId = objetivosSugerido[0].tipo_objetivo_id;
			
			$.ajax({
				    url: "ajaxInserts?accion=insObjetivoSugerido",
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
							alert("ERROR! Registro duplicado.");
						}
				   	},
				    error: function(data,status,er) {}
			});
			 
		});

////>>                 Funcion de Borrado del Objetivo                 <<////

	$("body").on("click", ".consultaBorrarObjetivoSugerido",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var objetivoId = idParsed[0];
		var tipoObjetivoId = idParsed[1];
		var objetivoAnho = idParsed[2];
		var objetivoVersion = idParsed[3];
		var objetivoSugeridoId = idParsed[4];
		var objetivoSugeridoTipoId = idParsed[5];
		var objetivoSugeridoAnho = idParsed[6];
		var objetivoSugeridoVersion = idParsed[7];
		
		
		
		if ( $("#consultaModalBorrarObjetivoSugerido").length )
		{
			$("#consultaModalBorrarObjetivoSugerido").remove();
		}	
		
		
		
	  	var objetivoSugerido = $.ajax({
	    	url:'/ajaxSelects?accion=getObjetivoSugerido&objetivoId='+objetivoId+'&tipoObjetivoId='+tipoObjetivoId+'&objetivoAnho='+objetivoAnho+'&objetivoVersion='+objetivoVersion+'&objetivoSugeridoId='+objetivoSugeridoId+'&objetivoSugeridoTipoId='+objetivoSugeridoTipoId+'&objetivoSugeridoAnho='+objetivoSugeridoAnho+'&objetivoSugeridoVersion='+objetivoSugeridoVersion,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	objetivoSugerido = JSON.parse(objetivoSugerido);
		objetivoSugerido = objetivoSugerido.sugeridos
	  	
		var objetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getObjetivos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	objetivos = JSON.parse(objetivos);
		objetivos = objetivos.objetivos
		
		var nombreObjetivo;
		//cambio del id del objetivo por el nombre del mismo
		nombreObjetivo = "";
		for(var q = 0; q < objetivoSugerido.length; q++){
			for(var p = 0; p < objetivos.length; p++){
				if (objetivoSugerido[q].objetivoId == objetivos[p].id){
					nombreObjetivo = objetivos[p].nombre;
				}
			}
		}
		
		var cuerpoModalObjetivoSugerido = "";
		
		cuerpoModalObjetivoSugerido =	'<div class="modal fade" id="consultaModalBorrarObjetivoSugerido" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
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
					
		$("body").append(cuerpoModalObjetivoSugerido);
		
		if(objetivoSugerido[0].borrado == 1){
			$("#agregarTituloModal").html("");
			$("#agregarTituloModal").append('<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">RETAURAR OBJETIVO</h4>');
			$("#mensajeRestaurarObjetivo").html("");
			$("#mensajeRestaurarObjetivo").append('<h3 class="text-center">Ud. esta seguro que desea Restaurar : <strong> '+objetivoSugerido[0].objetivoId+') '+nombreObjetivo+'</strong></h3>');
			$("#agregarBotonRestaurarObjetivo").html("");
			$("#agregarBotonRestaurarObjetivo").append('<button type="button" class="btn btn-success btn-sm borrarObjetivo" id="botonRestaurarObjetivo" parametros='+objetivoSugerido[0].objetivoId+'-'+objetivoSugerido[0].tipoObjetivoId+'-'+objetivoSugerido[0].objetivoAnho+'-'+objetivoSugerido[0].objetivoVersion+'-'+objetivoSugerido[0].objetivoSugeridoId+'-'+objetivoSugerido[0].objetivoSugeridoTipoId+'-'+objetivoSugerido[0].objetivoSugeridoAnho+'-'+objetivoSugerido[0].objetivoSugeridoVersion+'-r>Restaurar Objetivo</button>');
			
		}else{
			$("#agregarTituloModal").html("");
			$("#agregarTituloModal").append('<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">BORRAR OBJETIVO</h4>');
			$("#mensajeBorradoObjetivo").html("");
			$("#mensajeBorradoObjetivo").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR : <strong> '+objetivoSugerido[0].objetivoId+') '+nombreObjetivo+'</strong></h3');
			$("#agregarBotonBorradoObjetivo").html("");
			$("#agregarBotonBorradoObjetivo").append('<button type="button" class="btn btn-danger btn-sm borrarObjetivo" id="botonBorradoObjetivo" parametros='+objetivoSugerido[0].objetivoId+'-'+objetivoSugerido[0].tipoObjetivoId+'-'+objetivoSugerido[0].objetivoAnho+'-'+objetivoSugerido[0].objetivoVersion+'-'+objetivoSugerido[0].objetivoSugeridoId+'-'+objetivoSugerido[0].objetivoSugeridoTipoId+'-'+objetivoSugerido[0].objetivoSugeridoAnho+'-'+objetivoSugerido[0].objetivoSugeridoVersion+'-b>Borrar Objetivo</button>');
		}
		
		$("#consultaModalBorrarObjetivoSugerido").modal('show');
		 
	});
	/*
	function ocultarModal(){
	    $('#hola').on('show.bs.modal', function(){
	        var myModal = $(this);
	        clearTimeout(myModal.data('hideInterval'));
	        myModal.data('hideInterval', setTimeout(function(){
	            myModal.modal('hide');
	        }, 1500));
	    });
	};*/
	
	$("body").on("click", ".borrarObjetivo",function(event){
		var parametros = $(this).attr("parametros");
		var idParsed = parametros.split("-");
		var objetivoId = idParsed[0];
		var tipoObjetivoId = idParsed[1];
		var objetivoAnho = idParsed[2];
		var objetivoVersion = idParsed[3];
		var objetivoSugeridoId = idParsed[4];
		var objetivoSugeridoTipoId = idParsed[5];
		var objetivoSugeridoAnho = idParsed[6];
		var objetivoSugeridoVersion = idParsed[7];
		var estado = idParsed[8];
	
		var objetivoSugerido = $.ajax({
	    	url:'/ajaxSelects?accion=getObjetivoSugerido&objetivoId='+objetivoId+'&tipoObjetivoId='+tipoObjetivoId+'&objetivoAnho='+objetivoAnho+'&objetivoVersion='+objetivoVersion+'&objetivoSugeridoId='+objetivoSugeridoId+'&objetivoSugeridoTipoId='+objetivoSugeridoTipoId+'&objetivoSugeridoAnho='+objetivoSugeridoAnho+'&objetivoSugeridoVersion='+objetivoSugeridoVersion,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	objetivoSugerido = JSON.parse(objetivoSugerido);
		objetivoSugerido = objetivoSugerido.sugeridos
		var objeto = new Object();
	
		objeto.objetivoId = objetivoSugerido[0].objetivoId;
		objeto.tipoObjetivoId = objetivoSugerido[0].tipoObjetivoId;
		objeto.objetivoAnho = objetivoSugerido[0].objetivoAnho;
		objeto.objetivoVersion = objetivoSugerido[0].objetivoVersion;
		objeto.objetivoSugeridoId = objetivoSugerido[0].objetivoSugeridoId;
		objeto.objetivoSugeridoTipoId = objetivoSugerido[0].objetivoSugeridoTipoId;
		objeto.objetivoSugeridoAnho = objetivoSugerido[0].objetivoSugeridoAnho;
		objeto.objetivoSugeridoVersion = objetivoSugerido[0].objetivoSugeridoVersion;
		objeto.borrado = objetivoSugerido[0].borrado;
	
	
	
		$.ajax({
		    url: "ajaxUpdate?accion=actBorrarObjetivosSugeridos",
		    type: 'POST',
		    dataType: 'json',
		    data: JSON.stringify(objeto),
		    contentType: 'application/json',
		    mimeType: 'application/json',
		    success: function (data) {
		    	if(data.success == true){
					if(estado == "b"){
						/*if ( $("#consultaModalBorrarObjetivoSugerido").length ){
							$("#consultaModalBorrarObjetivoSugerido").remove();
						}
						var nuevoModal = '	<div id="modalMensajeBorrado" class="modal fade">'+
						   				 '		<div class="modal-dialog">'+
										 '	        <div class="modal-content">'+
										 ' 	            <div class="modal-body">'+
										 '	                <h3 class="text-center">SE BORRÓ CON EXITO EL REGISTRO!</h3>'+
										 '	            </div>'+
										 '	        </div> '+
										 '	    </div>'+
										 '	</div>';
						$("body").append(nuevoModal);
						$("#modalMensajeBorrado").modal('show');	*/	
						
	 				  /*  $('#hola').on('show.bs.modal', function (){
					        var myModal = $(this);
					        clearTimeout(myModal.data('hideInterval'));
					        myModal.data('hideInterval', setTimeout(function(){
					            myModal.modal('hide');
					        }, 1500));
					    });*/
						
						$('#mensajeBorradoObjetivo').html('');
						$('#mensajeBorradoObjetivo').append('<h3 class="text-center">SE BORRÓ CON EXITO EL REGISTRO!</h3>');
						$('#agregarBotonBorradoObjetivo').html('');
					}else{
						/*if ( $("#consultaModalBorrarObjetivoSugerido").length ){
							$("#consultaModalBorrarObjetivoSugerido").remove();
						}
						var nuevoModal = '	<div id="modalMensajeRestaurado" class="modal fade">'+
						   				 '		<div class="modal-dialog">'+
										 '	        <div class="modal-content">'+
										 ' 	            <div class="modal-body">'+
										 '	                <h3 class="text-center">SE RESTAURO CON EXITO EL REGISTRO!</h3>'+
										 '	            </div>'+
										 '	        </div> '+
										 '	    </div>'+
										 '	</div>';
						$("body").append(nuevoModal);
						$("#modalMensajeRestaurado").modal('show');*/
						
						$('#mensajeRestaurarObjetivo').html('');
						$('#mensajeRestaurarObjetivo').append('<h3 class="text-center">SE RESTAURO CON EXITO EL REGISTRO!</h3>');
						$('#agregarBotonRestaurarObjetivo').html('');
					}
					renderObjetivos();
					
					
					//ocultarModal();
					/*var myModal = "#hola";
			        clearTimeout(myModal.data('hideInterval'));
			        myModal.data('hideInterval', setTimeout(function(){
			            myModal.modal('hide');
			        }, 1500));*/
		    	}else{
					$("#mensajeBorradoObjetivo").html("");
					$("#mensajeBorradoObjetivo").append('<h3 class="text-center">Error al intentar Borrar este Registro!!!</h3>');
					$('#agregarBotonBorradoObjetivo').html('');
				}
		    	
		    },
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
          		<div class="box-header with-border" height="1000px" align="center">
            		<h3 class="box-title">Resultado Esperado Sugerido</h3>
            		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
          		</div>
          		<div class="box-body" id="cuerpoObjetivos1">
          		</div>		
   			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
        	<div class="box" height="1000px">
          		<div class="box-header with-border" height="1000px" align="center">
            		<h3 class="box-title">Objetivo Estrategico Sugerido</h3>
            		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
          		</div>
          		<div class="box-body" id="cuerpoObjetivos2">
          		</div>		
   			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
        	<div class="box" height="1000px">
          		<div class="box-header with-border" height="1000px" align="center">
            		<h3 class="box-title" >Objetivos Sugeridos</h3>
            		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
          		</div>
          		<div class="box-body" id="cuerpoObjetivosSugeridos">
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

  </body>
</html>
