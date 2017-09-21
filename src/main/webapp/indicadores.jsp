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
	
	<!-- bootstrap datepicker css  -->
	<link href="plugins/datepicker/datepicker3.css" rel="stylesheet">
	
</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>
	
<script>
//ex include /frame/programacion.js
var entidad=<%=attributes.get("entidad_id") %>;
var nivel=<%=attributes.get("nivel_id") %>;
var entidades;
//ISO-8859-1
<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1")){%>
$(document).ready(function(){

		function renderIndicadores(){
			
			var tablaIndicadores = "";
			var cuerpoTabla = "";
			$("#cuerpoIndicadores").html("");
			
		  	var indicadores = $.ajax({
		    	url:'/ajaxSelects?accion=getIndicador',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	indicadores = JSON.parse(indicadores);
		  	indicadores = indicadores.indicadores;
		  	
			var tipoIndicador = $.ajax({
		    	url:'/ajaxSelects?accion=getTipoIndicador',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			tipoIndicador = JSON.parse(tipoIndicador);
			
			var unidadesMedida = $.ajax({
		    	url:'/ajaxSelects?accion=getUnidadesMedida',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			unidadesMedida = JSON.parse(unidadesMedida);
			unidadesMedida = unidadesMedida.unidadesMedida;
			
/* 			var fuenteVerificacion = $.ajax({
		    	url:'/ajaxSelects?accion=getFuenteVerificacion',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			fuenteVerificacion = JSON.parse(fuenteVerificacion); */
			
			var objetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getResultados',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			objetivos = JSON.parse(objetivos);
			objetivos = objetivos.resultados;
			
			var coberturaGeograficaAlcance = $.ajax({
		    	url:'/ajaxSelects?accion=getCoberturaGeograficaAlcance',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			coberturaGeograficaAlcance = JSON.parse(coberturaGeograficaAlcance);
			
			var nivelDespliegueGeografico = $.ajax({
		    	url:'/ajaxSelects?accion=getNivelDespliegueGeografico',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			nivelDespliegueGeografico = JSON.parse(nivelDespliegueGeografico);
			
			var coberturaDemograficaAlcance = $.ajax({
		    	url:'/ajaxSelects?accion=getCoberturaDemograficaAlcance',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			coberturaDemograficaAlcance = JSON.parse(coberturaDemograficaAlcance);
			
			var nivelDespliegueDemografico = $.ajax({
		    	url:'/ajaxSelects?accion=getNivelDespliegueDemografico',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			nivelDespliegueDemografico = JSON.parse(nivelDespliegueDemografico);
																											
			var optionTipoIndicador;
			var optionUnidadesMedida;
			var optionFuenteVerificacion;
			var optionObjetivos;
			var optionCoberturaGeograficaAlcance;
			var optionNivelDespliegueGeografico;
			var optionCoberturaDemograficaAlcance;
			var optionNivelDespliegueDemografico;
		  	var cuerpoTabla="";
		  	
			for(var q = 0; q < indicadores.length; q++){
				
				optionTipoIndicador = "";
				optionUnidadesMedida = "";
				optionFuenteVerificacion = "";
				optionObjetivos = "";
				optionCoberturaGeograficaAlcance = "";
				optionNivelDespliegueGeografico = "";
				optionCoberturaDemograficaAlcance = "";
				optionNivelDespliegueDemografico = "";


				for(var t = 0; t < tipoIndicador.length; t++){
					if(tipoIndicador[t].id ==  indicadores[q].tipo_indicador_id){
						optionTipoIndicador = tipoIndicador[t].nombre;
					}
				}
				
				for(var u = 0; u < unidadesMedida.length; u++){
					if(unidadesMedida[u].codigoUnidadMedida == indicadores[q].unidad_medida_id){
						optionUnidadesMedida = unidadesMedida[u].nombre;
					}
				}
				
/* 				for(var f = 0; f < fuenteVerificacion.length; f++){
					if(fuenteVerificacion[f].id == indicadores[q].fuente_verificacion_id){
						optionFuenteVerificacion = fuenteVerificacion[f].nombre;
					}
				} */
				
				for(var o = 0; o < objetivos.length; o++){
					if(objetivos[o].id == indicadores[q].objetivo_id){
						optionObjetivos = objetivos[o].nombre;
					}
				}
				
				for(var a = 0; a < coberturaGeograficaAlcance.length; a++){
					if(coberturaGeograficaAlcance[a].id == indicadores[q].coberturaGeograficaAlcance){
						optionCoberturaGeograficaAlcance = coberturaGeograficaAlcance[a].nombre;
					}
				}
				
				for(var s = 0; s < nivelDespliegueGeografico.length; s++){
					if(nivelDespliegueGeografico[s].id == indicadores[q].NivelDespliegueGeograficoDesagregacion){
						optionNivelDespliegueGeografico = nivelDespliegueGeografico[s].nombre;
					}
				}
				
				for(var d = 0; d < coberturaDemograficaAlcance.length; d++){
					if(coberturaDemograficaAlcance[d].id == indicadores[q].coberturaDemograficaAlcance){
						optionCoberturaDemograficaAlcance = coberturaDemograficaAlcance[d].nombre;
					}
				}
				
				for(var f = 0; f < nivelDespliegueDemografico.length; f++){
					if(nivelDespliegueDemografico[f].id == indicadores[q].NivelDespliegueDemograficoDesagregacion){
						optionNivelDespliegueDemografico = nivelDespliegueDemografico[f].nombre;
					}
				}
				
				if(indicadores[q].borrado == true)
				{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
						cuerpoTabla += '<tr><td><del>'+indicadores[q].id+'</del></td><td><del>'+indicadores[q].nombre+'</del></td><td><del>'+optionTipoIndicador+'</del></td>'+
						//'<td><del>'+indicadores[q].metodo_calculo_id+'</del></td>'+
						'<td><del>'+optionUnidadesMedida+'</del></td><td><del>'+indicadores[q].frecuencia_meses+'</del></td><td><del>'+indicadores[q].fuente_verificacion_id+'</del></td>'+
						//'<td><del>'+indicadores[q].observaciones+'</del></td><td><del>'+optionObjetivos+'</del></td><td><del>'+optionCoberturaGeograficaAlcance+'</del></td><td><del>'+optionNivelDespliegueGeografico+'</del></td><td><del>'+optionCoberturaDemograficaAlcance+'</del></td><td><del>'+optionNivelDespliegueDemografico+'</del></td>'+
						'<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarIndicador" data-toggle="tooltip" data-placement="top" title="Restaurar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'"><span class="fa fa-recycle"></span></button></td></tr>';
					<%}%>
				}else{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
						cuerpoTabla += '<tr><td>'+indicadores[q].id+'</td><td>'+indicadores[q].nombre+'</td><td>'+optionTipoIndicador+'</td>'+
						//'<td>'+indicadores[q].metodo_calculo_id+'</td>'+
						'<td>'+optionUnidadesMedida+'</td><td>'+indicadores[q].frecuencia_meses+'</td><td>'+indicadores[q].fuente_verificacion_id+'</td>'+
						//'<td>'+indicadores[q].observaciones+'</td><td>'+optionObjetivos+'</td><td>'+optionCoberturaGeograficaAlcance+'</td><td>'+optionNivelDespliegueGeografico+'</td><td>'+optionCoberturaDemograficaAlcance+'</td><td>'+optionNivelDespliegueDemografico+'</td>'+
						'<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarIndicador" data-toggle="tooltip" data-placement="top" title="Editar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'"><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarIndicador" data-toggle="tooltip" data-placement="top" title="Borrar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'"><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm modalMetas" data-toggle="tooltip" data-placement="top" title="Agregar Meta" parametros="'+indicadores[q].id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'"><span class="glyphicon glyphicon-list-alt"></span></button></td></tr>';
						//cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td><td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Usuario" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Borrar Usuario" parametros="'+usuarios[q].id+'"><span class="glyphicon glyphicon-trash"></span></button></td></tr>';			
					<%} if (attributes.get("role_id").toString().equals("3")){%>
						cuerpoTabla +='<tr><td>'+indicadores[q].id+'</td>'+ 
						'<tr><td>'+indicadores[q].nombre+'</td>'+
						'<td>'+optionTipoIndicador+'</td>'+
						//'<td>'+indicadores[q].metodo_calculo_id+'</td>'+
						'<td>'+optionUnidadesMedida+'</td>'+
						'<td>'+indicadores[q].frecuencia_meses+'</td>'+
						'<td>'+indicadores[q].fuente_verificacion_id+'</td>'+
/* 						'<td>'+indicadores[q].observaciones+'</td>'+
						'<td>'+optionObjetivos+'</td>'+
						'<td>'+optionCoberturaGeograficaAlcance+'</td>'+
						'<td>'+optionNivelDespliegueGeografico+'</td>'+
						'<td>'+optionCoberturaDemograficaAlcance+'</td>'+
						'<td>'+optionNivelDespliegueDemografico+'</td>'+ */
						'<td></td></tr>';
						//cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td><td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
					<%}%>
				}	
			}
			
			
			var tablaIndicadores ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesIndicadores">'+
			'	                	<thead>'+
			'	                		<tr class="active"><th class="text-center" colspan="6">Agregar Nuevo Indicador</th><th class="text-center">';
										<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
					tablaIndicadores += '<button type="button" class="btn btn-default btn-sm agregarIndicador" data-toggle="tooltip" data-placement="top" title="Agregar Indicador"><span class="glyphicon glyphicon-plus"></span></button></th></tr>';
										<%}%>
					tablaIndicadores += '<tr class="active"><th class="text-center">Id</th>'+
					'<th class="text-center">Nombre</th>'+
					'<th class="text-center">Tipo Indicador</th>'+
					//'<th class="text-center">MetodoCalculo</th>'+
					'<th class="text-center">Unidad de Medida</th>'+
					'<th class="text-center">Frecuencia de Medición</th>'+
					'<th class="text-center">Fuente de Datos</th>'+
					//'<th class="text-center">Observaciones</th>'+
					//'<th class="text-center">Objetivo</th>'+
					//'<th class="text-center">CoberturaGeográficaAlcance</th>'+
					//'<th class="text-center">NivelDespliegueGeográficoDesagregacion</th>'+
					//'<th class="text-center">CoberturaGeográficaAlcance</th>'+
					//'<th class="text-center">NivelDespliegueGeográficoDesagregación</th>'+
					'<th class="text-center">Administrar</th></tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaIndicadoresPrecargados">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoIndicadores').append(tablaIndicadores);
			$('#tablaIndicadoresPrecargados').append(cuerpoTabla);
			$("#dataTablesIndicadores").DataTable();

		}
		
		renderIndicadores();
		
$("body").on("click", ".agregarIndicador",function(event){
/* 	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");
	var id = idParsed[0]; */
	
	if ( $("#modalEditarIndicador").length )
	{
		$("#modalEditarIndicador").remove();
	}
	if ( $("#consultaModalBorrarIndicador").length )
	{
		$("#consultaModalBorrarIndicador").remove();
	}	
	if ( $("#modalMetas").length )
	{
		$("#modalMetas").remove();
	}	
	
  	var indicadores = $.ajax({
    	url:'/ajaxSelects?accion=getIndicador',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	indicadores = JSON.parse(indicadores);
  	indicadores = indicadores.indicadores;
  	
/* 	var objetivos = $.ajax({
    	url:'/ajaxSelects?accion=getResultados',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	objetivos = JSON.parse(objetivos);
	objetivos = objetivos.resultados;
	
	var optionObjetivos = "";
	for(var o = 0; o < objetivos.length; o++){
		optionObjetivos+='<option value="'+objetivos[o].id+'" >'+objetivos[o].nombre+'</option>';
	} */
	
	var unidadesMedida = $.ajax({
    	url:'/ajaxSelects?accion=getUnidadesMedida',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	unidadesMedida = JSON.parse(unidadesMedida);
	unidadesMedida = unidadesMedida.unidadesMedida;
	
	var optionUnidadesMedida = "";
	for(var u = 0; u < unidadesMedida.length; u++){
		optionUnidadesMedida+='<option value="'+unidadesMedida[u].codigoUnidadMedida+'" >'+unidadesMedida[u].nombre+'</option>';
	}
	
	var coberturaGeograficaAlcance = $.ajax({
    	url:'/ajaxSelects?accion=getCoberturaGeograficaAlcance',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	coberturaGeograficaAlcance = JSON.parse(coberturaGeograficaAlcance);
	
	var optionCoberturaGeograficaAlcance = "";
	for(var a = 0; a < coberturaGeograficaAlcance.length; a++){
		optionCoberturaGeograficaAlcance+='<option value="'+coberturaGeograficaAlcance[a].id+'" >'+coberturaGeograficaAlcance[a].nombre+'</option>';
	}
	
	var nivelDespliegueGeografico = $.ajax({
    	url:'/ajaxSelects?accion=getNivelDespliegueGeografico',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	nivelDespliegueGeografico = JSON.parse(nivelDespliegueGeografico);
	
	var optionNivelDespliegueGeografico = "";
	for(var s = 0; s < nivelDespliegueGeografico.length; s++){
		optionNivelDespliegueGeografico += '<option value="'+nivelDespliegueGeografico[s].id+'" >'+nivelDespliegueGeografico[s].nombre+'</option>';
	}
	
	/*var coberturaDemograficaAlcance = $.ajax({
    	url:'/ajaxSelects?accion=getCoberturaDemograficaAlcance',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	coberturaDemograficaAlcance = JSON.parse(coberturaDemograficaAlcance);
	
	var optionCoberturaDemograficaAlcance = "";
	for(var d = 0; d < coberturaDemograficaAlcance.length; d++){
		optionCoberturaDemograficaAlcance += '<option value="'+coberturaDemograficaAlcance[d].id+'" >'+coberturaDemograficaAlcance[d].nombre+'</option>';
	}
	
	var nivelDespliegueDemografico = $.ajax({
    	url:'/ajaxSelects?accion=getNivelDespliegueDemografico',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	nivelDespliegueDemografico = JSON.parse(nivelDespliegueDemografico);
	
	var optionNivelDespliegueDemografico = "";
	for(var f = 0; f < nivelDespliegueDemografico.length; f++){
		optionNivelDespliegueDemografico += '<option value="'+nivelDespliegueDemografico[f].id+'" >'+nivelDespliegueDemografico[f].nombre+'</option>';
	}*/
	/*
	
	var nivelDespliegueDemografico = $.ajax({
    	url:'/ajaxSelects?accion=getNivelDespliegueDemografico',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	nivelDespliegueDemografico = JSON.parse(nivelDespliegueDemografico);
	
	var optionDesagregacionDemograficaDestinatario = "";
	for(var f = 0; f < nivelDespliegueDemografico.length; f++){
		optionDesagregacionDemograficaDestinatario += '<option value="'+nivelDespliegueDemografico[f].id+'" >'+nivelDespliegueDemografico[f].nombre+'</option>';
	}
	
	
	*/
	
	var  tiposDestinatarios= $.ajax({
    	url:'ajaxSelects?accion=getTiposDestinatarios',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	tiposDestinatarios = JSON.parse(tiposDestinatarios);
	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
	
	var optionDesagregacionDemograficaDestinatario="";
	optionDesagregacionDemograficaDestinatario+='<option value="0"></option>';
	for(i = 0;i<tiposDestinatarios.length; i++){
		optionDesagregacionDemograficaDestinatario+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
	}
	
/* 	var fuenteVerificacion = $.ajax({
    	url:'/ajaxSelects?accion=getFuenteVerificacion',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	fuenteVerificacion = JSON.parse(fuenteVerificacion);
	
	var optionFuenteVerificacion = "";
	for(var f = 0; f < fuenteVerificacion.length; f++){
		optionFuenteVerificacion += '<option value="'+fuenteVerificacion[f].id+'" >'+fuenteVerificacion[f].nombre+'</option>';
	} */
	
	var tipoIndicador = $.ajax({
    	url:'/ajaxSelects?accion=getTipoIndicador',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	tipoIndicador = JSON.parse(tipoIndicador);
	
	var optionTipoIndicador = "";
	for(var t = 0; t < tipoIndicador.length; t++){
		optionTipoIndicador += '<option value="'+tipoIndicador[t].id+'" >'+tipoIndicador[t].nombre+'</option>';
	}
		
	
	var cuerpoModalIndicador = "";
	
	cuerpoModalIndicador =	'<div class="modal fade" id="modalIndicador" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Agregar Indicador</h4>'+   
							'			</div>'+
							'		    <div class="modal-body" id="indicadorCuerpo" >'+
							
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header">'+
							'		                  		<h3 class="box-title"></h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body" id="cuerpoModalUsuario">'+
							
							'								<form role="form" id="formularioIndicador">'+
							'									<div class="table-responsive">'+
							'										<table class="table table-hover">'+
							'											<tbody>'+
							'												<form class="form-horizontal" role="form" id="formulario">'+
/* 							'												        <div class="form-group">'+
							'												           <label>Objetivos PND</label>'+
							'												           <select class="form-control" name="" id="objetivoIndicador">'+optionObjetivos+'</select>'+
							'												        </div>'+ */
							'														<div class="form-group">'+
							'												           <label>Nombre</label>'+
							'												           <input type= "text" class="form-control" id="nombreIndicador">'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Tipo Indicador</label>'+
							'												           <select class="form-control" name="" id="tipoIndicador">'+optionTipoIndicador+'</select>'+
							'												         </div>'+			
							'														<div class="form-group">'+
							'												           <label>Metodología de Cálculo</label>'+
							'												           <input type= "text" class="form-control" placeholder="" id="metodologiaCalculoIndicador">'+
							'												         </div>'+							
							'												          <div class="form-group">'+
							'												           <label>Unidad de Medida</label>'+
							'												           <select class="form-control" name="" id="unidadMedidaIndicador">'+optionUnidadesMedida+'</select>'+
							'												         </div>'+
							'												         <div class="form-group">'+
							'												           <label>Frecuencia de Medición</label>'+
							'												           <input type="number" class="form-control" id="frecuenciaMedicionIndicador">'+
							'												         </div>'+
							'												         <div class="form-group">'+
							'												           <label>Fecha de Disponilidad de la Información</label>'+
							'												           <input type="text" class="form-control" id="fechaIndicador">'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Cobertura Geográfica</label>'+
							'												           <select class="form-control" name="" id="coberturaGeograficaAlcanceId">'+optionCoberturaGeograficaAlcance+'</select>'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Nivel de Despliegue Geográfico</label>'+
							'												           <select class="form-control" id="nivelDespliegueGeograficoId">'+optionNivelDespliegueGeografico+'</select>'+
							'												         </div>'+	
							/*
							'												          <div class="form-group">'+
							'												           <label>Cobertura Demográfica y Alcance</label>'+
							'												           <select class="form-control" id="coberturaDemograficaAlcanceId">'+optionCoberturaDemograficaAlcance+'</select>'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Nivel de Despliegue Demografico y Desagregaciones</label>'+
							'												           <select class="form-control" id="nivelDespliegueDemograficoId">'+optionNivelDespliegueDemografico+'</select>'+
							'												         </div>'+	 
							*/
							'												          <div class="form-group">'+
							'												           <label>Desagregación demográfica y destinatarios</label>'+
							'												           <select class="form-control" id="desagregacionDemograficaDestinatario">'+optionDesagregacionDemograficaDestinatario+'</select>'+
							'												         </div>'+
							'												          <div class="form-group">'+
							'												           <label>Fuente de Datos</label>'+
							'												           <input type= "text" class="form-control" id="fuenteVerificacionId" />'+
							'												         </div>'+		
							'												         <div class="form-group">'+
							'												           <label>Institución Responsable del Cálculo del Indicador</label>'+
							'												           <input type="text" class="form-control" id="institucionResponsableIndicador">'+
							'												         </div>'+		
							'												         <div class="form-group">'+
							'												           <label>Evaluación HECI</label>'+
							'												           <input type="text" class="form-control" id="evaluacionHeciIndicador">'+
							'												         </div>'+								
							'												         <div class="form-group">'+
							'												           <label>Comentarios</label>'+
							'												           <input type= "text" class="form-control" id="observacionesIndicador">'+
							'												         </div>'+
							'												         <div class="form-group">'+
							'												           <label>Contacto</label>'+
							'												           <input type= "text" class="form-control" id="contactoIndicador">'+
							'												         </div>'+																			         
							'												         <div class="box-footer">'+
							'												         </div>'+
							'													</form>	'+	
				
							'											</tbody>'+							           
							'										</table>'+
							'									</div>'+
							'								</form>'+
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+
							'								<button type="submit" class="btn btn-success guardarIndicador">Guardar</button>'+

							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+											
				
							'		    </div>'+
					
							'		</div>'+ 
							'	</div>'+
							'</div>'; 
	
	$("body").append(cuerpoModalIndicador);
	$("#modalIndicador").modal('show');
});

	
	$("body").on("click", ".guardarIndicador",function(event){
/* 		var parametros = $(this).attr("parametros");
		var accion = "actEditarIndicadores";
	    var idParsed = parametros.split("-");
		var nivel = idParsed[0]; */
		
		var objeto = new Object();
		
		//como esta en la clase 
		objeto.objetivo_id = $("#formularioIndicador").find('select[id="objetivoIndicador"]').val();
		objeto.nombre = $("#nombreIndicador").val();
		objeto.tipo_indicador_id = $("#formularioIndicador").find('select[id="tipoIndicador"]').val();
		objeto.metodo_calculo_id = $("#metodologiaCalculoIndicador").val();
		objeto.unidad_medida_id = $("#formularioIndicador").find('select[id="unidadMedidaIndicador"]').val();
		objeto.frecuencia_meses = $("#frecuenciaMedicionIndicador").val();
		objeto.fechaDisponibilidadInformacion = $("#fechaIndicador").val();
		objeto.coberturaGeograficaAlcance = $("#formularioIndicador").find('select[id="coberturaGeograficaAlcanceId"]').val();
		objeto.NivelDespliegueGeograficoDesagregacion = $("#formularioIndicador").find('select[id="nivelDespliegueGeograficoId"]').val();
		/*
		objeto.coberturaDemograficaAlcance = $("#formularioIndicador").find('select[id="coberturaDemograficaAlcanceId"]').val();
		objeto.NivelDespliegueDemograficoDesagregacion = $("#formularioIndicador").find('select[id="nivelDespliegueDemograficoId"]').val();
		*/
		objeto.NivelDespliegueDemograficoDesagregacion = $("#formularioIndicador").find("#desagregacionDemograficaDestinatario").val();
		
		objeto.fuente_verificacion_id = $("#fuenteVerificacionId").val();
		objeto.institucionResponsableCalculoIndicador = $("#institucionResponsableIndicador").val();
		objeto.evaluacionHeci = $("#evaluacionHeciIndicador").val();
		objeto.observaciones = $("#observacionesIndicador").val();
		objeto.contacto = $("#contactoIndicador").val();
		objeto.desagregacion_tipo_zona_geografica_id = "1";//es requerido en la base de dtos por eso estoy guardando con el valor 1 Rafa me dijo que por ahora guardemos este dato con este valor
		objeto.tipo_demografica_id = "1";// Lo mismo que el comentario anterior
		
		 $.ajax({
		        url: "ajaxInserts?accion=insIndicador",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
		        		
		        		if ( $("#modalIndicador").length )
		        		{
		        			$("#modalIndicador").remove();
		        		}
		        		if ( $("#modalIndicadorGuardado").length )
		        		{
		        			$("#modalIndicadorGuardado").remove();
		        		}	
		        		var cuerpoModalIndicadorGuardado = "";
		        		
		        		cuerpoModalIndicadorGuardado =	'<div class="modal fade" id="modalIndicadorGuardado" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
				        								'	<div class="modal-dialog modal-lg" style="width:90%">'+
				        								'		<div class="modal-content" >'+
				        								'			<div class="modal-header">'+
				        								'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
				        								'		        <h4 class="modal-title">Agregar Indicador</h4>'+   
				        								'			</div>'+
				        								'		    <div class="modal-body" id="cuerpoIndicadorGuardado" >'+								
				        					
				        								'		    </div>'+
				        						
				        								'		</div>'+ 
				        								'	</div>'+
				        								'</div>'; 
		        		
		        		$("body").append(cuerpoModalIndicadorGuardado);
		        		$("#modalIndicadorGuardado").modal('show');
						$('#cuerpoIndicadorGuardado').html('');
						$('#cuerpoIndicadorGuardado').append('<h3 class="text-center">Se Guardo el Registro con Exito!!</h3>');
						renderIndicadores();
		        	}else{
						$("#cuerpoIndicadorGuardado").html("");
						$("#cuerpoIndicadorGuardado").append('<h3 class="text-center">Error al intentar guardar este Registro!!</h3>');
					}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });
		 
	});

	$("body").on("click", ".consultaBorrarIndicador",function(event){
		 		var parametros = $(this).attr("parametros");
			    var idParsed = parametros.split("-");
				var id = idParsed[0];
				var tipoIndicadorId = idParsed[1];
				//var metodoCalculoId = idParsed[2];
				var unidadMedidaId = idParsed[2];
				var desagregacionTipoZonaGeograficaId = idParsed[3];
				var tipoDemograficaId = idParsed[4];
				//var fuenteVerificacionId = idParsed[6];
				var objetivoId = idParsed[5];

				if ( $("#modalEditarIndicador").length )
				{
					$("#modalEditarIndicador").remove();
				}
				if ( $("#consultaModalBorrarIndicador").length )
				{
					$("#consultaModalBorrarIndicador").remove();
				}	
				if ( $("#modalMetas").length )
				{
					$("#modalMetas").remove();
				}		
				
			  	var indicadores = $.ajax({
			    	url:'/ajaxSelects?accion=getIndicador&indicadorId='+id+'&tipoIndicadorId='+tipoIndicadorId+'&unidadMedidaId='+unidadMedidaId+'&desagregacionTipoZonaGeograficaId='+desagregacionTipoZonaGeograficaId+'&tipoDemograficaId='+tipoDemograficaId+'&objetivoId='+objetivoId,//borre &fuenteVerificacionId='+fuenteVerificacionId+'
			      	type:'get',
			      	dataType:'json',
			      	async:false       
			    }).responseText;
			  	indicadores = JSON.parse(indicadores);
			  	indicadores = indicadores.indicadores;
			  	
			  	
				var cuerpoModalIndicador = "";
				
				cuerpoModalIndicador =	'<div class="modal fade" id="consultaModalBorrarIndicador" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
										'	<div class="modal-dialog modal-lg" style="width:90%">'+
										'		<div class="modal-content" >'+
										'			<div class="modal-header">'+
										'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
										'		        <h4 class="modal-title">Borrar Indicador</h4>'+   
										'			</div>'+
										'		    <div class="modal-body" id="cuerpoModalBorrarIndicador" >'+
										'				<h3 class="text-center" id="mensajeBorradoIndicador"></h3>'+									
										'		    </div>'+
										'			<div class="modal-footer" id="agregarBotonBorradoIndicador">'+
										'			</div>'+
								
										'		</div>'+ 
										'	</div>'+
										'</div>';
							
				$("body").append(cuerpoModalIndicador);
				
				if(indicadores[0].borrado == true){
					$("#mensajeBorradoIndicador").html("");
					$("#mensajeBorradoIndicador").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER<strong> '+indicadores[0].nombre+'</strong></h3>');
					$("#agregarBotonBorradoIndicador").html("");
					$("#agregarBotonBorradoIndicador").append('<button type="button" class="btn btn-success btn-sm borrarIndicador" id="botonRestaurarIndicador" parametros='+id+'-'+tipoIndicadorId+'-'+unidadMedidaId+'-'+desagregacionTipoZonaGeograficaId+'-'+tipoDemograficaId+'-'+objetivoId+'-r>Restaurar Indicador</button>');
					}else{
					$("#mensajeBorradoIndicador").html("");
					$("#mensajeBorradoIndicador").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR<strong> '+indicadores[0].nombre+'</strong></h3');
					$("#agregarBotonBorradoIndicador").html("");
					$("#agregarBotonBorradoIndicador").append('<button type="button" class="btn btn-danger btn-sm borrarIndicador" id="botonBorradoIndicador" parametros='+id+'-'+tipoIndicadorId+'-'+unidadMedidaId+'-'+desagregacionTipoZonaGeograficaId+'-'+tipoDemograficaId+'-'+objetivoId+'-b>Borrar Indicador</button>');
					}
				
				$("#consultaModalBorrarIndicador").modal('show');										
				 
			});
	$("body").on("click", ".borrarIndicador",function(event){
 		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		var tipoIndicadorId = idParsed[1];
		//var metodoCalculoId = idParsed[2];
		var unidadMedidaId = idParsed[2];
		var desagregacionTipoZonaGeograficaId = idParsed[3];
		var tipoDemograficaId = idParsed[4];
		//var fuenteVerificacionId = idParsed[6];
		var objetivoId = idParsed[5];
		var estado = idParsed[6];
		
		var indicador = $.ajax({
			url:'/ajaxSelects?accion=getIndicador&indicadorId='+id+'&tipoIndicadorId='+tipoIndicadorId+'&unidadMedidaId='+unidadMedidaId+'&desagregacionTipoZonaGeograficaId='+desagregacionTipoZonaGeograficaId+'&tipoDemograficaId='+tipoDemograficaId+'&objetivoId='+objetivoId,//borre &fuenteVerificacionId='+fuenteVerificacionId
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		indicador = JSON.parse(indicador);
		indicador = indicador.indicadores;
		var objeto = new Object();

		objeto.id = id;
		objeto.tipo_indicador_id = tipoIndicadorId;
		//objeto.metodo_calculo_id = metodoCalculoId;
		objeto.unidad_medida_id = unidadMedidaId;
		objeto.desagregacion_tipo_zona_geografica_id = desagregacionTipoZonaGeograficaId;
		objeto.tipo_demografica_id = tipoDemograficaId;
		//objeto.fuente_verificacion_id = fuenteVerificacionId;
		objeto.objetivo_id = objetivoId;		
		objeto.borrado = indicador[0].borrado;
		
		 $.ajax({
		        url: "ajaxUpdate?accion=actBorrarIndicador",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
		        		if(estado == "b"){
							$('#mensajeBorradoIndicador').html('');
							$('#mensajeBorradoIndicador').append('<h3 class="text-center">Se Borro el Registro con Exito!!</h3>');
							$('#agregarBotonBorradoIndicador').html('');	
		        		}else{
							$('#mensajeBorradoIndicador').html('');
							$('#mensajeBorradoIndicador').append('<h3 class="text-center">Se Restauro el Registro con Exito!!</h3>');
							$('#agregarBotonBorradoIndicador').html('');
		        		}
						renderIndicadores();
		        	}else{
						$("#mensajeBorradoIndicador").html("");
						$("#mensajeBorradoIndicador").append('<h3 class="text-center">Error al intentar Borrar este Registro!!</h3>');
						$('#agregarBotonBorradoIndicador').html('');
					}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });		 
	});
	
	$("body").on("click", ".consultaEditarIndicador",function(event){
 		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		var tipoIndicadorId = idParsed[1];
		//var metodoCalculoId = idParsed[2];
		var unidadMedidaId = idParsed[2];
		var desagregacionTipoZonaGeograficaId = idParsed[3];
		var tipoDemograficaId = idParsed[4];
		//var fuenteVerificacionId = idParsed[6];
		var objetivoId = idParsed[5];
		
		if ( $("#modalEditarIndicador").length )
		{
			$("#modalEditarIndicador").remove();
		}
		if ( $("#consultaModalBorrarIndicador").length )
		{
			$("#consultaModalBorrarIndicador").remove();
		}	
		if ( $("#modalMetas").length )
		{
			$("#modalMetas").remove();
		}	
		
	  	var indicadores = $.ajax({
	    	url:'/ajaxSelects?accion=getIndicador&indicadorId='+id+'&tipoIndicadorId='+tipoIndicadorId+'&unidadMedidaId='+unidadMedidaId+'&desagregacionTipoZonaGeograficaId='+desagregacionTipoZonaGeograficaId+'&tipoDemograficaId='+tipoDemograficaId+'&objetivoId='+objetivoId,// borre &fuenteVerificacionId='+fuenteVerificacionId
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	indicadores = JSON.parse(indicadores);
	  	indicadores = indicadores.indicadores;
	  	
/* 		var objetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getResultados',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		objetivos = JSON.parse(objetivos);
		objetivos = objetivos.resultados;
		
		var optionObjetivos = "";
		for(var o = 0; o < objetivos.length; o++){
			optionObjetivos+='<option value="'+objetivos[o].id+'" >'+objetivos[o].nombre+'</option>';
		} */
		
		var unidadesMedida = $.ajax({
	    	url:'/ajaxSelects?accion=getUnidadesMedida',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		unidadesMedida = JSON.parse(unidadesMedida);
		unidadesMedida = unidadesMedida.unidadesMedida;
		
		var optionUnidadesMedida = "";
		for(var u = 0; u < unidadesMedida.length; u++){
			optionUnidadesMedida+='<option value="'+unidadesMedida[u].codigoUnidadMedida+'" >'+unidadesMedida[u].nombre+'</option>';
		}
		
		var coberturaGeograficaAlcance = $.ajax({
	    	url:'/ajaxSelects?accion=getCoberturaGeograficaAlcance',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		coberturaGeograficaAlcance = JSON.parse(coberturaGeograficaAlcance);
		
		var optionCoberturaGeograficaAlcance = "";
		for(var a = 0; a < coberturaGeograficaAlcance.length; a++){
			optionCoberturaGeograficaAlcance+='<option value="'+coberturaGeograficaAlcance[a].id+'" >'+coberturaGeograficaAlcance[a].nombre+'</option>';
		}
		
		var nivelDespliegueGeografico = $.ajax({
	    	url:'/ajaxSelects?accion=getNivelDespliegueGeografico',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		nivelDespliegueGeografico = JSON.parse(nivelDespliegueGeografico);
		
		var optionNivelDespliegueGeografico = "";
		for(var s = 0; s < nivelDespliegueGeografico.length; s++){
			optionNivelDespliegueGeografico += '<option value="'+nivelDespliegueGeografico[s].id+'" >'+nivelDespliegueGeografico[s].nombre+'</option>';
		}
		/*
		var coberturaDemograficaAlcance = $.ajax({
	    	url:'/ajaxSelects?accion=getCoberturaDemograficaAlcance',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		coberturaDemograficaAlcance = JSON.parse(coberturaDemograficaAlcance);
		
		var optionCoberturaDemograficaAlcance = "";
		for(var d = 0; d < coberturaDemograficaAlcance.length; d++){
			optionCoberturaDemograficaAlcance += '<option value="'+coberturaDemograficaAlcance[d].id+'" >'+coberturaDemograficaAlcance[d].nombre+'</option>';
		}
		
		var nivelDespliegueDemografico = $.ajax({
	    	url:'/ajaxSelects?accion=getNivelDespliegueDemografico',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		nivelDespliegueDemografico = JSON.parse(nivelDespliegueDemografico);
		
		var optionNivelDespliegueDemografico = "";
		for(var f = 0; f < nivelDespliegueDemografico.length; f++){
			optionNivelDespliegueDemografico += '<option value="'+nivelDespliegueDemografico[f].id+'" >'+nivelDespliegueDemografico[f].nombre+'</option>';
		}
		/**/
		var  tiposDestinatarios= $.ajax({
	    	url:'ajaxSelects?accion=getTiposDestinatarios',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		tiposDestinatarios = JSON.parse(tiposDestinatarios);
		tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
		
		var optionDesagregacionDemograficaDestinatario="";
		optionDesagregacionDemograficaDestinatario+='<option value="0"></option>';
		for(i = 0;i<tiposDestinatarios.length; i++){
			optionDesagregacionDemograficaDestinatario+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
		}
		
/* 		var fuenteVerificacion = $.ajax({
	    	url:'/ajaxSelects?accion=getFuenteVerificacion',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		fuenteVerificacion = JSON.parse(fuenteVerificacion);
		
		var optionFuenteVerificacion = "";
		for(var f = 0; f < fuenteVerificacion.length; f++){
			optionFuenteVerificacion += '<option value="'+fuenteVerificacion[f].id+'" >'+fuenteVerificacion[f].nombre+'</option>';
		} */
		
		var tipoIndicador = $.ajax({
	    	url:'/ajaxSelects?accion=getTipoIndicador',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		tipoIndicador = JSON.parse(tipoIndicador);
		
		var optionTipoIndicador = "";
		optionTipoIndicador += '<option value="0" ></option>';
		for(var t = 0; t < tipoIndicador.length; t++){
			optionTipoIndicador += '<option value="'+tipoIndicador[t].id+'" >'+tipoIndicador[t].nombre+'</option>';
		}
			
		
		var cuerpoModalEditarIndicador = "";
		
		cuerpoModalEditarIndicador =	'<div class="modal fade" id="modalEditarIndicador" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
								'		        <h4 class="modal-title">Agregar Indicador</h4>'+   
								'			</div>'+
								'		    <div class="modal-body" id="indicadorCuerpo" >'+
								
								'		      	<div class="row">'+ 
								'		      		<div class="col-md-12">'+
								'						<div class="box box-warning">'+
								'		                	<div class="box-header">'+
								'		                  		<h3 class="box-title"></h3>'+
								'	                  			<div class="box-tools pull-right">'+
								'		                  		</div>'+
								'               			</div>'+//fin box-heder
								'               			<div class="box-body" id="cuerpoModalUsuario">'+
								
								'								<form role="form" id="formularioIndicador">'+
								'									<div class="table-responsive">'+
								'										<table class="table table-hover">'+
								'											<tbody>'+
								'												<form class="form-horizontal" role="form" id="formulario">'+
/* 								'												        <div class="form-group">'+
								'												           <label>Objetivos PND</label>'+
								'												           <select class= "form-control" name="" id="objetivoIndicador">'+optionObjetivos+'</select>'+
								'												        </div>'+ */
								'														<div class="form-group">'+
								'												           <label>Nombre</label>'+
								'												           <input type= "text" class="form-control" value="'+indicadores[0].nombre+'" name="nombre" id="nombreIndicador">'+
								'												           <input type= "hidden" class="form-control" value="'+indicadores[0].id+'" id="idIndicador">'+
								'												         </div>'+
								'												          <div class="form-group">'+
								'												           <label>Tipo Indicador</label>'+
								'												           <select class="form-control" id="tipoIndicador">'+optionTipoIndicador+'</select>'+
								'												         </div>'+			
								'														<div class="form-group">'+
								'												           <label>Metodología de Cálculo</label>'+
								'												           <input type= "text" class="form-control" value="'+indicadores[0].metodo_calculo_id+'" id="metodologiaCalculoIndicador">'+
								'												         </div>'+							
								'												          <div class="form-group">'+
								'												           <label>Unidad de Medida</label>'+
								'												           <select class="form-control" id="unidadMedidaIndicador">'+optionUnidadesMedida+'</select>'+
								'												         </div>'+
								'												         <div class="form-group">'+
								'												           <label>Frecuencia de Medición</label>'+
								'												           <input type="number" class="form-control" value="'+indicadores[0].frecuencia_meses+'" id="frecuenciaMedicionIndicador">'+
								'												         </div>'+
								'												         <div class="form-group">'+
								'												           <label>Fecha de Disponilidad de la Información</label>'+
								'												           <input type="text" class="form-control" value="'+indicadores[0].fechaDisponibilidadInformacion+'" id="fechaIndicador">'+
								'												         </div>'+
								'												          <div class="form-group">'+
								'												           <label>Cobertura Geográfica</label>'+
								'												           <select class= "form-control" name="" id="coberturaGeograficaAlcanceId">'+optionCoberturaGeograficaAlcance+'</select>'+
								'												         </div>'+
								'												          <div class="form-group">'+
								'												           <label>Nivel de Despliegue Geográfico</label>'+
								'												           <select class="form-control" id="nivelDespliegueGeograficoId">'+optionNivelDespliegueGeografico+'</select>'+
								'												         </div>'+	
								/*
								'												          <div class="form-group">'+
								'												           <label>Cobertura Demográfica y Alcance</label>'+
								'												           <select class="form-control" id="coberturaDemograficaAlcanceId">'+optionCoberturaDemograficaAlcance+'</select>'+
								'												         </div>'+
								'												          <div class="form-group">'+
								'												           <label>Nivel de Despliegue Demografico y Desagregaciones</label>'+
								'												           <select class="form-control" id="nivelDespliegueDemograficoId">'+optionNivelDespliegueDemografico+'</select>'+
								'												         </div>'+		
								/*	*/
								'												          <div class="form-group">'+
								'												           <label>Desagregación demográfica y destinatarios</label>'+
								'												           <select class="form-control" id="desagregacionDemograficaDestinatario">'+optionDesagregacionDemograficaDestinatario+'</select>'+
								'												         </div>'+
								
								'												          <div class="form-group">'+
								'												           <label>Fuente de Datos</label>'+
								'												           <input type= "text" class="form-control" value="'+indicadores[0].fuente_verificacion_id+'" id="fuenteVerificacionId">'+
								'												         </div>'+		
								'												         <div class="form-group">'+
								'												           <label>Institución Responsable del Cálculo del Indicador</label>'+
								'												           <input type="text" class="form-control" value="'+indicadores[0].institucionResponsableCalculoIndicador+'" id="institucionResponsableIndicador">'+
								'												         </div>'+		
								'												         <div class="form-group">'+
								'												           <label>Evaluación HECI</label>'+
								'												           <input type="text" class="form-control" value="'+indicadores[0].evaluacionHeci+'" id="evaluacionHeciIndicador">'+
								'												         </div>'+								
								'												         <div class="form-group">'+
								'												           <label>Comentarios</label>'+
								'												           <input type= "text" class="form-control" value="'+indicadores[0].observaciones+'" id="observacionesIndicador">'+
								'												         </div>'+
								'												         <div class="form-group">'+
								'												           <label>Contacto</label>'+
								'												           <input type= "text" class="form-control" value="'+indicadores[0].contacto+'" id="contactoIndicador">'+
								'												         </div>'+																			         
								'												         <div class="box-footer">'+
								'												         </div>'+
								'													</form>	'+	
					
								'											</tbody>'+							           
								'										</table>'+
								'									</div>'+
								'								</form>'+
								'               			</div>'+//fin box-body					
								'							<div class="modal-footer">'+
								'								<button type="submit" class="btn btn-success guardarIndicadorCambios" parametros="'+id+'-'+tipoIndicadorId+'-'+unidadMedidaId+'-'+desagregacionTipoZonaGeograficaId+'-'+tipoDemograficaId+'-'+objetivoId+'">Guardar Cambios</button>'+
								'							</div>'+
								'                		</div>'+	
								'                	</div>'+
								'                </div>'+											
					
								'		    </div>'+
						
								'		</div>'+ 
								'	</div>'+
								'</div>'; 
		
		$("body").append(cuerpoModalEditarIndicador);
		$('#objetivoIndicador > option[value="'+indicadores[0].objetivo_id+'"]').attr('selected', 'selected');
		$('#tipoIndicador > option[value="'+indicadores[0].tipo_indicador_id+'"]').attr('selected', 'selected');
		$('#unidadMedidaIndicador > option[value="'+indicadores[0].unidad_medida_id+'"]').attr('selected', 'selected');
		$('#coberturaGeograficaAlcanceId > option[value="'+indicadores[0].coberturaGeograficaAlcance+'"]').attr('selected', 'selected');
		$('#nivelDespliegueGeograficoId > option[value="'+indicadores[0].NivelDespliegueGeograficoDesagregacion+'"]').attr('selected', 'selected');
		//$('#coberturaDemograficaAlcanceId > option[value="'+indicadores[0].coberturaDemograficaAlcance+'"]').attr('selected', 'selected');
		//$('#nivelDespliegueDemograficoId > option[value="'+indicadores[0].NivelDespliegueDemograficoDesagregacion+'"]').attr('selected', 'selected');
		$('#desagregacionDemograficaDestinatario > option[value="'+indicadores[0].NivelDespliegueDemograficoDesagregacion+'"]').attr('selected', 'selected');
		//$('#fuenteVerificacionId > option[value="'+indicadores[0].fuente_verificacion_id+'"]').attr('selected', 'selected');
		
		$("#modalEditarIndicador").modal('show');
				
		});
	
	$("body").on("click", ".guardarIndicadorCambios",function(event){
 		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		var tipoIndicadorId = idParsed[1];
		//var metodoCalculoId = idParsed[2];
		var unidadMedidaId = idParsed[2];
		var desagregacionTipoZonaGeograficaId = idParsed[3];
		var tipoDemograficaId = idParsed[4];
		//var fuenteVerificacionId = idParsed[6];
		var objetivoId = idParsed[5];
				
		var objeto = new Object();
		
		//como esta en la clase 
		objeto.id = $("#idIndicador").val(); 
		objeto.objetivo_id = $("#formularioIndicador").find('select[id="objetivoIndicador"]').val();
		objeto.nombre = $("#nombreIndicador").val();
		objeto.tipo_indicador_id = $("#formularioIndicador").find('select[id="tipoIndicador"]').val();
		objeto.metodo_calculo_id = $("#metodologiaCalculoIndicador").val();
		objeto.unidad_medida_id = $("#formularioIndicador").find('select[id="unidadMedidaIndicador"]').val();
		objeto.frecuencia_meses = $("#frecuenciaMedicionIndicador").val();
		objeto.fechaDisponibilidadInformacion = $("#fechaIndicador").val();
		objeto.coberturaGeograficaAlcance = $("#formularioIndicador").find('select[id="coberturaGeograficaAlcanceId"]').val();
		objeto.NivelDespliegueGeograficoDesagregacion = $("#formularioIndicador").find('select[id="nivelDespliegueGeograficoId"]').val();
		//objeto.coberturaDemograficaAlcance = $("#formularioIndicador").find('select[id="coberturaDemograficaAlcanceId"]').val();
		//objeto.NivelDespliegueDemograficoDesagregacion = $("#formularioIndicador").find('select[id="nivelDespliegueDemograficoId"]').val();
		objeto.NivelDespliegueDemograficoDesagregacion = $("#formularioIndicador").find('select[id="desagregacionDemograficaDestinatario"]').val();
		objeto.fuente_verificacion_id = $("#fuenteVerificacionId").val();
		objeto.institucionResponsableCalculoIndicador = $("#institucionResponsableIndicador").val();
		objeto.evaluacionHeci = $("#evaluacionHeciIndicador").val();
		objeto.observaciones = $("#observacionesIndicador").val();
		objeto.contacto = $("#contactoIndicador").val();
		objeto.desagregacion_tipo_zona_geografica_id = "1";//es requerido en la base de dtos por eso estoy guardando con el valor 1 Rafa me dijo que por ahora guardemos este dato con este valor
		objeto.tipo_demografica_id = "1";// Lo mismo que el comentario anterior
		
		objeto.id = id;
		objeto.tipoIndicadorId = tipoIndicadorId;
		//objeto.metodoCalculoId = metodoCalculoId;
		objeto.unidadMedidaId = unidadMedidaId;
		objeto.desagregacionTipoZonaGeograficaId = desagregacionTipoZonaGeograficaId;
		objeto.tipoDemograficaId = tipoDemograficaId;
		//objeto.fuenteVerificacionId = fuenteVerificacionId;
		objeto.objetivoId = objetivoId;



						
		 $.ajax({
		        url: "ajaxUpdate?accion=actEditarIndicador",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        //data:{JSON.stringify(objeto)},
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
		        		if ( $("#modalEditarIndicador").length )
		        		{
		        			$("#modalEditarIndicador").remove();
		        		}	
		        		if ( $("#modalIndicadorEditado").length )
		        		{
		        			$("#modalIndicadorEditado").remove();
		        		}	
		        		var modalIndicadorEditado = "";
		        		
		        		modalIndicadorEditado =			'<div class="modal fade" id="modalIndicadorEditado" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
				        								'	<div class="modal-dialog modal-lg" style="width:90%">'+
				        								'		<div class="modal-content" >'+
				        								'			<div class="modal-header">'+
				        								'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
				        								'		        <h4 class="modal-title">Agregar Indicador</h4>'+   
				        								'			</div>'+
				        								'		    <div class="modal-body" id="cuerpoIndicadorEditado" >'+								
				        					
				        								'		    </div>'+
				        						
				        								'		</div>'+ 
				        								'	</div>'+
				        								'</div>'; 
		        		
		        		$("body").append(modalIndicadorEditado);
		        		$("#modalIndicadorEditado").modal('show');
						$('#cuerpoIndicadorEditado').html('');
						$('#cuerpoIndicadorEditado').append('<h3 class="text-center">Se Guardo el Registro con Exito!!</h3>');
						renderIndicadores();
		        	}else{
						$("#cuerpoIndicadorEditado").html("");
						$("#cuerpoIndicadorEditado").append('<h3 class="text-center">Error al intentar guardar este Registro!!</h3>');
					}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });
				 
	});
	
	function renderMetas(indicadorId){
		
		var webServicesMetas = $.ajax({
			url:'/ajaxSelects?accion=getMetas&indicadorId='+indicadorId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesMetas = JSON.parse(webServicesMetas);
		
		var cuerpoMetas = "";
		for(var a = 0; a < webServicesMetas.length; a++)
		{
			if(webServicesMetas[a].borrado == true)
			{
				<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
					cuerpoMetas += '<tr><td><del>'+webServicesMetas[a].vencimiento+'</del></td><td><del>'+webServicesMetas[a].cantidad+'</del></td><td class="text-center"></button><button type="button" class="btn btn-default btn-sm consultaBorrarMeta" data-toggle="tooltip" data-placement="top" title="Restaurar Meta" parametros='+webServicesMetas[a].id+'-'+webServicesMetas[a].indicador_id+'-'+webServicesMetas[a].zona_geografica_id+'-'+webServicesMetas[a].demografia_id+' ><span class="fa fa-recycle"></span></button></td></tr>';
				<% }%>
			}else{
				<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
					cuerpoMetas += '<tr><td>'+webServicesMetas[a].vencimiento+'</td><td>'+webServicesMetas[a].cantidad+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarMeta" data-toggle="tooltip" data-placement="top" title="Editar Meta" parametros='+webServicesMetas[a].id+'-'+webServicesMetas[a].indicador_id+'-'+webServicesMetas[a].zona_geografica_id+'-'+webServicesMetas[a].demografia_id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarMeta" data-toggle="tooltip" data-placement="top" title="Borrar Meta" parametros='+webServicesMetas[a].id+'-'+webServicesMetas[a].indicador_id+'-'+webServicesMetas[a].zona_geografica_id+'-'+webServicesMetas[a].demografia_id+' ><span class="fa fa-trash"></span></button></td></tr>';
				<%} if (attributes.get("role_id").toString().equals("3")){%>
					cuerpoMetas += '<tr><td>'+webServicesMetas[a].vencimiento+'</td><td>'+webServicesMetas[a].cantidad+'</td><td class="text-center"></td></tr>';
				<%}%>
			}

		}
		
		return cuerpoMetas;
	}
	
	$("body").on("click", ".modalMetas",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var indicadorId = idParsed[0];
	    var zonaGeograficaId = idParsed[1];
	    var demografiaId = idParsed[2];

	    var cuerpoDestinatarioAccion = "";
		
		if ( $("#modalMetas").length )
		{
			$("#modalMetas").remove();
		}
		if ( $("#modalEditarMeta").length )
		{
			$("#modalEditarMeta").remove();
		}		
		if ( $("#consultaModalBorrarMeta").length )
		{
			$("#consultaModalBorrarMeta").remove();
		}	
		
		var cuerpoMetas = renderMetas(indicadorId);

				
		var cuerpoModalMetas = "";

		cuerpoModalMetas =	'<div class="modal fade" id="modalMetas" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							
							'		      		<div class="row">'+		
							
							<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>		

							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning box-solid">'+
							'		                	<div class="box-header with-border">'+
							'	                  			<h3 class="box-title">Metas</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'		                  		</div>'+
							'              				</div>'+
							'               			<div class="box-body">'+
			
							'		      					<div class="col-md-12">'+
							'									<div class="box box-default box-solid">'+
							'		                				<div class="box-header with-border">'+
							'		                  					<h3 class="box-title">Agregar Meta</h3>'+
							'	                  						<div class="box-tools pull-right">'+

							'		                  					</div>'+
							'              							</div>'+
							'              						<div class="box-body">'+
							
							'										<div class="table-responsive">'+
							'											<table class="table table-hover">'+
							'												<tbody>'+
							'			      									<form class="form-horizontal" role="form">'+
							'													<tr><td><label for="cantidadMetas">Cantidad</label><input type="text" id="cantidadMetas" class="form-control" placeholder="Ingrese una Cantidad" /></td><td><label for="vencimientoMetas">Fecha</label><input id="vencimientoMetas" class="form-control" placeholder="Ingrese una fecha" /></td></tr>'+
							'													<input type="hidden" id="zonaGeograficaMetas" value="'+zonaGeograficaId+'" /><input type="hidden" id="demografiaMetas" value="'+demografiaId+'" /><input type="hidden" id="indicadorMetas" value="'+indicadorId+'" />'+
							'			      									</form>	'+				
							'												</tbody>'+
							'											</table>'+
							'				      					</div>'+
							
							'				      				 </div>'+//fin box body
							'									 <div class="modal-footer">'+ 
							'					        			<button type="button" class="btn btn-success btn-sm guardarMetas" >Guardar Meta</button>'+ 
							'									 </div>'+									
							'				      			 	</div>'+
							'				      			</div>'+							

							<% }%>		


							'		      					<div class="col-md-12">'+
							'									<div class="box box-default box-solid">'+
							'		                				<div class="box-header with-border">'+
							'		                  					<h3 class="box-title">Lista Metas</h3>'+
							'	                  						<div class="box-tools pull-right">'+
							'		                  					</div>'+
							'              							</div>'+
							'              						<div class="box-body">'+	
							'										<div class="table-responsive">'+
							'											<table class="table table-hover table-bordered" id="dataTableMetas">'+
							'												<thead>'+
							'													<tr class="active"><th>Fecha</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
							'												</thead>'+
							'												<tbody id="listaMetas">'+
							'												</tbody>'+
							'											</table>'+
							'				      					</div>'+
							
							'				      				</div>'+
							'				      			</div>'+
							'              				</div>'+
			
							'              				</div>'+
							'                		</div>'+	
							'               	</div>'+
							'                </div>'+//fin row																	
							
							'		    </div>'+
							'			<div class="modal-footer">'+
					      	'			</div>'+														
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
		$("body").append(cuerpoModalMetas);
		$("#listaMetas").append(cuerpoMetas);
		$('#modalMetas').modal('show');
		$('#vencimientoMetas').datepicker({  
			language: "es",
			format: 'yyyy-mm-dd',
			todayBtn: "linked",
		    todayHighlight: true});
		
	});
	
	$("body").on("click", ".guardarMetas",function(event){
		
		var objeto = new Object();
		var indicadorId = $("#indicadorMetas").val();
		
		objeto.cantidad = $("#cantidadMetas").val(); 
		objeto.vencimiento = $("#vencimientoMetas").val(); 
		objeto.zona_geografica_id = $("#zonaGeograficaMetas").val();
		objeto.demografia_id = $("#demografiaMetas").val();
		objeto.indicador_id = indicadorId;

		$("#cantidadMetas").val(''); 
		$("#vencimientoMetas").val(''); 
		
/* 		objeto.desagregacion_tipo_zona_geografica_id = "1";//es requerido en la base de dtos por eso estoy guardando con el valor 1 Rafa me dijo que por ahora guardemos este dato con este valor
		objeto.tipo_demografica_id = "1";// Lo mismo que el comentario anterior */
						
		 $.ajax({
		        url: "ajaxInserts?accion=insMetasCrud",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
						$('#listaMetas').html('');
						var render = renderMetas(indicadorId);
						$('#listaMetas').append(render);

		        	}
			
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });
		 
	});
	$("body").on("click", ".consultaBorrarMeta",function(event){
 		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		var indicadorId = idParsed[1];
		var zonaGeograficaId = idParsed[2];
		var demografiaId = idParsed[3];

		if ( $("#modalMetas").length )
		{
			$("#modalMetas").remove();
		}	
		if ( $("#consultaModalBorrarMeta").length )
		{
			$("#consultaModalBorrarMeta").remove();
		}	
		
	  	var metas = $.ajax({
	    	url:'/ajaxSelects?accion=getMetas&metaId='+id,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	metas = JSON.parse(metas);
	  	
	  	
		var cuerpoModalMeta = "";
		
		cuerpoModalMeta =	'<div class="modal fade" id="consultaModalBorrarMeta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close modalMetas" parametros="'+indicadorId+'-'+zonaGeograficaId+'-'+demografiaId+'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
								'		        <h4 class="modal-title"></h4>'+   
								'			</div>'+
								'		    <div class="modal-body" id="cuerpoModalBorrarMeta" >'+
								'		    </div>'+
								'			<div class="modal-footer" id="agregarBotonBorradoMeta">'+
								'			</div>'+
						
								'		</div>'+ 
								'	</div>'+
								'</div>';
					
		$("body").append(cuerpoModalMeta);
		
		var cuerpoTabla =	'<div class="table-responsive">'+
	 	'	<table class="table table-hover table-bordered">'+
	 	'		<thead>'+
		'			<tr class="active"><th>Fecha</th><th>Cantidad</th></tr>'+
		'		</thead>'+	
		'		<tbody>'+
		'			<tr><td>'+metas[0].vencimiento+'</td><td>'+metas[0].cantidad+'</td></tr>'+
		'		</tbody>'+
		'	</table>'+
		'</div>';
		
		if(metas[0].borrado == true){			
			$("#cuerpoModalBorrarMeta").html('');
			$("#cuerpoModalBorrarMeta").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este Registro</h3></br>'+cuerpoTabla);
			$("#agregarBotonBorradoMeta").html("");
			$("#agregarBotonBorradoMeta").append('<button type="button" class="btn btn-success btn-sm borrarMeta" id="botonRestaurarMeta" parametros='+id+'-'+indicadorId+'-r-'+zonaGeograficaId+'-'+demografiaId+'>Restaurar Indicador</button>');
			}else{
			$("#cuerpoModalBorrarMeta").html('');
			$("#cuerpoModalBorrarMeta").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este Registro</h3></br>'+cuerpoTabla);
			$("#agregarBotonBorradoMeta").html("");
			$("#agregarBotonBorradoMeta").append('<button type="button" class="btn btn-danger btn-sm borrarMeta" id="botonBorradoMeta" parametros='+id+'-'+indicadorId+'-b-'+zonaGeograficaId+'-'+demografiaId+'>Borrar Indicador</button>');
			}
		
		$("#consultaModalBorrarMeta").modal('show');										
		 
	});
	$("body").on("click", ".borrarMeta",function(event){
 		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		var indicadorId = idParsed[1];
		var estado = idParsed[2];
		var zonaGeograficaId = idParsed[3];
		var demografiaId = idParsed[4];


		
	  	var metas = $.ajax({
	    	url:'/ajaxSelects?accion=getMetas&metaId='+id,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	metas = JSON.parse(metas);
	  	
		var objeto = new Object();

		objeto.id = id;
		objeto.indicador_id = indicadorId;
		objeto.zona_geografica_id = zonaGeograficaId;
		objeto.demografia_id = demografiaId;
		objeto.borrado = metas[0].borrado;
		
		 $.ajax({
		        url: "ajaxUpdate?accion=actBorradoMetas",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
		        		if(estado == "b"){
							$('#cuerpoModalBorrarMeta').html('');
							$('#cuerpoModalBorrarMeta').append('<h3 class="text-center">Se Borro el Registro con Exito!!</h3>');
							$('#agregarBotonBorradoMeta').html('');	
		        		}else{
							$('#cuerpoModalBorrarMeta').html('');
							$('#cuerpoModalBorrarMeta').append('<h3 class="text-center">Se Restauro el Registro con Exito!!</h3>');
							$('#agregarBotonBorradoMeta').html('');
		        		}
		    			$("#agregarBotonBorradoMeta").append('<button type="button" class="btn btn-success btn-sm modalMetas" parametros="'+indicadorId+'-'+zonaGeograficaId+'-'+demografiaId+'">Cerrar</button>');
						$('#listaMetas').html('');
						var render = renderMetas(indicadorId);
						$('#listaMetas').append(render);
		        	}else{
						$("#mensajeBorradoMeta").html("");
						$("#mensajeBorradoMeta").append('<h3 class="text-center">Error al intentar Borrar este Registro!!</h3>');
						$('#agregarBotonBorradoMeta').html('');
					}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });		 
	});
	$("body").on("click", ".consultaEditarMeta",function(event){
 		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var id = idParsed[0];
		
	    var indicadorId = idParsed[1];
	    var zonaGeograficaId = idParsed[2];
	    var demografiaId = idParsed[3];

		if ( $("#modalMetas").length )
		{
			$("#modalMetas").remove();
		}	
		if ( $("#modalEditarMeta").length )
		{
			$("#modalEditarMeta").remove();
		}	
		
	  	var metas = $.ajax({
	    	url:'/ajaxSelects?accion=getMetas&metaId='+id,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	metas = JSON.parse(metas);
		
		var cuerpoModalMetas = "";

		cuerpoModalMetas =	'<div class="modal fade" id="modalEditarMeta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalMetas" parametros="'+indicadorId+'-'+zonaGeograficaId+'-'+demografiaId+'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoModalEditarMeta">'+
							
							'		      		<div class="row">'+		
							
							<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>		

							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning box-solid">'+
							'		                	<div class="box-header with-border">'+
							'	                  			<h3 class="box-title">Metas</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'		                  		</div>'+
							'              				</div>'+
							'               			<div class="box-body">'+
			
							'		      					<div class="col-md-12">'+
							'									<div class="box box-default box-solid">'+
							'		                				<div class="box-header with-border">'+
							'		                  					<h3 class="box-title">Editar Meta</h3>'+
							'	                  						<div class="box-tools pull-right">'+

							'		                  					</div>'+
							'              							</div>'+
							'              						<div class="box-body">'+
							
							'										<div class="table-responsive">'+
							'											<table class="table table-hover">'+
							'												<tbody>'+
							'			      									<form class="form-horizontal" role="form">'+
							'													<tr><td><label for="cantidadMetas">Cantidad</label><input type="text" id="cantidadMetas" class="form-control" value="'+metas[0].cantidad+'" /></td><td><label for="vencimientoMetas">Fecha</label><input id="vencimientoMetas" class="form-control" value="'+metas[0].vencimiento+'" /></td></tr>'+
							'													<input type="hidden" id="zonaGeograficaMetas" value="'+zonaGeograficaId+'" /><input type="hidden" id="demografiaMetas" value="'+demografiaId+'" /><input type="hidden" id="indicadorMetas" value="'+indicadorId+'" /><input type="hidden" id="idMetas" value="'+id+'" />'+

							'			      									</form>	'+				
							'												</tbody>'+
							'											</table>'+
							'				      					</div>'+
							
							'				      				 </div>'+//fin box body
							'									 <div class="modal-footer">'+ 
							'					        			<button type="button" class="btn btn-success btn-sm guardarMetasCambios" >Guardar Meta</button>'+ 
							'									 </div>'+									
							'				      			 	</div>'+
							'				      			</div>'+							

							<% }%>		
			
							'              				</div>'+
							'                		</div>'+	
							'               	</div>'+
							'                </div>'+//fin row																	
							
							'		    </div>'+
							'			<div class="modal-footer">'+
					      	'			</div>'+														
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
		$("body").append(cuerpoModalMetas);
		$("#modalEditarMeta").modal('show');
		$('#vencimientoMetas').datepicker({  
			language: "es",
			format: 'yyyy-mm-dd',
			todayBtn: "linked",
		    todayHighlight: true});
				
		});
	
	$("body").on("click", ".guardarMetasCambios",function(event){
		
		var objeto = new Object();
		
		//como esta en la clase 
		var id = $("#idMetas").val(); 
		var cantidad = $("#cantidadMetas").val(); 
		var vencimiento = $("#vencimientoMetas").val(); 
		var indicadorId = $("#indicadorMetas").val(); 
		var zonaGeograficaId = $("#zonaGeograficaMetas").val(); 
		var demografiaId = $("#demografiaMetas").val(); 

		var objeto = new Object();

		objeto.id = id;
		objeto.cantidad = cantidad;
		objeto.vencimiento = vencimiento;
		objeto.indicador_id = indicadorId;
		objeto.zona_geografica_id = zonaGeograficaId;
		objeto.demografia_id = demografiaId;

		 $.ajax({
		        url: "ajaxUpdate?accion=actMetas",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
						$('#cuerpoModalEditarMeta').html('');
						$('#cuerpoModalEditarMeta').append('<h3 class="text-center">Ud edito el Registro con Exito!!</h3>');

		        	}else{
						$("#cuerpoModalEditarMeta").html("");
						$("#cuerpoModalEditarMeta").append('<h3 class="text-center">Error al intentar Editar este Registro!!</h3>');
					}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });					

		 
	});

	
	});
<%}else{%>
window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%}%>
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
	<section class="content" id="cuerpoIndicador">

	<div class="row">
		<div class="col-md-12">
        	<div class="box" height="1000px">
          		<div class="box-header with-border" height="1000px">
            		<h3 class="box-title">Indicadores</h3>
            		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
          		</div>
          		<div class="box-body" id="cuerpoIndicadores">
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
    <script src="plugins/datepicker/locales/bootstrap-datepicker.es.js" charset="UTF-8"></script>
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
