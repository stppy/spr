
function compareMes(a,b) {  
	if (a.mes < b.mes) return -1;
	if (a.mes > b.mes) return 1;
	return 0;
}

function compareDepartamento(a,b) {  
	if (a.departamento < b.departamento) return -1;
	if (a.departamento > b.departamento) return 1;
	return 0;
}

function numeroConComa(x) {
    //return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return x.toString().replace(".00","").replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function cabeceraReporte(){
	//var cabecera ='<div style="page-break-before:auto"></div>'+
	var cabecera =
	'<div class="row">'+
	'	<div class="col-xs-3" style="padding-top:19px">'+
	'		<img src="http://webmail.stp.gov.py/intranet/prueba/logo_izquierda.png" />'+
	'	</div>'+
	'	<div class="col-xs-6">'+
	' 		<p align ="center" style="line-height: 10px;">'+
	'			<sup>'+
	'     			<br><br>PRESIDENCIA DE LA REPÚBLICA<br>'+
	' 		   		STP -POI<br>'+
	'   			2018 – 2020<br>'+
	' 			</sup>'+
	'		</p>'+	
	'   </div>'+
	' 	<div class="col-xs-3">'+
	'		<img src="http://webmail.stp.gov.py/intranet/prueba/logo_derecha.png" />'+
	'	</div><!-- /.col -->'+
	'</div><!-- /.row -->'+
	'<strong><hr>';
	$("#reporteCuerpo").append(cabecera);
}

var estrategiasPnd = $.ajax({
	url:'ajaxSelects?accion=getEstrategias',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
estrategiasPnd = JSON.parse(estrategiasPnd);
estrategiasPnd = estrategiasPnd.estrategias;

var todosLosObjetivos = $.ajax({
	url:'ajaxSelects?accion=getObjetivos&borrado=false',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
todosLosObjetivos = JSON.parse(todosLosObjetivos);
todosLosObjetivos = todosLosObjetivos.objetivos;

var todosLosOHO = $.ajax({
	url:'ajaxSelects?accion=getObjetivoHasObjetivo&borrado=false',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
todosLosOHO=JSON.parse(todosLosOHO);
todosLosOHO=todosLosOHO.objetivos;

var webServicesMetas = $.ajax({
	url:'ajaxSelects?accion=getMetas&borrado=false',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
webServicesMetas = JSON.parse(webServicesMetas);

var  tiposDestinatarios= $.ajax({
	url:'ajaxSelects?accion=getTiposDestinatarios',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
tiposDestinatarios = JSON.parse(tiposDestinatarios);
tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;

var grupoDestinatario = $.ajax({
	url:'ajaxSelects?accion=getDestinatarios',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
grupoDestinatario = JSON.parse(grupoDestinatario);
grupoDestinatario = grupoDestinatario.destinatarios;		

var productos = $.ajax({
	url:'ajaxSelects?accion=getProductos',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
productos = JSON.parse(productos);
productos = productos.productos;

var unidadesMedida = $.ajax({
	url:'ajaxSelects?accion=getUnidadesMedida',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
unidadesMedida = JSON.parse(unidadesMedida);
unidadesMedida = unidadesMedida.unidadesMedida;

var funcionales = $.ajax({
	url:'ajaxSelects?accion=getFuncionales&anio=2017',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
funcionales = JSON.parse(funcionales);
funcionales = funcionales.funcionales;

var tiposPrograma = $.ajax({
	url:'ajaxSelects?accion=getTiposPrograma',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;

tiposPrograma = JSON.parse(tiposPrograma);
tiposPrograma = tiposPrograma.tiposPrograma;
var nivel=usuarios[0].nivel_id;
var entidad=usuarios[0].entidad_id;


var metaProductoPorNivelEntidad = $.ajax({
    url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+nivel+'&entidad='+entidad,
    type:'get',
    dataType:'json',
    async:false       
}).responseText;
metaProductoPorNivelEntidad = JSON.parse(metaProductoPorNivelEntidad);
metaProductoPorNivelEntidad=metaProductoPorNivelEntidad.productoPresupuestoMeta;

var sumaNivelEntidadPorMes = $.ajax({
	url:'ajaxSelects?accion=getSumaMes&nivel='+nivel+'&entidad='+entidad+'&anio=2017',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
sumaNivelEntidadPorMes = JSON.parse(sumaNivelEntidadPorMes);
sumaNivelEntidadPorMes = sumaNivelEntidadPorMes.sumaMes;
sumaNivelEntidadPorMes=sumaNivelEntidadPorMes.sort(compareMes);

var sumaNivelEntidadPorDepto = $.ajax({
	url:'ajaxSelects?accion=getSumaDepto&nivel='+nivel+'&entidad='+entidad+'&anio=2017',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
sumaNivelEntidadPorDepto = JSON.parse(sumaNivelEntidadPorDepto);
sumaNivelEntidadPorDepto = sumaNivelEntidadPorDepto.sumaDeptoN;
sumaNivelEntidadPorDepto=sumaNivelEntidadPorDepto.sort(compareDepartamento);

var sumaNivelEntidadPorDeptoN = $.ajax({
	url:'ajaxSelects?accion=getSumaDepto&nivel='+nivel+'&entidad='+entidad+'&anio=2017',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
sumaNivelEntidadPorDeptoN = JSON.parse(sumaNivelEntidadPorDeptoN);
sumaNivelEntidadPorDeptoN = sumaNivelEntidadPorDeptoN.sumaDeptoN;
sumaNivelEntidadPorDeptoN=sumaNivelEntidadPorDeptoN.sort(compareDepartamento);

var snip = $.ajax({
	url:'ajaxSelects?accion=getSnip&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
snip = JSON.parse(snip);
snip = snip.snip;

var unidadesResponsables = $.ajax({
	url:'ajaxSelects?accion=getUnidadesResponsables&anio=2017&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
unidadesResponsables = JSON.parse(unidadesResponsables);
unidadesResponsables = unidadesResponsables.unidadesResponsables;

var departamentos = $.ajax({
	url:'ajaxSelects?accion=getDepartamentos',
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
departamentos = JSON.parse(departamentos);
departamentos = departamentos.departamentos;
var optionDepartamentos='';
for(var i = 0;i<departamentos.length; i++){
	optionDepartamentos+='<option value="'+departamentos[i].deptoPais+'">'+departamentos[i].abrevDepartamento+'</option>';
}

var datosNiveles = $.ajax({
	url:'ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
datosNiveles = JSON.parse(datosNiveles);
datosNiveles=datosNiveles.niveles;

var datosEntidad = $.ajax({
	url:'ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
datosEntidad = JSON.parse(datosEntidad);
datosEntidad=datosEntidad.entidades;

var datosInstitucion = $.ajax({
	url:'ajaxSelects?accion=getInstitucion&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&unidadResponsable='+usuarios[0].unidadResponsable,
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
datosInstitucion = JSON.parse(datosInstitucion);
datosInstitucion=datosInstitucion.instituciones;

var usuarios_nivel=usuarios[0].nivel_id;
var usuarios_entidad=usuarios[0].entidad_id;
var usuarios_unidadResponsable=usuarios[0].unidadResponsable;

var datosUnidadJerarquica = $.ajax({
	url:'ajaxSelects?accion=getUnidadesJerarquicas&unidadJerarquica='+datosInstitucion[0].unidadJerarquicaId+'&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	type:'get',
	dataType:'json',
	async:false       
}).responseText;
datosUnidadJerarquica = JSON.parse(datosUnidadJerarquica);
datosUnidadJerarquica=datosUnidadJerarquica.unidadesJerarquicas; 


function getMetaProductos(nivel, entidad, tipo, programa, subprograma,proyecto,producto){   	        
	var metaProducto = [];
	for(var i=0; i<metaProductoPorNivelEntidad.length; i++){
		if (metaProductoPorNivelEntidad[i].tipo_presupuesto_id==tipo && 
			metaProductoPorNivelEntidad[i].programa_id==programa &&
			metaProductoPorNivelEntidad[i].subprograma_id==subprograma  &&
			metaProductoPorNivelEntidad[i].proyecto_id==proyecto  &&
			metaProductoPorNivelEntidad[i].producto_id==producto){
			metaProducto.push(metaProductoPorNivelEntidad[i]);
		}
	}
	
		
		    return metaProducto;
}

function getMetaMayorPorDepto(nivel, entidad, tipo, programa, subprograma,proyecto,producto){
    var porDepto = $.ajax({
		    	url:'ajaxSelects?accion=getDeptoMayor&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&anio=2017',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
   		porDepto = JSON.parse(porDepto);
   		porDepto = porDepto.deptoMayor;
   		porDepto=porDepto.sort(compareDepartamento);
   		return porDepto;
}

function getMetaSumaPorDepto(nivel, entidad, tipo, programa, subprograma,proyecto,producto){
	var porDepto=[];
	for(var i=0; i<sumaNivelEntidadPorDepto.length; i++){
		if (sumaNivelEntidadPorDepto[i].tipoPresupuesto==tipo && 
			sumaNivelEntidadPorDepto[i].programa==programa &&
			sumaNivelEntidadPorDepto[i].subprograma==subprograma  &&
			sumaNivelEntidadPorDepto[i].proyecto==proyecto  &&
			sumaNivelEntidadPorDepto[i].producto==producto){
			porDepto.push(sumaNivelEntidadPorDepto[i]);
		}
	}
	return porDepto;
}

function getMetaSumaPorMes(nivel, entidad, tipo, programa, subprograma,proyecto,producto){
	var porMes=[];
	for(var i=0; i<sumaNivelEntidadPorMes.length; i++){
		if (sumaNivelEntidadPorMes[i].tipoPresupuesto==tipo && 
			sumaNivelEntidadPorMes[i].programa==programa &&
			sumaNivelEntidadPorMes[i].subprograma==subprograma  &&
			sumaNivelEntidadPorMes[i].proyecto==proyecto  &&
			sumaNivelEntidadPorMes[i].producto==producto){
			porMes.push(sumaNivelEntidadPorMes[i]);
		}
	}
	return porMes;
}
function getMetaSumaNPorMes(nivel, entidad, tipo, programa, subprograma,proyecto,producto){
	var porDepto=[];
	for(var i=0; i<sumaNivelEntidadPorDeptoN.length; i++){
		if (sumaNivelEntidadPorDeptoN[i].tipoPresupuesto==tipo && 
			sumaNivelEntidadPorDeptoN[i].programa==programa &&
			sumaNivelEntidadPorDeptoN[i].subprograma==subprograma  &&
			sumaNivelEntidadPorDeptoN[i].proyecto==proyecto  &&
			sumaNivelEntidadPorDeptoN[i].producto==producto){
			porDepto.push(sumaNivelEntidadPorDeptoN[i]);
		}
	}
	return porDepto;
}

function renderProductoMetaFisica(metaProducto, porDepto,porMes,max ){
	
	metaProducto.getCantidadPorMesDepto = function( mesB, deptoB, anhoB ) {
    	var depto;
        for( var mes in this ) {
            if( this.hasOwnProperty( mes ) ) {
            	depto=this[mes][ 'departamento' ];
                 if( this[mes][ 'mes' ] == mesB && this[mes][ 'departamento' ] == deptoB && this[mes][ 'anho' ] == anhoB)
                     return  this[mes][ 'cantidad' ];
            }
        }
    }
	
	var texto="";
	texto+='<div class="row" style="font-size:8px; padding-right: 1px; padding-left: 1px;">'+
	'<div class="col-md-12">'+
	'<table class="table table-striped table-condensed">'+
	'<thead>'+
	'<tr> '+
	'<th colspan="13">AÑO 2018</th>'+
	'</tr>'+
	'<tr>'+
	'<th>DEPTO/MES:</th>'+
	'<th>01</th>'+
	'<th>02</th>'+
	'<th>03</th>'+
	'<th>04</th>'+
	'<th>05</th>'+
	'<th>06</th>'+
	'<th>07</th>'+
	'<th>08</th>'+
	'<th>09</th>'+
	'<th>10</th>'+
	'<th>11</th>'+
	'<th>12</th>'+
	'<th>Total</th>'+
	'</tr>'+
	'</thead>'+
	'<tbody>'+
	'<tr>'+
	'<td>Asunción:</td>'+ 
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,0,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,0,2017))+'</td>';
	if(porDepto[0].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[0].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[0].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Concepción:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,1,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,1,2017))+'</td>';
	if(porDepto[1].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[1].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[1].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>San Pedro:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,2,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,2,2017))+'</td>';
	if(porDepto[2].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[2].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[2].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Cordillera:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,3,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,3,2017))+'</td>';
	if(porDepto[3].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[3].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[3].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Guaira:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,4,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,4,2017))+'</td>';
	if(porDepto[4].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[4].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[4].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Caaguazú:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,5,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,5,2017))+'</td>';
	if(porDepto[5].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[5].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[5].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Caazapá:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,6,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,6,2017))+'</td>';
	if(porDepto[6].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[6].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[6].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Itapua:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,7,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,7,2017))+'</td>';
	if(porDepto[7].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[7].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[7].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Misiones:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,8,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,8,2017))+'</td>';
	if(porDepto[8].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[8].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[8].suma+'</td>';
	}
	texto+='</tr> '+
	'<tr>'+
	'<td>Paraguari:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,9,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,9,2017))+'</td>';
	if(porDepto[9].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[9].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[9].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Alto Parana:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,10,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,10,2017))+'</td>';
	if(porDepto[10].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[10].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[10].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Central:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,11,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,11,2017))+'</td>';
	if(porDepto[11].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[11].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[11].suma+'</td>';
	}
	texto+='</tr>  '+
	'<tr>'+
	'<td>Ñeembucú:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,12,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,12,2017))+'</td>';
	if(porDepto[12].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[12].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[12].suma+'</td>';
	}
	texto+='</tr>  '+
	'<tr>'+
	'<td>Amambay:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,13,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,13,2017))+'</td>';
	if(porDepto[13].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[13].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[13].suma+'</td>';
	}
	texto+='</tr>  '+
	'<tr>'+
	'<td>Canindeyu:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,14,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,14,2017))+'</td>';
	if(porDepto[14].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[14].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[14].suma+'</td>';
	}
	texto+='</tr>  '+
	'<tr>'+
	'<td>Pte. Hayes:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,15,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,15,2017))+'</td>';
	if(porDepto[15].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[15].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[15].suma+'</td>';
	}
	texto+='</tr> '+
	'<tr>'+
	'<td>Boqueron:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,16,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,16,2017))+'</td>';
	if(porDepto[16].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[16].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[16].suma+'</td>';
	}
	texto+='</tr>  '+
	'<tr>'+
	'<td>Alto Paraguay:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,17,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,17,2017))+'</td>';
	if(porDepto[17].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[17].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[17].suma+'</td>';
	}
	texto+='</tr>'+
	'<tr>'+
	'<td>Aux. Trasp.:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,88,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,88,2017))+'</td>';	
	if(porDepto[18].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[18].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[18].suma+'</td>';
	}
	texto+='</tr>  '+
	'<tr>'+
	'<td>Alc. Nacional:</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(2,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(3,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(4,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(5,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(6,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(7,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(8,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(9,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(10,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(11,99,2017))+'</td>'+
	'<td>'+numeroConComa(metaProducto.getCantidadPorMesDepto(12,99,2017))+'</td>';	
	if(porDepto[19].suma>0){// si suma es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(porDepto[19].suma.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+porDepto[19].suma+'</td>';
	}
	texto+=' </tr>'+
	'<tr>'+
	'<td>Total Mes:</td>'+
	'<td>'+numeroConComa(porMes[0].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[1].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[2].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[3].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[4].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[5].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[6].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[7].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[8].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[9].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[10].suma)+'</td>'+
	'<td>'+numeroConComa(porMes[11].suma)+'</td>';
	if(max>0){// si max es 0 no se hace el toFixed
		texto+='<td>'+numeroConComa(max.toFixed(2))+'</td>';
	} else {
		texto+='<td>'+max+'</td>';
	}	
	texto+='</tr>'+
	'</body>'+
	'</table>'+
	'</div>'+
	'</div>'+
	'<div class="row">'+
	'<div class="col-md-12">'+
	'<table class="table table-striped" style="border:1px solid silver">'+
	'<tr><td><center><strong>2019:</strong></center></td><td><center><strong>2020:</strong></center></td></tr>'+
	'<tr><td><center>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,99,2018))+'</center></td><td><center>'+numeroConComa(metaProducto.getCantidadPorMesDepto(1,99,2019))+'</center></td></tr>'+
	'</table>'+
	'</div><!-- /.col -->'+
	'</div>';
	//'<div style="page-break-after:always"></div>';
	return texto; 
}

function renderMetas(indicadorId){
	
	var cuerpoMetas = "";

	cuerpoMetas +=	'<div class="table-responsive">'+
	'	<table class="table table-hover table-bordered table-condensed">'+
	'		<thead>'+					
	'			<tr class="active"><th class="text-center col-sm-6">Fecha</th><th class="text-center col-sm-6">Cantidad</th></tr>'+  									
	'		</thead>'+
	'      	<tbody>';
	var cantidadMetas=0;
	for(var indMetas=0;indMetas<webServicesMetas.length;indMetas++){
		if (webServicesMetas[indMetas].indicador_id==indicadorId){
			//webServicesMetas=webServicesMetas[indMetas];
			
			//for(var a = 0; a < webServicesMetas.length; a++){
				cuerpoMetas += '<tr><td>'+webServicesMetas[indMetas].vencimiento+'</td><td>'+numeroConComa(webServicesMetas[indMetas].cantidad)+'</td></tr>';
				cantidadMetas++;
			//}
		}
	}

	
	
	if(cantidadMetas==0){
		cuerpoMetas += '<tr><td>--</td><td>--</td></tr>';
		
	}
	cuerpoMetas +=	'		</tbody>'+
	'	</table>'+
	'</div>';

	return cuerpoMetas;
}

function renderResultados(indicadorId,tipoIndicadorId, indicadores, proyectosFiltro){

/*	var indicadores = $.ajax({
		url:'ajaxSelects?accion=getObjetivoHasIndicador&indicadorId='+indicadorId+'&tipoIndicadorId='+tipoIndicadorId+'&tipoObjetivoId=2',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	indicadores = JSON.parse(indicadores);
	indicadores=indicadores.indicadores;*/
	
	var datosObjetivo="[{}]";

	var cuerpoIndicadores = "";

	cuerpoIndicadores +=	'<div class="table-responsive">'+
							'	<br><table class="table table-hover table-bordered table-condensed">'+
							'		<thead>'+					
							'			<tr class="active">'+
							'				<th class="text-center ">Niv</th>'+
							'				<th class="text-center ">Ent</th>'+
							'				<th class="text-center ">TP</th>'+
							'				<th class="text-center ">Pro</th>'+
							'				<th class="text-center ">Sub</th>'+
							'				<th class="text-center ">Pry</th>'+
							'				<th class="text-center ">Prd</th>'+
							'				<th class="text-center ">Res</th>'+
							'				<th class="text-center col-sm-6">Resultado</th></tr>'+
							'		</thead>'+
							'      	<tbody>';
	var cantidadResultados=0;
	for (var a=0; a<indicadores.length;a++){
		if(indicadores[a].indicadorId==indicadorId && indicadores[a].indicadorTipoIndicadorId==tipoIndicadorId){
			var concatParsed = indicadores[a].productoConcat.split("-");
			var filtroProyecto="proyecto-"+concatParsed[0]+"-"+concatParsed[1]+"-"+concatParsed[2]+"-"+concatParsed[3]+"-"+concatParsed[4]+"-"+concatParsed[5];
			if (concatParsed[0]==nivel && concatParsed[1]==entidad){
				for (var indPF=0; indPF<proyectosFiltro.length; indPF++ ){
					
					if(proyectosFiltro[indPF]==filtroProyecto){ 
						for(var indObj=0; indObj<todosLosObjetivos.length;indObj++){
							if(todosLosObjetivos[indObj].id==indicadores[a].objetivoId && todosLosObjetivos[indObj].tipo_objetivo_id==2 && todosLosObjetivos[indObj].version==3 && todosLosObjetivos[indObj].anho==2016){
								datosObjetivo=todosLosObjetivos[indObj];
							}
						}
						/*var datosObjetivo = $.ajax({
							url:'ajaxSelects?accion=getObjetivos&objetivoId='+indicadores[a].objetivoId+'&tipoObjetivoId=2&anho=2016&version=3&borrado=false',
							type:'get',
							dataType:'json',
							async:false       
						}).responseText;
						datosObjetivo=JSON.parse(datosObjetivo);
						datosObjetivo=datosObjetivo.objetivos[0];*/
						if (datosObjetivo){
							cantidadResultados++;
							cuerpoIndicadores += '<tr><td>'+concatParsed[0]+'</td>'+
												 '<td>'+concatParsed[1]+'</td>'+
												 '<td>'+concatParsed[2]+'</td>'+
												 '<td>'+concatParsed[3]+'</td>'+
												 '<td>'+concatParsed[4]+'</td>'+
												 '<td>'+concatParsed[5]+'</td>'+
												 '<td>'+concatParsed[6]+'</td>'+
												 '<td>'+indicadores[a].objetivoId+'</td>'+
												 '<td>'+datosObjetivo.nombre+'</td></tr>';
						}
					}
				}
			}
		}
	}
	if(cantidadResultados==0){
		cuerpoIndicadores += '<tr><td>--</td>'+
		 '<td>--</td>'+
		 '<td>--</td>'+
		 '<td>--</td>'+
		 '<td>--</td>'+
		 '<td>--</td>'+
		 '<td>--</td>'+
		 '<td>--</td>'+
		 '<td>Sin nombre</td></tr>';
	}
	cuerpoIndicadores +=	'		</tbody>'+
	'	</table>'+
	'</div>';

	return cuerpoIndicadores;
}

function renderIndicadores(proyectosFiltro){

	var tablaIndicadores = "";
	var cuerpoTabla = "";
	$("#cuerpoIndicadores").html("");

	var objetivoHasIndicador = $.ajax({
		url:'ajaxSelects?accion=getObjetivoHasIndicador',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	objetivoHasIndicador = JSON.parse(objetivoHasIndicador);
	objetivoHasIndicador = objetivoHasIndicador.indicadores;

	var idsObjetivos = [];
	for(var g = 0; g < objetivoHasIndicador.length; g++){
		if(objetivoHasIndicador[g].objetivoTipoObjetivoId == 2){
			var concatParsed = objetivoHasIndicador[g].productoConcat.split("-");
			if (concatParsed[0]==nivel && concatParsed[1]==entidad){
				for(var indFiltro=0;indFiltro<proyectosFiltro.length;indFiltro++){
					
					if (proyectosFiltro[indFiltro].indexOf(concatParsed[0]+"-"+concatParsed[1]+"-"+concatParsed[2]+"-"+concatParsed[3]+"-"+concatParsed[4]+"-"+concatParsed[5])>0){
						idsObjetivos.push(objetivoHasIndicador[g].indicadorId);
					}
				}
			}
		}
	}
    
	var indicadores = $.ajax({
		url:'ajaxSelects?accion=getIndicador&tipoIndicadorId=2&borrado=false',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	indicadores = JSON.parse(indicadores);
	indicadores = indicadores.indicadores;

	var tipoIndicador = $.ajax({
		url:'ajaxSelects?accion=getTipoIndicador',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	tipoIndicador = JSON.parse(tipoIndicador);

	var unidadesMedida = $.ajax({
		url:'ajaxSelects?accion=getUnidadesMedida',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	unidadesMedida = JSON.parse(unidadesMedida);
	unidadesMedida = unidadesMedida.unidadesMedida;

	var objetivos = $.ajax({
		url:'ajaxSelects?accion=getResultados&borrado=false',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	objetivos = JSON.parse(objetivos);
	objetivos = objetivos.resultados;

	var coberturaGeograficaAlcance = $.ajax({
		url:'ajaxSelects?accion=getCoberturaGeograficaAlcance',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	coberturaGeograficaAlcance = JSON.parse(coberturaGeograficaAlcance);

	var nivelDespliegueGeografico = $.ajax({
		url:'ajaxSelects?accion=getNivelDespliegueGeografico',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	nivelDespliegueGeografico = JSON.parse(nivelDespliegueGeografico);

//	var coberturaDemograficaAlcance = $.ajax({
//		url:'ajaxSelects?accion=getCoberturaDemograficaAlcance',
//		type:'get',
//		dataType:'json',
//		async:false       
//	}).responseText;
//	coberturaDemograficaAlcance = JSON.parse(coberturaDemograficaAlcance);
	
	var tiposDestinatarios = $.ajax({
		url:'ajaxSelects?accion=getTiposDestinatarios',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	tiposDestinatarios = JSON.parse(tiposDestinatarios);
	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;

	var nivelDespliegueDemografico = $.ajax({
		url:'ajaxSelects?accion=getNivelDespliegueDemografico',
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
	//var optionCoberturaDemograficaAlcance;
	var optionDesagregacionDemograficaDestinatario;
	var optionNivelDespliegueDemografico;
	var cuerpoTabla="";
	
	//cabeceraReporte();
	//$('#reporteCuerpo').append('<div style="page-break-before:always"></div><div class="row "><div class="col-xs-12" align="center"><h2><strong>FICHA DE INDICADOR</strong></h2></div></div>');
	$('#reporteCuerpo').append('<div class="row "><div class="col-xs-12" align="center"><h2><strong>FICHA DE INDICADOR</strong></h2></div></div>');

	for(var q = 0; q < indicadores.length; q++){
		if (idsObjetivos.indexOf(indicadores[q].id)>=0){

			optionTipoIndicador = "";
			optionUnidadesMedida = "";
			optionFuenteVerificacion = "";
			optionObjetivos = "";
			optionCoberturaGeograficaAlcance = "";
			optionNivelDespliegueGeografico = "";
			optionDesagregacionDemograficaDestinatario = "";
			optionNivelDespliegueDemografico = "";
			var cuerpoTabla="";

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

			for(var d = 0; d < tiposDestinatarios.length; d++){
				if(tiposDestinatarios[d].id == indicadores[q].NivelDespliegueDemograficoDesagregacion){
					optionDesagregacionDemograficaDestinatario = tiposDestinatarios[d].nombre;
				}
			}

			for(var f = 0; f < nivelDespliegueDemografico.length; f++){
				if(nivelDespliegueDemografico[f].id == indicadores[q].NivelDespliegueDemograficoDesagregacion){
					optionNivelDespliegueDemografico = nivelDespliegueDemografico[f].nombre;
				}
			}

			var tablaMeta = renderMetas(indicadores[q].id);
			
			var tablaResultados = renderResultados(indicadores[q].id, indicadores[q].tipo_indicador_id, objetivoHasIndicador, proyectosFiltro);
			
			cuerpoTabla +='<div class="table-responsive">'+
			'	<table class="table table-hover table-bordered table-condensed">'+
			'		<thead>'+					
			'			<tr class="active"><th colspan="2" class="text-center col-sm-2">'+indicadores[q].id+") "+indicadores[q].nombre+'</th></tr>'+  									
			'		</thead>'+
			'      	<tbody class="tablaIndicadoresPrecargados">';
			cuerpoTabla += 	''+
			'			<tr><td class="active col-sm-3"><strong>Tipo de Indicador</strong></td><td>'+optionTipoIndicador+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Metodología de Cálculo</strong></td><td>'+indicadores[q].metodo_calculo_id+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Unidad de Medida</strong></td><td>'+optionUnidadesMedida+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Frecuencia de Medición (Meses)</strong></td><td>'+indicadores[q].frecuencia_meses+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Fecha de Disponilidad de la Información</strong></td><td>'+indicadores[q].fechaDisponibilidadInformacion+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Cobertura Geográfica</strong></td><td>'+optionCoberturaGeograficaAlcance+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Nivel de Despliegue Geográfico</strong></td><td>'+optionNivelDespliegueGeografico+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Desagregación demográfica y destinatarios</strong></td><td>'+optionDesagregacionDemograficaDestinatario+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Fuente de Datos</strong></td><td>'+indicadores[q].fuente_verificacion_id+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Institución Responsable del Cálculo del Indicador</strong></td><td>'+indicadores[q].institucionResponsableCalculoIndicador+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Evaluación HECI</strong></td><td>'+indicadores[q].evaluacionHeci+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Contacto</strong></td><td>'+indicadores[q].contacto+'</td></tr>'+
			'			<tr><td class="active col-sm-3"><strong>Comentarios</strong></td><td>'+indicadores[q].observaciones+'</td></tr>';
			cuerpoTabla +=	'		</tbody>'+
			'	</table>'+
			'</div>';
			
			//'<div style="page-break-before:always"></div>';

			cuerpoTabla +=	'<div class="table-responsive">'+
			'	<table class="table table-hover table-bordered table-condensed">'+
			'      	<tbody class="tablaIndicadoresPrecargados">';
			cuerpoTabla +=	'			<tr><td class="active col-sm-3"><strong>Metas</strong></td><td>'+tablaMeta+'</td></tr>'+
							'			<tr><td class="active col-sm-3"><strong>Resultados Vinculados</strong></td><td>'+tablaResultados+'</td></tr>';
			cuerpoTabla +=	'		</tbody>'+
			'	</table>'+

			'</div>';
			//'<div style="page-break-before:always"></div>';			

			$('#reporteCuerpo').append(cuerpoTabla);
		}
	}
}

function getReporteDestinatario(nivel, entidad, tipo, programa, subprograma,proyecto,producto){

	var cuerpoDestinatario ="";
	var productoDestinatarios = $.ajax({
		//url:'/ajaxSelects?accion=getProductoDestinatario',
		url:'ajaxSelects?accion=getProductoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	productoDestinatarios = JSON.parse(productoDestinatarios);
	productoDestinatarios = productoDestinatarios.productoDestinatarios;

	var nombreDepto;
	var grupo;
	var tipoDest;					    

	cuerpoDestinatario='<div class="row">'+
	'<div class="col-xs-12">'+
	'<strong>DESTINATARIOS</strong>'+
	'<table class="table table-striped table-condensed" style="border:1px solid silver">'+
	"<tr><td><center><strong>Tipo Destinatario</strong></center></td><td><center><strong>Grupo Destinatario</strong></center></td><td><center><strong>Descripcion</strong></center></td><td><center><strong>Cantidad</strong></center></td><td><center><strong>Departamento</strong></center></td></tr>";
	for(var a = 0; a < productoDestinatarios.length; a++)
	{
		if(productoDestinatarios[a].borrado!=true){
			nombreDepto = "";
			grupo = "";
			tipoDest = "";
			
	
			for(var g = 0; g <grupoDestinatario.length; g++){
				if(grupoDestinatario[g].id == productoDestinatarios[a].catalogo_destinatario){
					grupo = grupoDestinatario[g].nombre;
	
					for(var j = 0; j < tiposDestinatarios.length; j++){
						if(grupoDestinatario[g].tipo_catalogo_destianatario_id == tiposDestinatarios[j].id){
							tipoDest = tiposDestinatarios[j].nombre;
						}
					}
				}
			}
	
			for(var p = 0; p <departamentos.length; p++){
				if(productoDestinatarios[a].departamento == departamentos[p].deptoPais){
					nombreDepto = departamentos[p].abrevDepartamento;
				}
			}
	
			cuerpoDestinatario += '<tr><td>'+tipoDest+'</td><td>'+grupo+'</td><td>'+productoDestinatarios[a].descripcion+'</td><td>'+productoDestinatarios[a].cantidad+'</td><td>'+nombreDepto+'</td></tr>';
		}
	}
	cuerpoDestinatario +='</table></div><!-- /.col -->'+         		
	'</div><!-- /.row -->';	
	return cuerpoDestinatario;
}  	    	        

function cargarObjetivosVinculados(idObjetivo, tipoObjetivoRelId, anho, version, productoConcat){
	var cadena=[];
	var getObjetivosVinculados = $.ajax({
		url:'ajaxSelects?accion=getObjetivoHasObjetivo&objetivoId='+idObjetivo+'&objetivoRelTipoObjetivoId='+tipoObjetivoRelId+'&anho='+anho+'&objetivoVersion='+version+'&productoConcat='+productoConcat+'&borrado=false',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	getObjetivosVinculados=JSON.parse(getObjetivosVinculados);

	if (getObjetivosVinculados.success){
		getObjetivosVinculados=getObjetivosVinculados.objetivos;
		var objetivosVinculados=[];

		for(var i = 0; i < getObjetivosVinculados.length ; i++){
			var datosObjetivo = $.ajax({
				url:'ajaxSelects?accion=getObjetivos&objetivoId='+getObjetivosVinculados[i].objetivoRelId+'&tipoObjetivoId='+getObjetivosVinculados[i].relTipoObjetivoId+'&anho='+getObjetivosVinculados[i].relAnho+'&version='+getObjetivosVinculados[i].relVersion,
				type:'get',
				dataType:'json',
				async:false       
			}).responseText;
			datosObjetivo=JSON.parse(datosObjetivo);
			datosObjetivo=datosObjetivo.objetivos;
			objetivosVinculados.push(datosObjetivo[0]);
		}
		cadena.push(getObjetivosVinculados);
		cadena.push(objetivosVinculados);
		return cadena;

	}else{
		return "[{}]";
	}
};

function getReporteCadenaValor(nivel, entidad, tipo, programa, subprograma,proyecto,producto){
	var productoConcat=nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
	var texto='<div class="row">'+
	'<div class="col-xs-12">'+
	'<table class="table table-striped table-condensed" style="border:1px solid silver">'+
	'<tr><td><left><strong>Resultado Esperado Vinculado</strong></center></td><td class="text-center"><strong>Colaboración del Producto</strong></td><td class="text-center"> <strong>Influencia del Producto</strong></td><td><center><strong>Objetivo PND Vinculado</strong></center></td></tr>';
	var lineasPnd=0;
	var lineasResultados=0;
	var datosResultadosVinculados=cargarObjetivosVinculados(producto, 2, 2016, 3, productoConcat);
	for(var i = 0; i < datosResultadosVinculados[0].length ; i++){
		if (!datosResultadosVinculados[0][i].borrado){
			lineasResultados++;
			texto+='<tr><td>'+datosResultadosVinculados[1][i].nombre+'</td><td class="text-center">'+datosResultadosVinculados[0][i].colaboracion+'</td><td class="text-center">'+datosResultadosVinculados[0][i].influencia+'</td>';
			var datosPndVinculados=cargarObjetivosVinculados(datosResultadosVinculados[0][i].objetivoRelId, 1, 2016, 3, productoConcat);
			texto+='<td>'+
			'<table class="table table-striped table-condensed" style="border:1px solid silver">'+
			'<tr><td><left><strong>Objetivo PND</strong></center></td><td class="text-center"><strong>Colaboración del Resultado</strong></td><td class="text-center"><strong>Influencia del Resultado</strong></td></tr>';
			for(var j = 0; j < datosPndVinculados[0].length ; j++){
				if (!datosPndVinculados[0][j].borrado){
					lineasPnd++;
					texto+='<tr><td>'+datosPndVinculados[1][j].nombre+'</td><td class="text-center">'+datosPndVinculados[0][j].colaboracion+'</td><td class="text-center">'+datosPndVinculados[0][j].influencia+'</td></tr>';
				}
			}
			if (lineasPnd==0){
				texto+='<tr><td class="text-center">--</td><td class="text-center">--</td><td class="text-center">--</td></tr>';
			}
			lineasPnd=0;
			texto+='</table>'+
			'</td></tr>';
		}
	}
	if (lineasResultados==0){
		texto+='<tr><td class="text-center">--</td><td class="text-center">--</td><td class="text-center">--</td><td class="text-center">--</td></tr>';
	}
	lineasResultados=0;
	texto+='</table></div><!-- /.col -->'+         		
	'</div><!-- /.row -->';		
	return texto;
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
function compareSubPrograma(a,b) {  // falta consultar
	if (a.id < b.id) return -1;
	if (a.id > b.id) return 1;
	return 0;
}

$(document).ready(function() {

	$(function () {
		$("body").on("click", "input[type='checkbox']",function(event){		
			
			$(this).siblings('ul').find("input[type='checkbox']").prop('checked', this.checked); // maraca o desmarca todos los sucesores
			
		});
	});


	var tipoPrograma=0;
	var texto='<ul><li class="selectorGeneral"><input type="checkbox"  checked="checked" name="seleccionarTodo" id="selecccionarTodo"> <strong>Seleccionar/Desmarcar Todo </strong> ';
	 texto+="<ul>";
	//for(i = 0;i<tiposPrograma.length; i++){
	for(i = 0;i<4; i++){

		texto+='<li class="tipoPrograma"><input type="checkbox"  checked="checked" name="tipo-'+nivel+'-'+entidad+'-'+tiposPrograma[i].numeroFila+'" id="tipo-'+tiposPrograma[i].numeroFila+'"><strong>Tipo de Programa: </strong> '+tiposPrograma[i].numeroFila+') '+tiposPrograma[i].nombreTipoPrograma;

		var programas = $.ajax({
			url:'ajaxSelects?accion=getProgramas&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tiposPrograma[i].numeroFila+'',
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;

		programas = JSON.parse(programas);
		programas = programas.programas;
		programas=programas.sort(comparePrograma);

		var indProg=0;
		texto+="<ul>";
		for (indProg=0;indProg<programas.length; indProg++){
			texto+='<li class="programa"><input type="checkbox"  checked="checked" name ="programa-'+nivel+'-'+entidad+'-'+tiposPrograma[i].numeroFila+'-'+programas[indProg].codigoPrograma+'" id="programa-'+tiposPrograma[i].numeroFila+'-'+programas[indProg].codigoPrograma+'"><strong>Programa: </strong>'+programas[indProg].codigoPrograma+') '+programas[indProg].nombrePrograma;

			var subprogramas = $.ajax({
				url:'ajaxSelects?accion=getSubprogramas&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tiposPrograma[i].numeroFila+'&programa='+programas[indProg].codigoPrograma,
				type:'get',
				dataType:'json',
				async:false       
			}).responseText;

			subprogramas = JSON.parse(subprogramas);
			subprogramas = subprogramas.subprogramas;
			subprogramas=subprogramas.sort(compareSubPrograma);

			texto+="<ul>";
			for (indSubProg=0;indSubProg<subprogramas.length; indSubProg++){
				texto+='<li class="subprograma"><input type="checkbox"  checked="checked" name="subprograma-'+nivel+'-'+entidad+'-'+tiposPrograma[i].numeroFila+'-'+programas[indProg].codigoPrograma+'-'+subprogramas[indSubProg].id+'" id="subprograma-'+tiposPrograma[i].numeroFila+'-'+programas[indProg].codigoPrograma+'-'+subprogramas[indSubProg].id+'"><strong>Subprograma: </strong>'+subprogramas[indSubProg].id+') '+subprogramas[indSubProg].nombre;

				var datosProyectos = $.ajax({
					url:'ajaxSelects?accion=getProyectos&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tiposPrograma[i].numeroFila+'&programa='+programas[indProg].codigoPrograma+'&subprograma='+subprogramas[indSubProg].id+'&borrado=false',
					type:'get',
					dataType:'json',
					async:false       
				}).responseText; 		        
				datosProyectos = JSON.parse(datosProyectos);
				datosProyectos = datosProyectos.proyectos;
				datosProyectos=datosProyectos.sort(compareProyecto);

				texto+="<ul>";
				for (indProy=0;indProy<datosProyectos.length; indProy++){
					texto+='<li class="proyecto"><input type="checkbox"  checked="checked" name="proyecto-'+nivel+'-'+entidad+'-'+tiposPrograma[i].numeroFila+'-'+programas[indProg].codigoPrograma+'-'+subprogramas[indSubProg].id+'-'+datosProyectos[indProy].codigoProyecto+'" id="proyecto-'+tiposPrograma[i].numeroFila+'-'+programas[indProg].codigoPrograma+'-'+subprogramas[indSubProg].id+'-'+datosProyectos[indProy].codigoProyecto+'"><strong>Proyecto: </strong>'+datosProyectos[indProy].codigoProyecto+') '+datosProyectos[indProy].nombreProyecto+"</li>";	
				}
				texto+="</ul>";//lista de proyectos
				texto+='</li>';//subprograma
			}
			texto+="</ul>"; //lista subprogramas
			texto+="</li>";// programa
		}
		texto+="</ul>";//lista programas
		texto+='</li>';// tipo
	}
	texto+="</ul>"; //lista de tipos
	texto+="</li>";
	texto+="</ul>"; //lista de todo
	$("#listaDeEstructura").append(texto); 

});

$( "form" ).on( "submit", function( event ) {
	event.preventDefault();
});
$("body").on("click", "#generarReporteSpinner",function(event){
	//document.getElementById("spinGenerarReporte").style.display="block";
	$("#spinGenerarReporte").show().delay(2500).queue(function(n) {
		$("#generarReporte").click(); n();
	});
	
});

$("body").on("click", "#generarReporte",function(event){
	$.fn.serializeObject = function(){
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name] !== undefined) {
				if (!o[this.name].push) {
					o[this.name] = [o[this.name]];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
	$("#reporteCuerpo").html("");

	



	var reporte=$("form").serializeObject();
	
	//var caratulaReporte = '<div style="page-break-before:always"></div>'+
	var caratulaReporte = 
	'	<section class="invoice" >'+
	'			<div class="row">';
	cabeceraReporte();
	caratulaReporte = '				</br></br></br></br></br></br></br></br></br></br></br></br></br></br>'+
	'				<div class="col-xs-12">'+
	'					<h1 id="tituloEntidad"><center></center></h1></br>'+
	'					<small><center>PLAN OPERATIVO INSTITUCIONAL PERIODO<br>'+
	'   	 			2018 – 2020</center></small>'+
	'  	 				</br></br></br></br></br></br></br></br>'+
	'   			</div>'+
	'				<strong><hr></strong>'+
	'			</div><!-- /.row -->'+
	'	</section><!-- /.section -->'+
	'<div style="page-break-after:always"></div>';	
	$("#reporteCuerpo").append(caratulaReporte);
	
	if (reporte.checkInstitucional=="on"){

		

		cabeceraReporte();

		$("#reporteCuerpo").append("<h2 align='center'>PERFIL INSTITUCIONAL</h2>");


		var i=parseInt(0);

		var perfilInstitucional = '<section class="invoice">'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2  col-sm-3 col-xs-4">'+
		'			<h5 align="left"><b>Nivel:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 col-sm-9 col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosNiveles[0].nombreNivel+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2  col-sm-3 col-xs-4">'+
		'			<h5 align="left"><b>Entidad:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 col-sm-9 col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].nombreEntidad+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2  col-sm-3 col-xs-4">'+
		'			<h5 align="left"><b>Base Legal de  Creación:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 col-sm-9 col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosInstitucion[0].baseLegal+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2  col-sm-3 col-xs-4">'+
		'			<h5 align="left"> <b>Misión:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 col-sm-9 col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosInstitucion[0].mision+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2  col-sm-3 col-xs-4">'+
		'			<h5 align="left"> <b>Visión:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 ol-sm-9  col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosInstitucion[0].vision+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2 col-sm-3  col-xs-4">'+
		'			<h5 align="left"><b>Diagnóstico General de la Institución:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 ol-sm-9  col-xs-8">'+
		'			<p class="text-justify" style="line-height: 14px;">'+datosInstitucion[0].diagnostico+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2 col-sm-3  col-xs-4">'+
		'			<h5 align="left"><b>Objetivos Generales de la In stitución:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 col-sm-9 col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosInstitucion[0].objetivo+'</p>'+
		'		</div>'+
		'	</div>'+
		'	<div class="row" style="border-top-style: inset; border-right-style: inset">'+
		'		<div class="col-md-2  col-sm-3 col-xs-4">'+
		'			<h5 align="left"><b>Principales Políticas Instit ucionales:</b></h5>'+
		'		</div>'+
		'		<div class="col-md-10 col-sm-9 col-xs-8">'+
		'			<p class="text-justify" style="line-height: 17px;">'+datosInstitucion[0].politica+'</p>'+
		'		</div>'+
		'	</div>'+
		'</section>'+
		'<div style="page-break-after:always"></div>';
		$("#reporteCuerpo").append(perfilInstitucional);


	}
	if (true){// if (reporte.checkEstructura=="on"){
		var tiposProgramasFiltro=[];
		var programasFiltro=[];
		var subprogramasFiltro=[];
		var proyectosFiltro=[];
		var concatTipo="";
		var concatPrograma="";
		var concatSubprograma="";
		var countTipo=0;
		var countProg=0;
		var countSubProg=0;
		
		for(var key in reporte) {
			var keyParsed = key.split("-");
			if (key.indexOf("proyecto") >= 0) {
				proyectosFiltro.push(key);
				
				concatTipo="tipo-"+keyParsed[1]+"-"+keyParsed[2]+"-"+keyParsed[3];
				concatPrograma="programa-"+keyParsed[1]+"-"+keyParsed[2]+"-"+keyParsed[3]+"-"+keyParsed[4];
				concatSubprograma="subprograma-"+keyParsed[1]+"-"+keyParsed[2]+"-"+keyParsed[3]+"-"+keyParsed[4]+"-"+keyParsed[5];
				for (var i=0; i< tiposProgramasFiltro.length; i++){
					if(tiposProgramasFiltro[i].indexOf(concatTipo)>=0){	
						countTipo++; 
					}
				}
				if (tiposProgramasFiltro.length==0 || countTipo==0) tiposProgramasFiltro.push(concatTipo); 
				countTipo=0;
				for (var i=0; i< programasFiltro.length; i++){
					if(programasFiltro[i].indexOf(concatPrograma)>=0){	
						countProg++;
					}
				}
				if (programasFiltro.length==0 || countProg==0) programasFiltro.push(concatPrograma);
				countProg=0;
				for (var i=0; i< subprogramasFiltro.length; i++){
					if(subprogramasFiltro[i].indexOf(concatSubprograma)>=0){	
						countSubProg++;
					}
				}
				if (subprogramasFiltro.length==0 || countSubProg==0) subprogramasFiltro.push(concatSubprograma);
				countSubProg=0;
			}else{
				if (key.indexOf("subprograma") >= 0) {
					subprogramasFiltro.push(key);
					
					concatTipo="tipo-"+keyParsed[1]+"-"+keyParsed[2]+"-"+keyParsed[3];
					concatPrograma="programa-"+keyParsed[1]+"-"+keyParsed[2]+"-"+keyParsed[3]+"-"+keyParsed[4];
					for (var i=0; i< tiposProgramasFiltro.length; i++){
						if(tiposProgramasFiltro[i].indexOf(concatTipo)>=0){	
							countTipo++; 
						}
					}
					if (tiposProgramasFiltro.length==0 || countTipo==0) tiposProgramasFiltro.push(concatTipo); 
					countTipo=0;
					for (var i=0; i< programasFiltro.length; i++){
						if(programasFiltro[i].indexOf(concatPrograma)>=0){	
							countProg++;
						}
					}
					if (programasFiltro.length==0 || countProg==0) programasFiltro.push(concatPrograma);
					countProg=0;

				}else{
					if (key.indexOf("programa") >= 0) {
						programasFiltro.push(key);
						
						concatTipo="tipo-"+keyParsed[1]+"-"+keyParsed[2]+"-"+keyParsed[3];
						for (var i=0; i< tiposProgramasFiltro.length; i++){
							if(tiposProgramasFiltro[i].indexOf(concatTipo)>=0){	
								countTipo++; 
							}
						}
						if (tiposProgramasFiltro.length==0 || countTipo==0) tiposProgramasFiltro.push(concatTipo); 
						countTipo=0;
						
					}else{
						if (key.indexOf("tipo") >= 0) {
							tiposProgramasFiltro.push(key); 
						}
					}
				}
			}
		}
		
		
		
		var nivel=usuarios[0].nivel_id;
		var entidad=usuarios[0].entidad_id;

		var tiposPrograma = $.ajax({
			url:'ajaxSelects?accion=getTiposPrograma',
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;

		tiposPrograma = JSON.parse(tiposPrograma);
		tiposPrograma = tiposPrograma.tiposPrograma

		/*var programas = $.ajax({
			url:'ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;

		programas = JSON.parse(programas);
		programas = programas.programas;
		programas=programas.sort(comparePrograma);*/

		$("#tituloEntidad").children().append(usuarios[0].entidad);
		$("#hoja2-nombre-entidad").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].nombreEntidad+'</p>');
		$("#hoja2-abrev-entidad").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].abrevEntidad+'</p>');
		$("#hoja2-base-legal").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].baseLegal+'</p>'); 
		$("#hoja2-vision-entidad").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].vision+'</p>');
		$("#hoja2-mision-entidad").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].mision+'</p>');
		$("#hoja2-diagnostico").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].diagnostico+'</p>');
		$("#hoja2-objetivo-general").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].objetivo+'</p>');
		$("#hoja2-politica-institucional").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].politica+'</p>');
		$("#hoja3-nombre-entidad").append('<p class="text-justify" style="line-height: 17px;">'+datosEntidad[0].nombreEntidad+'</p>');
		$("#hoja3-nivel-entidad").append('<p class="text-justify" style="line-height: 17px;">'+datosNiveles[0].nombreNivel+'</p>');


		cabeceraReporte();
		var programasCuerpo ='';
		var subprogramaCuerpo='';
		var tituloEntidadProgramaCero='';
		for (var l = 1; l <= 5; l++ ){
			var programas = $.ajax({
				url:'ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l,
				type:'get',
				dataType:'json',
				async:false       
			}).responseText;

			programas = JSON.parse(programas);
			programas = programas.programas;
			programas=programas.sort(comparePrograma);
			var bandera = 0;

			for(var m = 0; m < programas.length; m++){
				programasCuerpo='';

				if(bandera == 0){
					programasCuerpo+='<h2><center>FUNDAMENTACIÓN DE LOS PROGRAMAS / SUBPROGRAMAS / PROYECTOS</center></h2>'+
					'<div class="row ">'+
					'<div class="col-xs-12 ">'+
					'<h5><strong>Entidad:</strong> '+datosEntidad[0].nivel+' '+datosEntidad[0].nombreEntidad+'</h5>'+ 
					'</div><!-- /.col -->'+
					'</div> '+           
					'<div class="row invoice-info">'+
					'<div class="col-xs-12 ">'+
					'<h5><strong>Tipo Presupuesto:</strong> '+tiposPrograma[l-1].numeroFila+' '+tiposPrograma[l-1].nombreTipoPrograma+'</h5>'+
					'</div><!-- /.col -->'+
					'</div><!-- /.row -->';
					bandera=1;
				}

				var concat =  nivel+"-"+entidad+"-"+tiposPrograma[l-1].numeroFila+"-"+programas[m].codigoPrograma;

				for (var idPrograma2=0;idPrograma2<programasFiltro.length;idPrograma2++){
					if(programasFiltro[idPrograma2].indexOf(concat)>=0){
						programasCuerpo+='<div class="row">'+
						'<div class="col-xs-12" style="border:3px solid silver;">'+
						'<h5><strong>PROGRAMA:</strong> '+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+programas[m].nombrePrograma+'</h5>'+
						'</div><!-- /.col -->'+        		
						'</div><!-- /.row -->';
						if (reporte.checkEstructura=="on"){
							programasCuerpo+='<div class="row ">'+
							'<div class="col-xs-3">'+
							'<strong>Diagnóstico:</strong>'+
							'</div><!-- /.col -->'+
							'<div class="col-xs-9">'+
							'<p class="text-justify" style="line-height: 17px;">'+programas[m].diagnostico+'</p>'+

							'</div><!-- /.col --> '+        		
							'</div><!-- /.row -->'+			
							'<div class="row">'+
							'<div class="col-xs-3">'+
							'<strong>Objetivo:</strong>'+
							'</div><!-- /.col -->'+
							'<div class="col-xs-9">'+
							'<p class="text-justify" style="line-height: 17px;">'+programas[m].objetivo+'</p>'+

							'</div><!-- /.col -->'+         		
							'</div><!-- /.row -->'+			
							'<div class="row">'+
							'<div class="col-xs-3">'+
							'<strong>Base Legal:</strong>'+
							'</div><!-- /.col -->'+
							'<div class="col-xs-9">'+
							programas[m].baseLegal+
							'</div><!-- /.col -->'+         		
							'</div><!-- /.row -->'+			
							'<div class="row ">'+
							'<div class="col-xs-3">'+
							'<strong>Departamento:</strong>'+
							'</div><!-- /.col -->'+
							'<div class="col-xs-9">';

							for(var ol=0; ol<departamentos.length; ol++){
								if(departamentos[ol].deptoPais == programas[m].codigoDepartamento){
									programasCuerpo+=departamentos[ol].abrevDepartamento;
								} 
							}
							programasCuerpo+='</div><!-- /.col -->'+         		
							'</div><!-- /.row -->';
							$("#reporteCuerpo").append(programasCuerpo);
							programasCuerpo="";
						}

						var subprogramas = $.ajax({
							url:'ajaxSelects?accion=getSubprogramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma,
							type:'get',
							dataType:'json',
							async:false       
						}).responseText;

						subprogramas = JSON.parse(subprogramas); 
						subprogramas = subprogramas.subprogramas;
						subprogramas=subprogramas.sort(compareSubPrograma);
						
						subprogramaCuerpo='';
						var concatSubprograma="";
						var concat="";
						for(var v=0; v < subprogramas.length; v++){
							concat=nivel+"-"+entidad+'-'+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+"-";
							for(var v2=0; v2 < subprogramasFiltro.length; v2++){
								concatSubprograma=subprogramasFiltro[v2]+"-";
								if(concatSubprograma.indexOf(concat)>0){
							
									if(subprogramas[v].id != 0 ){
										subprogramaCuerpo+='<div class="row">'+
										'<div class="col-xs-12">'+
										'<h5><strong>SUBPROGRAMA:</strong> '+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+'-'+subprogramas[v].nombre+'</h5>'+
										'</div><!-- /.col -->'+
										'</div><!-- /.row -->';
										if (reporte.checkEstructura=="on"){
											subprogramaCuerpo+='<div class="row ">'+
											'<div class="col-xs-3">'+
											'<strong>Diagnóstico:</strong>'+
											'</div><!-- /.col -->'+
											'<div class="col-xs-9">'+
											'<p class="text-justify" style="line-height: 17px;">'+subprogramas[v].descripcion+'</p>'+
											'</div><!-- /.col --> '+        		
											'</div><!-- /.row -->'+													
											'<div class="row">'+
											'<div class="col-xs-3">'+
											'<strong>Objetivo:</strong>'+
											'</div><!-- /.col -->'+
											'<div class="col-xs-9">'+
											'<p class="text-justify" style="line-height: 17px;">'+subprogramas[v].objetivo+'</p>'+
											'</div><!-- /.col -->'+         		
											'</div><!-- /.row -->'+			
											'<div class="row">'+
											'<div class="col-xs-3">'+
											'<strong>Base Legal:</strong>'+
											'</div><!-- /.col -->'+
											'<div class="col-xs-9">'+
											''+subprogramas[v].baseLegal+
											'</div><!-- /.col -->'+         		
											'</div><!-- /.row -->'+			
											'<div class="row ">'+
											'<div class="col-xs-3">'+
											'<strong>Departamento:</strong>'+
											'</div><!-- /.col -->'+
											'<div class="col-xs-9">';
											//'<div style="page-break-after:always"></div>';
		
											for(var p=0;p<departamentos.length; p++){
												if(departamentos[p].deptoPais == subprogramas[v].codigo_departamento){
													subprogramaCuerpo+=departamentos[p].abrevDepartamento;
												}
											}	
											subprogramaCuerpo+='</div></div>';    
										}
									}
									var proyectos = $.ajax({
										url:'ajaxSelects?accion=getProyectos&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&borrado=false',
										type:'get',
										dataType:'json',
										async:false       
									}).responseText; 
		
									proyectos = JSON.parse(proyectos);
									proyectos = proyectos.proyectos;
									proyectos=proyectos.sort(compareProyecto);
									var pilarNombre="";
									var concatProy="";
									for( var k=0; k<proyectos.length;k++){
										concatProy=nivel+"-"+entidad+'-'+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+"-"+proyectos[k].codigoProyecto+"-";
										for(var k2=0; k2 < proyectosFiltro.length; k2++){
											concatProyecto=proyectosFiltro[k2]+"-";
											if(concatProyecto.indexOf(concatProy)>0){
										
												pilarNombre="";
												for(var indEst=0; indEst< estrategiasPnd.length;indEst++){
													if (estrategiasPnd[indEst].codigoPilar==proyectos[k].objetivo_estrategico_id){
														pilarNombre=estrategiasPnd[indEst].pilarNombre;
													}
												}
												
				
												var unidadResponsableNombre="";
				
												if(proyectos[k].codigoProyecto != 0){
													subprogramaCuerpo+='<div class="row ">'+ 
													'<div class="col-xs-12">'+
													'<h5><strong>PROYECTO:</strong> '+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+'-'+proyectos[k].codigoProyecto+'-'+proyectos[k].nombreProyecto+'</h5>'+                         
													'</div><!-- /.col -->'+
													'</div><!-- /.row -->';
													if (reporte.checkEstructura=="on"){
														subprogramaCuerpo+='<div class="row ">'+
														'<div class="col-xs-3">'+
														'<strong>Diagnóstico:</strong>'+
														'</div><!-- /.col -->'+
														'<div class="col-xs-9">'+
														'<p class="text-justify" style="line-height: 17px;">'+proyectos[k].diagnostico+'</p>'+
														'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
														'<div class="row ">'+
														'<div class="col-xs-3">'+
														'<strong>Objetivo:</strong>'+
														'</div><!-- /.col -->'+
														'<div class="col-xs-9">'+
														'<p class="text-justify" style="line-height: 17px;">'+proyectos[k].descripcionProyecto+'</p>'+
														'</div><!-- /.col -->'+
														'</div><!-- /.row -->'+	 	
														'<div class="row ">'+
														'<div class="col-xs-3">'+
														'<strong>Base Legal:</strong>'+
														'</div><!-- /.col -->'+
														'<div class="col-xs-9">'+
														'</div><!-- /.col -->'+
														'</div><!-- /.row -->';
													}
												}
				
												for (var w=0; w<unidadesResponsables.length; w++){
													if (unidadesResponsables[w].unrCodigo == proyectos[k].codigoUnidadResponsable){
														unidadResponsableNombre=unidadesResponsables[w].unrNombre;
													}
												}
												if (reporte.checkEstructura=="on"){
													subprogramaCuerpo+='<div class="row ">'+
													'<div class="col-xs-3">'+
													'<strong>Estrategia PND:</strong> '+
													'</div><!-- /.col -->'+
													'<div class="col-xs-9">';
				
													subprogramaCuerpo+='<p class="text-justify" style="line-height: 17px;">'+pilarNombre+'</p>';
				
													subprogramaCuerpo+='</div><!-- /.col -->'+
													'</div><!-- /.row -->'+	 	
													'<div class="row ">'+
													'<div class="col-xs-3">'+
													'<strong>Unidad Responsable:</strong> '+
													'</div><!-- /.col -->'+
													'<div class="col-xs-9">';
				
													subprogramaCuerpo+=unidadResponsableNombre;
													subprogramaCuerpo+='</div><!-- /.col -->'+
													'</div><!-- /.row -->'+	
													'<div class="row ">'+
													'<div class="col-xs-3">'+
													'<strong>Clasificación Funcional:</strong> '+
													'</div><!-- /.col -->'+
													'<div class="col-xs-9">';
				
													for (var oo=0; oo<funcionales.length; oo++){
														if (funcionales[oo].codigoFuncional == proyectos[k].codigoFuncional){
															subprogramaCuerpo+=funcionales[oo].nombre;
														}
													}
				
													subprogramaCuerpo+='</div><!-- /.col -->'+
													'</div><!-- /.row -->';	
													if(tiposPrograma[l-1].numeroFila==3){
														subprogramaCuerpo+='<div class="row ">'+
														'<div class="col-xs-3">'+
														'<strong>COD. SNIP: </strong>'+
														'</div><!-- /.col -->'+
														'<div class="col-xs-9">';
				
														for(var f=0; f<snip.length; f++){
															if (snip[f].codigoSnip == proyectos[k].codigoSnip){
																subprogramaCuerpo+=snip[f].codigoSnip+") "+snip[f].nombreProyecto;
															}	
														}
														subprogramaCuerpo+='</div><!-- /.col -->'+
														'</div><!-- /.row -->';
													}
													subprogramaCuerpo+='<div class="row ">'+
													'<div class="col-xs-3">'+
													'<strong>Departamento:</strong> '+
													'</div><!-- /.col -->'+
													'<div class="col-xs-9">';
				
													for(var q=0;q<departamentos.length; q++){
														if(departamentos[q].deptoPais == proyectos[k].codigoDepartamento){
															subprogramaCuerpo+=departamentos[q].abrevDepartamento;
														}
													}
													subprogramaCuerpo+='</div><!-- /.col -->'+
													'</div><!-- /.row -->';
												}
												subprogramaCuerpo+='</br>';
				
												var datosProductos = $.ajax({
													url:'ajaxSelects?accion=getProductosPresupuesto&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto+'&borrado=false',
													type:'get',
													dataType:'json',
													async:false       
												}).responseText;
												datosProductos = JSON.parse(datosProductos);
												datosProductos = datosProductos.producto;
												var cuerpoProducto="";
												if (datosProductos.length>=0){
													for(var c = 0; c < datosProductos.length; c++){
														cuerpoProducto="";
														var porDepto=0;
														var max=0;
														var porMes=0;
				
														if (c== 0){
															if(reporte.checkProgramacionAgregada=="on" && reporte.checkEstructura!="on"){
																subprogramaCuerpo+='<div class="row">'+
																'<div class="col-md-12">'+
																'<h5><strong>Unidad Responsable: </strong>'+unidadResponsableNombre+'</h5>'+
																'</div>'+
																'</div>';
															}
														}
				
														//subprogramaCuerpo+='<div style="page-break-before:always"></div><div class="row">'+
														subprogramaCuerpo+='<div class="row">'+
														'<div class="col-md-12">'+
														'<strong>PRODUCTO:</strong> '+datosProductos[c].producto_id;
				
														var unidadMedidaNonmbre="";
														for(var y = 0; y < productos.length; y++){
															if(productos[y].codigoCatalogo == datosProductos[c].producto_id){
																subprogramaCuerpo+='-'+productos[y].nombreCatalogo+'-';
				
																for(var d = 0; d < unidadesMedida.length; d++){
																	if(unidadesMedida[d].codigoUnidadMedida == datosProductos[c].unidad_medida_id){
																		subprogramaCuerpo+=", <strong>U.M.:</strong> "+unidadesMedida[d].nombre;
																		unidadMedidaNonmbre=unidadesMedida[d].nombre;
																	}
																}
																subprogramaCuerpo+='- <strong>TIPO:</strong> '+productos[y].clase;
																if (reporte.checkProgramacion=="on" || reporte.checkProgramacionAgregada=="on"){
																	if(productos[y].clase == "N"){
																		porDepto=getMetaSumaNPorMes(usuarios[0].nivel_id, usuarios[0].entidad_id, l, programas[m].codigoPrograma, subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id);
																		porMes=getMetaSumaPorMes(usuarios[0].nivel_id, usuarios[0].entidad_id, l, programas[m].codigoPrograma, subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id);
				
																		if(porMes.length > 0){
				
																			mayorVec = new Array(12);
																			mayorVec[0] = porMes[0].suma;
																			mayorVec[1] = porMes[1].suma;
																			mayorVec[2] = porMes[2].suma;
																			mayorVec[3] = porMes[3].suma;	
																			mayorVec[4] = porMes[4].suma;
																			mayorVec[5] = porMes[5].suma;
																			mayorVec[6] = porMes[6].suma;
																			mayorVec[7] = porMes[7].suma;	
																			mayorVec[8] = porMes[8].suma;
																			mayorVec[9] = porMes[9].suma;
																			mayorVec[10] = porMes[10].suma;
																			mayorVec[11] = porMes[11].suma;
				
																			for (var rec = 0; rec < mayorVec.length; rec++){
																				max += porMes[rec].suma;
																			}
																		}//fin if
																	} 
																	if(productos[y].clase == "C"){
																		porDepto=getMetaMayorPorDepto(usuarios[0].nivel_id, usuarios[0].entidad_id, l, programas[m].codigoPrograma, subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id);
																		porMes=getMetaSumaPorMes(usuarios[0].nivel_id, usuarios[0].entidad_id, l, programas[m].codigoPrograma, subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id);
																		
																		var mayorVec = new Array(12);
																		mayorVec[0] = porMes[0].suma;
																		mayorVec[1] = porMes[1].suma;
																		mayorVec[2] = porMes[2].suma;
																		mayorVec[3] = porMes[3].suma;	
																		mayorVec[4] = porMes[4].suma;
																		mayorVec[5] = porMes[5].suma;
																		mayorVec[6] = porMes[6].suma;
																		mayorVec[7] = porMes[7].suma;	
																		mayorVec[8] = porMes[8].suma;
																		mayorVec[9] = porMes[9].suma;
																		mayorVec[10] = porMes[10].suma;
																		mayorVec[11] = porMes[11].suma;
				
																		max=Math.max.apply(null, mayorVec);
																	}																	
																	if(max>0){// si suma es 0 no se hace el toFixed
																		subprogramaCuerpo+=", <strong>Meta 2018:</strong> "+numeroConComa(max.toFixed(2));
																	} else {
																		subprogramaCuerpo+=", <strong>Meta 2018:</strong> "+max;
																	}
																}//fin check programacion
															}
														}
														subprogramaCuerpo+='</div><!-- /.col -->'+
														'</div><!-- /row -->';
														if (reporte.checkProgramacion=="on"){			
															var metaProducto=getMetaProductos(usuarios[0].nivel_id, usuarios[0].entidad_id, l, programas[m].codigoPrograma, subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id);   
				
															if(porDepto.length > 0 && metaProducto.length > 0){
				
																subprogramaCuerpo+=renderProductoMetaFisica(metaProducto, porDepto,porMes,max);
															}
															porDepto =  "";
															porMes = "";
															max=0;
														}// fin check programacion
				
														if (reporte.checkCadena=="on"){
															subprogramaCuerpo+=getReporteCadenaValor(usuarios[0].nivel_id,usuarios[0].entidad_id,l,programas[m].codigoPrograma,subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id);
														}
														if(reporte.checkDestinatarios=="on"){
															subprogramaCuerpo+=getReporteDestinatario(usuarios[0].nivel_id,usuarios[0].entidad_id,l,programas[m].codigoPrograma,subprogramas[v].id,proyectos[k].codigoProyecto,datosProductos[c].producto_id)
														}
													}// fin datosProducto
													
												}
												$("#reporteCuerpo").append(subprogramaCuerpo);
												subprogramaCuerpo="";
											}
										}
									}	//fin de proyectos
								  }
							
							}
						}
						//$("#reporteCuerpo").append(programasCuerpo);
						//$("#reporteCuerpo").append(subprogramaCuerpo);
						//$('#departamento-programa-reporte-'+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+' option[value="'+programas[m].codigoDepartamento+'"]').attr("selected", "selected");
					}
				}
			}
		}
	}

	if (reporte.checkIndicadores=="on"){
		renderIndicadores(proyectosFiltro);
	}   

	$("#imprimirReporteInstButton").show();
	$("#spinGenerarReporte").hide();
	$("#anexos").addClass("no-print");
	if(reporte.checkPnd=="no"){
		$("#anexos").show();
		$("#anexos").removeClass("no-print");
	}
});

$("body").on("click", "#imprimirReporteInst",function(event){
	$("#reporteCuerpo").parent().css("border","0");
	$("body").addClass("sidebar-collapse");
	window.print();
	$("#reporteCuerpo").parent().css("border","");
	$("body").removeClass("sidebar-collapse");
});
