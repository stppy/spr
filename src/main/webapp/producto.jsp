<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
  	<!--  ISO-8859-1 -->
  	<%@ include file="/frames/head.jsp" %>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet"> 
	
	<link href="plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="plugins/datatables/css/buttons.dataTables.min.css" rel="stylesheet">
    
    <!-- bootstrap datepicker css  -->
	<link href="plugins/datepicker/datepicker3.css" rel="stylesheet">
    
    <style type="text/css">
    	legend {
	    	width:inherit; /* Or auto */	    	
	    	border-bottom:none;
	    	margin-bottom: 10px;
    </style>    
</head>

<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>

<script>
var entidad_id_jsp=<%=attributes.get("entidad_id") %>;
var nivel_id_jsp=<%=attributes.get("nivel_id") %>;
var rol_jsp=<%=attributes.get("role_id").toString() %>;

function modalExito() {
	var nuevoModalExito = '    <div id="modalMensajeExito" class="modal fade">'+
    '        <div class="modal-dialog">'+
 '            <div class="modal-content">'+
 '                 <div class="modal-body alert-success">'+
 '                    <h3 class="text-center">REGISTRO GUARDADO EXITOSAMENTE</h3>'+
 '                </div>'+
 '            </div> '+
 '        </div>'+
 '    </div>';
$("body").append(nuevoModalExito);
$('#modalMensajeExito').on('show.bs.modal', function (){
    var myModal = $(this);
    clearTimeout(myModal.data('hideInterval'));
    myModal.data('hideInterval', setTimeout(function(){
        myModal.modal('hide');
    }, 1800));
}).modal('show')
}

function numeroConComa(x) {
	return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function modalError() {
		var nuevoModalError = '    <div id="modalMensajeError" class="modal fade">'+
        '        <div class="modal-dialog">'+
     '            <div class="modal-content">'+
     '                 <div class="modal-body alert-danger">'+
     '                        <div class="alert-danger">'+
     '                        <h3 class="text-center">ERROR AL GUARDAR EL REGISTRO.</h3>'+
//     '                        <h3 class="text-center">FAVOR CONTACTAR A: </h3>'+
     '                    </div>'+
     '                </div>'+
/*     '                 <div class="modal-footer">'+
     '                    <div class="box box-danger" height="1000px">'+
     '                        <div class="box-header with-border" height="1000px"  align="left">'+
     '                            <h3 class="box-title" id="tituloTipoPrograma">'+
     '                                DGGPR'+
     '                            </h3>'+
     '                        </div>'+
     '                        <div class="box-body" align="left">'+
     '                            <table class="table table-striped table-bordered table-hover">'+
     '                                <tr>'+
     '                                    <td>Nombre</td>'+
     '                                    <td>Sebastián Codas</td>'+
     '                                </tr>'+
     '                                <tr>'+
     '                                    <td>Correo Electrónico</td>'+
     '                                    <td>dggpr@stp.gov.py</td>'+
     '                                </tr>'+
     '                                <tr>'+
     '                                    <td>Teléfono Laboral</td>'+
     '                                    <td>+595 21 450422</td>'+
     '                                </tr>'+
     '                                <tr>'+
     '                                    <td>Teléfono Móvil</td>'+
     '                                    <td>+595 985 321761</td>'+
     '                                </tr>'+
     '                            </table> '+
     '                        </div>'+
     '                    </div>'+
     '                </div>'+*/
     '            </div> '+
     '        </div>'+
     '    </div>';
    $("body").append(nuevoModalError);
    $('#modalMensajeError').modal('show');
}

function cargarIndicadoresVinculados(productoConcat,objetivoRelId, relTipoObjetivoId, objetivoAnho, objetivoVersion, parametroRetorno){
	
	var tablaIndicadoresVinculados = "";
	var cuerpoTablaIndicadoresVinculados = "";
	$("#cuerpoIndicadoresVinculados").html("");
	
	var indicadores = $.ajax({
    	url:'/ajaxSelects?accion=getIndicador&tipoIndicadorId=2',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	indicadores = JSON.parse(indicadores);
  	indicadores = indicadores.indicadores;
	
	var indicadoresVinculados = $.ajax({
    	url:'/ajaxSelects?accion=getObjetivoHasIndicador&productoConcat='+productoConcat+'&objetivoId='+objetivoRelId+'&tipoObjetivoId='+relTipoObjetivoId+'&anho='+objetivoAnho+'&objetivoVersion='+objetivoVersion,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	indicadoresVinculados = JSON.parse(indicadoresVinculados);
  	indicadoresVinculados = indicadoresVinculados.indicadores;
  	
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
	
	var fuenteVerificacion = $.ajax({
    	url:'/ajaxSelects?accion=getFuenteVerificacion',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	fuenteVerificacion = JSON.parse(fuenteVerificacion);
	
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
	
	var cuerpoTablaIndicadoresVinculados="";	
	var tablaIndicadoresVinculados = "";
	var optionTipoIndicador;
	var optionUnidadesMedida;
	var optionFuenteVerificacion;
	var optionObjetivos;
	var optionCoberturaGeograficaAlcance;
	var optionNivelDespliegueGeografico;
	var optionCoberturaDemograficaAlcance;
	var optionNivelDespliegueDemografico;
  	
  	
	for(var q = 0; q < indicadores.length; q++){
		for (var ind=0;ind<indicadoresVinculados.length; ind++){ 
			if (indicadoresVinculados[ind].indicadorId==indicadores[q].id && indicadoresVinculados[ind].productoConcat==productoConcat && indicadoresVinculados[ind].indicadorTipoIndicadorId==indicadores[q].tipo_indicador_id){
			//if (indicadoresVinculados[ind].indicadorId==indicadores[q].id && indicadoresVinculados[ind].productoConcat==productoConcat && indicadoresVinculados[ind].indicadorTipoIndicadorId==indicadores[q].tipo_indicador_id && indicadoresVinculados[ind].indicadorUnidadMedidaId==indicadores[q].unidad_medida_id){
				//if (indicadoresVinculados[ind].indicadorId==indicadores[q].id && indicadoresVinculados[ind].productoConcat==productoConcat && indicadoresVinculados[ind].indicadorTipoIndicadorId==indicadores[q].tipo_indicador_id && indicadoresVinculados[ind].indicadorUnidadMedidaId==indicadores[q].unidad_medida_id && indicadoresVinculados[ind].indicadorFuenteVerificacionId==indicadores[q].fuente_verificacion_id){

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
				
				for(var f = 0; f < fuenteVerificacion.length; f++){
					if(fuenteVerificacion[f].id == indicadores[q].fuente_verificacion_id){
						optionFuenteVerificacion = fuenteVerificacion[f].nombre;
					}
				}
				
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
						cuerpoTablaIndicadoresVinculados += '<tr><td><del>'+indicadores[q].nombre+'</del></td><td><del>'+optionTipoIndicador+'</del></td>'+
						'<td><del>'+optionUnidadesMedida+'</del></td><td><del>'+indicadores[q].frecuencia_meses+'</del></td><td><del>'+indicadores[q].fuente_verificacion_id+'</del></td>'+
						'<td class="text-center"></td></tr>';
					<%}%>
				}else{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
cuerpoTablaIndicadoresVinculados += '<tr><td>'+indicadores[q].nombre+'</td><td>'+optionTipoIndicador+'</td>'+
									'<td>'+optionUnidadesMedida+'</td><td>'+indicadores[q].frecuencia_meses+'</td><td>'+indicadores[q].fuente_verificacion_id+'</td>'+
									'<td class="text-center">'+
									
/* 								    var idParsed = usuarios[0].correo.split("@");
									var usuarioInstitucion = idParsed[1];
								    idParsed = indicadores[q].usuarioResponsable.split("@");
									var usuarioIndicador = idParsed[1];
									if(usuarioInstitucion == usuarioIndicador){
									
									if(usuarios[0].correo == indicadores[q].usuarioResponsable){
										cuerpoTablaIndicadoresVinculados +=	'<button type="button" class="btn btn-default btn-sm consultaEditarIndicador" data-toggle="tooltip" data-placement="top" title="Editar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-pencil"></span></button>';
									}else{
										cuerpoTablaIndicadoresVinculados +=	'<button type="button" class="btn btn-default btn-sm consultaVerificarIndicador" data-toggle="tooltip" data-placement="top" title="Usted no puede modificar este Indicador"> <span class="glyphicon glyphicon-pencil"></span></button>';
									}
*/									
									'<button type="button" class="btn btn-default btn-sm consultaEditarIndicador" data-toggle="tooltip" data-placement="top" title="Editar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-pencil"></span></button>'+
									'<button type="button" class="btn btn-default btn-sm modalMetas" data-toggle="tooltip" data-placement="top" title="Agregar Meta" parametros="'+indicadores[q].id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+parametroRetorno+'-Metas">'+
										'<span class="glyphicon glyphicon-list-alt"></span>'+
									'</button>'+
									'<button type="button" class="btn btn-default btn-sm modalMetas" data-toggle="tooltip" data-placement="top" title="Agregar Avance" parametros="'+indicadores[q].id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+parametroRetorno+'-Avance">'+
									'<span class="fa fa-line-chart"></span>'+
								'</button>'+
								'<button type="button" class="btn btn-default btn-sm consultaBorrarIndicadorVinculado" data-toggle="tooltip" data-placement="top" title="Borrar Indicador Vinculado" parametros="'+indicadores[q].id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-trash"></span></button>';
								
/*								if(usuarios[0].correo == indicadores[q].usuarioResponsable){
									cuerpoTablaIndicadoresVinculados +='<button type="button" class="btn btn-default btn-sm consultaBorrarIndicadorVinculado" data-toggle="tooltip" data-placement="top" title="Borrar Indicador Vinculado" parametros="'+indicadores[q].id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-trash"></span></button>';
								}else{
									cuerpoTablaIndicadoresVinculados +='<button type="button" class="btn btn-default btn-sm consultaVerificarIndicador" data-toggle="tooltip" data-placement="top" title="Usted no puede borrar este Indicador" ><span class="glyphicon glyphicon-trash"></span></button>';
								}
*/								
								
cuerpoTablaIndicadoresVinculados +=	'</td></tr>';

					<%} if (attributes.get("role_id").toString().equals("3")){%>
cuerpoTablaIndicadoresVinculados += '<tr><td>'+indicadores[q].nombre+'</td>'+
									'<td>'+optionTipoIndicador+'</td>'+
									'<td>'+optionUnidadesMedida+'</td>'+
									'<td>'+indicadores[q].frecuencia_meses+'</td>'+
									'<td>'+indicadores[q].fuente_verificacion_id+'</td>'+
									'<td></td></tr>';
					<%}%>
				}
			}	
		}
	}

	var tablaIndicadoresVinculados ='<div class="table-responsive">'+
				'	              		<table class="table table-hover table-bordered" id="dataTablesIndicadoresVinculados-'+productoConcat+'">'+
				'	                		<thead>'+
				'	                			<tr class="active"><th class="text-center" colspan="5">Indicadores Vinculados</th><th class="text-center"></th></tr>'+
				'								<tr class="active"><th class="text-center">Nombre</th>'+
				'									<th class="text-center">Tipo Indicador</th>'+
				'									<th class="text-center">Unidad de Medida</th>'+
				'									<th class="text-center">Frecuencia de Medición</th>'+
				'									<th class="text-center">Fuente de Datos</th>'+
				'									<th class="text-center">Administrar</th>'+
				'								</tr>'+
				'	                		</thead>'+
				'		                	<tbody id="tablaIndicadoresPrecargadosVinculados-'+productoConcat+'">'+
				'		                	</tbody>'+
				'	               	 	</table>'+
				'	              	</div>';
	
	$('#cuerpoIndicadoresVinculados-'+productoConcat).html('');
	$('#cuerpoIndicadoresVinculados-'+productoConcat).append(tablaIndicadoresVinculados);
	$('#tablaIndicadoresPrecargadosVinculados-'+productoConcat).append(cuerpoTablaIndicadoresVinculados);
	$("#dataTablesIndicadoresVinculados-"+productoConcat).DataTable({
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  }
              ]
    });
	
}


function renderIndicadores(productoConcat,objetivoRelId, relTipoObjetivoId, objetivoAnho, objetivoVersion, parametroRetorno){
	
	var tablaIndicadores = "";
	var cuerpoTabla = "";
	$("#cuerpoIndicadores").html("");
	
  	var indicadores = $.ajax({
    	url:'/ajaxSelects?accion=getIndicador&tipoIndicadorId=2',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	indicadores = JSON.parse(indicadores);
  	indicadores = indicadores.indicadores;
  	
	var indicadoresVinculados = $.ajax({
    	url:'/ajaxSelects?accion=getObjetivoHasIndicador&productoConcat='+productoConcat+'&objetivoId='+objetivoRelId+'&tipoObjetivoId='+relTipoObjetivoId+'&anho='+objetivoAnho+'&objetivoVersion='+objetivoVersion,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	indicadoresVinculados = JSON.parse(indicadoresVinculados);
  	indicadoresVinculados = indicadoresVinculados.indicadores;
  	
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
	
	var fuenteVerificacion = $.ajax({
    	url:'/ajaxSelects?accion=getFuenteVerificacion',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	fuenteVerificacion = JSON.parse(fuenteVerificacion);
	
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
	var lineasDeAccion=[];

	for(var g = 0; g < indicadoresVinculados.length; g++){
		lineasDeAccion.push(indicadoresVinculados[g].indicadorId);
	}  	
	
	for(var q = 0; q < indicadores.length; q++){
		if (lineasDeAccion.indexOf(indicadores[q].id)<0){

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
			
			for(var f = 0; f < fuenteVerificacion.length; f++){
				if(fuenteVerificacion[f].id == indicadores[q].fuente_verificacion_id){
					optionFuenteVerificacion = fuenteVerificacion[f].nombre;
				}
			}
			
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
					cuerpoTabla += '<tr><td><del>'+indicadores[q].nombre+'</del></td><td><del>'+optionTipoIndicador+'</del></td>'+
					'<td><del>'+optionUnidadesMedida+'</del></td><td><del>'+indicadores[q].frecuencia_meses+'</del></td><td><del>'+indicadores[q].fuente_verificacion_id+'</del></td>'+
					'<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarIndicador" data-toggle="tooltip" data-placement="top" title="Restaurar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'-'+parametroRetorno+'"><span class="fa fa-recycle"></span></button></td></tr>';
				<%}%>
			}else{
				<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
					cuerpoTabla += 	'<tr><td>'+indicadores[q].nombre+'</td><td>'+optionTipoIndicador+'</td>'+
										'<td>'+optionUnidadesMedida+'</td><td>'+indicadores[q].frecuencia_meses+'</td><td>'+indicadores[q].fuente_verificacion_id+'</td>'+
										'<td class="text-center">'+
											'<button type="button" class="btn btn-default btn-sm consultaEditarIndicador" data-toggle="tooltip" data-placement="top" title="Editar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-pencil"></span></button>'+
											'<button type="button" class="btn btn-default btn-sm consultaBorrarIndicador" data-toggle="tooltip" data-placement="top" title="Borrar Indicador" parametros="'+indicadores[q].id+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].objetivo_id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-trash"></span></button>'+
											'<button type="button" class="btn btn-default btn-sm agregarIndicadorAResultado" data-toggle="tooltip" data-placement="top" title="Agregar A Resultado" parametros="'+indicadores[q].id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+productoConcat+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'-'+indicadores[q].tipo_indicador_id+'-'+indicadores[q].unidad_medida_id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+indicadores[q].fuente_verificacion_id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-plus"></span></button>'+
											'<button type="button" class="btn btn-default btn-sm modalMetas" data-toggle="tooltip" data-placement="top" title="Agregar Meta" parametros="'+indicadores[q].id+'-'+indicadores[q].desagregacion_tipo_zona_geografica_id+'-'+indicadores[q].tipo_demografica_id+'-'+parametroRetorno+'"><span class="glyphicon glyphicon-list-alt"></span></button>'+
										'</td>'+
									'</tr>';
				<%} if (attributes.get("role_id").toString().equals("3")){%>
					cuerpoTabla += 	'<tr>'+
										'<td>'+indicadores[q].nombre+'</td>'+
										'<td>'+optionTipoIndicador+'</td>'+
										'<td>'+optionUnidadesMedida+'</td>'+
										'<td>'+indicadores[q].frecuencia_meses+'</td>'+
										'<td>'+indicadores[q].fuente_verificacion_id+'</td>'+
										'<td></td>'+
									'</tr>';
				<%}%>
			}	
		}
	}
	
			var tablaIndicadores ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesIndicadores-'+productoConcat+'">'+
			'	                	<thead>'+
			'	                		<tr class="active"><th class="text-center" colspan="5">Agregar Nuevo Indicador</th><th class="text-center">';
										<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
					tablaIndicadores += '<button type="button" class="btn btn-default btn-sm agregarIndicador" data-toggle="tooltip" data-placement="top" title="Agregar Indicador" parametros="'+parametroRetorno+'"><span class="glyphicon glyphicon-plus"></span></button></th></tr>';
										<%}%>
					tablaIndicadores += '<tr class="active">'+
			'								<th class="text-center">Nombre</th>'+
			'								<th class="text-center">Tipo Indicador</th>'+
			'								<th class="text-center">Unidad de Medida</th>'+
			'								<th class="text-center">Frecuencia de Medición</th>'+
			'								<th class="text-center">Fuente de Datos</th>'+
			'								<th class="text-center">Administrar</th>'+
			'							</tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaIndicadoresPrecargados-'+productoConcat+'">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$("#cuerpoIndicadores-"+productoConcat).html('');
			$("#cuerpoIndicadores-"+productoConcat).append(tablaIndicadores);
			$("#tablaIndicadoresPrecargados-"+productoConcat).append(cuerpoTabla);
			$("#dataTablesIndicadores-"+productoConcat).DataTable();
}

$("body").on("click", ".consultaVerificarIndicador",function(event){
	
	modalError("Usted no puede modificar este Indicador. Favor comunicarse con scs@stp.gov.py",false);
});

	
$("body").on("click", ".agregarIndicador",function(event){
	 	var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");
		var nivel = idParsed[0];
		var entidad = idParsed[1];
		var tipoPresupuesto = idParsed[2];
		var programa = idParsed[3];
		var subPrograma = idParsed[4];
		var proyecto = idParsed[5];
		var producto = idParsed[6];
		var objetivoRelId = idParsed[7];
		var relTipoObjetivoId = idParsed[8];
		var relAnho = idParsed[9];
		var relVersion = idParsed[10];
		var objetivoId = idParsed[11];
		var tipoObjetivoId = idParsed[12];
		var objetivoAnho = idParsed[13];
		var objetivoVersion = idParsed[14];
		
		if ( $("#modalIndicadorProducto").length )
		{
			$("#modalIndicadorProducto").remove();
		}	
		if ( $("#modalIndicador").length )
		{
			$("#modalIndicador").remove();
		}
		if ( $("#consultaModalBorrarIndicadorVinculado").length )
		{
			$("#consultaModalBorrarIndicadorVinculado").remove();
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
		for(var t = 0; t < tipoIndicador.length; t++){
			if (tipoIndicador[t].id == 2){
				optionTipoIndicador += '<option value="'+tipoIndicador[t].id+'" >'+tipoIndicador[t].nombre+'</option>';	
			}			
		}																													
																																										
		var cuerpoModalIndicador = "";
		
		cuerpoModalIndicador =	'<div class="modal fade" id="modalIndicador" tabindex="-1" aria-labelledby="myLargeModalLabel" data-backdrop="static" data-keyboard="false">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close indicadores-modal-objetivo" data-dismiss="modal" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'"><span aria-hidden="true">&times;</span></button>'+
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
								'												           <label>Frecuencia de Medición (meses)</label>'+
								'												           <input type="number" class="form-control" id="frecuenciaMedicionIndicador" value="0">'+
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
								'												           	<input type= "text" class="form-control" id="fuenteVerificacionId" />'+
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
								'								<button type="submit" class="btn btn-success guardarIndicador" parametros="'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'">Guardar</button>'+

								'							</div>'+
								'                		</div>'+	
								'                	</div>'+
								'                </div>'+											
					
								'		    </div>'+
						
								'		</div>'+ 
								'	</div>'+
								'</div>'; 
		
		$("body").append(cuerpoModalIndicador);
		$("#modalIndicador").modal({backdrop: "static", show: true});
	});

		
		$("body").on("click", ".guardarIndicador",function(event){
	 		var parametros = $(this).attr("parametros");
			var accion = "actEditarIndicadores";
		    var idParsed = parametros.split("-");
			var nivel = idParsed[0];
			var entidad = idParsed[1];
			var tipoPresupuesto = idParsed[2];
			var programa = idParsed[3];
			var subPrograma = idParsed[4];
			var proyecto = idParsed[5];
			var producto = idParsed[6];
			var objetivoRelId = idParsed[7];
			var relTipoObjetivoId = idParsed[8];
			var relAnho = idParsed[9];
			var relVersion = idParsed[10];
			var objetivoId = idParsed[11];
			var tipoObjetivoId = idParsed[12];
			var objetivoAnho = idParsed[13];
			var objetivoVersion = idParsed[14];
			
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
			        		
			        		cuerpoModalIndicadorGuardado =	'<div class="modal fade" id="modalIndicadorGuardado" tabindex="-1" aria-labelledby="myLargeModalLabel" data-backdrop="static" data-keyboard="false">'+
					        								'	<div class="modal-dialog modal-lg" style="width:90%">'+
					        								'		<div class="modal-content" >'+
					        								'			<div class="modal-header">'+
					        								'		        <button type="button" class="close indicadores-modal-objetivo" data-dismiss="modal" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'" ><span aria-hidden="true">&times;</span></button>'+
					        								'		        <h4 class="modal-title">Agregar Indicador</h4>'+   
					        								'			</div>'+
					        								'		    <div class="modal-body" id="cuerpoIndicadorGuardado" >'+								
					        					
					        								'		    </div>'+
					        						
					        								'		</div>'+ 
					        								'	</div>'+
					        								'</div>'; 
			        		
			        		$("body").append(cuerpoModalIndicadorGuardado);
			        		$("#modalIndicadorGuardado").modal({backdrop: "static", show: true});
							$('#cuerpoIndicadorGuardado').html('');
							$('#cuerpoIndicadorGuardado').append('<h3 class="text-center">Se Guardo el Registro con Exito!!</h3>');
							//renderIndicadores();
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
			var nivel = idParsed[6];
			var entidad = idParsed[7];
			var tipoPresupuesto = idParsed[8];
			var programa = idParsed[9];
			var subPrograma = idParsed[10];
			var proyecto = idParsed[11];
			var producto = idParsed[12];
			var objetivoRelId = idParsed[13];
			var relTipoObjetivoId = idParsed[14];
			var relAnho = idParsed[15];
			var relVersion = idParsed[16];
			var objetivoIdRetorno = idParsed[17];
			var tipoObjetivoId = idParsed[18];
			var objetivoAnho = idParsed[19];
			var objetivoVersion = idParsed[20];

			if ( $("#modalEditarIndicador").length )
			{
				$("#modalEditarIndicador").remove();
			}
			if ( $("#consultaModalBorrarIndicador").length )
			{
				$("#consultaModalBorrarIndicador").remove();
			}	
			if ( $("#consultaModalBorrarIndicadorVinculado").length )
			  {
				  $("#consultaModalBorrarIndicadorVinculado").remove();
			  }
			if ( $("#modalMetas").length )
			{
				$("#modalMetas").remove();
			}
			if ( $("#modalIndicadorProducto").length )
			{
				$("#modalIndicadorProducto").remove();
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
			
			cuerpoModalIndicador =	'<div class="modal fade" id="consultaModalBorrarIndicador" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'	<div class="modal-dialog modal-lg" style="width:90%">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close indicadores-modal-objetivo" data-dismiss="modal" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoIdRetorno+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'"><span aria-hidden="true">&times;</span></button>'+
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
//			objeto.metodo_calculo_id = metodoCalculoId;
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
							//renderIndicadores();
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
		
////////BORRAR INDICADOR VINCULADO DESDE OBJETIVO HAS INDICADOR
	$("body").on("click", ".consultaBorrarIndicadorVinculado",function(event){
	 		var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-");
	      	
		    var indicadorId = idParsed[0];
		    var nivel=idParsed[1];
		    var entidad=idParsed[2];
		    var tipoPresupuesto=idParsed[3];
		    var programa=idParsed[4];
		    var subprograma=idParsed[5];
		    var proyecto=idParsed[6];
		    var producto=idParsed[7];
		    var objetivoRelId=idParsed[8];
		    var relTipoObjetivoId=idParsed[9];
		    var relAnho=idParsed[10];
		    var relVersion=idParsed[11];
		    var objetivoId=idParsed[12];
		    var tipoObjetivoId=idParsed[13];
		    var objetivoAnho=idParsed[14];
		    var objetivoVersion=idParsed[15]; 
		    
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+indicadorId;
		    var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;

		    		
		    if ( $("#modalEditarIndicador").length )
			{
				$("#modalEditarIndicador").remove();
			}
			if ( $("#consultaModalBorrarIndicadorVinculado").length )
			{
				$("#consultaModalBorrarIndicadorVinculado").remove();
			}
			if ( $("#modalMetas").length )
			{
				$("#modalMetas").remove();
			}
			if ( $("#modalIndicadorProducto").length )
			{
				$("#modalIndicadorProducto").remove();
			}	
			
		  	var indicadores = $.ajax({
		  		url:'ajaxSelects?accion=getObjetivoHasIndicador&objetivoRelId='+objetivoRelId+'&relTipoObjetivoId='+relTipoObjetivoId+'&relAnho='+relAnho+'&relVersion='+relVersion+'&indicadorId='+indicadorId,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	indicadores = JSON.parse(indicadores);
		  	indicadores = indicadores.indicadores;
		  	
		  	var nombreIndicador = $.ajax({
		    	url:'/ajaxSelects?accion=getIndicador&indicadorId='+indicadorId, //+'&tipoIndicadorId='+tipoIndicadorId+'&unidadMedidaId='+unidadMedidaId+'&desagregacionTipoZonaGeograficaId='+desagregacionTipoZonaGeograficaId+'&tipoDemograficaId='+tipoDemograficaId+'&objetivoId='+objetivoId,//borre &fuenteVerificacionId='+fuenteVerificacionId+'
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	nombreIndicador = JSON.parse(nombreIndicador);
		  	nombreIndicador = nombreIndicador.indicadores;
		  	
		  	
		  	
			var cuerpoModalIndicadorVinculado = "";
			
			cuerpoModalIndicadorVinculado =	'<div class="modal fade" id="consultaModalBorrarIndicadorVinculado" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'	<div class="modal-dialog modal-lg" style="width:90%">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close indicadores-modal-objetivo" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
									'		        <h4 class="modal-title">Borrar Indicador Vinculado</h4>'+
									'			</div>'+
									'		    <div class="modal-body" id="cuerpoModalBorrarIndicadorVinculado" >'+
									'				<h3 class="text-center" id="mensajeBorradoIndicadorVinculado"></h3>'+									
									'		    </div>'+
									'			<div class="modal-footer" id="agregarBotonBorradoIndicadorVinculado">'+
									'			</div>'+
							
									'		</div>'+ 
									'	</div>'+
									'</div>';
						
			$("body").append(cuerpoModalIndicadorVinculado);
				$("#mensajeBorradoIndicadorVinculado").html("");
				$("#mensajeBorradoIndicadorVinculado").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR : <strong> '+nombreIndicador[0].nombre+' ? </strong></h3');
				$("#agregarBotonBorradoIndicadorVinculado").html("");
				$("#agregarBotonBorradoIndicadorVinculado").append('<button type="button" class="btn btn-danger btn-sm borrarIndicadorVinculado" id="botonBorradoIndicadorVinculado" parametros='+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+indicadorId+'-b>Borrar Indicador</button>');
			$("#consultaModalBorrarIndicadorVinculado").modal('show');										
			 
		});
		$("body").on("click", ".borrarIndicadorVinculado",function(event){
	 		var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-");
		    
		    var nivel=idParsed[0];
		    var entidad=idParsed[1];
		    var tipoPresupuesto=idParsed[2];
		    var programa=idParsed[3];
		    var subprograma=idParsed[4];
		    var proyecto=idParsed[5];
		    var producto=idParsed[6];
		    var objetivoRelId=idParsed[7];
		    var relTipoObjetivoId=idParsed[8];
		    var relAnho=idParsed[9];
		    var relVersion=idParsed[10];
		    var indicadorId = idParsed[11];
		    var estado = idParsed[12]

		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+indicadorId;
		    var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
			
			var indicador = $.ajax({
				url:'ajaxSelects?accion=getObjetivoHasIndicador&objetivoRelId='+objetivoRelId+'&relTipoObjetivoId='+relTipoObjetivoId+'&relAnho='+relAnho+'&relVersion='+relVersion+'&indicadorId='+indicadorId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			indicador = JSON.parse(indicador);
			indicador = indicador.indicadores;
			var objeto = new Object();
			
			objeto.objetivoId = objetivoRelId;
			objeto.objetivoTipoObjetivoId = relTipoObjetivoId;
			objeto.objetivoAnho = relAnho;
			objeto.objetivoVersion = relVersion;
			objeto.indicadorId = indicadorId;
			objeto.productoConcat = productoConcat;
	
			 $.ajax({
			        url: "ajaxDelete?accion=delObjetivoHasIndicador&objetivoRelId="+objeto.objetivoId+"&relTipoObjetivoId="+objeto.objetivoTipoObjetivoId+"&relAnho="+objeto.objetivoAnho+"&relVersion="+objeto.objetivoVersion+"&indicadorId="+objeto.indicadorId+"&productoConcat="+productoConcat,
			        type: 'POST',
			        dataType: 'json',
			        //data: JSON.stringify(objeto),
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
			        	if(data.success == true){
			        		if(estado == "b"){
			        			/*if ( $("#consultaModalBorrarIndicadorVinculado").length )
			        			{
			        				$("#consultaModalBorrarIndicadorVinculado").remove();
			        			}	
								modalExito();*/
			        			$('#mensajeBorradoIndicadorVinculado').html('');
								$('#mensajeBorradoIndicadorVinculado').append('<h3 class="text-center">Se Borro el Registro con Exito!!</h3>');
								$('#agregarBotonBorradoIndicadorVinculado').html('');
								
			        		}else{
			        			/*if ( $("#consultaModalBorrarIndicadorVinculado").length )
			        			{
			        				$("#consultaModalBorrarIndicadorVinculado").remove();
			        			}
			        			modalError();*/
			        			$("#mensajeBorradoIndicadorVinculado").html("");
								$("#mensajeBorradoIndicadorVinculado").append('<h3 class="text-center">Error al intentar Borrar este Registro!!</h3>');
								$('#agregarBotonBorradoIndicadorVinculado').html('');
			        		}
			        	}else{
			        		/*if ( $("#consultaModalBorrarIndicadorVinculado").length )
			    			{
			    				$("#consultaModalBorrarIndicadorVinculado").remove();
			    			}
			        		modalError();*/
			        		$("#mensajeBorradoIndicadorVinculado").html("");
							$("#mensajeBorradoIndicadorVinculado").append('<h3 class="text-center">Error al intentar Borrar este Registro!!</h3>');
							$('#agregarBotonBorradoIndicadorVinculado').html('');
						}
			        },
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
			var nivel = idParsed[6];
			var entidad = idParsed[7];
			var tipoPresupuesto = idParsed[8];
			var programa = idParsed[9];
			var subPrograma = idParsed[10];
			var proyecto = idParsed[11];
			var producto = idParsed[12];
			var objetivoRelId = idParsed[13];
			var relTipoObjetivoId = idParsed[14];
			var relAnho = idParsed[15];
			var relVersion = idParsed[16];
			var objetivoIdRetorno = idParsed[17];
			var tipoObjetivoId = idParsed[18];
			var objetivoAnho = idParsed[19];
			var objetivoVersion = idParsed[20];
			
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion;
			
			if ( $("#modalEditarIndicador").length )
			{
				$("#modalEditarIndicador").remove();
			}
			if ( $("#consultaModalBorrarIndicador").length )
			{
				$("#consultaModalBorrarIndicador").remove();
			}	
			if ( $("#consultaModalBorrarIndicadorVinculado").length )
			{
				$("#consultaModalBorrarIndicadorVinculado").remove();
			}
			if ( $("#modalMetas").length )
			{
				$("#modalMetas").remove();
			}
			if ( $("#modalIndicadorProducto").length )
			{
				$("#modalIndicadorProducto").remove();
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
			for(i = 0;i<tiposDestinatarios.length; i++){
				optionDesagregacionDemograficaDestinatario+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
			}1
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
			for(var t = 0; t < tipoIndicador.length; t++){
				if (tipoIndicador[t].id == 2){ 
					optionTipoIndicador += '<option value="'+tipoIndicador[t].id+'" >'+tipoIndicador[t].nombre+'</option>';
				}
			}
				
			
			var cuerpoModalEditarIndicador = "";
			
			cuerpoModalEditarIndicador =	'<div class="modal fade" id="modalEditarIndicador" tabindex="-1" aria-labelledby="myLargeModalLabel" data-backdrop="static" data-keyboard="false">'+
									'	<div class="modal-dialog modal-lg" style="width:90%">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close indicadores-modal-objetivo" data-dismiss="modal" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoIdRetorno+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'"><span aria-hidden="true">&times;</span></button>'+
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
									'												           <label>Frecuencia de Medición (meses)</label>'+
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
									'												           <label>Nivel de Despliegue Demográfico y Desagregaciones</label>'+
									'												           <select class="form-control" id="nivelDespliegueDemograficoId">'+optionNivelDespliegueDemografico+'</select>'+
									'												         </div>'+			*/
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
									'								<button type="submit" class="btn btn-success guardarIndicadorCambios" parametros="'+id+'-'+tipoIndicadorId+'-'+unidadMedidaId+'-'+desagregacionTipoZonaGeograficaId+'-'+tipoDemograficaId+'-'+objetivoId+'-'+parametroRetorno+'">Guardar Cambios</button>'+
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
			var nivel = idParsed[6];
			var entidad = idParsed[7];
			var tipoPresupuesto = idParsed[8];
			var programa = idParsed[9];
			var subPrograma = idParsed[10];
			var proyecto = idParsed[11];
			var producto = idParsed[12];
			var objetivoRelId = idParsed[13];
			var relTipoObjetivoId = idParsed[14];
			var relAnho = idParsed[15];
			var relVersion = idParsed[16];
			var objetivoIdRetorno = idParsed[17];
			var tipoObjetivoId = idParsed[18];
			var objetivoAnho = idParsed[19];
			var objetivoVersion = idParsed[20];
					
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
			        		if ( $("#consultaModalBorrarIndicadorVinculado").length )
			    			{
			    				$("#consultaModalBorrarIndicadorVinculado").remove();
			    			}
			        		var modalIndicadorEditado = "";
			        		
			        		modalIndicadorEditado =			'<div class="modal fade" id="modalIndicadorEditado" tabindex="-1" aria-labelledby="myLargeModalLabel" data-backdrop="static" data-keyboard="false">'+
					        								'	<div class="modal-dialog modal-lg" style="width:90%">'+
					        								'		<div class="modal-content" >'+
					        								'			<div class="modal-header">'+
					        								'		        <button type="button" class="close indicadores-modal-objetivo" data-dismiss="modal" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoIdRetorno+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'"><span aria-hidden="true">&times;</span></button>'+
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
			        	}else{
							$("#cuerpoIndicadorEditado").html("");
							$("#cuerpoIndicadorEditado").append('<h3 class="text-center">Error al intentar guardar este Registro!!</h3>');
						}
			        },
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {}
			 });
					 
		});

		function renderMetas(indicadorId,parametroRetorno, avance){
			
			if(avance=="Avance"){
				var webServicesMetas = $.ajax({
					url:'/ajaxSelects?accion=getAvanceMetas&indicadorId='+indicadorId,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				webServicesMetas = JSON.parse(webServicesMetas);
			}else{
				if(avance=="Metas"){
					var webServicesMetas = $.ajax({
						url:'/ajaxSelects?accion=getMetas&indicadorId='+indicadorId,
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;
					webServicesMetas = JSON.parse(webServicesMetas);	
				}
			}
			
			var cuerpoMetas = "";
			for(var a = 0; a < webServicesMetas.length; a++)
			{
				if(webServicesMetas[a].borrado == true)
				{
					<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
						cuerpoMetas += '<tr><td><del>'+webServicesMetas[a].vencimiento+'</del></td><td><del>'+webServicesMetas[a].cantidad+'</del></td><td class="text-center"></button><button type="button" class="btn btn-default btn-sm consultaBorrarMeta" data-toggle="tooltip" data-placement="top" title="Restaurar Meta" parametros='+webServicesMetas[a].id+'-'+webServicesMetas[a].indicador_id+'-'+webServicesMetas[a].zona_geografica_id+'-'+webServicesMetas[a].demografia_id+'-'+parametroRetorno+'-'+avance+' ><span class="fa fa-recycle"></span></button></td></tr>';
					<% }%>
				}else{
					<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
						cuerpoMetas += '<tr><td>'+webServicesMetas[a].vencimiento+'</td><td>'+webServicesMetas[a].cantidad+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarMeta" data-toggle="tooltip" data-placement="top" title="Editar Meta" parametros='+webServicesMetas[a].id+'-'+webServicesMetas[a].indicador_id+'-'+webServicesMetas[a].zona_geografica_id+'-'+webServicesMetas[a].demografia_id+'-'+parametroRetorno+'-'+avance+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarMeta" data-toggle="tooltip" data-placement="top" title="Borrar Meta" parametros='+webServicesMetas[a].id+'-'+webServicesMetas[a].indicador_id+'-'+webServicesMetas[a].zona_geografica_id+'-'+webServicesMetas[a].demografia_id+'-'+parametroRetorno+'-'+avance+'><span class="fa fa-trash"></span></button></td></tr>';
					<%} if (attributes.get("role_id").toString().equals("3")){%>
						cuerpoMetas += '<tr><td>'+webServicesMetas[a].vencimiento+'</td><td>'+webServicesMetas[a].cantidad+'</td><td class="text-center"></td></tr>';
					<%}%>
				}

			}
						
			return cuerpoMetas;
		}
		
		function renderMeta(indicadorId,zonaGeograficaId,demografiaId,parametroRetorno,nivel,entidad,tipoPresupuesto,programa,subprograma,proyecto,producto,objetivoRelId,relTipoObjetivoId,relAnho,relVersion,objetivoId,tipoObjetivoId,objetivoAnho,objetivoVersion, avance){
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
			if ( $("#modalIndicadorProducto").length )
			{
				$("#modalIndicadorProducto").remove(); 
			}
			
			var cuerpoMetas = renderMetas(indicadorId, parametroRetorno, avance);
			
			var cuerpoModalMetas = "";

			cuerpoModalMetas =	'<div class="modal fade" id="modalMetas" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close indicadores-modal-objetivo" id="indicadores-modal-objetivo-'+nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion+'-'+avance+'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
								'			</div>'+
								'		    <div class="modal-body">'+
								
								'		      		<div class="row">'+		
								
								<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>		

								'		      		<div class="col-md-12">'+
								'						<div class="box box-warning box-solid">'+
								'		                	<div class="box-header with-border">'+
								'	                  			<h3 class="box-title">'+avance+'</h3>'+
								'	                  			<div class="box-tools pull-right">'+
								'		                  		</div>'+
								'              				</div>'+
								'               			<div class="box-body">'+
				
								'		      					<div class="col-md-12">'+
								'									<div class="box box-default box-solid">'+
								'		                				<div class="box-header with-border">'+
								'		                  					<h3 class="box-title">Agregar '+avance+'</h3>'+
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
								'					        			<button type="button" class="btn btn-success btn-sm guardarMetas" parametros="'+parametroRetorno+'-'+avance+'" >Guardar '+avance+'</button>'+ 
								'									 </div>'+									
								'				      			 	</div>'+
								'				      			</div>'+							

								<% }%>		


								'		      					<div class="col-md-12">'+
								'									<div class="box box-default box-solid">'+
								'		                				<div class="box-header with-border">'+
								'		                  					<h3 class="box-title">Lista '+avance+'</h3>'+
								'	                  						<div class="box-tools pull-right">'+
								'		                  					</div>'+
								'              							</div>'+
								'              						<div class="box-body">'+	
								'										<div class="table-responsive">'+
								'											<table class="table table-hover table-bordered" id="dataTableMetas">'+
								'												<thead>'+
								'													<tr class="active"><th>Fecha</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
								'												</thead>'+
								'												<tfoot><tr><th></th><th></th><th></th></tr></tfoot>'+	
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
			if ( $("#dataTableMetas").length){
				$('#dataTableMetas').DataTable().destroy();
			}
			$('#dataTableMetas').DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0, 1 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0, 1 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0, 1 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0, 1 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0, 1 ]
		                }
		                    }
		                ],
		        "footerCallback": function ( row, data, start, end, display ) {
		        	var api = this.api(), data;
		        	// saca los puntos y <del> de la cadena para pasarlo a entero
		        	var intVal = function(i){
		            	if(typeof i==='string'){	
		            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
		            		i=i.replace(/[","]/g, '.');
		            		i=i*1;		            		
		            	}else{
		            		if(typeof i==='number'){
		            			i=i;		            			
		            	}else{
		            		i=0;
		            	}
		            }
		            	return i;
		            };
		                
	                // total general para todas las paginas
	                total1 = api
	                    .column( 1 )
	                    .data()
	                    .reduce( function (a, b) {
	                        return intVal(a) + intVal(b);
	                    }, 0 );

	                // total por pagina 
	                pageTotal1 = api
	                    .column( 1, { page: 'current'} )
	                    .data()
	                    .reduce( function (a, b) {
	                        return intVal(a) + intVal(b);
	                    }, 0 );
	                
	                // se muestran los valores de los totales en el footer del table
	                $( api.column( 1 ).footer() ).html(
	                		'Total Pág. '+numeroConComa(pageTotal1) +' (Total Gral. '+ numeroConComa(total1) +')'	                		
	                );
				}
		    } ); 
			$('#modalMetas').modal('show');
			$('#vencimientoMetas').datepicker({  
				language: "es",
				format: 'yyyy-mm-dd',
				todayBtn: "linked",
			    todayHighlight: true});
		}
		
		$("body").on("click", ".modalMetas",function(event){
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-"); 
		    var indicadorId = idParsed[0];
		    var zonaGeograficaId = idParsed[1];
		    var demografiaId = idParsed[2];
		    
		    var nivel=idParsed[3];
		    var entidad=idParsed[4];
		    var tipoPresupuesto=idParsed[5];
		    var programa=idParsed[6];
		    var subprograma=idParsed[7];
		    var proyecto=idParsed[8];
		    var producto=idParsed[9];
		    var objetivoRelId=idParsed[10];
		    var relTipoObjetivoId=idParsed[11];
		    var relAnho=idParsed[12];
		    var relVersion=idParsed[13];
		    var objetivoId=idParsed[14];
		    var tipoObjetivoId=idParsed[15];
		    var objetivoAnho=idParsed[16];
		    var objetivoVersion=idParsed[17]; 
		    var avance=idParsed[18];
		    		    
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion;
		    //var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;

		    renderMeta(indicadorId,zonaGeograficaId,demografiaId,parametroRetorno,nivel,entidad,tipoPresupuesto,programa,subprograma,proyecto,producto,objetivoRelId,relTipoObjetivoId,relAnho,relVersion,objetivoId,tipoObjetivoId,objetivoAnho,objetivoVersion,avance);
			
		});
		
		$("body").on("click", ".guardarMetas",function(event){
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-"); 
		    var nivel=idParsed[0];
		    var entidad=idParsed[1];
		    var tipoPresupuesto=idParsed[2];
		    var programa=idParsed[3];
		    var subprograma=idParsed[4];
		    var proyecto=idParsed[5];
		    var producto=idParsed[6];
		    var objetivoRelId=idParsed[7];
		    var relTipoObjetivoId=idParsed[8];
		    var relAnho=idParsed[9];
		    var relVersion=idParsed[10];
		    var objetivoId=idParsed[11];
		    var tipoObjetivoId=idParsed[12];
		    var objetivoAnho=idParsed[13];
		    var objetivoVersion=idParsed[14]; 
		    var avance=idParsed[15];
		    
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion;
			//var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
		    
			var objeto = new Object();
			var indicadorId = $("#indicadorMetas").val();
			
			objeto.cantidad = $("#cantidadMetas").val(); 
			objeto.vencimiento = $("#vencimientoMetas").val(); 
			objeto.zona_geografica_id = $("#zonaGeograficaMetas").val();
			objeto.demografia_id = $("#demografiaMetas").val();
			objeto.indicador_id = indicadorId;
			//objeto.productoConcat = productoConcat;
			//objeto.nivel = nivel;
			//objeto.entidad = entidad;
			objeto.objetivoId = objetivoId;
			objeto.tipoObjetivoId = tipoObjetivoId;		
			objeto.avance = avance;

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
							/* $('#listaMetas').html('');
							var render = renderMetas(indicadorId,parametroRetorno);
							$('#listaMetas').append(render); */
			        		renderMeta(indicadorId,objeto.zona_geografica_id,objeto.demografia_id,parametroRetorno,nivel,entidad,tipoPresupuesto,programa,subprograma,proyecto,producto,objetivoRelId,relTipoObjetivoId,relAnho,relVersion,objetivoId,tipoObjetivoId,objetivoAnho,objetivoVersion,avance);
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
			
		    var nivel=idParsed[4];
		    var entidad=idParsed[5];
		    var tipoPresupuesto=idParsed[6];
		    var programa=idParsed[7];
		    var subprograma=idParsed[8];
		    var proyecto=idParsed[9];
		    var producto=idParsed[10];
		    var objetivoRelId=idParsed[11];
		    var relTipoObjetivoId=idParsed[12];
		    var relAnho=idParsed[13];
		    var relVersion=idParsed[14];
		    var objetivoId=idParsed[15];
		    var tipoObjetivoId=idParsed[16];
		    var objetivoAnho=idParsed[17];
		    var objetivoVersion=idParsed[18];
		    var avance=idParsed[19];
		    
		    if ( $("#modalMetas").length )
			{
				$("#modalMetas").remove();
			}	
			if ( $("#consultaModalBorrarMeta").length )
			{
				$("#consultaModalBorrarMeta").remove();
			}
			
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion;
		    //var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
		  	
		  	if(avance=="Avance"){
		  		var metas = $.ajax({		    	
			    	url:'/ajaxSelects?accion=getAvanceMetas&metaId='+id,
			      	type:'get',
			      	dataType:'json',
			      	async:false       
			    }).responseText;
			  	metas = JSON.parse(metas);
			}else{
				if(avance=="Metas"){
					var metas = $.ajax({		    	
				    	url:'/ajaxSelects?accion=getMetas&metaId='+id,
				      	type:'get',
				      	dataType:'json',
				      	async:false       
				    }).responseText;
				  	metas = JSON.parse(metas);
				}
			}
		  	
			var cuerpoModalMeta = "";
			
			cuerpoModalMeta =	'<div class="modal fade" id="consultaModalBorrarMeta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'	<div class="modal-dialog modal-lg" style="width:90%">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close modalMetas" parametros="'+indicadorId+'-'+zonaGeograficaId+'-'+demografiaId+'-'+parametroRetorno+'-'+avance+'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
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
				$("#agregarBotonBorradoMeta").append('<button type="button" class="btn btn-success btn-sm borrarMeta" id="botonRestaurarMeta" parametros='+id+'-'+indicadorId+'-r-'+zonaGeograficaId+'-'+demografiaId+'-'+parametroRetorno+'-'+avance+'>Restaurar Indicador</button>');
				}else{
				$("#cuerpoModalBorrarMeta").html('');
				$("#cuerpoModalBorrarMeta").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este Registro</h3></br>'+cuerpoTabla);
				$("#agregarBotonBorradoMeta").html("");
				$("#agregarBotonBorradoMeta").append('<button type="button" class="btn btn-danger btn-sm borrarMeta" id="botonBorradoMeta" parametros='+id+'-'+indicadorId+'-b-'+zonaGeograficaId+'-'+demografiaId+'-'+parametroRetorno+'-'+avance+'>Borrar Indicador</button>');
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
			
		    var nivel=idParsed[5];
		    var entidad=idParsed[6];
		    var tipoPresupuesto=idParsed[7];
		    var programa=idParsed[8];
		    var subprograma=idParsed[9];
		    var proyecto=idParsed[10];
		    var producto=idParsed[11];
		    var objetivoRelId=idParsed[12];
		    var relTipoObjetivoId=idParsed[13];
		    var relAnho=idParsed[14];
		    var relVersion=idParsed[15];
		    var objetivoId=idParsed[16];
		    var tipoObjetivoId=idParsed[17];
		    var objetivoAnho=idParsed[18];
		    var objetivoVersion=idParsed[19]; 
		    var avance=idParsed[20];
		    
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion;
		    //var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;

		    if(avance=="Avance"){
		    	var metas = $.ajax({
			  		url:'/ajaxSelects?accion=getAvanceMetas&metaId='+id,
			      	type:'get',
			      	dataType:'json',
			      	async:false       
			    }).responseText;
			  	metas = JSON.parse(metas);
			}else{
				if(avance=="Metas"){
					var metas = $.ajax({
				  		url:'/ajaxSelects?accion=getMetas&metaId='+id,
				      	type:'get',
				      	dataType:'json',
				      	async:false       
				    }).responseText;
				  	metas = JSON.parse(metas);	
				}
			}
		  	
			var objeto = new Object();

			objeto.id = id;
			objeto.borrado = metas[0].borrado;
			objeto.indicador_id = metas[0].indicador_id;
			objeto.zona_geografica_id = metas[0].zona_geografica_id;
			objeto.demografia_id = metas[0].demografia_id;
			objeto.avance = avance;
			//objeto.productoConcat = metas[0].productoConcat;
			
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
								$('#cuerpoModalBorrarMeta').append('<h3 class="text-center">Se Borro el Registro con Éxito!!</h3>');
								$('#agregarBotonBorradoMeta').html('');	
			        		}else{
								$('#cuerpoModalBorrarMeta').html('');
								$('#cuerpoModalBorrarMeta').append('<h3 class="text-center">Se Restauro el Registro con Éxito!!</h3>');
								$('#agregarBotonBorradoMeta').html('');
			        		}
			        		
			    			$("#agregarBotonBorradoMeta").append('<button type="button" class="btn btn-success btn-sm modalMetas" parametros="'+indicadorId+'-'+zonaGeograficaId+'-'+demografiaId+'-'+parametroRetorno+'-'+avance+'">Cerrar</button>');
							$('#listaMetas').html('');
							
							var render = renderMetas(indicadorId,parametroRetorno, avance);
							$('#listaMetas').append(render);							
			        	}else{
							$("#mensajeBorradoMeta").html("");
							$("#mensajeBorradoMeta").append('<h3 class="text-center">Error al intentar Borrar éste Registro!!</h3>');
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
		    
		    var nivel=idParsed[4];
		    var entidad=idParsed[5];
		    var tipoPresupuesto=idParsed[6];
		    var programa=idParsed[7];
		    var subprograma=idParsed[8];
		    var proyecto=idParsed[9];
		    var producto=idParsed[10];
		    var objetivoRelId=idParsed[11];
		    var relTipoObjetivoId=idParsed[12];
		    var relAnho=idParsed[13];
		    var relVersion=idParsed[14];
		    var objetivoId=idParsed[15];
		    var tipoObjetivoId=idParsed[16];
		    var objetivoAnho=idParsed[17];
		    var objetivoVersion=idParsed[18]; 
		    var avance=idParsed[19];
		    
		    if ( $("#modalMetas").length )
			{
				$("#modalMetas").remove();
			}	
			if ( $("#modalEditarMeta").length )
			{
				$("#modalEditarMeta").remove();
			}	
			if ( $("#consultaModalBorrarIndicadorVinculado").length )
			{
				$("#consultaModalBorrarIndicadorVinculado").remove();
			}
		    var parametroRetorno = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+objetivoRelId+'-'+relTipoObjetivoId+'-'+relAnho+'-'+relVersion+'-'+objetivoId+'-'+tipoObjetivoId+'-'+objetivoAnho+'-'+objetivoVersion;
		    //var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;

		    if(avance=="Avance"){
		  		var metas = $.ajax({		    	
			    	url:'/ajaxSelects?accion=getAvanceMetas&metaId='+id,
			      	type:'get',
			      	dataType:'json',
			      	async:false       
			    }).responseText;
			  	metas = JSON.parse(metas);
			}else{
				if(avance=="Metas"){
					var metas = $.ajax({		    	
				    	url:'/ajaxSelects?accion=getMetas&metaId='+id,
				      	type:'get',
				      	dataType:'json',
				      	async:false       
				    }).responseText;
				  	metas = JSON.parse(metas);
				}
			}
		  	
		  	var cuerpoModalMetas = "";

			cuerpoModalMetas =	'<div class="modal fade" id="modalEditarMeta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
								'	<div class="modal-dialog modal-lg" style="width:90%">'+
								'		<div class="modal-content" >'+
								'			<div class="modal-header">'+
								'		        <button type="button" class="close modalMetas" parametros="'+indicadorId+'-'+zonaGeograficaId+'-'+demografiaId+'-'+parametroRetorno+'-'+avance+'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
								'			</div>'+
								'		    <div class="modal-body" id="cuerpoModalEditarMeta">'+
								
								'		      		<div class="row">'+		
								
								<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>		

								'		      		<div class="col-md-12">'+
								'						<div class="box box-warning box-solid">'+
								'		                	<div class="box-header with-border">'+
								'	                  			<h3 class="box-title">'+avance+'</h3>'+
								'	                  			<div class="box-tools pull-right">'+
								'		                  		</div>'+
								'              				</div>'+
								'               			<div class="box-body">'+
				
								'		      					<div class="col-md-12">'+
								'									<div class="box box-default box-solid">'+
								'		                				<div class="box-header with-border">'+
								'		                  					<h3 class="box-title">Editar '+avance+'</h3>'+
								'	                  						<div class="box-tools pull-right">'+

								'		                  					</div>'+
								'              							</div>'+
								'              						<div class="box-body">'+
								
								'										<div class="table-responsive">'+
								'											<table class="table table-hover">'+
								'												<tbody>'+
								'			      									<form class="form-horizontal" role="form">'+
								'													<tr><td><label for="cantidadMetas">Cantidad</label><input type="text" id="cantidadMetas" class="form-control" value="'+metas[0].cantidad+'" /></td><td><label for="vencimientoMetas">Fecha</label><input id="vencimientoMetas" class="form-control" value="'+metas[0].vencimiento+'" /></td></tr>'+
								'													<input type="hidden" id="zonaGeograficaMetas" value="'+zonaGeograficaId+'" /><input type="hidden" id="demografiaMetas" value="'+demografiaId+'" /><input type="hidden" id="indicadorMetas" value="'+indicadorId+'" /><input type="hidden" id="idMetas" value="'+id+'" />'+// borre este segmento <input type="hidden" id="productoConcatMetas" value="'+productoConcat+'" />

								'			      									</form>	'+				
								'												</tbody>'+
								'											</table>'+
								'				      					</div>'+
								
								'				      				 </div>'+//fin box body
								'									 <div class="modal-footer">'+ 
								'					        			<button type="button" class="btn btn-success btn-sm guardarMetasCambios" parametros='+avance+' >Guardar '+avance+'</button>'+ 
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
			var avance = $(this).attr("parametros");
			
			var objeto = new Object();
			
			//como esta en la clase 
			var id = $("#idMetas").val(); 
			var cantidad = $("#cantidadMetas").val(); 
			var vencimiento = $("#vencimientoMetas").val(); 
			var indicadorId = $("#indicadorMetas").val(); 
			var zonaGeograficaId = $("#zonaGeograficaMetas").val(); 
			var demografiaId = $("#demografiaMetas").val(); 
			//var productoConcat = $("#productoConcatMetas").val();
			
			var objeto = new Object();

			objeto.id = id;
			objeto.cantidad = cantidad;
			objeto.vencimiento = vencimiento;
			objeto.indicador_id = indicadorId;
			objeto.zona_geografica_id = zonaGeograficaId;
			objeto.demografia_id = demografiaId;
			objeto.demografia_id = demografiaId;
			objeto.avance = avance;
			//objeto.productoConcat = productoConcat;

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
							$('#cuerpoModalEditarMeta').append('<h3 class="text-center">Ud editó el Registro con Éxito!!</h3>');

			        	}else{
							$("#cuerpoModalEditarMeta").html("");
							$("#cuerpoModalEditarMeta").append('<h3 class="text-center">Error al intentar Editar éste Registro!!</h3>');
						}
			        },
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {}
			 });					

			 
		});
////>>                 Funcion de Borrado del Producto               <<////
		$("body").on("click", ".consultaBorrarProductoPresupuesto",function(event){
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-");
		    var nivel = idParsed[0];
		    var entidad = idParsed[1];
			var tipoPresupuesto = idParsed[2];
			var programa = idParsed[3];
			var subprograma = idParsed[4];
			var proyecto = idParsed[5];
			var producto = idParsed[6];
			
			
			if ( $("#consultaModalBorrarProductoPresupuesto").length )
			{
				$("#consultaModalBorrarProductoPresupuesto").remove();
			}
			
			var productoPresupuesto = $.ajax({
		    	url:'ajaxSelects?accion=getProductosPresupuesto&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPresupuesto+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	productoPresupuesto = JSON.parse(productoPresupuesto);
			productoPresupuesto = productoPresupuesto.producto
		  	
			var productosCat = $.ajax({
		    	url:'ajaxSelects?accion=getProductos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			productosCat = JSON.parse(productosCat);
			productosCat = productosCat.productos
			
			var nombreProducto;
			//cambio del id del objetivo por el nombre del mismo
			nombreProducto = "";
			for(var q = 0; q < productoPresupuesto.length; q++){
				for(var p = 0; p < productosCat.length; p++){
					if (productoPresupuesto[q].producto_id == productosCat[p].codigoCatalogo){
						nombreProducto = productosCat[p].nombreCatalogo;
					}
				}
			}
			
			var cuerpoModalProductoPresupuesto = "";
			
			cuerpoModalProductoPresupuesto ='<div class="modal fade" id="consultaModalBorrarProductoPresupuesto" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
											'	<div class="modal-dialog modal-lg" style="width:90%">'+
											'		<div class="modal-content" >'+
											'			<div class="modal-header" id="agregarTituloModal">'+
											
											'			</div>'+
											'		    <div class="modal-body" >'+
											'				<div  id="cuerpoModalBorrarObjetivo">'+
											'					<h3 class="text-center" id="mensajeBorradoObjetivo"></h3>'+
											'					<h3 class="text-center" id="mensajeRestaurarObjetivo"></h3>'+
											'		   		</div>'+
											
											'		    </div>'+
											'			<div class="modal-footer" id="agregarBotonBorradoObjetivo">'+
											
											'			</div>'+
											'			<div class="modal-footer" id="agregarBotonRestaurarObjetivo">'+
											
											'			</div>'+ 
											'		</div>'+ 
											'	</div>'+
											'</div>';
						
			$("body").append(cuerpoModalProductoPresupuesto);
			
			if(productoPresupuesto[0].borrado == true){
				$("#agregarTituloModal").html("");
				$("#agregarTituloModal").append('<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">RETAURAR PRODUCTO</h4>');
				$("#mensajeRestaurarObjetivo").html("");
				$("#mensajeRestaurarObjetivo").append('<h3 class="text-center">Ud. está seguro que desea Restaurar : <strong> '+nombreProducto+'</strong><br><br><i class="fa fa-refresh fa-spin" style="font-size:24px"></h3>');
				$("#agregarBotonRestaurarObjetivo").html("");
				$("#agregarBotonRestaurarObjetivo").append('<button type="button" class="btn btn-success btn-sm borrarProductoPresupuesto" id="botonRestaurarProductoPresupuesto" parametros='+productoPresupuesto[0].nivel_id+'-'+productoPresupuesto[0].entidad_id+'-'+productoPresupuesto[0].tipo_presupuesto_id+'-'+productoPresupuesto[0].programa_id+'-'+productoPresupuesto[0].subprograma_id+'-'+productoPresupuesto[0].proyecto_id+'-'+productoPresupuesto[0].producto_id+'-r>Restaurar Producto</button>');
				
			}else{
				$("#agregarTituloModal").html("");
				$("#agregarTituloModal").append('<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">BORRAR PRODUCTO</h4>');
				$("#mensajeBorradoObjetivo").html("");
				$("#mensajeBorradoObjetivo").append('<h3 class="text-center">Ud. está seguro que desea BORRAR : <strong> '+nombreProducto+'</strong><br><br><i class="fa fa-refresh fa-spin" style="font-size:24px"></i></h3');
				$("#agregarBotonBorradoObjetivo").html("");
				$("#agregarBotonBorradoObjetivo").append('<button type="button" class="btn btn-danger btn-sm borrarProductoPresupuesto" id="botonBorradoProductoPresupuesto" parametros='+productoPresupuesto[0].nivel_id+'-'+productoPresupuesto[0].entidad_id+'-'+productoPresupuesto[0].tipo_presupuesto_id+'-'+productoPresupuesto[0].programa_id+'-'+productoPresupuesto[0].subprograma_id+'-'+productoPresupuesto[0].proyecto_id+'-'+productoPresupuesto[0].producto_id+'-b>Borrar Producto</button>');
			}
			
			$("#consultaModalBorrarProductoPresupuesto").modal('show');
			 
		});
		$("body").on("click", ".borrarProductoPresupuesto",function(event){
			var parametros = $(this).attr("parametros");
			var idParsed = parametros.split("-");
			var nivel = idParsed[0];
		    var entidad = idParsed[1];
			var tipoPresupuesto = idParsed[2];
			var programa = idParsed[3];
			var subprograma = idParsed[4];
			var proyecto = idParsed[5];
			var producto = idParsed[6];
			//var destinatarioId = idParsed[7];
			var estado = idParsed[7];
			var productoConcat = nivel+'-'+entidad+'-'+tipoPresupuesto+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
			
			
		
			var productoPresupuesto = $.ajax({
		    	url:'ajaxSelects?accion=getProductosPresupuesto&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPresupuesto+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		  	productoPresupuesto = JSON.parse(productoPresupuesto);
			productoPresupuesto = productoPresupuesto.producto
		
			var objeto = new Object();
			
			objeto.nivel_id = productoPresupuesto[0].nivel_id;
			objeto.entidad_id = productoPresupuesto[0].entidad_id;
			objeto.tipo_presupuesto_id = productoPresupuesto[0].tipo_presupuesto_id;
			objeto.programa_id = productoPresupuesto[0].programa_id;
			objeto.subprograma_id = productoPresupuesto[0].subprograma_id;
			objeto.proyecto_id = productoPresupuesto[0].proyecto_id;
			objeto.unidad_medida_id = productoPresupuesto[0].unidad_medida_id;
			objeto.producto_id = productoPresupuesto[0].producto_id;
			objeto.id = productoPresupuesto[0].id;
			objeto.borrado = productoPresupuesto[0].borrado;
		
			//borra el producto
			$.ajax({
			    url: "ajaxUpdate?accion=actBorrarProductoPresupuesto",
			    type: 'POST',
			    dataType: 'json',
			    data: JSON.stringify(objeto),
			    contentType: 'application/json',
			    mimeType: 'application/json',
			    success: function (data) {
			    	if(data.success == true){
			    		if(estado == "b"){
			    			estado = false;
			    			//Borra destinatarios completamente, los relacionados al producto
				    		var productoDestinatarios = $.ajax({
								url:'ajaxSelects?accion=getProductoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPresupuesto+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&borrado='+estado,
								type:'get',
								dataType:'json',
								async:false       
							}).responseText;
							productoDestinatarios = JSON.parse(productoDestinatarios);
							productoDestinatarios = productoDestinatarios.productoDestinatarios;
							if (productoDestinatarios.length > 0){  
							    var objeto = new Object();
							    objeto.nivel = productoDestinatarios[0].nivel;
							    objeto.entidad = productoDestinatarios[0].entidad;
							    objeto.tipo_presupuesto = productoDestinatarios[0].tipo_presupuesto;
							    objeto.programa = productoDestinatarios[0].programa;
							    objeto.subprograma = productoDestinatarios[0].subprograma;
							    objeto.proyecto = productoDestinatarios[0].proyecto;
							    objeto.producto = productoDestinatarios[0].producto;
							    objeto.borrado = productoDestinatarios[0].borrado;
							    
					    		var info = JSON.stringify(objeto);
					    		$.ajax({ 
				    		        url: "ajaxUpdate?accion=actBorrarTodosProductoPresupuestoDestinatario",
				    		        type: 'POST',
				    		        dataType: 'json',
				    		        //data: JSON.stringify(objeto),
				    		        data: info,
				    		        contentType: 'application/json',
				    		        mimeType: 'application/json',
				    		        success: function (data) {
				    		        	if(data.success == true){
				    		        		//alert("Exito se borraron todos los destinatarios de este producto");
				    		        	}else{
				    		        		//alert("Error al intentar borrar todos los Destinatario");
				    		        	}
				    		        },
				    		        error: function(data,status,er) {
				    		        	alert("ERROR (1)");
				    		        }
				    			 });
							}
					    	//borra desde O.H.O.
					    	var getObjetivosVinculados = $.ajax({
				    	         url:'ajaxSelects?accion=getObjetivoHasObjetivo&productoConcat='+productoConcat+'&borrado='+estado,
				    	         type:'get',
				    	         dataType:'json',
				    	         async:false       
				    	       }).responseText;
					    		getObjetivosVinculados=JSON.parse(getObjetivosVinculados);
					    		getObjetivosVinculados=getObjetivosVinculados.objetivos;
					    	
					    	if (getObjetivosVinculados.length > 0){
					    		var objeto = new Object();
							    objeto.productoConcat = getObjetivosVinculados[0].productoConcat;
							    objeto.borrado = getObjetivosVinculados[0].borrado;
							    
					    		var info = JSON.stringify(objeto);
					    		$.ajax({ 
				    		        url: "ajaxUpdate?accion=actBorrarTodosObjetivoHasObjetivo",
				    		        type: 'POST',
				    		        dataType: 'json',
				    		        //data: JSON.stringify(objeto),
				    		        data: info,
				    		        contentType: 'application/json',
				    		        mimeType: 'application/json',
				    		        success: function (data) {
				    		        	if(data.success == true){
				    		        		//alert("Exito se borraron todos los destinatarios de este producto");
				    		        	}else{
				    		        		//alert("Error al intentar borrar todos los Destinatario");
				    		        	}
				    		        },
				    		        error: function(data,status,er) {
				    		        	alert("ERROR (1)");
				    		        }
				    			 });
					    	}
							//borra desde O.H.I.
					    	var indicadoresVinculados = $.ajax({
						    	url:'ajaxSelects?accion=getObjetivoHasIndicador&productoConcat='+productoConcat,
						      	type:'get',
						      	dataType:'json',
						      	async:false       
						    }).responseText;
						  	indicadoresVinculados = JSON.parse(indicadoresVinculados);
						  	indicadoresVinculados = indicadoresVinculados.indicadores;
							
						  	if (indicadoresVinculados.length > 0){
					    		var objeto = new Object();
							    objeto.productoConcat = getObjetivosVinculados[0].productoConcat;
							    
						    	$.ajax({
						    			url: 'ajaxDelete?accion=delTodosObjetivoHasIndicador&productoConcat='+productoConcat,
								        type: 'POST',
								        dataType: 'json',
								        data: JSON.stringify(objeto),
								        contentType: 'application/json',
								        mimeType: 'application/json',
								        success: function (data) {
								        	if(data.success == true){
								        		//alert("Exito, se borraron todos los indicadores vinculados de este producto");
								        	}else{
					    		        		//alert("Error al intentar borrar todos los indicadores vinculados a este producto");
					    		        	}
								        },
								        error: function(data,status,er) {
								        }
								 });
						  	
					    	
						    	//Borra metas completamente, los relacionados al producto
						    	var idsIndicadores = [];
							  	for(var f = 0; f < indicadoresVinculados.length; f++){
							  		idsIndicadores.push(indicadoresVinculados[f].indicadorId);
							  	}
								var objeto = new Object();
						
								for(var j = 0; j < idsIndicadores.length; j++){
													
									objeto.indicador_id = idsIndicadores[j];
								    
									$.ajax({
									        url: "ajaxUpdate?accion=actBorradoTodasMetas",
									        type: 'POST',
									        dataType: 'json',
									        data: JSON.stringify(objeto),
									        contentType: 'application/json',
									        mimeType: 'application/json',
									        success: function (data) {
									        	if(data.success == true){
									        		//alert("Exito, se borraron todos las metas de este producto--");
									        	}else{
												}
									        },
									        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
									        error: function(data,status,er) {}
									});
								}
						  	}
							//Programacion Fisica desde productoPresupuestoMeta
					    	var productoPresupuestoMeta = $.ajax({
				    		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPresupuesto+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&borrado='+estado,
				    		        type:'get',
				    		        dataType:'json',
				    		        async:false       
				    		    }).responseText;
							productoPresupuestoMeta = JSON.parse(productoPresupuestoMeta);
				        	productoPresupuestoMeta=productoPresupuestoMeta.productoPresupuestoMeta;
				        	
				        	if (productoPresupuestoMeta.length > 0){	    
							    var objeto = new Object();
							    objeto.nivel_id = productoPresupuestoMeta[0].nivel_id;
							    objeto.entidad_id = productoPresupuestoMeta[0].entidad_id;
							    objeto.tipo_presupuesto_id = productoPresupuestoMeta[0].tipo_presupuesto_id;
							    objeto.programa_id = productoPresupuestoMeta[0].programa_id;
							    objeto.subprograma_id = productoPresupuestoMeta[0].subprograma_id;
							    objeto.proyecto_id = productoPresupuestoMeta[0].proyecto_id;
							    objeto.producto_id = productoPresupuestoMeta[0].producto_id;
							    objeto.borrado = productoPresupuestoMeta[0].borrado;
							    
					    		var info = JSON.stringify(objeto);
					    		$.ajax({ 
				    		        url: "ajaxUpdate?accion=actBorrarTodosProductosPresupuestoMeta",
				    		        type: 'POST',
				    		        dataType: 'json',
				    		        //data: JSON.stringify(objeto),
				    		        data: info,
				    		        contentType: 'application/json',
				    		        mimeType: 'application/json',
				    		        success: function (data) {
				    		        	if(data.success == true){
				    		        		//alert("Exito se borraron toda la programacion fisica de este producto");
				    		        	}else{
				    		        		//alert("Error al intentar borrar toda la programacion fisica de este producto");
				    		        	}
				    		        },
				    		        error: function(data,status,er) {
				    		        	alert("ERROR (5)");
				    		        }
				    			 });
					    	}
				    		$('#mensajeBorradoObjetivo').html('');
							$('#mensajeBorradoObjetivo').append('<h3 class="text-center">SE BORRÓ CON ÉXITO EL REGISTRO!</h3>');
							$('#agregarBotonBorradoObjetivo').html('');
						}else{
			    			
								estado = true;
				    			//Restaurar destinatarios completamente, los relacionados al producto
					    		var productoDestinatarios = $.ajax({
									url:'ajaxSelects?accion=getProductoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPresupuesto+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&borrado='+estado,
									type:'get',
									dataType:'json',
									async:false       
								}).responseText;
								productoDestinatarios = JSON.parse(productoDestinatarios);
								productoDestinatarios = productoDestinatarios.productoDestinatarios;
								if (productoDestinatarios.length > 0){			    
							    
									var objeto = new Object();
								    objeto.nivel = productoDestinatarios[0].nivel;
								    objeto.entidad = productoDestinatarios[0].entidad;
								    objeto.tipo_presupuesto = productoDestinatarios[0].tipo_presupuesto;
								    objeto.programa = productoDestinatarios[0].programa;
								    objeto.subprograma = productoDestinatarios[0].subprograma;
								    objeto.proyecto = productoDestinatarios[0].proyecto;
								    objeto.producto = productoDestinatarios[0].producto;
								    objeto.borrado = productoDestinatarios[0].borrado;
								    
						    		var info = JSON.stringify(objeto);
						    		$.ajax({ 
					    		        url: "ajaxUpdate?accion=actBorrarTodosProductoPresupuestoDestinatario",
					    		        type: 'POST',
					    		        dataType: 'json',
					    		        //data: JSON.stringify(objeto),
					    		        data: info,
					    		        contentType: 'application/json',
					    		        mimeType: 'application/json',
					    		        success: function (data) {
					    		        	if(data.success == true){
					    		        		//alert("Exito se restauraron todos los destinatarios de este producto");
					    		        	}else{
					    		        		//alert("Error al intentar restaurar todos los Destinatario");
					    		        	}
					    		        },
					    		        error: function(data,status,er) {
					    		        	alert("ERROR (1)");
					    		        }
					    			 });
								}
					    		//Programacion Fisica desde productoPresupuestoMeta
						    	var productoPresupuestoMeta = $.ajax({
					    		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPresupuesto+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&borrado='+estado,
					    		        type:'get',
					    		        dataType:'json',
					    		        async:false       
					    		    }).responseText;
								productoPresupuestoMeta = JSON.parse(productoPresupuestoMeta);
					        	productoPresupuestoMeta=productoPresupuestoMeta.productoPresupuestoMeta;
					        	if (productoPresupuestoMeta.length > 0){				    
								    var objeto = new Object();
								    objeto.nivel_id = productoPresupuestoMeta[0].nivel_id;
								    objeto.entidad_id = productoPresupuestoMeta[0].entidad_id;
								    objeto.tipo_presupuesto_id = productoPresupuestoMeta[0].tipo_presupuesto_id;
								    objeto.programa_id = productoPresupuestoMeta[0].programa_id;
								    objeto.subprograma_id = productoPresupuestoMeta[0].subprograma_id;
								    objeto.proyecto_id = productoPresupuestoMeta[0].proyecto_id;
								    objeto.producto_id = productoPresupuestoMeta[0].producto_id;
								    objeto.borrado = productoPresupuestoMeta[0].borrado;
								    
						    		var info = JSON.stringify(objeto);
						    		$.ajax({ 
					    		        url: "ajaxUpdate?accion=actBorrarTodosProductosPresupuestoMeta",
					    		        type: 'POST',
					    		        dataType: 'json',
					    		        //data: JSON.stringify(objeto),
					    		        data: info,
					    		        contentType: 'application/json',
					    		        mimeType: 'application/json',
					    		        success: function (data) {
					    		        	if(data.success == true){
					    		        		//alert("Exito se restauro toda la programacion fisica de este producto");
					    		        	}else{
					    		        		//alert("Error al intentar restaurar toda la programacion fisica de este producto");
					    		        	}
					    		        },
					    		        error: function(data,status,er) {
					    		        	alert("ERROR (5)");
					    		        }
					    			 });
					        	}
					    		//borra desde O.H.O.
						    	var getObjetivosVinculados = $.ajax({
					    	         url:'ajaxSelects?accion=getObjetivoHasObjetivo&productoConcat='+productoConcat+'&borrado='+estado,
					    	         type:'get',
					    	         dataType:'json',
					    	         async:false       
					    	       }).responseText;
						    		getObjetivosVinculados=JSON.parse(getObjetivosVinculados);
						    		getObjetivosVinculados=getObjetivosVinculados.objetivos;
						    	if (getObjetivosVinculados.length > 0){		
						    		var objeto = new Object();
								    objeto.productoConcat = getObjetivosVinculados[0].productoConcat;
								    objeto.borrado = getObjetivosVinculados[0].borrado;
								   
						    		var info = JSON.stringify(objeto);
						    		$.ajax({ 
										url: "ajaxUpdate?accion=actBorrarTodosObjetivoHasObjetivo",
										type: 'POST',
										dataType: 'json',
										//data: JSON.stringify(objeto),
										data: info,
										contentType: 'application/json',
										mimeType: 'application/json',
										success: function (data) {
											if(data.success == true){
												//alert("Exito se borraron todos los destinatarios de este producto");
											}else{
												//alert("Error al intentar borrar todos los Destinatario");
											}
					    		        },
					    		        error: function(data,status,er) {
					    		        	alert("ERROR (1)");
					    		        }
					    			 });
						    	}
				    		
							$('#mensajeRestaurarObjetivo').html('');
							$('#mensajeRestaurarObjetivo').append('<h3 class="text-center">SE RESTAURO CON ÉXITO EL REGISTRO!</h3>');
							$('#agregarBotonRestaurarObjetivo').html('');
						}
						$("#row-body-programacionfisica").html("");
						eje1.dibujar();
						
			    	}else{
						$("#mensajeBorradoObjetivo").html("");
						$("#mensajeBorradoObjetivo").append('<h3 class="text-center">Error al intentar Borrar este Registro!!!</h3>');
						$('#agregarBotonBorradoObjetivo').html('');
					}
			    },
			    error: function(data,status,er) {}
			});		
			
		});

</script>
  <!-- piwik -->
  <script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
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
		<div class="content-header">
			<h2> Programación de Productos <small> (FG-02.2 del SIPP)</small></h2>
		</div>
        <section class="content-header">
          <h1>
            <small>
            <!--  Titulo, donde antes estaba dashboard -->
            </small>
          </h1>
          <ol class="breadcrumb" style="margin-left: 20px;">
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
				<%@ include file="/frames/producto-buscador.jsp" %>
       </div><!-- /.row -->
       
       <% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%> 
       <div class="row" id="crear-producto">
        	<%@ include file="/frames/producto-formulario.jsp" %>
       </div>
       <%}%>
       
 	   <div class="row" id="buscar-producto">
            <div class="col-md-12">
              <div class="box " height="1000px">
                <div class="box-header with-border" height="1000px">
                  <h3 class="box-title" id="tituloTipoPrograma">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>Programación de Productos
                  </h3>
                  <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body" >
                	<div class="row" id="row-body-programacionfisica"></div>
						<script src="frames/producto.js"></script>
						
						<!-- fin de box body-->

                 <!-- </ul> -->
                </div>
              </div>
            </div>
       </div>
       
          
          
          
        
          
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
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    
    <script src="plugins/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.flash.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/jszip.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/pdfmake.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/vfs_fonts.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.html5.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.print.min.js" type="text/javascript"></script>
    
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
