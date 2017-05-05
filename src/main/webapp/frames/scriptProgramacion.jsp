<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	
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
		
		function modalError() {
			var nuevoModalError = '    <div id="modalMensajeError" class="modal fade">'+
	        '        <div class="modal-dialog">'+
	     '            <div class="modal-content">'+
	     '                 <div class="modal-body alert-danger">'+
	     '                        <div class="alert-danger">'+
	     '                        <h3 class="text-center">ERROR AL GUARDAR EL REGISTRO.</h3>'+
	     '                        <h3 class="text-center">FAVOR CONTACTAR A: </h3>'+
	     '                    </div>'+
	     '                </div>'+
	     '                 <div class="modal-footer">'+
	     '                    <div class="box box-danger" height="1000px">'+
	     '                        <div class="box-header with-border" height="1000px"  align="left">'+
	     '                            <h3 class="box-title" id="tituloTipoPrograma">'+
	     '                                DGPR'+
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
	     '                                    <td>scs@stp.gov.py</td>'+
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
	     '                </div>'+
	     '            </div> '+
	     '        </div>'+
	     '    </div>';
	    $("body").append(nuevoModalError);
	    $('#modalMensajeError').modal('show');
		}
	
	function comparePrograma(a,b) {  
		if (a.codigoPrograma < b.codigoPrograma) return -1;
		if (a.codigoPrograma > b.codigoPrograma) return 1;
		return 0;
	}
	function compareId(a,b) {  
		if (a.id < b.id) return -1;
		if (a.id > b.id) return 1;
		return 0;
	}
	function compareProyecto(a,b) {  
		if (a.codigoProyecto < b.codigoProyecto) return -1;
		if (a.codigoProyecto > b.codigoProyecto) return 1;
		return 0;
	}

	var pndModal="";
	pndModal='<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
	  '<div class="modal-dialog modal-lg">'+
	    '<div class="modal-content">'+
	      '<div class="modal-header">'+
	        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
	        '<h4 class="modal-title" id="myModalLabel">Estrategias PND 2030</h4>'+
	      '</div>'+
	      '<div class="modal-body" id="lista-pnd">'+
	      '</div>'+
	      '<div class="modal-footer">'+
	        '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'+
	        '<button type="button" class="btn btn-primary">Save changes</button>'+
	      '</div>'+
	    '</div>'+
	  '</div>'+  
	'</div>';
		
		$('.content-wrapper').append(pndModal);
		
		var editarProgramaModal="";
		editarProgramaModal='<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+	
		'<div class="modal-dialog box box-success">'+
		    '<div class="modal-content">'+
		      '<div class="modal-header">'+
		        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		        '<h4 class="modal-title" id="myModalLabel4">Editar Programa</h4>'+
		        '</div>'+
		      '<div class="modal-body" id="editar-programa">'+					      
	
	
		      '</div>'+
		      '<div class="modal-footer">'+

		      '</div>'+
		    '</div>'+ 
		  '</div>'+  
		'</div>';
			
			$('.content-wrapper').append(editarProgramaModal);
		
		
		var editarSubProgramaModal="";
		editarSubProgramaModal='<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
		  '<div class="modal-dialog box box-warning">'+
		    '<div class="modal-content">'+
		      '<div class="modal-header">'+
		        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		        '<h4 class="modal-title" id="myModalLabel1">Editar Subprograma</h4>'+
		      '</div>'+
		      '<div class="modal-body" id="editar-subprograma">'+
   
	
		      '</div>'+
		      '<div class="modal-footer">'+
		       
		      '</div>'+
		    '</div>'+ 
		  '</div>'+ 
		'</div>';
			
			$('.content-wrapper').append(editarSubProgramaModal);
		
		
			
			
			var agregarSubProgramaModal="";
			agregarSubProgramaModal='<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
			  '<div class="modal-dialog box box-warning">'+
			    '<div class="modal-content">'+
			      '<div class="modal-header">'+
			        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
			        '<h4 class="modal-title" id="myModalLabel2">Agregar Subprograma</h4>'+
			      '</div>'+
			      '<div class="modal-body" id="agregar-subprograma">'+
 
			      '</div>'+
			      '<div class="modal-footer">'+

			      '</div>'+
			    '</div>'+ 
			  '</div>'+ 
			'</div>';
				
				$('.content-wrapper').append(agregarSubProgramaModal);

		
		var agregarProyectoModal="";
		agregarProyectoModal='<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
		  '<div class="modal-dialog box box-danger">'+
		    '<div class="modal-content">'+
		      '<div class="modal-header">'+
		        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		        '<h4 class="modal-title" id="">Agregar Proyecto</h4>'+
		      '</div>'+
		      '<div class="modal-body">'+


				      '</div>'+
				      '<div class="modal-footer">'+

				      '</div>'+
				    '</div>'+
				  '</div>'+ 
				'</div>';
				
				
		$('.content-wrapper').append(agregarProyectoModal);
		
		var agregarReportePresupuestoGasto="";
		agregarReportePresupuestoGasto='<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
		  '<div class="modal-dialog box box-danger modal-lg">'+
		    '<div class="modal-content">'+
		      '<div class="modal-header">'+
		        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		        '<h3 class="modal-title" id="myModalLabel"></h3>'+
		      '</div>'+
		      '<div class="modal-body">'+
		      
		      
		      '</div>'+
		      '<div class="modal-footer">'+
	
		      '</div>'+
		    '</div>'+
		  '</div>'+ 
		'</div>';
				
				
		$('.content-wrapper').append(agregarReportePresupuestoGasto);
		

	
	//event.stopPropagation();
// });
	
function numeroConComa(x) {
	return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

$("body").on("click", ".tituloEstrategiaPnd",function(event){
  
  //var estrategia=$(this).parent().parent().parent().attr("id");
	var estrategia=$(this).attr("estrategia");
	var ruta=$("#myModal").attr("ruta");
	var idParsed = ruta.split("-");                                                            
	var nivel=idParsed[0];
	var entidad=idParsed[1];
	var tipo= idParsed[2];
	var programa= idParsed[3];
	var subprograma= idParsed[4];
	var proyecto= idParsed[5];




  $("div [class=lista-objetivos][estrategia="+estrategia+"]").html("");
  	var objetivos = $.ajax({
    	url:'/ajaxSelects?accion=getObjetivosEstrategicos&estrategia='+estrategia,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	$("#estrategia-contenedor-"+estrategia).html("");
  	objetivos = JSON.parse(objetivos);
  	objetivos = objetivos.objetivos;
  	
	var objetivosPorProyecto = $.ajax({
    	url:'/ajaxSelects?accion=getObjetivosPorProyecto&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto,
      	type:'get',
      	dataType:'json',
      	async:false       
	}).responseText;
	objetivosPorProyecto = JSON.parse(objetivosPorProyecto);

	var i =0;
	for(i = 0;i<objetivos.length; i++){
		$("#estrategia-contenedor-"+estrategia).append(' <!-- objetivos -->'+
                '<div class="box box-success ">'+
                '<div class="box-header with-border">'+
	                '<div class="checkbox col-md-1" >'+
	                	'<label>'+
	                		'<input type="checkbox" value="checkbox" id="'+objetivos[i].objetivo_id+'">'+
	                	'</label>'+
	                '</div>'+
	                '<div class="col-md-7">'+
        				'<h3 class="box-title tituloObjetivoPnd" objetivo="'+objetivos[i].objetivo_id+'">Objetivo Estratégico: '+objetivos[i].objetivoNombre+'</h3>'+
	                '</div>'+
				   '<div class="box-tools pull-right col-md-4">'+
				   '<small></small>'+
				   '<button class="btn btn-box-tool pull-right" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
                  '</div>'+
                '</div><!-- /.box-header -->'+
                '<div class="box-body lista-indicadores" style="display:block;" id="indicador-contenedor-'+objetivos[i].objetivo_id+'">'+
                '</div>'+
               '</div>'); 
		
		for(var j=0; j<objetivosPorProyecto.length;j++)
		{
			if(objetivos[i].objetivo_id == objetivosPorProyecto[j].objetivo)
			{
				$("#"+objetivos[i].objetivo_id).attr('checked', true);
			}
		}

		
	}
	
	
	//$("#estrategia-titulo-"+estrategia).append("<p>PROBANDO</p>");
	event.stopPropagation();
	
});
$("body").on("click", ".tituloObjetivoPnd",function(event){
  var objetivo=$(this).attr("objetivo");
  $("div [class=lista-indicadores][objetivo="+objetivo+"]").html("");
  	var indicadores = $.ajax({
    	url:'/ajaxSelects?accion=getIndicadoresPnd&objetivo='+objetivo,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  	$("#indicador-contenedor-"+objetivo).html("");
  	indicadores = JSON.parse(indicadores);
  	indicadores = indicadores.indicadores;
	var i =0;
	for(i = 0;i<indicadores.length; i++){
		$("#indicador-contenedor-"+objetivo).append(' <!-- objetivos -->'+
                '<div class="box box-warning ">'+
                '<div class="box-header with-border">'+
                  '<h3 class="box-title tituloIndicadorPnd" indicador="'+indicadores[i].id+'">Indicador: '+indicadores[i].nombre+'</h3>'+
                  '<div class="box-tools pull-right">'+
                  ''+
                   '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
                  '</div>'+
                '</div><!-- /.box-header -->'+
                '<div class="box-body lista-metas" style="display:block;" id="metas-contenedor-'+indicadores[i].id+'">'+
                '</div>'+
               '</div>'); 
	}
	event.stopPropagation();
	
});
$("body").on("click", ".tituloIndicadorPnd",function(event){
  var indicador=$(this).attr("indicador");
  $("div [class=lista-metas][indicador="+indicador+"]").html("");
  	var metas = $.ajax({
    	url:'/ajaxSelects?accion=getMetasPnd&indicador='+indicador,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
  
  	metas = JSON.parse(metas);
  	metas = metas.metas;
	var i =0;
	$("#metas-contenedor-"+indicador).html("");
	var tabla= '<table class="table table-striped table-bordered  table-hover">'+
	'<tr>'+
	'<th>fecha</th>'+
	'<th>cantidad</th>'+
'</tr>';
	  
	for(i = 0;i<metas.length; i++){
    	tabla+='<tr>'+
        	'<td>'+metas[i].vencimiento+'</td>'+
           	'<td>'+metas[i].cantidad+'</td>'+
           '</tr>';
	}
	tabla+='</table>'+
	'</div>';
	$("#metas-contenedor-"+indicador).append('<div id="chartContainer-'+indicador+'" style="height: 300px; width: 100%;">');
	//$("#metas-contenedor-"+indicador).append(tabla);
	dibujarGrafico(metas, indicador);

	event.stopPropagation();
	
});
	
	function dibujarGrafico(metas, indicador){
		var dataPoints=[];
		var dia;
		var mes;
		var anho;
		
		for(i = 0;i<metas.length; i++){
 			dataPoints.push({ x: new Date( metas[i].vencimiento), y: metas[i].cantidad});

		}
			       
			
			var chart = new CanvasJS.Chart("chartContainer-"+indicador,
			{
				zoomEnabled: true,
				exportEnabled: true,
				exportFileName: "Indicador-"+indicador,
				title: {
					text: "Evolución del Indicador" 
				},
	                        animationEnabled: true,
				axisX:{      
					valueFormatString: "YYYY" ,
					interval: 1,
					intervalType: "year",
					labelAngle: -50,
					labelFontColor: "rgb(0,75,141)",
				},
				axisY: {
					title: "",
					interlacedColor: "#F0FFFF",
					tickColor: "azure",
					titleFontColor: "rgb(0,75,141)"
				},
				data: [
				{        
					indexLabelFontColor: "darkSlateGray",
					name: 'views',
					type: "area",
					color: "rgba(0,75,141,0.7)",
					markerSize:8,
					dataPoints:dataPoints
				}
			  ]
			});
			
	chart.render();
	}
	
	
	var optionDepartamentos=""; 
	var optionFuncionales=""; 
	var optionUnidadResponsable=""; 
	var optionSnipAutorizado="";
	var optionPnd='<optgroup label="DESARROLLO SOCIAL EQUITATIVO">'+
	'<option value="0">Seleccione Objetivo Estratégico		</option>'+
		'<option value="1">Universalizar el acceso a la identidad de las personas en el país.</option>'+
		'<option value="2">Erradicar la pobreza extrema de hombres y mujeres.</option>'+
		'<option value="3">Reducir en 90% la desnutrición crónica infantil, con énfasis en grupos vulnerables.</option>'+
		'<option value="4">Reducir en 75% la mortalidad materna.</option>'+
		'<option value="5">Reducir en 70% la mortalidad infantil.</option>'+
		'<option value="6">Aumentar a 70% la cobertura de educación inicial.</option>'+
		'<option value="7">Universalizar la educación preescolar.</option>'+
		'<option value="8">Aumentar 5 veces la escolaridad promedio de la población indígena.</option>'+
		'<option value="9">Universalizar el alfabetismo en la población indígena.</option>'+
		'<option value="10">Universalizar la cobertura de la educación escolar básica.</option>'+
		'<option value="11">"Aumentar la cobertura de educación media al 92% (tasa bruta dematriculación en educación media), con énfasis en poblaciones vulnerables.</option>'+
		'<option value="12">Universalizar la alfabetización en adolescentes y adultos.</option>'+
		'<option value="13">Aumentar en 75% la participación de las mujeres en el mundo laboral formal en igualdad de condiciones.</option>'+
	'</optgroup>'+

	'<optgroup label="SERVICIOS SOCIALES DE CALIDAD">'+
		'<option value="14">Alcanzar los estándares internacionales de calidad educativa (universalización del nivel 2 en prueba PISA y promedio en nivel 3 o más).</option>'+
		'<option value="15">Aumentar la esperanza de vida al nacer a 79 años.</option>'+
		'<option value="16">Disminuir en 50% las muertes por enfermedades no contagiosas.</option>'+
		'<option value="17">Disminuir en 50% la tasa de obesidad de la población.</option>'+
		'<option value="18">Reducir en 75% la tasa de homicidios dolosos.</option>'+
		'<option value="19">Reducir en 50% la tasa de muertes por accidentes de tránsito.</option>'+
		'<option value="20">Disminuir en 50% la tasa de suicidios.</option>'+
		'<option value="21">Aumentar la proporción de funcionarios públicos incorporados o promocionados con criterio de méritos y aptitudes.</option>'+
		'<option value="22">Aumentar el acceso a información pública y trámites por medio de redes electrónicas.</option>'+
		'<option value="23">Mejora del sistema estadístico nacional por encima de 85 puntos en el índice internacional de capacidad estadística.</option>'+
	'</optgroup>'+

	'<optgroup label="DESARROLLO LOCAL PARTICIPATIVO">'+
		'<option value="24">Mejorar condiciones de los asentamientos precarios a través de un proceso de ordenamiento y mejora urbanística adecuada.</option>'+
		'<option value="25">Descentralización de la gestión de las políticas públicas.</option>'+
		'<option value="26">Ordenamiento territorial a nivel municipal que determine el uso del suelo rural y urbano considerando los efectos económicos, sociales, culturales y ambientales, de forma a contar con una densidad poblacional adecuada que facilite la provisión de servicios públicos con eficiencia.</option>'+
		'<option value="27">Rendición de cuentas periódicas de todos los niveles de gobierno.</option>'+
	'</optgroup>'+

	'<optgroup label="HÁBITAT ADECUADO Y SOSTENIBLE">'+
		'<option value="28">Reducir en 70% el déficit habitacional.</option>'+
		'<option value="29">Universalizar el acceso a agua potable (agua corriente segura domiciliaria).</option>'+
		'<option value="30">Universalizar el acceso a saneamiento mejorado.</option>'+
		'<option value="31">Universalizar el acceso a energía eléctrica de calidad.</option>'+
		'<option value="32">Reducir en 95% las muertes atribuibles a la contaminación del aire.</option>'+
		'<option value="33">Universalizar la disposición y manejo de residuos urbanos e industriales.</option>'+
	'</optgroup>'+

	'<optgroup label="EMPLEO Y PROTECción SOCIAL">'+
		'<option value="34">Mantener la tasa de crecimiento del ingreso del 40% de la población de menores ingresos por encima de la tasa promedio de crecimiento de la economía.</option>'+
		'<option value="35">Aumentar en 7 veces el promedio nacional de población con estudios terciarios, con énfasis en poblaciones vulnerables.</option>'+
		'<option value="36">Universalizar la cobertura de la seguridad social.</option>'+
		'<option value="37">Alcanzar la inclusión financiera del 100% de los hogares.</option>'+
		'<option value="38">85% de jóvenes de 20-32 años de los quintiles más pobres incluidos en programas de capacitación laboral.</option>'+
	'</optgroup>'+

	'<optgroup label="COMPETITIVIDAD E INNOVACIÓN">'+
		'<option value="39">Tasa de crecimiento promedio del PIB de 6,8%.</option>'+
		'<option value="40">Consolidar una red de transporte multimodal eficiente (fluvial, aéreo, terrestre, ferroviario) que disminuya los costos logísticos promedios a niveles competitivos internacionalmente.</option>'+
		'<option value="41">Mantener bajas tasas de inflación (de acuerdo al objetivo definido) y con reducida volatilidad.</option>'+
		'<option value="42">"Alcanzar el 90% de formalización de la actividad económica en los principales sectores, logrando asimismo un incremento en recaudaciones fiscales que permita una presión tributaria de aproximadamente el 18% del PIB.</option>'+
		'<option value="43">Contar con al menos 1 universidad paraguaya ubicada entre las primeras 400 a nivel mundial (en cualquiera de los 3 rankings más utilizados).</option>'+
		'<option value="44">Aumentar al 80% el uso de internet de banda ancha - o tecnología equivalente -.</option>'+
		'<option value="45">Regularizar la tenencia de la tierra por medio de un catastro fiable que incluya también a todos los beneficiarios de la reforma agraria en las últimas décadas, ce�ido a un estricto cumplimiento de la Ley.</option>'+
		'<option value="46">Quintuplicar el número de patentes de invenciones nacionales.</option>'+
		'<option value="47">Asegurar la transparencia del gasto público en los tres niveles de gobierno y en los tres Poderes del Estado.</option>'+
	'</optgroup>'+

	'<optgroup label="REGIONALIZAción Y DIVERSIFICAción PRODUCTIVA">'+
		'<option value="48">Reducir a menos de 3% el rezago potencial de la productividad por hectárea de la agricultura familiar con respecto a la agricultura empresarial</option>'+
		'<option value="49">Reducir a menos de 7% el rezago potencial de los ingresos laborales promedios en la región centro-norte del país (San Pedro, Concepción, Canindeyú, Caazapá y Caaguazú) con respecto al resto de la región oriental.</option>'+
		'<option value="50">Incrementar el consumo de electricidad para uso industrial.</option>'+
		'<option value="51">Fomentar la creación de MiPyMEs en industrias de servicios y tecnologías.</option>'+
	'</optgroup>'+

	'<optgroup label="VALORIZAción DEL CAPITAL AMBIENTAL">'+
		'<option value="52">Aumentar en 60% el consumo de energías renovables.</option>'+
		'<option value="53">Reducir en 20% el consumo de combustible fósil.</option>'+
	'</optgroup>'+

	'<optgroup label="IGUALDAD DE OPORTUNIDADES EN UN MUNDO GLOBALIZADO">'+
		'<option value="54">Asegurar servicios consulares útiles, eficientes a paraguayos migrantes y propiciar los vínculos culturales paraguayos con sus familiares.</option>'+
		'<option value="55">Ampliar la cobertura territorial y la presencia del país en el mundo, en particular en los países donde existen comunidades crecientes de paraguayos y donde deben promocionarse los productos nacionales y el turismo.</option>'+
		'<option value="56">Gestión efectiva de la diáspora paraguaya en el exterior.</option>'+
		'<option value="57">Propiciar la re-incorporación de paraguayos destacados en el exterior, al servicio público, al sector empresarial o científico.</option>'+
		'<option value="58">Potenciar la contribución al desarrollo paraguayo de la comunidad de inmigrantes en Paraguay en forma armónica e integrada.</option>'+
	'</optgroup>'+


	'<optgroup label="ATRACción DE INVERSIONES, COMERCIO EXTERIOR E IMAGEN PAIS.">'+
		'<option value="59">Ubicar a Paraguay entre los primeros exportadores mundiales de alimentos, en rubros tales como sésamo, almidón de mandioca, stevia, frutas y hortalizas, soja, carne, etc.</option>'+
		'<option value="60">Aumentar la exportación de productos y servicios culturales y tecnológicos.</option>'+
		'<option value="61">Incrementar a al menos 2 millones el número de turistas por año.</option>'+
		'<option value="62">Disminuir sustancialmente las vulnerabilidades y amenazas de lavado de activos, financiamiento del terrorismo y proliferación de armas de destrucción masiva.</option>'+
		'<option value="63">Aumentar los ingresos por venta de energía eléctrica.</option>'+
	'</optgroup>'+

	'<optgroup label="INTEGRACIÓN ECONÓMICA REGIONAL">'+
		'<option value="64">Hacer del Paraguay el eje de una integración energética regional, aprovechando las potenciales complementariedades energéticas en la regién, garantizando así el uso sostenible y eficiente de los recursos energéticos de cada país.</option>'+
		'<option value="65">Aumentar la capacidad de movimiento portuario.</option>'+
		'<option value="66">Incrementar el tiempo disponible de uso de las hidrovías a 365 días al año.</option>'+
		'<option value="67">Aumentar la transitabilidad de transporte de cargas a todas las cabeceras distritales.</option>'+
		'<option value="68">Restaurar al menos el 20% de los ecosistemas degradados.</option>'+
		'<option value="69">Aumentar los ingresos nacionales por la venta de servicios ambientales.</option>'+
	'</optgroup>'+

	'<optgroup label="SOSTENIBILIDAD DEL HÁBITAT GLOBAL">'+
		'<option value="70">Reducir los costos de recuperación ante eventos de desastres causados por efectos climáticos.</option>'+
		'<option value="71">Explotar los acuíferos en base a planes ambientales debidamente monitoreados.</option>'+
		'<option value="72">Aumentar la cobertura de áreas forestales y biomasa protegida.</option>'+
	'</optgroup>';
	
	var departamentos = $.ajax({
    	url:'/ajaxSelects?accion=getDepartamentos',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	departamentos = JSON.parse(departamentos);
	departamentos = departamentos.departamentos;
	for(i = 0;i<departamentos.length; i++){
		optionDepartamentos+='<option value="'+departamentos[i].deptoPais+'">'+departamentos[i].abrevDepartamento+'</option>';
	}
	
	
	var funcionales = $.ajax({
    	url:'/ajaxSelects?accion=getFuncionales&anio=2017',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	funcionales = JSON.parse(funcionales);
	funcionales = funcionales.funcionales;
	for(i = 0;i<funcionales.length; i++){
		optionFuncionales+='<option value="'+funcionales[i].codigoFuncional+'">'+funcionales[i].codigoFuncional+') '+funcionales[i].nombre+'</option>';
	}
	
	
	
	var unidadesResponsables = $.ajax({
    	url:'/ajaxSelects?accion=getUnidadesResponsables&anio=2017&nivel='+nivel+'&entidad='+entidad+'&unidadResponsableId=0',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	unidadesResponsables = JSON.parse(unidadesResponsables);
	unidadesResponsables = unidadesResponsables.unidadesResponsables;
	for(i = 0;i<unidadesResponsables.length; i++){
		optionUnidadResponsable+='<option value="'+unidadesResponsables[i].unrCodigo+'">'+unidadesResponsables[i].unrNombre+'</option>';
	}
	
	
	var snip = $.ajax({
    	url:'/ajaxSelects?accion=getSnip&nivel='+nivel+'&entidad='+entidad,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	snip = JSON.parse(snip);
	snip = snip.snip;
	
	var snipAutorizado = $.ajax({
    	url:'/ajaxSelects?accion=getSnipAutorizado&nivel='+nivel+'&entidad='+entidad,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	snipAutorizado = JSON.parse(snipAutorizado);
	snipAutorizado = snipAutorizado.snipAutorizado;
	
	for(var i = 0;i<snipAutorizado.length; i++){
		for(var aux=0;aux<snip.length;aux++){
			if (snip[aux].codigoSnip==snipAutorizado[i].codigoSnip){
				optionSnipAutorizado+='<option value="'+snipAutorizado[i].codigoSnip+'">'+snipAutorizado[i].codigoSnip+") "+snip[aux].nombreProyecto+'</option>';
			}
		}
		
	}
	
	optionEstrategiaPND =   '<option value="0" selected="selected">Seleccione una estrategia PND</option>'+
							'<option value="1">1.1) Desarrollo social equitativo</option>'+
						    '<option value="2">1.2) Servicios sociales de calidad</option>'+
							'<option value="3">1.3) Desarrollo local participativo</option>'+
							'<option value="4">1.4) Hábitat adecuado y sostenible</option>'+
							'<option value="5">2.1) Empleo y seguridad social</option>'+
							'<option value="6">2.2) Competitividad e innovación</option>'+
							'<option value="7">2.3) Regionalización y diversificación productiva</option>'+
							'<option value="8">2.4) Valorización del capital ambiental</option>'+
							'<option value="9">3.1) Igualdad de oportunidades en un mundo globalizado</option>'+
							'<option value="10">3.2) Atracción de inversiones, comercio exterior e imagen país</option>'+
							'<option value="11">3.3) Integración económica regional</option>'+
							'<option value="12">3.4) Sostenibilidad del hábitat global</option>';
	
	$("#row-body-programacionfisica").html("");
	var tiposPrograma = $.ajax({
    	url:'/ajaxSelects?accion=getTiposPrograma',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;

	tiposPrograma = JSON.parse(tiposPrograma);
	tiposPrograma = tiposPrograma.tiposPrograma;
	var i =0;
	var nombre_corto=$("#nombreUsuario").text().split("@");	
		
	for(i = 0;i<tiposPrograma.length; i++){
		if (nombre_corto[0]=="scs"){		
			$("#row-body-programacionfisica").append(' <!-- tipos -->'+
					'<div class="row">'+
				      '<div class="col-md-12">'+
				      	'<div class="box box-info" height="1000px">'+
	                '<div class="box-header with-border">'+
	                  '<h3 class="box-title tituloTipoPrograma" id="" tipoPrograma="'+tiposPrograma[i].numeroFila+'">Tipo de Programa: '+tiposPrograma[i].numeroFila+') '+tiposPrograma[i].nombreTipoPrograma+'</h3>'+
	                  '<div class="box-tools pull-right">'+
	                   '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
	                  '</div>'+
	                '</div><!-- /.box-header -->'+
	                '<div class="box-body lista-programas" id="programas-contenedor-'+tiposPrograma[i].numeroFila+'" tipoPrograma="'+tiposPrograma[i].numeroFila+'"  >'+
	                '</div>'+
	               '</div></div></div>');
		}else{
			if(tiposPrograma[i].numeroFila!=5){
				$("#row-body-programacionfisica").append(' <!-- tipos -->'+
						'<div class="row">'+
					      '<div class="col-md-12">'+
					      	'<div class="box box-info" height="1000px">'+
		                '<div class="box-header with-border">'+
		                  '<h3 class="box-title tituloTipoPrograma" id="" tipoPrograma="'+tiposPrograma[i].numeroFila+'">Tipo de Programa: '+tiposPrograma[i].numeroFila+') '+tiposPrograma[i].nombreTipoPrograma+'</h3>'+
		                  '<div class="box-tools pull-right">'+
		                   '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
		                  '</div>'+
		                '</div><!-- /.box-header -->'+
		                '<div class="box-body lista-programas" id="programas-contenedor-'+tiposPrograma[i].numeroFila+'" tipoPrograma="'+tiposPrograma[i].numeroFila+'"  >'+
		                '</div>'+
		               '</div></div></div>');
			}
		}		 
	}
	
	$("body").on("click", "#titulolistaProgramacion",function(event){
		
		event.stopPropagation();
   	 event.preventDefault();
		 return false;
	});
	// termina body on load (document.ready)
	
	
	$("body").on("click", ".tituloTipoPrograma",function(event){
		var tipoPrograma= $(this).attr("tipoPrograma");
		$("#programas-contenedor-"+tipoPrograma).html("");
		var programas = $.ajax({
        	url:'/ajaxSelects?accion=getProgramas&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPrograma+'',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

		programas = JSON.parse(programas);
		programas = programas.programas;
		programas=programas.sort(comparePrograma);
		var contenedorProgramas="";
		$("#programas-contenedor-"+tipoPrograma).html("");
    	var i =0;
    	for(i = 0;i<programas.length; i++){
    		contenedorProgramas='<!-- programas -->'+
	                  '<div class="box box-success collapsed-box" >'+
                    '<div class="box-header with-border">'+
	                    '<div class="row">'+	
                    		'<div class="col-md-11">'+
	                    		'<h3 class="box-title tituloPrograma" id="" tipoPrograma="'+tipoPrograma+'" programa="'+programas[i].codigoPrograma+'">Programa: '+nivel+'.'+entidad+'.'+tipoPrograma+'.'+programas[i].codigoPrograma+') '+programas[i].nombrePrograma+'('+programas[i].abrevPrograma+')</h3>'+
	                      	'</div>'+
	                      	'<div class="col-md-1">'+
	                    		'<div class="box-tools pull-right">';
	    		<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
		    	contenedorProgramas+='<button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-edit"></i></button>'+
				                     '   <ul class="dropdown-menu" role="menu"><div class="btn-group-vertical">'+
				                     '     <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal1" tipoPrograma="'+tipoPrograma+'" codigoPrograma="'+programas[i].codigoPrograma+'">Editar Programa</button>'+
				                     '   </ul></div>';
		    	<%}%>
		    	contenedorProgramas+='</div>'+
	    				'</div>';

	       contenedorProgramas+='</div>'+
                    '<div class="box-body cuerpo-programa" id="cuerpo-programa-'+tipoPrograma+'-'+programas[i].codigoPrograma+'" programa="'+programas[i].codigoPrograma+'" style="display:none">'+
                    '<form id="from-programa-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programas[i].codigoPrograma+'">'+
                    '<table class="table table-striped table-bordered  table-hover">'+
                    ' 	<tr>'+
                    '		<td>Diagnóstico</td>'+
                    '		<td id="diagnostico-programa-'+tipoPrograma+'-'+programas[i].codigoPrograma+'">'+programas[i].diagnostico.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</td>'+
                    ' 	</tr>'+
                     ' 	<tr>'+
                     '		<td>Objetivo</td>'+
                     '		<td id="objetivo-programa-'+tipoPrograma+'-'+programas[i].codigoPrograma+'" >'+programas[i].objetivo.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</td>'+
                     ' 	</tr>'+
                     ' 	<tr>'+
                     '		<td>Base Legal</td>'+
                     '		<td id="baseLegal-programa-'+tipoPrograma+'-'+programas[i].codigoPrograma+'"> '+programas[i].baseLegal.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</td>'+
                   //  ' 	</tr>'+
    		//		 ' 	<tr>'+
                    // '		<td>Descripcion</td>'+
                    // '		<td><textarea name="descripcion" id="descripcion-programa-'+programas[i].codigoPrograma+'" rows="4" cols="180">'+programas[i].descripcionPrograma+'</textarea></td>'+
                   //  ' 	</tr>'+
                   //  ' 	<tr>'+
                   //  '		<td>Resultado</td>'+
                    // '		<td><textarea name="resultado" id="resultado-programa-'+programas[i].codigoPrograma+'" rows="4" cols="180">'+programas[i].resultado+'</textarea></td>'+
                     //' 	</tr>'+
                     '  <tr>'+
                     '		<td>Departamento</td>'+
                     '		<td><select name="departamento" id="departamento-programa-'+tipoPrograma+'-'+programas[i].codigoPrograma+'" disabled="">'+
                     			optionDepartamentos+
                     '		</select></td>'+
                     ' 	</tr>';
                     contenedorProgramas+='</table>'+
                     '<!-- <button type="submit" style="margin-right:50px" class="btn btn-primary" id="guardar-programa-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programas[i].codigoPrograma+'">Guardar</button> -->'+
                     '</form>'+
                    '</div>'+
                    '<div class="box-body lista-subprogramas" id="subprogramas-contenedor-'+programas[i].codigoPrograma+'-'+tipoPrograma+'" programa="'+programas[i].codigoPrograma+'" style="display:block;" >'+
                    '</div>'+
                   '</div>'; 
                   
                   
	        		$("#programas-contenedor-"+tipoPrograma).append(contenedorProgramas); 
	        		contenedorProgramas="";
	        		$('#departamento-programa-'+tipoPrograma+'-'+programas[i].codigoPrograma+' option[value="'+programas[i].codigoDepartamento+'"]').attr("selected", "selected");
    	}
    	event.stopPropagation();
   	 event.preventDefault();
		 return false;
	});
	$("body").on("click", ".tituloPrograma",function(event){
//		$(this).next().children().click();

		var programa= $(this).attr("programa");
		var tipoPrograma= $(this).attr("tipoPrograma");
		$("#cuerpo-programa-"+tipoPrograma+"-"+programa).show();
		$("#subprograma-contenedor-"+programa+"-"+tipoPrograma).html("");
		var subprogramas = $.ajax({
        	url:'/ajaxSelects?accion=getSubprogramas&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPrograma+'&programa='+programa,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

		subprogramas = JSON.parse(subprogramas); 
		subprogramas = subprogramas.subprogramas;
		subprogramas=subprogramas.sort(compareId);
		
		$("#subprogramas-contenedor-"+programa+"-"+tipoPrograma).html("");
		var contenedorSubprograma="";		
    	
    	for(var i = 0;i<subprogramas.length; i++){
    		contenedorSubprograma+=' <!-- subprogramas -->'+
            '<div class="box box-warning collapsed-box" >'+
          '<div class="box-header with-border">'+
	          '<div class="row">'+	
	  			'<div class="col-md-11">'+
           			'<h3 class="box-title tituloSubprograma" id="" subprograma="'+subprogramas[i].id+'" tipoPrograma="'+tipoPrograma+'" programa="'+programa+'">Subprograma: '+nivel+'.'+entidad+'.'+tipoPrograma+'.'+programa+'.'+subprogramas[i].id+') '+subprogramas[i].nombre+'('+subprogramas[i].abrev+')</h3>'+
        		'</div>'+
                '<div class="col-md-1">'+
           			'<div class="box-tools pull-right">';
			    		<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
				    	contenedorSubprograma+=	 '   <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-edit"></i></button>'+
									             '   <ul class="dropdown-menu" role="menu"><div class="btn-group-vertical">'+
									             '   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal3" tipoPrograma="'+tipoPrograma+'" codigoPrograma="'+programa+'" codigoSubPrograma="'+subprogramas[i].id+'">Editar Subprograma</button>';
			            <%}%>
contenedorSubprograma+='</div>'+
					'</div>'+
   	   				'</ul>'+
            '</div>'+
          '</div><!-- /.box-header -->'+
          '<div class="box-body cuerpo-programa" id="cuerpo-programa-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'" programa="'+subprogramas[i].id+'" style="display:none;" >'+
          '<form id="from-subprograma-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'">'+
          '<table class="table table-striped table-bordered  table-hover">'+
          ' 	<tr>'+
           '		<td>Diagnóstico</td>'+
           '		<td id="diagnostico-subprograma-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'">'+subprogramas[i].descripcion.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</td>'+
           ' 	</tr>'+
           ' 	<tr>'+
           '		<td>Objetivo</td>'+
           '		<td id="objetivo-subprograma-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'">'+subprogramas[i].objetivo.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</td>'+
           ' 	</tr>'+
           ' 	<tr>'+
           '		<td>Base Legal</td>'+
           '		<td id="baseLegal-subprograma-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'">'+subprogramas[i].baseLegal+'</td>'+
           ' 	</tr>'+
           ' 	<tr>'+

           ' 	<tr>'+
           '		<td>Departamento</td>'+
           '		<td><select id="departamento-subprogramajaja-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'"  disabled>'+
           			optionDepartamentos+
           '		</select></td>'+
           ' 	</tr>';
    	
    		contenedorSubprograma+='</table>'+
           '<!-- <button type="submit" style="margin-right:50px" data-dismiss="modal" class="btn btn-primary" id="guardar-subprograma-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+'">Guardar</button> -->'+
           '</form>'+
          '</div>'+
          '<div class="box-body lista-subprogramas" id="proyecto-contenedor-'+subprogramas[i].id+'-'+programa+'-'+tipoPrograma+'" subprograma="'+subprogramas[i].id+'"  tipoPrograma="'+tipoPrograma+'" programa="'+programa+'" style="display:block;" >'+
          '</div>'+
         '</div>';
    		//$("#subprogramas-contenedor-"+programa+"-"+tipoPrograma).html("");
    		$("#subprogramas-contenedor-"+programa+"-"+tipoPrograma).append(contenedorSubprograma); 
    		contenedorSubprograma="";
    		$('#departamento-subprogramajaja-'+tipoPrograma+'-'+programa+'-'+subprogramas[i].id+' option[value="'+subprogramas[i].codigo_departamento+'"]').attr("selected", "selected");

    	}
    	event.stopPropagation();
   	 event.preventDefault();
		 return false;
	});
	$("body").on("click", ".tituloSubprograma",function(event){
		var optionUnidadesMedida=""; 
		var contenedorProyecto="";
		
		var unidadesMedida = $.ajax({
	    	url:'/ajaxSelects?accion=getUnidadesMedida',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		unidadesMedida = JSON.parse(unidadesMedida);
		unidadesMedida = unidadesMedida.unidadesMedida;
		for(var i = 0;i<unidadesMedida.length; i++){
			optionUnidadesMedida+='<option value="'+unidadesMedida[i].codigoUnidadMedida+'">'+unidadesMedida[i].nombre+'</option>';
		}
		
		
		var subprograma= $(this).attr("subprograma");
		var programa= $(this).attr("programa");
		var tipoPrograma= $(this).attr("tipoPrograma");
		$("#cuerpo-programa-"+tipoPrograma+"-"+programa+"-"+subprograma).show();
		
		$("#proyecto-contenedor-"+subprograma+"-"+programa+"-"+tipoPrograma).html("");
		var proyectos = $.ajax({
        	url:'/ajaxSelects?accion=getProyectos&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

		proyectos = JSON.parse(proyectos);
		proyectos = proyectos.proyectos;
		proyectos=proyectos.sort(compareProyecto);
		var usuarios = $.ajax({
			url:'/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		//$('#myModal .modal-body').html("");
    	for(var i =0;i<proyectos.length; i++){ 
    		
    		if(proyectos[i].borrado == false){	    		
	    		contenedorProyecto = '<!-- proyectos -->'+
		                '<div class="col-md-12"><div class="box box-danger collapsed-box" >'+	    				
		                    '<div class="box-header with-border">'+
		                      
				                '<div class="col-md-11">'+
			                    	'<h3 class="box-title tituloProyecto" id="" proyecto="'+proyectos[i].codigoProyecto+'" subprograma="'+subprograma+'" tipoPrograma="'+tipoPrograma+'" programa="'+programa+'">Proyecto: '+nivel+'.'+entidad+'.'+tipoPrograma+'.'+programa+'.'+subprograma+'.'+proyectos[i].codigoProyecto+') '+
				                    	'<input type="text" name="nombreProyecto"  id="nombre-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" value="'+proyectos[i].nombreProyecto+'" size="34">'+
				                    	'('+'<input type="text" name="abrevProyecto" id="abrev-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" value="'+proyectos[i].abrevProyecto+'" size="7">'+')'+
				                    '</h3>'+
				                '</div>'+
			                    
			                    '<div class="col-md-1">'+
			                     	'<div class="box-tools pull-right">';
			                     	<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
			                     	contenedorProyecto +='<button type="button" class="btn btn-box-tool consultaBorrarProyecto" data-widget="remove" data-toggle="tooltip" title="Borrar Proyecto" parametros="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">'+
			                     			'<i class="fa fa-trash-o"></i>'+
			                     		'</button>';
		                     		 <%}%>
		                     		contenedorProyecto +='</div>'+
			                    '</div>'+
		                    
		                    '</div><!-- /.box-header -->'+
		                    '<div class="box-body cuerpo-programa" id="cuerpo-programa-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" programa="'+proyectos[i].codigoProyecto+'" style="display:block;" >'+
		                    	'<form id="formulario-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">'+
		                    		'<table class="table table-striped table-bordered  table-hover">'+
		                    
				                    '<tr>'+
				                    '	<td>Diagnostico</td>'+
				                    '	<td><textarea class="form-control animated" name="diagnostico" id="diagnostico-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" rows="4" >'+proyectos[i].diagnostico+'</textarea></td>'+
				                    '</tr>'+
				                    
				                    '<tr>'+
				                    '	<td>Objetivo</td>'+
				                    '	<td><textarea class="form-control animated" name="descripcionProyecto" id="objetivo-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" rows="4" >'+proyectos[i].descripcionProyecto+'</textarea></td>'+
				                    '</tr>'+
				                     
				               //      ' 	<tr id="pnd-proyecto-'+proyectos[i].codigoProyecto+'">'+
				               //      '		<td><button type="button" class="btn btn-default botonObjetivo" data-toggle="modal" data-target="#myModal" ruta='+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'>Objetivo Estratégico PND</button></td>'+
				               //      '		<td ><select class="form-control" name="objetivo_estrategico_id" id="pnd-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+optionPnd+
				               //      '		</select>'+
				               //      '</td>'+
				               //      ' 	</tr>'+
				                     
				               //      '  <tr>'+
				               //      '		<td>Resultado Esperado</td>'+
				               //      '		<td >'+
				              //       			'<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#resultado_esperado-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" id="agregar-resultado-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">'+
				              //       				'Agregar Resultado Esperado'+													  
				              //       			'</button>'+
				              //       		'</td>'+
				              //       ' 	</tr>'+
				              		 ' <tr>'+
				                     '		<td>Estrategia PND</td>'+
				                     '		<td><select name="estrategia_pnd" id="estrategia_pnd-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+
				                     optionEstrategiaPND+
				                     '          </select></td>'+
				                     ' 	</tr>'+
				                     ' 	<tr>'+
				                     '		<td>Unidad Responsable</td>'+
				                     '		<td><select name="codigoUnidadResponsable" id="unidad_responsable-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+
				                     optionUnidadResponsable+
				                    '		</select></td>'+
				                     ' 	</tr>'+
				                     '  <tr>'+
				                     '		<td>Clasificación Funcional</td>'+
				                     '		<td><select name="codigoFuncional" id="funcional-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+
				                     optionFuncionales+
				                    '		</select></td>'+
				                     ' 	</tr>';                     
			                     
									if(tipoPrograma==3){
										
									 contenedorProyecto+=
										'<tr>'+
					                     '		<td>Proyecto Snip</td>'+
					                     '		<td><select name="codigoSnip" id="snip-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+
					                     '<option value="0">No Aplica</option>'+
					                 optionSnipAutorizado+
					                    '		</select></td>'+
					                     ' 	</tr>'
				                    }                     
			                     
									/* contenedorProyecto+=
				                     ' 	<tr>'+
				                     '		<td>Departamento</td>'+
				                     '		<td><select name="codigoDepartamento" id="departamento-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+
				                     			optionDepartamentos+
				                     '		</select></td>'+
				                     ' 	</tr>'+
				                     '  <tr>'+
				                     '		<td>Presupuesto Gasto</td>'+
				                     '		<td >'+
				                     			'<button type="button" class="btn btn-primary btn-lg" id="presupuesto-gasto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" data-toggle="modal" data-target="#myModal5" id="reportePresupuestoGasto" parametros="PresupuestoGasto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">'+
				                     				'Presupuesto Gasto'+													  
				                     			'</button>'+
				                     		'</td>'+
				                     ' 	</tr>'+
				                     '</table>'; */	                     	                     
				                     
				                     contenedorProyecto+=
				                         ' 	<tr>'+
				                         '		<td>Departamento</td>'+
				                         '		<td><select name="codigoDepartamento" id="departamento-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" >'+
				                         			optionDepartamentos+
				                         '		</select></td>'+
				                         ' 	</tr>'+
				                         '  <tr>'+                         
				                         '</table>';
			                     
			                     <% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>                
			                     		contenedorProyecto+='<button type="submit" style="margin-right:50px" class="btn btn-primary" id="guardar-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">Guardar</button>';                     	
								 <%} if (attributes.get("role_id").toString().equals("2")){%>							 	
								 	if(usuarios[0].unidadResponsable == 0 || usuarios[0].unidadResponsable == proyectos[i].codigoUnidadResponsable){
								 		contenedorProyecto+='<button type="submit" style="margin-right:50px" class="btn btn-primary" id="guardar-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">Guardar</button>';					 		
								 	}					 	
								 <%}%>
							 
							 contenedorProyecto+=
								'</div><!-- /.box-body -->'+
							'</form>'+
		                    '<div class="box-body lista-proyecto" id="detalle-proyecto-contenedor-'+proyectos[i].codigoProyecto+'-'+programa+'-'+tipoPrograma+'-'+subprograma+'" proyecto="'+proyectos[i].codigoProyecto+'" subprograma="'+subprograma+'"  tipoPrograma="'+tipoPrograma+'" programa="'+programa+'" style="display:block;" >'+
		                    '</div>'+
		                  '</div>'+
		                  '</div>';				    
    			} else {
    				<% if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
    				
    				contenedorProyecto = '<!-- proyectos -->'+
	                '<div class="col-md-12"><div class="box box-danger collapsed-box" >'+
    				'<form id="formulario-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">'+	                    
    					'<div class="box-header with-border">'+	                      
    						'<div class="col-md-11">'+
	    						'<h3 class="box-title tituloProyecto" id="" proyecto="'+proyectos[i].codigoProyecto+'" subprograma="'+subprograma+'" tipoPrograma="'+tipoPrograma+'" programa="'+programa+'"><del>Proyecto: '+nivel+'.'+entidad+'.'+tipoPrograma+'.'+programa+'.'+subprograma+'.'+proyectos[i].codigoProyecto+')</del> '+
		                    		'<input type="text" name="nombreProyecto"  id="nombre-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" value="'+proyectos[i].nombreProyecto+'" disabled="disabled" size="34">'+
		                    		'('+'<input type="text" name="abrevProyecto" id="abrev-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" value="'+proyectos[i].abrevProyecto+'" disabled="disabled" size="7">'+')'+
		                    	'</h3>'+
	                    	'</div>'+
	                    	'<div class="col-md-1">'+
				                '<div class="box-tools pull-right">'+
				                	'<button type="button" class="btn btn-box-tool consultaBorrarProyecto" data-widget="remove" data-toggle="tooltip" title="Restaurar Proyecto" parametros="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'"><i class="fa fa-recycle"></i>'+
									'</button>'+
				                '</div>'+
			                '</div>'+
			                
	                    '</div><!-- /.box-header -->'+
	                    '<div class="box-body cuerpo-programa" id="cuerpo-programa-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" programa="'+proyectos[i].codigoProyecto+'" style="display:block;" >'+
	                    	'<div class="box-body lista-proyecto" id="detalle-proyecto-contenedor-'+proyectos[i].codigoProyecto+'-'+programa+'-'+tipoPrograma+'-'+subprograma+'" proyecto="'+proyectos[i].codigoProyecto+'" subprograma="'+subprograma+'"  tipoPrograma="'+tipoPrograma+'" programa="'+programa+'" style="display:block;" >'+
	                    	'</div>'+
	                    '</div>'+
	                '</form></div></div>';
				    <%}%>		
    			}
    		    		
            $("#proyecto-contenedor-"+subprograma+"-"+programa+"-"+tipoPrograma).append(contenedorProyecto);
    		$('#departamento-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+' option[value="'+proyectos[i].codigoDepartamento+'"]').attr("selected", "selected");
    		$('#funcional-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+' option[value="'+proyectos[i].codigoFuncional+'"]').attr("selected", "selected");
    		$('#unidad_responsable-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+' option[value="'+proyectos[i].codigoUnidadResponsable+'"]').attr("selected", "selected");
    		$('#snip-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+' option[value="'+proyectos[i].codigoSnip+'"]').attr("selected", "selected");
    		//$('#pnd-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+' option[value="'+proyectos[i].objetivo_estrategico_id+'"]').attr("selected", "selected");
    		$('#estrategia_pnd-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+' option[value="'+proyectos[i].objetivo_estrategico_id+'"]').attr("selected", "selected");
    		
    		// Se verifica si puede editar datos solo si es rol 0, 1 y 2 (Unr=0 o unr_usuario=unr_proyecto), si no se deshabilitan los campos.
    		<% if (attributes.get("role_id").toString().equals("2")){%>		 	
		 	if(usuarios[0].unidadResponsable != 0 && usuarios[0].unidadResponsable != proyectos[i].codigoUnidadResponsable){
		 		$('#nombre-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#abrev-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#diagnostico-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#objetivo-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#unidad_responsable-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#funcional-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#snip-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#departamento-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#estrategia_pnd-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#presupuesto-gasto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');		 		
		 	}
		 	<%} else if (attributes.get("role_id").toString().equals("3")){%>
			 	$('#nombre-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#abrev-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#diagnostico-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#objetivo-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#unidad_responsable-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#funcional-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#snip-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#departamento-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#estrategia_pnd-proyecto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 		$('#presupuesto-gasto-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto).attr('disabled', 'disabled');
		 	<%}%>
	var resultados = $
														.ajax({
															url : '/ajaxSelects?accion=getResultados&nivel='
																	+ nivel
																	+ '&entidad='
																	+ entidad
																	+ '&tipoPresupuesto='
																	+ tipoPrograma
																	+ '&programa='
																	+ programa
																	+ '&subprograma='
																	+ subprograma
																	+ '&proyecto='
																	+ proyectos[i].codigoProyecto,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;

												resultados = JSON
														.parse(resultados);
												resultados = resultados.resultados;

												var contenidoModal = "";
												contenidoModal += '<div class="modal fade" id="resultado_esperado-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
														+ '<div class="modal-dialog modal-lg">'
														+ '<div class="modal-content">'
														+ '<div class="modal-header">'
														+ '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'
														+ '<h4 class="modal-title" id="titulo-resultado-esperado-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'"> Resultados Esperados</h4>'
														+ '</div>'
														+ '<div class="modal-body">';
												//formulario de nuevo resultado
												contenidoModal += '  <div class="box" height="1000px">'
														+ '   <div class="box-header with-border" height="1000px">'
														+ '    <h3 class="box-title" id="tituloTipoPrograma">'
														+ '    Agregue Nuevo Resultado Esperado'
														+ '  </h3>'
														+
														// ' <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
														'</div>'
														+ '</div>'
														+ '<div class="box-body" >'
														+ '<ul  class="col-md-12">'
														+ '<form class="form-horizontal" role="form" id="formulario_resultado_esperado-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">'
														+ '	<input type="hidden"  name="accion"  value="insResultado">'
														+ '	<input type="hidden"  name="nivel"  value="'+nivel+'">'
														+ '<input type="hidden"  name="entidad" value="'+entidad+'">'
														+ '<input type="hidden"  name="tipo_presupuesto" value="'+tipoPrograma+'">'
														+ '<input type="hidden"  name="programa" value="'+programa+'">'
														+ '<input type="hidden"  name="subprograma" value="'+subprograma+'">'
														+ '<input type="hidden"  name="proyecto" value="'+proyectos[i].codigoProyecto+'">'
														+ '<input type="hidden"  name="funcional" value="'+proyectos[i].codigoFuncional+'">'
														+ '<input type="hidden"  name="tipo_objetivo_id" value="2">'
														+ '<div class="form-group">'
														+ '<label>Resultado Esperado</label>'
														+ '<textarea class="form-control" rows="3" name="nombre" ></textarea>'
														+ '</div>'
														+

														'<div class="box-footer">'
														+ '<button type="submit" class="btn btn-warning" id="guardar-resultado-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'">Agregar</button>'
														+ '</div>'
														+ '</form>'
														+ '</ul>'
														+ '</div>'
														+ '</div>';
												for (var j = 0; j < resultados.length; j++) {

													contenidoModal += '<div class="box box-info">'
															+ '<div class="box-header with-border">'
															+ '<h3 class="box-title tituloResultado">'
															+ resultados[j].nombre
															+ '</h3>'
															+
															//'<div class="box-tools pull-right">(Resultado Esperado)'+
															'<div class="box-tools pull-right">'
															+
															//'<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
															//'<button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
															'</div>'
															+ '</div>'
															+ '<div class="box-body lista-resultados" id="indicadores-contenedor-'+resultados[j].id+'" style="display:block;">';
													//'<button type="submit" class="btn btn-danger borrarResultado" parametros=""'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'-'+resultados[j].id+'-borrarResultado"">Borrar Resultado y todos sus indicadores</button>';

													var indicadores = $
															.ajax({
																url : '/ajaxSelects?accion=getIndicadoresPnd&objetivo='
																		+ resultados[j].id,
																type : 'get',
																dataType : 'json',
																async : false
															}).responseText;

													indicadores = JSON
															.parse(indicadores);
													indicadores = indicadores.indicadores;

													var nombreUnidadMedida = "";
													var productos = $
															.ajax({
																url : '/ajaxSelects?accion=getProductos',
																type : 'get',
																dataType : 'json',
																async : false
															}).responseText;
													productos = JSON
															.parse(productos);
													productos = productos.productos;

													/*for(i = 0;i<productos.length; i++){
														if(productos[i].unidad_medida_id == indicadores[k].unidad_medida_id){
															nombreUnidadMedida = productos[i].nombre
														}
													optionProducto+='<option value="'+productos[i].codigoCatalogo+'">'+productos[i].codigoCatalogo+") "+productos[i].nombreCatalogo+'</option>';
													}*/

													//formulario para agregar indicadores
													contenidoModal += '	    	<div class="box" height="1000px">'
															+ '          <div class="box-header with-border" height="1000px">'
															+ '            <h3 class="box-title" id="tituloTipoPrograma">'
															+ '              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'
															+ '              Agregar Indicador'
															+ '            </h3>'
															+
															//'            <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
															'           </div>'
															+ '          </div>'
															+ '        <div class="box-body" >'
															+ '           <ul  class="col-md-12">'
															+ '			<form class="form-horizontal" role="form" id="formulario_indicador_resultado-'+resultados[j].id+'">'
															+ '				<input type="hidden"  name="objetivo_id" value="'+resultados[j].id+'">'
															+ '				<input type="hidden"  name="tipo_indicador_id" value="2">'
															+ '				<input type="hidden"  name="metodo_calculo_id" value="1">'
															+ '				<input type="hidden"  name="desagregacion_tipo_zona_geografica_id" value="1">'
															+ '				<input type="hidden"  name="tipo_demografica_id" value="1">'
															+ '				<input type="hidden"  name="fuente_verificacion_id" value="1">'
															+ '				<input type="hidden"  name="descripcion" value="">'
															+ '				<div class="form-group">'
															+ '                    <label>Nombre</label>'
															+ '                    <input type= "text" class="form-control" placeholder="" name="nombre">'
															+ '                  </div>'
															+ '                   <div class="form-group">'
															+ '                    <label>Unidad de Medida</label>'
															+ '                    <select class= "form-control" name="unidad_medida_id">'
															+ optionUnidadesMedida
															+ '					</select>'
															+ '                  </div>'
															+ '                  <div class="form-group">'
															+ '                    <label>Frecuencia (Meses)</label>'
															+ '                    <input type="int" class="form-control" rows="3" placeholder="" name="frecuencia_meses">'
															+ '                  </div>'
															+ '                  <div class="form-group">'
															+ '                    <label>Observaciones</label>'
															+ '                    <input type= "text" class="form-control" placeholder="" name="observaciones">'
															+ '                  </div>'
															+ '                  <div class="form-group">'
															+ '                    <label>Metas</label>'
															+ '                    <input size="50px" type= "text" class="form-control" placeholder="2014" name="meta2014">'
															+ '                    <input size="50px" type= "text" class="form-control" placeholder="2015" name="meta2015">'
															+ '                    <input size="50px" type= "text" class="form-control" placeholder="2016" name="meta2016">'
															+ '                    <input size="50px" type= "text" class="form-control" placeholder="2017" name="meta2017">'
															+ '                    <input size="50px" type= "text" class="form-control" placeholder="2018" name="meta2018">'
															+ '                  </div>'
															+ '                  <div class="box-footer">'
															+ '                  	<button type="submit" class="btn btn-warning" id="guardar-indicador_resultado-'+resultados[j].id+'">Agregar</button>'
															+ '                  </div>'
															+ '			</form>'
															+ '		</ul>'
															+ '	</div>'
															+ '</div>';
													for (var k = 0; k < indicadores.length; k++) {
														var nomUniMed = "";
														for (var unidadId = 0; unidadId < unidadesMedida.length; unidadId++) {

															if (unidadesMedida[unidadId].codigoUnidadMedida == indicadores[k].unidad_medida_id)
																nomUniMed = unidadesMedida[unidadId].nombre
														}

														contenidoModal += ' <!-- indicadores -->'
																+ '<div class="box box-warning ">'
																+ '<div class="box-header with-border">'
																+

																'<h3 class="box-title tituloIndicador" id="" indicador="'+indicadores[k].id+'">Indicador: '
																+ indicadores[k].nombre
																+ '</h3><br/>'
																+

																//AGREGAR MAS DATOS AL GRAFICO EVOLUCION DEL INDICADOR
																'<table class="table table-striped table-bordered table-hover">'
																+ '<tr>'
																+ '	<td>Unidad de Medida:</td>'
																+ '	<td>'
																+ nomUniMed
																+ '</td>'
																+ '</tr>'
																+

																'<tr>'
																+ '	<td>Frecuencia (Meses):</td>'
																+ '	<td>'
																+ indicadores[k].frecuencia_meses
																+ '</td>'
																+ '</tr>'
																+

																'<tr>'
																+ '	<td>Observaciones:</td>'
																+ '	<td>'
																+ indicadores[k].observaciones
																+ '</td>'
																+ '</tr>'
																+ '</table>'
																+

																'<div class="box-tools pull-right">'
																+
																//   '(Indicador De Resultado)'+
																//   '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+

																'</div>'
																+ '</br>'
																+ '<button type="submit" class="btn btn-danger alertaIndicador" parametros="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'-'+indicadores[k].id+'-borrarIndicador">Borrar Indicador</button>'
																+ ' '
																+ '<button type="submit" class="btn btn-danger modalEditar" parametros="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[i].codigoProyecto+'-'+resultados[j].id+'-'+indicadores[k].id+'-editarIndicador">Editar Indicador</button>'
																+ '</div><!-- /.box-header -->'
																+ '<div class="box-body lista-metas" style="display:block;" id="metas-contenedor-'+indicadores[k].id+'">'
																+

																'</div>'
																+ '</div>';
													}
													contenidoModal += '</div>'
															+ '</div>';
												}

												contenidoModal += '</div>'
														+ '<div class="modal-footer">'
														+

														'</div>' + '</div>'
														+ '</div>' + '</div>';
												//	 $('.content-wrapper').append(contenidoModal);
												var contenidoModal = "";

											}

											event.stopPropagation();
											event.preventDefault();
											return false;
										});

						// Funcion de Borrado de Proyectos
						$("body")
								.on(
										"click",
										".consultaBorrarProyecto",
										function(event) {
											var parametros = $(this).attr(
													"parametros");
											var idParsed = parametros
													.split("-");
											var nivel = idParsed[0];
											var entidad = idParsed[1];
											var tipoPresupuesto = idParsed[2];
											var programa = idParsed[3];
											var subprograma = idParsed[4];
											var proyecto = idParsed[5];

											if ($("#consultaBorrarProyecto").length) {
												$("#consultaBorrarProyecto")
														.remove();
											}

											var proyecto = $
													.ajax({
														url : 'ajaxSelects?accion=getProyectos&nivel='
																+ nivel
																+ '&entidad='
																+ entidad
																+ '&tipoPresupuesto='
																+ tipoPresupuesto
																+ '&programa='
																+ programa
																+ '&subprograma='
																+ subprograma
																+ '&proyecto='
																+ proyecto,
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;
											proyecto = JSON.parse(proyecto);
											proyecto = proyecto.proyectos

											var cuerpoModalProyecto = "";

											cuerpoModalProyecto = '<div class="modal fade" data-backdrop="static" data-keyboard="false" id="consultaBorrarProyecto" tabindex="-1" aria-labelledby="myLargeModalLabel">'
													+ '	<div class="modal-dialog modal-lg" style="width:90%">'
													+ '		<div class="modal-content" >'
													+ '			<div class="modal-header" id="agregarTituloModal">'
													+

													'			</div>'
													+ '		    <div class="modal-body" >'
													+ '				<div  id="cuerpoModalBorrarProyecto">'
													+ '					<h3 class="text-center" id="mensajeBorradoProyecto"></h3>'
													+ '					<h3 class="text-center" id="mensajeRestaurarProyecto"></h3>'
													+ '		   		</div>'
													+

													'		    </div>'
													+ '			<div class="modal-footer" id="agregarBotonBorradoProyecto">'
													+

													'			</div>'
													+ '			<div class="modal-footer" id="agregarBotonRestaurarProyecto">'
													+

													'			</div>'
													+ '		</div>'
													+ '	</div>' + '</div>';

											$("body").append(
													cuerpoModalProyecto);

											if (proyecto[0].borrado == true) {
												$("#agregarTituloModal").html(
														"");
												$("#agregarTituloModal")
														.append(
																'<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">RESTAURAR PROYECTO</h4>');
												$("#mensajeRestaurarProyecto")
														.html("");
												$("#mensajeRestaurarProyecto")
														.append(
																'<h3 class="text-center">Ud. está seguro que desea Restaurar : <strong> '
																		+ proyecto[0].nombreProyecto
																		+ '</strong><br><br></h3>');
												$(
														"#agregarBotonRestaurarProyecto")
														.html("");
												$(
														"#agregarBotonRestaurarProyecto")
														.append(
																'<button type="button" class="btn btn-success btn-sm borrarProyecto" id="botonRestaurarProyecto" parametros='+proyecto[0].nivel+'-'+proyecto[0].entidad+'-'+proyecto[0].tipoPrograma+'-'+proyecto[0].codigoPrograma+'-'+proyecto[0].codigoSubprograma+'-'+proyecto[0].codigoProyecto+'-'+proyecto[0].codigoUnidadResponsable+'-'+proyecto[0].codigoFuncional+'-r>Restaurar Proyecto</button>');
											} else {
												$("#agregarTituloModal").html(
														"");
												$("#agregarTituloModal")
														.append(
																'<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">BORRAR PROYECTO</h4>');
												$("#mensajeBorradoProyecto")
														.html("");
												$("#mensajeBorradoProyecto")
														.append(
																'<h3 class="text-center">Ud. está seguro que desea BORRAR : <strong> '
																		+ proyecto[0].nombreProyecto
																		+ '</strong><br><br></h3');
												$(
														"#agregarBotonBorradoProyecto")
														.html("");
												$(
														"#agregarBotonBorradoProyecto")
														.append(
																'<button type="button" class="btn btn-danger btn-sm borrarProyecto" id="botonBorradoProyecto" parametros='+proyecto[0].nivel+'-'+proyecto[0].entidad+'-'+proyecto[0].tipoPrograma+'-'+proyecto[0].codigoPrograma+'-'+proyecto[0].codigoSubprograma+'-'+proyecto[0].codigoProyecto+'-'+proyecto[0].codigoUnidadResponsable+'-'+proyecto[0].codigoFuncional+'-b>Borrar Proyecto</button>');
											}

											$("#consultaBorrarProyecto").modal(
													'show');

										});
						$("body")
								.on(
										"click",
										".borrarProyecto",
										function(event) {
											var parametros = $(this).attr(
													"parametros");
											var idParsed = parametros
													.split("-");
											var nivel = idParsed[0];
											var entidad = idParsed[1];
											var tipoPresupuesto = idParsed[2];
											var programa = idParsed[3];
											var subprograma = idParsed[4];
											var proyecto = idParsed[5];
											var unidadResponsable = idParsed[6];
											var funcional = idParsed[7];
											var estado = idParsed[8];

											var proyecto = $
													.ajax({
														url : 'ajaxSelects?accion=getProyectos&nivel='
																+ nivel
																+ '&entidad='
																+ entidad
																+ '&tipoPresupuesto='
																+ tipoPresupuesto
																+ '&programa='
																+ programa
																+ '&subprograma='
																+ subprograma
																+ '&proyecto='
																+ proyecto,
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;
											proyecto = JSON.parse(proyecto);
											proyecto = proyecto.proyectos

											var objeto = new Object();
											objeto.nivel = proyecto[0].nivel;
											objeto.entidad = proyecto[0].entidad;
											objeto.tipoPrograma = proyecto[0].tipoPrograma;
											objeto.codigoPrograma = proyecto[0].codigoPrograma;
											objeto.codigoSubprograma = proyecto[0].codigoSubprograma;
											objeto.codigoProyecto = proyecto[0].codigoProyecto;
											objeto.codigoUnidadResponsable = proyecto[0].codigoUnidadResponsable;
											objeto.codigoFuncional = proyecto[0].codigoFuncional;
											objeto.borrado = proyecto[0].borrado;

											var info = JSON.stringify(objeto);
											$
													.ajax({
														url : "ajaxUpdate?accion=actBorrarProyecto",
														type : 'POST',
														dataType : 'json',
														data : info,
														contentType : 'application/json',
														mimeType : 'application/json',
														success : function(data) {

															if (data.success == true) {
																if (estado == "b") {
																	$(
																			"#botonBorradoProyecto")
																			.remove();
																	$(
																			"#agregarTituloModal")
																			.html(
																					"");
																	$(
																			"#agregarTituloModal")
																			.append(
																					'<button type="button" class="close tituloSubprograma" data-dismiss="modal" id="" subprograma="'+subprograma+'" tipoPrograma="'+proyecto[0].tipoPrograma+'" programa="'+programa+'"><span aria-hidden="true">&times;</span></button>');
																	$(
																			"#mensajeBorradoProyecto")
																			.html(
																					"");
																	$(
																			"#mensajeBorradoProyecto")
																			.html(
																					"<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
																	$(
																			"#agregarBotonBorradoProyecto")
																			.append(
																					'<button type="button" class="btn btn-warning tituloSubprograma" data-dismiss="modal" id="" subprograma="'+subprograma+'" tipoPrograma="'+proyecto[0].tipoPrograma+'" programa="'+programa+'">Cerrar</button>');
																} else {
																	$(
																			"#botonRestaurarProyecto")
																			.remove();
																	$(
																			"#agregarTituloModal")
																			.html(
																					"");
																	$(
																			"#agregarTituloModal")
																			.append(
																					'<button type="button" class="close tituloSubprograma" data-dismiss="modal" id="" subprograma="'+subprograma+'" tipoPrograma="'+proyecto[0].tipoPrograma+'" programa="'+programa+'"><span aria-hidden="true">&times;</span></button>');
																	$(
																			"#mensajeRestaurarProyecto")
																			.html(
																					"");
																	$(
																			"#mensajeRestaurarProyecto")
																			.html(
																					"<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
																	$(
																			"#agregarBotonRestaurarProyecto")
																			.append(
																					'<button type="button" class="btn btn-warning tituloSubprograma" data-dismiss="modal" id="" subprograma="'+subprograma+'" tipoPrograma="'+proyecto[0].tipoPrograma+'" programa="'+programa+'">Cerrar</button>');
																}
															}

														},

														error : function(data,
																status, er) {
															alert("ERROR");
														}
													});

										});
						$("body")
								.on(
										"click",
										".alertaIndicador",
										function(event) {
											var parametros = $(this).attr(
													"parametros");
											var idParsed = parametros
													.split("-");
											var nivel = idParsed[0];
											var entidad = idParsed[1];
											var tipoPrograma = idParsed[2];
											var programa = idParsed[3];
											var subPrograma = idParsed[4];
											var proyecto = idParsed[5];
											var indicadorId = idParsed[6];
											var estado = idParsed[7];
											var alertaBorrarIndicador = "";
											var nombreIndicador;
											$('.content-wrapper').find(
													'#myModal6').remove();

											var indicadores = $
													.ajax({
														url : '/ajaxSelects?accion=getIndicadores',
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;

											indicadores = JSON
													.parse(indicadores);
											indicadores = indicadores.indicadores;

											for (var s = 0; s < indicadores.length; s++) {
												if (indicadores[s].id == indicadorId) {
													nombreIndicador = indicadores[s].nombre;
												}
											}

											alertaBorrarIndicador = "";
											alertaBorrarIndicador = '<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
													+ '<div class="modal-dialog box box-danger modal-lg">'
													+ '<div class="modal-content">'
													+ '<div class="modal-header">'
													+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
													+ '<h3 class="modal-title">'
													+ nombreIndicador
													+ '</h3>'
													+ '</div>'
													+ '<div class="modal-body">'
													+ '<div class="alert alert-warning alert-dismissable">'
													+ '<strong>¡Cuidado!</strong> Esta seguro que desea BORRAR este indicador!!'
													+ '</br></br>'
													+ '<button type="submit" class="btn btn-danger borrarIndicador" parametros="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+indicadorId+'">Borrar Indicador</button>'
													+ '</div>'
													+

													'</div>'
													+ '<div class="modal-footer">'
													+

													'</div>'
													+ '</div>'
													+ '</div>' + '</div>';

											$('.content-wrapper').append(
													alertaBorrarIndicador);
											$(
													"#resultado_esperado-"
															+ nivel + '-'
															+ entidad + '-'
															+ tipoPrograma
															+ '-' + programa
															+ '-' + subPrograma
															+ '-' + proyecto)
													.modal('hide');
											$("#myModal6").modal('show');

										});
						var objetoIndicador = new Object();

						$("body")
								.on(
										"click",
										".modalEditar",
										function(event) {
											var parametros = $(this).attr(
													"parametros");
											var idParsed = parametros
													.split("-");
											var nivel = idParsed[0];
											var entidad = idParsed[1];
											var tipoPrograma = idParsed[2];
											var programa = idParsed[3];
											var subPrograma = idParsed[4];
											var proyecto = idParsed[5];
											var resultadoId = idParsed[6];
											var indicadorId = idParsed[7];
											var estado = idParsed[8];
											var cajaModalEditar = "";
											var optionUnidadesMedida = "";
											var fechaVencimiento;
											var anho;

											$('.content-wrapper').find(
													'#myModal7').remove();

											var unidadesMedida = $
													.ajax({
														url : '/ajaxSelects?accion=getUnidadesMedida',
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;
											unidadesMedida = JSON
													.parse(unidadesMedida);
											unidadesMedida = unidadesMedida.unidadesMedida;

											var indicadores = $
													.ajax({
														url : '/ajaxSelects?accion=getIndicadoresPnd&objetivo='
																+ resultadoId,
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;
											indicadores = JSON
													.parse(indicadores);
											indicadores = indicadores.indicadores;

											var metas = $
													.ajax({
														url : '/ajaxSelects?accion=getMetasPnd&indicador='
																+ indicadorId,
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;

											metas = JSON.parse(metas);
											metas = metas.metas;

											for (var i = 0; i < unidadesMedida.length; i++) {
												if (unidadesMedida[i].codigoUnidadMedida == indicadores[0].unidad_medida_id) {
													optionUnidadesMedida += '<option value="'+unidadesMedida[i].codigoUnidadMedida+'" selected>'
															+ unidadesMedida[i].nombre
															+ '</option>';

												}
												optionUnidadesMedida += '<option value="'+unidadesMedida[i].codigoUnidadMedida+'">'
														+ unidadesMedida[i].nombre
														+ '</option>';
											}

											for (var k = 0; k < indicadores.length; k++) {
												for (var i = 0; i < unidadesMedida.length; i++) {
													if (unidadesMedida[i].codigoUnidadMedida == indicadores[k].unidad_medida_id) {
														optionUnidadesMedida += '<option value="'+unidadesMedida[i].codigoUnidadMedida+'" selected>'
																+ unidadesMedida[i].nombre
																+ '</option>';

													}
													optionUnidadesMedida += '<option value="'+unidadesMedida[i].codigoUnidadMedida+'">'
															+ unidadesMedida[i].nombre
															+ '</option>';
												}
												if (indicadores[k].id == indicadorId) {
													cajaModalEditar = '<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
															+ '<div class="modal-dialog box box-danger modal-lg">'
															+ '<div class="modal-content">'
															+ '<div class="modal-header">'
															+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
															+ '<h3 class="modal-title">'
															+ indicadores[k].nombre
															+ ' ('
															+ nivel
															+ '-'
															+ entidad
															+ '-'
															+ tipoPrograma
															+ '-'
															+ programa
															+ '-'
															+ subPrograma
															+ '-'
															+ proyecto
															+ ')</h3>'
															+ '</div>'
															+ '<div class="modal-body">'
															+ '<form role="form" id="editarIndicadores-'+resultadoId+'">'
															+ '<table class="table table-striped table-bordered table-hover">'
															+ '<tr>'
															+ '	<td>Unidad de Medida:</td>'
															+ '	<td><div class="form-group"><select class="form-control" name="unidadMedida">'
															+ optionUnidadesMedida
															+ '</select></div></td>'
															+ '</tr>'
															+ '<tr>'
															+ '	<td>Frecuencia (Meses):</td>'
															+ '	<td><div class="form-group"><input class="form-control" type="text" name="frecuenciaMeses" value="'+indicadores[k].frecuencia_meses+'" /></div></td>'
															+ '</tr>'
															+

															'<tr>'
															+ '	<td>Observaciones:</td>'
															+ '	<td><div class="form-group"><textarea class="form-control" rows="5" cols="40" name="observaciones">'
															+ indicadores[k].observaciones
															+ '</textarea></div></td>'
															+ '</tr>'
															+ '<tr>'
															+ '<td colspan="2">'
															+ '<label>Metas</label>'
															+ '</td>' + '</tr>';

													for (var l = 0; l < metas.length; l++) {
														anho = "";
														fechaVencimiento = metas[l].vencimiento;
														var idParsed = fechaVencimiento
																.split("-");
														anho = idParsed[0];
														objetoIndicador.vencimiento = fechaVencimiento;

														cajaModalEditar += '<tr><td>'
																+ anho
																+ '</td><td><input type= "text" name="'+anho+'" class="form-control" value="'+metas[l].cantidad+'"></td></tr>';
													}

													cajaModalEditar += '<tr>'
															+ '	<td colspan="2"><button type="submit" class="btn btn-success guardarIndicador" parametros="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+indicadorId+'-'+resultadoId+'">Guardar Indicador</button></td>'
															+ '</tr>'
															+ '</table>'
															+

															'</div>'
															+ '<div class="modal-footer">'
															+

															'</div>' + '</div>'
															+ '</div>'
															+ '</div>';

													$('.content-wrapper')
															.append(
																	cajaModalEditar);
													$(
															"#resultado_esperado-"
																	+ nivel
																	+ '-'
																	+ entidad
																	+ '-'
																	+ tipoPrograma
																	+ '-'
																	+ programa
																	+ '-'
																	+ subPrograma
																	+ '-'
																	+ proyecto)
															.modal('hide');
													$("#myModal7")
															.modal('show');
												}

											}

										});

						$("body")
								.on(
										"click",
										".guardarIndicador",
										function(event) {
											var parametros = $(this).attr(
													"parametros");
											var accion = "actEditarIndicadores";
											var idParsed = parametros
													.split("-");
											var nivel = idParsed[0];
											var entidad = idParsed[1];
											var tipoPrograma = idParsed[2];
											var programa = idParsed[3];
											var subPrograma = idParsed[4];
											var proyecto = idParsed[5];
											var indicadorId = idParsed[6];
											var resultadoId = idParsed[7];

											var fromulario = "#editarIndicadores-"
													+ resultadoId;

											var objetoIndicador = new Object();

											//como esta en la clase 
											objetoIndicador.id = indicadorId;
											objetoIndicador.unidadMedidaId = $(
													fromulario)
													.find(
															'select[name="unidadMedida"]')
													.val();
											objetoIndicador.frecuenciaMeses = $(
													fromulario)
													.find(
															'input[name="frecuenciaMeses"]')
													.val();
											objetoIndicador.observaciones = $(
													fromulario)
													.find(
															'textarea[name="observaciones"]')
													.val();
											objetoIndicador.cantidad1 = $(
													fromulario).find(
													'input[name="2014"]').val();
											objetoIndicador.cantidad2 = $(
													fromulario).find(
													'input[name="2015"]').val();
											objetoIndicador.cantidad3 = $(
													fromulario).find(
													'input[name="2016"]').val();
											objetoIndicador.cantidad4 = $(
													fromulario).find(
													'input[name="2017"]').val();
											objetoIndicador.cantidad5 = $(
													fromulario).find(
													'input[name="2018"]').val();

											$("#myModal7").modal('hide');
											//alert(objetoIndicador.unidad_medida_id+'-'+objetoIndicador.frecuencia_meses+'-'+objetoIndicador.observaciones+'-'+objetoIndicador.meta2014+'-'+objetoIndicador.meta2015+'-'+objetoIndicador.meta2016+'-'+objetoIndicador.meta2017+'-'+objetoIndicador.meta2018);

											$
													.ajax({
														url : "ajaxUpdate?accion="
																+ accion,
														type : 'POST',
														dataType : 'json',
														data : JSON
																.stringify(objetoIndicador),
														contentType : 'application/json',
														mimeType : 'application/json',
														success : function(data) {
														},
														//error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
														error : function(data,
																status, er) {
														}
													});

										});

						$("body")
								.on(
										"click",
										".borrarIndicador",
										function(event) {
											var parametros = $(this).attr(
													"parametros");
											var accion = "actBorrarIndicadores";
											var idParsed = parametros
													.split("-");
											var nivel = idParsed[0];
											var entidad = idParsed[1];
											var tipoPrograma = idParsed[2];
											var programa = idParsed[3];
											var subPrograma = idParsed[4];
											var proyecto = idParsed[5];
											var idIndicador = idParsed[6];

											var indicadorObj = new Object();

											//aca como la clase
											indicadorObj.id = idIndicador;

											$
													.ajax({
														url : "ajaxUpdate?accion="
																+ accion,
														type : 'POST',
														dataType : 'json',
														data : JSON
																.stringify(indicadorObj),
														contentType : 'application/json',
														mimeType : 'application/json',
														success : function(data) {
														},
														//error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
														error : function(data,
																status, er) {
														}
													});

											$("#myModal6").modal('hide');
											$(
													"#resultado_esperado-"
															+ nivel + '-'
															+ entidad + '-'
															+ tipoPrograma
															+ '-' + programa
															+ '-' + subPrograma
															+ '-' + proyecto)
													.modal('show');

										});

						$("body")
								.on(
										"click",
										".botonObjetivo",
										function(event) {
											var ruta = $(this).attr("ruta");
											$('#myModal').attr('ruta', ruta);

											$("#lista-pnd").html("");
											var estrategias = $
													.ajax({
														url : '/ajaxSelects?accion=getEstrategias',
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;

											estrategias = JSON
													.parse(estrategias);
											estrategias = estrategias.estrategias;

											var i = 0;
											for (i = 0; i < estrategias.length; i++) {
												$("#lista-pnd")
														.append(
																' <!-- pilares -->'
																		+ '<div class="box box-info">'
																		+ '<div class="box-header with-border">'
																		+ '<h3 class="box-title tituloEstrategiaPnd" id="estrategia-titulo-'+estrategias[i].codigoPilar+'" estrategia="'+estrategias[i].codigoPilar+'">'
																		+ estrategias[i].pilarNombre
																		+ '</h3>'
																		+ '<div class="box-tools pull-right">'
																		+ '(Estrategia PND)'
																		+ '<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'
																		+ '</div>'
																		+ '</div><!-- /.box-header -->'
																		+ '<div class="box-body lista-objetivos" id="estrategia-contenedor-'+estrategias[i].codigoPilar+'" estrategia="'+estrategias[i].codigoPilar+'" style="display:block;" >'
																		+ '</div>'
																		+ '</div>');
											}
										});

						$("body")
								.on(
										"click",
										"#reportePresupuestoGasto",
										function(event) {

											var parametros = $(this).attr(
													"parametros");
											var idParsed = parametros
													.split("-");
											var titulo = idParsed[0];
											var nivel = idParsed[1];
											var entidad = idParsed[2];
											var tipo = idParsed[3];
											var programa = idParsed[4];
											var subPrograma = idParsed[5];
											var proyecto = idParsed[6];
											var sumaTotal = 0;

											var caja;
											caja = "<div class='table-responsive'>"
													+ "<table class='table table-condensed table-fixed display' id='tablaPresupuestoGasto'>";

											var bandera = 0;
											var presupuestoGasto = $
													.ajax({
														url : '/ajaxSelects?accion=getPresupuestoGastoPresi&nivel='
																+ nivel
																+ '&entidad='
																+ entidad
																+ '&tipo='
																+ tipo
																+ '&programa='
																+ programa
																+ '&subprograma='
																+ subPrograma
																+ '&proyecto='
																+ proyecto
																+ '&versionReporte=6&anho=2016',
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;
											presupuestoGasto = JSON
													.parse(presupuestoGasto);

											if (bandera == 0) {
												caja += "<thead><th colspan='4'><h3>Tipo: "
														+ tipo
														+ "</3></th><thead>"
														+ "<thead><th>Departamento</th><th>Objeto</th><th>Fuente</th><th>VerProgramado</th></thead>";

												bandera = 1;
											}

											for (var s = 0; s < presupuestoGasto.length; s++) {
												var objetoGasto = $
														.ajax({
															url : '/ajaxSelects?accion=getObjetosDeGasto&codigoObjeto='
																	+ presupuestoGasto[s].objeto,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;
												objetoGasto = JSON
														.parse(objetoGasto);
												objetoGasto = objetoGasto.objetosDeGasto;

												var departamentos = $
														.ajax({
															url : '/ajaxSelects?accion=getDepartamentos&deptoPais='
																	+ presupuestoGasto[s].departamento,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;
												departamentos = JSON
														.parse(departamentos);
												departamentos = departamentos.departamentos;

												if (presupuestoGasto[s].departamento = departamentos[0].deptoPais) {
													if (presupuestoGasto[s].objeto = objetoGasto[0].codObjetoGasto) {

														caja += "<tr><td>"
																+ presupuestoGasto[s].departamento
																+ "-"
																+ departamentos[0].abrevDepartamento
																+ "</td><td>"
																+ presupuestoGasto[s].objeto
																+ "-"
																+ objetoGasto[0].nombre
																+ "</td><td>"
																+ presupuestoGasto[s].fuente
																+ "</td><td>"
																+ numeroConComa(presupuestoGasto[s].verProgramado)
																+ "</td></tr>";
														sumaTotal += parseInt(presupuestoGasto[s].verProgramado);
													}
												}

											}

											caja += "</table>" + "</div>";

											$('#myModal5').find("#modal-title")
													.html("");
											$('#myModal5').find(".modal-body")
													.html("");
											$('#myModal5').find(
													".sumaTotalReporte").html(
													"");
											$('#myModal5')
													.find("#myModalLabel")
													.html(
															" "
																	+ titulo
																	+ " "
																	+ nivel
																	+ "-"
																	+ entidad
																	+ "-"
																	+ tipo
																	+ "-"
																	+ programa
																	+ "-"
																	+ subPrograma
																	+ "-"
																	+ proyecto);
											$('#myModal5').find(".modal-body")
													.html(caja);
											$('#myModal5')
													.find(".modal-footer")
													.html(
															'<h3>Total: '
																	+ numeroConComa((sumaTotal))
																	+ '</h3>');

											$(function() {

												$('#tablaPresupuestoGasto')
														.dataTable(
																{
																	"bPaginate" : false,
																	"bLengthChange" : false,
																	"bFilter" : true,
																	"bSort" : true,
																	"bInfo" : true,
																	"bAutoWidth" : false,
																	"language" : {
																		"sProcessing" : "Procesando...",
																		"sLengthMenu" : "Mostrar _MENU_ registros",
																		"sZeroRecords" : "No se encontraron resultados",
																		"sEmptyTable" : "Ningún dato disponible en esta tabla",
																		"sInfo" : "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
																		"sInfoEmpty" : "Mostrando registros del 0 al 0 de un total de 0 registros",
																		"sInfoFiltered" : "(filtrado de un total de _MAX_ registros)",
																		"sInfoPostFix" : "",
																		"sSearch" : "Buscar:",
																		"sUrl" : "",
																		"sInfoThousands" : ",",
																		"sLoadingRecords" : "Cargando...",
																		"oPaginate" : {
																			"sFirst" : "Primero",
																			"sLast" : "Último",
																			"sNext" : "Siguiente",
																			"sPrevious" : "Anterior"
																		},
																		"oAria" : {
																			"sSortAscending" : ": Activar para ordenar la columna de manera ascendente",
																			"sSortDescending" : ": Activar para ordenar la columna de manera descendente"
																		}
																	}
																});
											});

										});

						$("body")
								.on(
										"click",
										".btn-warning",
										function(event) {

											var id = $(this).attr("id");
											var idParsed = id.split("-");
											var accion = idParsed[0];
											var elemento = idParsed[1];

											//envio de formulario de Resultado
											if (accion === "guardar"
													&& elemento === "resultado") {
												var resultado = new Object();
												var accion = "insResultado";

												var nivel = idParsed[2];
												var entidad = idParsed[3];
												var tipo = idParsed[4];
												var programa = idParsed[5];
												var subprograma = idParsed[6];
												var proyecto = idParsed[7];

												var fromulario = "#formulario_resultado_esperado-"
														+ nivel
														+ "-"
														+ entidad
														+ "-"
														+ tipo
														+ "-"
														+ programa
														+ "-"
														+ subprograma
														+ "-"
														+ proyecto;
												resultado.nivel = $(fromulario)
														.find(
																'input[name="nivel"]')
														.val();
												resultado.entidad = $(
														fromulario)
														.find(
																'input[name="entidad"]')
														.val();
												resultado.tipo_presupuesto = $(
														fromulario)
														.find(
																'input[name="tipo_presupuesto"]')
														.val();
												resultado.programa = $(
														fromulario)
														.find(
																'input[name="programa"]')
														.val();
												resultado.subprograma = $(
														fromulario)
														.find(
																'input[name="subprograma"]')
														.val();
												resultado.proyecto = $(
														fromulario)
														.find(
																'input[name="proyecto"]')
														.val();
												resultado.funcional = $(
														fromulario)
														.find(
																'input[name="funcional"]')
														.val();
												resultado.tipo_objetivo_id = $(
														fromulario)
														.find(
																'input[name="tipo_objetivo_id"]')
														.val();
												resultado.nombre = $(fromulario)
														.find(
																'textarea[name="nombre"]')
														.val();
												resultado.descripcion = $(
														fromulario)
														.find(
																'input[name="descripcion"]')
														.val();

												var frm = $(fromulario);
												var dat = frm.serializeArray();
												// var dat = JSON.stringify(frm.serializeArray());
												$
														.ajax({
															url : "ajaxInserts?accion="
																	+ accion,
															type : 'POST',
															dataType : 'json',
															data : JSON
																	.stringify(resultado),
															contentType : 'application/json',
															mimeType : 'application/json',
															success : function(
																	data) {
																alert("Resultado Esperado Agregado, recuerde detallar los indicadores para el mismo!");
																$(
																		'#titulo-resultado-esperado-'
																				+ nivel
																				+ '-'
																				+ entidad
																				+ '-'
																				+ tipo
																				+ '-'
																				+ programa
																				+ '-'
																				+ subprograma
																				+ '-'
																				+ proyecto)
																		.parent()
																		.next()
																		.append(
																				'<div class="box box-info">'
																						+ '<div class="box-header with-border">'
																						+ '<h3 class="box-title tituloResultado">'
																						+ resultado.nombre
																						+ '</h3>'
																						+
																						//'<div class="box-tools pull-right">(Resultado Esperado)'+
																						'<div class="box-tools pull-right">'
																						+ '<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'
																						+ '</div>'
																						+ '</div>'
																						+ '<div class="box-body lista-objetivos" id="estrategia-contenedor-2" estrategia="2" style="display:block;">'
																						+ 'Necesita Recargar la Pagina para Agregar indicadores a un resultado creado recientemente.'
																						+ '</div>'
																						+ '</div>');
																$(fromulario)
																		.find(
																				'textarea[name="nombre"]')
																		.html(
																				"");
																event
																		.stopPropagation();
															},
															//error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
															error : function(
																	data,
																	status, er) {
																alert("Resultado Esperado Agregado, recuede detallar los indicadores para el mismo!");
																$(
																		'#titulo-resultado-esperado-'
																				+ nivel
																				+ '-'
																				+ entidad
																				+ '-'
																				+ tipo
																				+ '-'
																				+ programa
																				+ '-'
																				+ subprograma
																				+ '-'
																				+ proyecto)
																		.parent()
																		.next()
																		.append(
																				'<div class="box box-info">'
																						+ '<div class="box-header with-border">'
																						+ '<h3 class="box-title tituloResultado">'
																						+ resultado.nombre
																						+ '</h3>'
																						+
																						//'<div class="box-tools pull-right">(Resultado Esperado)'+
																						'<div class="box-tools pull-right">'
																						+ '<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'
																						+ '</div>'
																						+ '</div>'
																						+ '<div class="box-body lista-objetivos" id="estrategia-contenedor-2" estrategia="2" style="display:block;">'
																						+ 'Necesita Recargar la Pagina para Agregar indicadores a un resultado creado recientemente.'
																						+ '</div>'
																						+ '</div>');
																$(fromulario)
																		.find(
																				'textarea[name="nombre"]')
																		.html(
																				"");
																event
																		.stopPropagation();

															}
														});

											}
											//envio de formulario de indicadores
											if (accion === "guardar"
													&& elemento === "indicador_resultado") {
												var indicadorResultado = new Object();
												var accion = "insIndicadorResultado";
												var resultado = idParsed[2];

												var fromulario = "#formulario_indicador_resultado-"
														+ resultado;
												indicadorResultado.objetivo_id = $(
														fromulario)
														.find(
																'input[name="objetivo_id"]')
														.val();
												indicadorResultado.tipo_indicador_id = $(
														fromulario)
														.find(
																'input[name="tipo_indicador_id"]')
														.val();
												indicadorResultado.metodo_calculo_id = $(
														fromulario)
														.find(
																'input[name="metodo_calculo_id"]')
														.val();
												indicadorResultado.desagregacion_tipo_zona_geografica_id = $(
														fromulario)
														.find(
																'input[name="desagregacion_tipo_zona_geografica_id"]')
														.val();
												indicadorResultado.fuente_verificacion_id = $(
														fromulario)
														.find(
																'input[name="fuente_verificacion_id"]')
														.val();
												indicadorResultado.unidad_medida_id = $(
														fromulario)
														.find(
																'select[name="unidad_medida_id"] option:selected')
														.val();
												indicadorResultado.frecuencia_meses = $(
														fromulario)
														.find(
																'input[name="frecuencia_meses"]')
														.val();
												indicadorResultado.observaciones = $(
														fromulario)
														.find(
																'input[name="observaciones"]')
														.val();
												indicadorResultado.nombre = $(
														fromulario).find(
														'input[name="nombre"]')
														.val();
												indicadorResultado.descripcion = $(
														fromulario)
														.find(
																'input[name="descripcion"]')
														.val();
												indicadorResultado.meta2014 = $(
														fromulario)
														.find(
																'input[name="meta2014"]')
														.val();
												indicadorResultado.meta2015 = $(
														fromulario)
														.find(
																'input[name="meta2015"]')
														.val();
												indicadorResultado.meta2016 = $(
														fromulario)
														.find(
																'input[name="meta2016"]')
														.val();
												indicadorResultado.meta2017 = $(
														fromulario)
														.find(
																'input[name="meta2017"]')
														.val();
												indicadorResultado.meta2018 = $(
														fromulario)
														.find(
																'input[name="meta2018"]')
														.val();
												indicadorResultado.tipo_demografica_id = $(
														fromulario)
														.find(
																'input[name="tipo_demografica_id"]')
														.val();

												var frm = $(fromulario);
												var dat = frm.serializeArray();
												// var dat = JSON.stringify(frm.serializeArray());

												$
														.ajax({
															url : "ajaxInserts?accion="
																	+ accion,
															type : 'POST',
															dataType : 'json',
															data : JSON
																	.stringify(indicadorResultado),
															contentType : 'application/json',
															mimeType : 'application/json',
															success : function(
																	data) {
																alert("Indicador de resultado Agregado");
																$(
																		'#indicadores-contenedor-'
																				+ indicadorResultado.objetivo_id)
																		.append(
																				'<div class="box box-success">'
																						+ '<div class="box-header with-border">'
																						+ '<h3 class="box-title tituloIndicador">'
																						+ indicadorResultado.nombre
																						+ '</h3>'
																						+
																						//'<div class="box-tools pull-right">(Indicador)'+
																						'<div class="box-tools pull-right">'
																						+ '<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'
																						+ '</div>'
																						+ '</div>'
																						+ '<div class="box-body lista-indicador" id="indicador-contenedor-2" estrategia="2" style="display:block;">'
																						+ 'Necesita Recargar la Pagina'
																						+ '</div>'
																						+ '</div>');
																$(fromulario)
																		.find(
																				'textarea[name="nombre"]')
																		.html(
																				"");
																event
																		.stopPropagation();
															},
															//error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
															error : function(
																	data,
																	status, er) {
																alert("Indicador de resultado Agregado");
																$(
																		'#indicadores-contenedor-'
																				+ indicadorResultado.objetivo_id)
																		.append(
																				'<div class="box box-success">'
																						+ '<div class="box-header with-border">'
																						+ '<h3 class="box-title tituloIndicador">'
																						+ indicadorResultado.nombre
																						+ '</h3>'
																						+
																						//'<div class="box-tools pull-right">(Indicador)'+
																						'<div class="box-tools pull-right">'
																						+ '<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'
																						+ '</div>'
																						+ '</div>'
																						+ '<div class="box-body lista-indicador" id="indicador-contenedor-2" estrategia="2" style="display:block;">'
																						+ 'Necesita Recargar la Pagina'
																						+ '</div>'
																						+ '</div>');
																$(fromulario)
																		.find(
																				'textarea[name="nombre"]')
																		.html(
																				"");

															}
														});

											}
											//$("#myModal7").modal('hide');
											event.stopPropagation();
											event.preventDefault();
											return false;

										});

						$("body").on("submit",
								"[id^=formulario_resultado_esperado]",
								function(event) {
									event.stopPropagation();
									event.preventDefault();
									return false;
								});

						$("body")
								.on(
										"click",
										".tituloIndicador",
										function(event) {
											var indicador = $(this).attr(
													"indicador");
											$(
													"div [class=lista-metas][indicador="
															+ indicador + "]")
													.html("");
											var metas = $
													.ajax({
														url : '/ajaxSelects?accion=getMetasPnd&indicador='
																+ indicador,
														type : 'get',
														dataType : 'json',
														async : false
													}).responseText;

											metas = JSON.parse(metas);
											metas = metas.metas;
											var i = 0;
											$("#metas-contenedor-" + indicador)
													.html("");
											var tabla = '<table class="table table-striped table-bordered  table-hover">'
													+ '<tr>'
													+ '<th>fecha</th>'
													+ '<th>cantidad</th>'
													+ '</tr>';

											for (i = 0; i < metas.length; i++) {
												tabla += '<tr>' + '<td>'
														+ metas[i].vencimiento
														+ '</td>' + '<td>'
														+ metas[i].cantidad
														+ '</td>' + '</tr>';
											}
											tabla += '</table>' + '</div>';
											$("#metas-contenedor-" + indicador)
													.append(
															'<div id="chartContainer-'
																	+ indicador
																	+ '" style="height: 300px; width: 100%;">');
											//$("#metas-contenedor-"+indicador).append(tabla);
											dibujarGrafico(metas, indicador);

											event.stopPropagation();
											event.preventDefault();
											return false;

										});

						$("body").on("click",".btn-primary",
										function(event) {
											var id = $(this).attr("id");
											var idParsed = id.split("-");
											var accion = idParsed[0];
											var elemento = idParsed[1];

											var nivel = idParsed[2];
											var entidad = idParsed[3];
											var tipo = idParsed[4];
											var programa = idParsed[5];

											if (accion === "guardar" && elemento === "programa") {
												var accion = "actPrograma";
												var formulario = '#form-programa-' + nivel + '-' + entidad + '-' + tipo	+ '-' + programa;
												var programaObj = new Object();

												//aca como la clase
												programaObj.nivel = nivel;
												programaObj.entidad = entidad;
												programaObj.tipoPrograma = tipo;
												programaObj.codigoPrograma = programa;
												programaObj.nombrePrograma = $(formulario).find('input[name="nombrePrograma"]').val();
												programaObj.abrevPrograma = $(formulario).find('input[name="abrevPrograma"]').val();
												programaObj.diagnostico = $(formulario).find('textarea[name="diagnostico"]').val();
												programaObj.baseLegal = $(formulario).find('textarea[name="baseLegal"]').val();
												programaObj.objetivo = $(formulario).find('textarea[name="objetivo"]').val();
												programaObj.codigoDepartamento = $(formulario).find('select[name="codigoDepartamento"]').val();

												$.ajax({
													url : "ajaxUpdate?accion=" + accion,
													type : 'POST',
													dataType : 'json',
													data : JSON.stringify(programaObj),
													contentType : 'application/json',
													mimeType : 'application/json',
													success : function(
															data) {
														if (data.success == true) {
															var programasAct = 
																$.ajax({ 
																	url : 'ajaxSelects?accion=getProgramas'
																			+ '&nivel='+ nivel
																			+ '&entidad=' + entidad
																			+ '&tipoPresupuesto=' + tipo
																			+ '&programa='+ programa + '',
																	type : 'get',
																	dataType : 'json',
																	async : false
																}).responseText;

															programasAct = JSON.parse(programasAct);
															programasAct = programasAct.programas;
															var fechaUlt = new Date(programasAct[0].fechaActualizacion);

															$("#fechaUltActPrograma-" + nivel + "-" + entidad + "-"
																	+ tipo + "-" + programa).html(
																			"  Ultima Actualización: " + fechaUlt.getDate()
																					+ "/" + (fechaUlt.getMonth() + 1)
																					+ "/" + fechaUlt.getFullYear()	+ " "
																					+ fechaUlt.getHours() + ":"
																					+ fechaUlt.getMinutes()	+ ":"
																					+ fechaUlt.getSeconds());

															$("#diagnostico-programa-" + tipo + "-" + programa)
																	.html(programasAct[0].diagnostico);
															$("#objetivo-programa-"	+ tipo + "-" + programa)
																	.html(programasAct[0].objetivo);
															$("#baseLegal-programa-" + tipo	+ "-" + programa)
																	.html(programasAct[0].baseLegal);
															$("#departamento-programa-" + tipo	+ "-" + programa)
																	.val(programasAct[0].codigoDepartamento);
															modalExito();
															$(".tituloTipoPrograma[tipoprograma="+tipo+"]").click();
														} else {																	
															modalError();
														}
													},															
													error : function(data, status, er) {
														modalError();
													}
												});

												event.preventDefault();
												event.stopPropagation();
												return false;
											}  

											if (accion === "guardar" && elemento === "Subprograma") {
												var accion = "actSubPrograma";
												var subprograma = idParsed[6];

												var formulario = '#form-subprograma-' + nivel + '-'	+ entidad + '-'	+ tipo + '-' + programa + '-' + subprograma;

												var subProgramaObj = new Object();

												//aca como la clase
												subProgramaObj.programa_entidad_nivel_id = nivel;
												subProgramaObj.programa_entidad_id = entidad;
												subProgramaObj.programa_tipo_presupuesto_id = tipo;
												subProgramaObj.programa_id = programa;
												subProgramaObj.id = subprograma;
												subProgramaObj.nombre = $(formulario).find('input[name="nombreSubprograma"]').val();
												subProgramaObj.abrev = $(formulario).find('input[name="abrevSubprograma"]').val();
												subProgramaObj.descripcion = $(formulario).find('textarea[name="descripcionSubprograma"]').val();
												subProgramaObj.objetivo = $(formulario).find('textarea[name="objetivo"]').val();
												subProgramaObj.codigo_departamento = $(formulario).find('select[name="codigoDepartamento"]').val();
												subProgramaObj.baseLegal = $(formulario).find('textarea[name="baseLegal"]').val();
												
												$.ajax({
													url : "ajaxUpdate?accion=" + accion,
													type : 'POST',
													dataType : 'json',
													data : JSON.stringify(subProgramaObj),
													contentType : 'application/json',
													mimeType : 'application/json',
													success : function(data) {
														if (data.success == true) {
															var subprogramasAct = 
																$.ajax({
																	url : '/ajaxSelects?accion=getSubprogramas&nivel=' + nivel
																		+ '&entidad=' + entidad	+ '&tipoPresupuesto=' + tipo
																		+ '&programa='+ programa,
																	type : 'get',
																	dataType : 'json',
																	async : false
																}).responseText;

															subprogramasAct = JSON.parse(subprogramasAct);
															subprogramasAct = subprogramasAct.subprogramas;

															$("#diagnostico-subprograma-" + tipo + "-"	+ programa	+ "-" + subprograma)
																	.html(subprogramasAct[0].descripcion);
															$("#objetivo-subprograma-" + tipo + "-"	+ programa + "-" + subprograma)
																	.html(subprogramasAct[0].objetivo);
															$("#baseLegal-subprograma-"	+ tipo	+ "-" + programa + "-"	+ subprograma)
																	.html(subprogramasAct[0].baseLegal);
															$("#departamento-subprogramajaja-"	+ tipo	+ "-" + programa + "-"	+ subprograma)
																	.val(subprogramasAct[0].codigo_departamento);
															modalExito();
															$(".tituloPrograma[tipoprograma="+tipo+"][programa="+programa+"]").click();
														} else {
															modalError();
														}
													},
													//error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
													error : function(
															data,
															status, er) {
														modalError();
													}
												});

												event.preventDefault();
												event.stopPropagation();
												return false;
											}

											if (accion === "guardar"
													&& elemento === "proyecto") {
												var accion = "actProyecto";
												var subprograma = idParsed[6];
												var proyectos = idParsed[7];
												var formulario = '#formulario-proyecto-'
														+ nivel
														+ '-'
														+ entidad
														+ '-'
														+ tipo
														+ '-'
														+ programa
														+ '-'
														+ subprograma
														+ '-'
														+ proyectos;

												var proyecto = new Object();

												//aca como la clase
												proyecto.nivel = nivel;
												proyecto.entidad = entidad;
												proyecto.tipoPrograma = tipo;
												proyecto.codigoPrograma = programa;
												proyecto.codigoSubprograma = subprograma;
												proyecto.codigoProyecto = proyectos;
												proyecto.abrevProyecto = $(
														formulario)
														.find(
																'input[name="abrevProyecto"]')
														.val();
												proyecto.nombreProyecto = $(
														formulario)
														.find(
																'input[name="nombreProyecto"]')
														.val();
												proyecto.diagnostico = $(
														formulario)
														.find(
																'textarea[name="diagnostico"]')
														.val();
												proyecto.descripcionProyecto = $(
														formulario)
														.find(
																'textarea[name="descripcionProyecto"]')
														.val();
												proyecto.codigoUnidadResponsable = $(
														formulario)
														.find(
																'select[name="codigoUnidadResponsable"]')
														.val();
												proyecto.codigoFuncional = $(
														formulario)
														.find(
																'select[name="codigoFuncional"]')
														.val();
												proyecto.codigoDepartamento = $(
														formulario)
														.find(
																'select[name="codigoDepartamento"]')
														.val();
												proyecto.codigoSnip = $(
														formulario)
														.find(
																'select[name="codigoSnip"]')
														.val();
												proyecto.objetivo_estrategico_id = $(
														formulario)
														.find(
																'select[name="estrategia_pnd"]')
														.val();

												var it;
												var nombre = document.forms;

												$
														.ajax({
															url : "ajaxUpdate?accion="
																	+ accion,
															type : 'POST',
															dataType : 'json',
															data : JSON
																	.stringify(proyecto),
															contentType : 'application/json',
															mimeType : 'application/json',
															success : function(
																	data) {
																if (data.success == true) {
																	modalExito();
																} else {
																	modalError();
																}
															},
															error : function(
																	data,
																	status, er) {
																modalError();
															}
														});

												event.preventDefault();
												event.stopPropagation();
												return false;
											}

										});

						$("body").on("submit", "#formulario-crear-producto",
								function(event) {
									event.stopPropagation();
									event.preventDefault();
									return false;
								});

						$("body").on("submit", ".btn-default", function(event) {

							event.stopPropagation();
							event.preventDefault();
							return false;
						});

						$("body")
								.on(
										"click",
										".fa-times",
										function(event) {
											var idParsed = $(this).parent()
													.parent().parent().next()
													.attr("id").split("-")
											var id = idParsed[2];
											var elemento = idParsed[1];
											var contenido = idParsed[0];

											if (contenido === "indicadores"
													&& elemento === "contenedor") {
												if (confirm("Esta seguro que desea elimiar?") == true) {
													var resultadoBorrado = $
															.ajax({
																url : '/ajaxDelete?accion=delResultado&objetivoId='
																		+ id,
																type : 'get',
																dataType : 'json',
																async : false
															}).responseText;
													$(this).parent().parent()
															.parent().parent()
															.remove();
												}
											}
											event.stopPropagation();
											event.preventDefault();
											return false;

										});

						$("body").on("submit", ".btn-primary", function(event) {
							event.stopPropagation();
							event.preventDefault();
							return false;
						});
						$("body")
								.on(
										"click",
										".btn-default",
										function(event) {
											var tipoPrograma = $(this).attr(
													"tipoPrograma");
											var queBotonPresiono = $(this)
													.attr("data-target");
											var codigoPrograma = $(this).attr(
													"codigoPrograma");
											var editarProgramaModal = "";
											if (queBotonPresiono == "#myModal1") {// Editar programa

												var programas = $
														.ajax({
															url : '/ajaxSelects?accion=getProgramas&nivel='
																	+ nivel
																	+ '&entidad='
																	+ entidad
																	+ '&tipoPresupuesto='
																	+ tipoPrograma
																	+ '&programa='
																	+ codigoPrograma,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;

												programas = JSON
														.parse(programas);
												programas = programas.programas;

												var fechaUlt = new Date(
														programas[0].fechaActualizacion);

												editarProgramaModal = '<ul  class="col-md-12">'
														+ '<form class="form-horizontal" id="form-programa-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+codigoPrograma+'">'
														+

														' <input type="hidden" class="form-control" value="2017" name="anio" disable="" />'
														+ ' <input type="hidden" class="form-control" value="'+nivel+'" name="nivel" disable="" />'
														+ ' <input type="hidden" class="form-control" value="'+entidad+'" name="entidad" disable="" />'
														+ ' <input type="hidden" class="form-control" value="'+tipoPrograma+'" name="tipoPrograma" />'
														+ ' <input type="hidden" class="form-control" name="resultado" value="'+programas[0].resultado+'">'
														+

														'<div class="form-group">'
														+ '<label>Nombre</label>'
														+ '<input type="text" class="form-control" value="'+programas[0].nombrePrograma+'" name="nombrePrograma" >'
														+ ' </div>'
														+

														'<div class="form-group">'
														+ '<label>Abreviación</label>'
														+ '<input type="text" class="form-control" name="abrevPrograma" value="'+programas[0].abrevPrograma+'">'
														+ '</div>'
														+

														' <div class="form-group">'
														+ ' <label>Objetivo</label>'
														+ ' <textarea class="form-control" rows="5" name="objetivo" >'
														+ programas[0].objetivo
														+ '</textarea>'
														+ ' </div>'
														+

														'<div class="form-group">'
														+ ' <label>Diagnostico</label>'
														+ ' <textarea class="form-control" rows="5" name="diagnostico" >'
														+ programas[0].diagnostico
														+ '</textarea>'
														+ '</div>'
														+

														' <div class="form-group">'
														+ ' <label>Base Legal</label>'
														+ ' <textarea class="form-control" rows="3" name="baseLegal" >'
														+ programas[0].baseLegal
														+ '</textarea>'
														+ ' </div>'
														+

														' <div class="form-group">'
														+ ' <label>Departamento</label>'
														+ ' <select name="codigoDepartamento" id="departamento-programa-'+programas[0].codigoPrograma+'" >'
														+ optionDepartamentos
														+ '</select>'
														+ ' </div>'
														+

														'<div class="box-footer">'
														+ '<button type="submit" style="margin-right:50px" data-dismiss="modal" class="btn btn-primary" id="guardar-programa-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+codigoPrograma+'">Guardar</button><small id="fechaUltActPrograma-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+codigoPrograma+'"></small>'
														+ ' </div>' +

														'</form>' + '</ul>';

												$('#myModal1').find(
														".modal-body").html("");
												$('#myModal1').find(
														".modal-body").html(
														editarProgramaModal);
												$(
														'#departamento-programa-'
																+ programas[0].codigoPrograma
																+ ' option[value="'
																+ programas[0].codigoDepartamento
																+ '"]').attr(
														"selected", "selected");
												$(
														'#fechaUltActPrograma-'
																+ nivel
																+ '-'
																+ entidad
																+ '-'
																+ tipoPrograma
																+ '-'
																+ codigoPrograma)
														.html(
																" Ultima Actualización: "
																		+ fechaUlt
																				.getDate()
																		+ "/"
																		+ (fechaUlt
																				.getMonth() + 1)
																		+ "/"
																		+ fechaUlt
																				.getFullYear()
																		+ " "
																		+ fechaUlt
																				.getHours()
																		+ ":"
																		+ fechaUlt
																				.getMinutes()
																		+ ":"
																		+ fechaUlt
																				.getSeconds());

											}

											if (queBotonPresiono == "#myModal2") {//HALLAR EL ID DE MAYOR VALOR PARA AGREGAR SIGUIENTE agregar subprogramas

												var subprogramas = $
														.ajax({
															url : '/ajaxSelects?accion=getSubprogramas&nivel='
																	+ nivel
																	+ '&entidad='
																	+ entidad
																	+ '&tipoPresupuesto='
																	+ tipoPrograma
																	+ '&programa='
																	+ codigoPrograma,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;

												subprogramas = JSON
														.parse(subprogramas);
												subprogramas = subprogramas.subprogramas;

												var mayorsubprograma = subprogramas[0].id;
												for (var i = 0; i < subprogramas.length; i++) {
													if (mayorsubprograma < subprogramas[i].id) {
														mayorsubprograma = subprogramas[i].id;
													}

												}

												mayorsubprograma = mayorsubprograma + 1;

												agregarSubProgramaModal = '<ul  class="col-md-12">'
														+ '<form class="form-horizontal" role="form" id="formulario">'
														+

														'<input type="hidden" class="form-control" value= "'+mayorsubprograma+'" name="codigoSubPrograma" disable="" />'
														+ '<input type="hidden" class="form-control" value="'+nivel+'" name="nivel" disable="" />'
														+ '<input type="hidden" class="form-control" value="'+entidad+'" name="entidad" disable="" />'
														+ '<input type="hidden" class="form-control" value="'+tipoPrograma+'" name="tipoPrograma" />'
														+ '<input type="hidden" class="form-control" value="'+codigoPrograma+'" name="codigoPrograma" />'
														+

														'<div class="form-group">'
														+ '<label>Año</label>'
														+ '<input  class="form-control" value="2017" name="anio" disable="" />'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Nombre</label>'
														+ '<input type="text" class="form-control" placeholder=""  name="nombrePrograma" >'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Descripcion</label>'
														+ '<textarea class="form-control" rows="3" placeholder="" name="descripcionPrograma" ></textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Abreviación</label>'
														+ '<input type="text" class="form-control" placeholder="" name="abrevPrograma" ></textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Departamento</label>'
														+ '<textarea class="form-control" rows="3" placeholder="" name="codigoDepartamento" ></textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Objetivo</label>'
														+ '<input type="text" class="form-control" placeholder="" name="objetivo" ></textarea>'
														+ '</div>'
														+

														'<div class="box-footer">'
														+ '<button type="submit" class="btn btn-primary" id="insertar-subprograma">Guardar</button>'
														+ '</div>' +

														'</form>' + '</ul>';

												$('#myModal2').find(
														".modal-body").html("");
												$('#myModal2')
														.find(".modal-body")
														.html(
																agregarSubProgramaModal);
											}

											if (queBotonPresiono == "#myModal3") {//Editar subprogramas
												var codigoSubPrograma = $(this)
														.attr(
																"codigoSubPrograma");
												var subprogramas = $
														.ajax({
															url : '/ajaxSelects?accion=getSubprogramas&nivel='
																	+ nivel
																	+ '&entidad='
																	+ entidad
																	+ '&tipoPresupuesto='
																	+ tipoPrograma
																	+ '&programa='
																	+ codigoPrograma
																	+ '&subprograma='
																	+ codigoSubPrograma,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;

												subprogramas = JSON
														.parse(subprogramas);
												subprogramas = subprogramas.subprogramas;

												editarSubProgramaModal = '<ul  class="col-md-12">'
														+

														'<form class="form-horizontal" id="form-subprograma-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+codigoPrograma+'-'+codigoSubPrograma+'">'
														+

														'<input type="hidden" class="form-control" value="'+nivel+'" name="nivel" disable="" />'
														+ '<input type="hidden" class="form-control" value="'+entidad+'" name="entidad" disable="" />'
														+ '<input type="hidden" class="form-control" value="'+tipoPrograma+'" name="tipoPrograma" />'
														+ '<input type="hidden" class="form-control" value="'+codigoPrograma+'" name="codigoPrograma" />'
														+

														'<div class="form-group">'
														+ '<label>Nombre</label>'
														+ '<input type="text" class="form-control" value="'+subprogramas[0].nombre+'"  name="nombreSubprograma" >'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Abreviación</label>'
														+ '<input type="text" class="form-control" value="'+subprogramas[0].abrev+'" name="abrevSubprograma" ></textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Diagnóstico</label>'
														+ '<textarea class="form-control" rows="3" name="descripcionSubprograma" >'
														+ subprogramas[0].descripcion
														+ '</textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Objetivo</label>'
														+ '<textarea class="form-control" rows="3" name="objetivo" >'
														+ subprogramas[0].objetivo
														+ '</textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Base Legal</label>'
														+ '<textarea class="form-control" rows="3" name="baseLegal" >'
														+ subprogramas[0].baseLegal
														+ '</textarea>'
														+ '</div>'
														+

														'<div class="form-group">'
														+ '<label>Departamento</label>'
														+ ' <select name="codigoDepartamento" id="departamento-subPrograma-'+codigoPrograma+'-'+codigoSubPrograma+'" >'
														+ optionDepartamentos
														+ '</select>'
														+ '</div>'
														+

														'<div class="box-footer">'
														+

														'<button type="submit" style="margin-right:50px" class="btn btn-primary" data-dismiss="modal" id="guardar-Subprograma-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+codigoPrograma+'-'+codigoSubPrograma+'">Guardar</button><small id="fechaUltActSubprograma"></small>'
														+

														'</div>' +

														'</form>' + '</ul>';

												$('#myModal3').find(
														".modal-body").html("");
												$('#myModal3').find(
														".modal-body").html(
														editarSubProgramaModal);
												$("#fechaUltActSubprograma")
														.html(
																"Fecha Ultima Actualización: "
																		+ subprogramas[0].fechaActualizacion);
												$(
														'#departamento-subPrograma-'
																+ codigoPrograma
																+ '-'
																+ codigoSubPrograma
																+ ' option[value="'
																+ subprogramas[0].codigo_departamento
																+ '"]').attr(
														"selected", "selected");

											}
											if (queBotonPresiono == "#myModal4") { //agregrar proyecto 
												snipAutorizado = "";
												var snipAutorizado = $
														.ajax({
															url : '/ajaxSelects?accion=getSnipAutorizado&nivel='
																	+ nivel
																	+ '&entidad='
																	+ entidad,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;
												snipAutorizado = JSON
														.parse(snipAutorizado);
												snipAutorizado = snipAutorizado.snipAutorizado;

												for (var i = 0; i < snipAutorizado.length; i++) {
													for (var aux = 0; aux < snip.length; aux++) {
														if (snip[aux].codigoSnip == snipAutorizado[i].codigoSnip) {
															optionSnipAutorizado += '<option value="'+snipAutorizado[i].codigoSnip+'">'
																	+ snipAutorizado[i].codigoSnip
																	+ ') '
																	+ snip[aux].nombreProyecto
																	+ '</option>';
														}
													}

												}

												var codigoSubPrograma = $(this)
														.attr(
																"codigoSubPrograma");
												var proyectos = $
														.ajax({
															url : '/ajaxSelects?accion=getProyectos&nivel='
																	+ nivel
																	+ '&entidad='
																	+ entidad
																	+ '&tipoPresupuesto='
																	+ tipoPrograma
																	+ '&programa='
																	+ codigoPrograma
																	+ '&subprograma='
																	+ codigoSubPrograma,
															type : 'get',
															dataType : 'json',
															async : false
														}).responseText;

												proyectos = JSON
														.parse(proyectos);
												proyectos = proyectos.proyectos;

												var mayor = proyectos[0].codigoProyecto;
												for (var i = 0; i < proyectos.length; i++) {
													if (mayor < proyectos[i].codigoProyecto) {
														mayor = proyectos[i].codigoProyecto;
													}
												}
												mayor = mayor + 1;
												agregarProyectoModal = '<ul  class="col-md-12">'
														+ '<form class="form-horizontal" role="form" id="formulario">'
														+ '<input type="hidden" class="form-control" value="'+mayor+'" nombre="codigoProyecto" />'
														+ '<input type="hidden" class="form-control" value="2017" nombre="anho" />'
														+ '<input type="hidden" class="form-control" value="'+nivel+'" nombre="nivel_id"  />'
														+ '<input type="hidden" class="form-control" value="'+entidad+'" nombre="entidad_id" />'
														+ '<input type="hidden" class="form-control" value="'+tipoPrograma+'" nombre="tipoPresupuesto" />'
														+ '<input type="hidden" class="form-control" value="'+codigoPrograma+'" nombre="programa_id" />'
														+ '<input type="hidden" class="form-control" value="'+codigoSubPrograma+'" nombre="subprograma_id" />'
														+ '<div class="form-group">'
														+ '<label>Nombre</label>'
														+ '<input type="text" class="form-control" value="" nombre="nombre" />'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Descripcion</label>'
														+ '<textarea class="form-control" rows="3" placeholder="" nombre="descripcion"></textarea>'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Abreviacion</label>'
														+ '<input type="text" class="form-control" placeholder="" nombre="abrev"></textarea>'
														+ '</div> '
														+ '<div class="form-group">'
														+ '<label>Unidad Responsable</label>'
														+ '<select class="form-control" rows="3" placeholder="" nombre="unidad_responsable_id" >'
														+ optionUnidadResponsable
														+ '</select>'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Funcional</label>'
														+ '<select class="form-control" rows="3" placeholder="" nombre="funcional_id" >'
														+ optionFuncionales
														+ '</select>'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Diagnostico</label>'
														+ '<textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Resultado Esperado</label>'
														+ '<textarea class="form-control" rows="3" placeholder="" nombre="resultado_esperado"></textarea>'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Departamento</label>'
														+ '<select class="form-control" rows="3" placeholder="" nombre="codigoDepartamento" >'
														+ optionDepartamentos
														+ '</select>'
														+ '</div>'
														+ '<div class="form-group">'
														+ '<label>Código Snip</label>'
														+ '<select class="form-control" rows="3" placeholder="" nombre="codigoSnip" >'
														+ '<option value="0">No Aplica</option>'
														+ optionSnipAutorizado
														+ '</select>'
														+ '</div>'
														+

														'<div class="box-footer">'
														+ '<button type="submit" class="btn btn-primary" id="insertar-proyecto">Guardar</button>'
														+ '</div>' +

														'</form>' + '</ul>';

												$('#myModal4').find(
														".modal-body").html("");
												$('#myModal4').find(
														".modal-body").html(
														agregarProyectoModal);
											}
										});
						event.stopPropagation();
					});
</script>