Number.prototype.round = function(p) {
  p = p || 10; 
  return parseFloat( this.toFixed(p) );
};


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

//function construirTabla(origen, selector, ignorar) {
//    var columns = agregarEncabezados(origenJson, selector, ignorar);
//
//    for (var i = 0 ; i < origenJson.length ; i++) {vincular-cadena-valor
//        var row$ = $('<tr/>');
//        for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
//            var cellValue = origenJson[i][columns[colIndex]];
//
//            if (cellValue == null) { cellValue = ""; }
//
//            row$.append($('<td/>').html(cellValue));
//        }
//        $(selector).append(row$);
//    }
//}
//
//function agregarEncabezados(origenJson, selector, ignorar)
//{
//    var columnSet = [];
//    var headerTr$ = $('<tr/>');
//    var columnIgnore=[];
//
//    for (var i = 0 ; i < origenJson.length ; i++) {
//        var rowHash = origenJson[i];
//        for (var key in rowHash) {
//            if ($.inArray(key, columnSet) == -1){
//                columnSet.push(key);
//                headerTr$.append($('<th/>').html(key));
//            }
//        }
//    }
//    $(selector).append(headerTr$);
//
//    return columnSet;
//}

function cargarObjetivosSugeridos(idObjetivo, tipoObjetivoSugerido){
	var getObjetivosSugeridos = $.ajax({
         url:'/ajaxSelects?accion=getObjetivoSugerido&objetivoId='+idObjetivo+'&objetivoSugeridoTipoId='+tipoObjetivoSugerido,
         type:'get',
         dataType:'json',
         async:false       
       }).responseText;
	getObjetivosSugeridos=JSON.parse(getObjetivosSugeridos);
	
	if (getObjetivosSugeridos.success){
		getObjetivosSugeridos=getObjetivosSugeridos.sugeridos;
		var objetivosSugeridos=[];
		
		for(var i = 0; i < getObjetivosSugeridos.length ; i++){
			if(!getObjetivosSugeridos[i].borrado){
				var datosObjetivo = $.ajax({
			        url:'/ajaxSelects?accion=getObjetivos&objetivoId='+getObjetivosSugeridos[i].objetivoSugeridoId+'&tipoObjetivoId='+getObjetivosSugeridos[i].objetivoSugeridoTipoId+'&anho='+getObjetivosSugeridos[i].objetivoSugeridoAnho+'&version='+getObjetivosSugeridos[i].objetivoSugeridoVersion,
			        type:'get',
			        dataType:'json',
			        async:false       
			      }).responseText;
				datosObjetivo=JSON.parse(datosObjetivo);
				datosObjetivo=datosObjetivo.objetivos;
				objetivosSugeridos.push(datosObjetivo[0]);
			}
		}
		
		return objetivosSugeridos;
		
		
	}else{
		return "[{}]";
	}
};

function cargarObjetivosVinculados(idObjetivo, tipoObjetivoRelId, anho, version, productoConcat){
	var cadena=[];
	var getObjetivosVinculados = $.ajax({
         url:'/ajaxSelects?accion=getObjetivoHasObjetivo&objetivoId='+idObjetivo+'&objetivoRelTipoObjetivoId='+tipoObjetivoRelId+'&anho='+anho+'&objetivoVersion='+version+'&productoConcat='+productoConcat,
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
		        url:'/ajaxSelects?accion=getObjetivos&objetivoId='+getObjetivosVinculados[i].objetivoRelId+'&tipoObjetivoId='+getObjetivosVinculados[i].relTipoObjetivoId+'&anho='+getObjetivosVinculados[i].relAnho+'&version='+getObjetivosVinculados[i].relVersion,
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


function cargarCadenaValor(nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, anho, version, objetivoIdParam, objetivoTipoIdParam){
	//paramentros generarl, inicializaciones
	function compareId(a,b) {  
		if (a.id < b.id) return -1;
		if (a.id > b.id) return 1;
		return 0;
		}
	
	if (typeof(anho) == 'undefined'||anho == null) {anho="2016";}
	if (typeof(version) == 'undefined'||version == null) {version="3";}
	anho="2016";version="3"
	var objetivoRelTipoIdParam=objetivoTipoIdParam-1;
	var tituloVinculados="";var tituloSugeridos=""; var otroTitulos="";
	if (objetivoTipoIdParam=="3"){ tituloVinculados= "Resultados Esperados Vinculados";tituloSugeridos="Resultados Sugeridos"; otroTitulos="Otros Resultados";}
	if (objetivoTipoIdParam=="2"){ tituloVinculados= "Objetivos Estratégicos Vinculados";tituloSugeridos="Objetivos Estratégicos Sugeridos"; otroTitulos="Otros Objetivos";}
	var datosResultados = $.ajax({
        url:'/ajaxSelects?accion=getObjetivos&tipoObjetivoId='+objetivoRelTipoIdParam+'&borrado=false',//TODO: Falta año, version borrado
        type:'get',
        dataType:'json',
        async:false       
      }).responseText;
	datosResultados=JSON.parse(datosResultados);
	datosResultados=datosResultados.objetivos;
	datosResultados=datosResultados.sort(compareId);
	
//	var optionObjetivos="";
//	for(i = 0;i<datosResultados.length; i++){
//		optionObjetivos+='<option value="'+datosResultados[i].id+'">'+datosResultados[i].id+") "+datosResultados[i].nombre+'</option>';
//	}
	
	
	
	var productoConcat=nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
	
	//render primera tabla de resultados previamientoe vinculados
	var idsDeResultadosVinculados=[];
	var datosFiltrados = [];
	var sumaContrib = 0;
	var datosResultadosVinculados=cargarObjetivosVinculados(objetivoIdParam,objetivoRelTipoIdParam,anho,version,productoConcat);
	var tablaResultadoEsperadoVinculado= '<div class="col-md-12">'+
		'<table id="tablaResultadosVinculados" class="table table-striped table-bordered  table-hover">'+
			'<tr><th>'+tituloVinculados+'</th><th>Contrib.</th><th>Influe.</th><th>Acciones</th></tr>';
	for(var i = 0; i < datosResultadosVinculados[0].length ; i++){
		if (!datosResultadosVinculados[0][i].borrado||!datosResultadosVinculados[1][i].borrado){
			idsDeResultadosVinculados.push(datosResultadosVinculados[1][i].id);
			datosFiltrados.push(datosResultadosVinculados[1][i].id);
			 tablaResultadoEsperadoVinculado+='<tr>'+
						'<td class="nombreREV">'+datosResultadosVinculados[1][i].nombre+'</td><td class="valContrib">'+datosResultadosVinculados[0][i].colaboracion+'</td><td>'+datosResultadosVinculados[0][i].influencia+'</td>'+
			 			'<td class="btn-group-vertical">'+
				 			'<button type="button" class="btn btn-info indicadores-modal-objetivo" data-toggle="modal" data-target="#indicador-modal-producto-'+productoConcat+'" id="indicadores-modal-objetivo-'+productoConcat+'-'+datosResultadosVinculados[1][i].id+'-'+datosResultadosVinculados[1][i].tipo_objetivo_id+'-'+datosResultadosVinculados[1][i].anho+'-'+datosResultadosVinculados[1][i].version+'-'+datosResultadosVinculados[0][i].objetivoId+'-'+datosResultadosVinculados[0][i].tipoObjetivoId+'-'+datosResultadosVinculados[0][i].objetivoAnho+'-'+datosResultadosVinculados[0][i].objetivoVersion+'">Indicadores</button>';
			if(rol_jsp < 3){
				tablaResultadoEsperadoVinculado += '<button type="button" class="btn btn-warning modificar-contrib-resultado" id="modificar-contrib-resultado-'+productoConcat+'-'+datosResultadosVinculados[1][i].id+'-'+datosResultadosVinculados[1][i].tipo_objetivo_id+'-'+datosResultadosVinculados[1][i].anho+'-'+datosResultadosVinculados[1][i].version+'-'+datosResultadosVinculados[0][i].objetivoId+'-'+datosResultadosVinculados[0][i].tipoObjetivoId+'-'+datosResultadosVinculados[0][i].objetivoAnho+'-'+datosResultadosVinculados[0][i].objetivoVersion+'">Modificar Contrib</button>';
			}
			if (rol_jsp == 0){
			 tablaResultadoEsperadoVinculado+='<button type="button" class="btn btn-secondary modificar-influe-resultado" id="modificar-influe-resultado-'+productoConcat+'-'+datosResultadosVinculados[1][i].id+'-'+datosResultadosVinculados[1][i].tipo_objetivo_id+'-'+datosResultadosVinculados[1][i].anho+'-'+datosResultadosVinculados[1][i].version+'-'+datosResultadosVinculados[0][i].objetivoId+'-'+datosResultadosVinculados[0][i].tipoObjetivoId+'-'+datosResultadosVinculados[0][i].objetivoAnho+'-'+datosResultadosVinculados[0][i].objetivoVersion+'">Modificar Influe</button>';
			}
			if(objetivoTipoIdParam == "3" && rol_jsp <= 3){
				 tablaResultadoEsperadoVinculado+='<button type="button" class="btn btn-success vincular-indicador-pnd" id="vincular-indicador-pnd-'+productoConcat+'-'+datosResultadosVinculados[1][i].id+'-'+datosResultadosVinculados[1][i].tipo_objetivo_id+'-'+datosResultadosVinculados[1][i].anho+'-'+datosResultadosVinculados[1][i].version+'-'+datosResultadosVinculados[0][i].objetivoId+'-'+datosResultadosVinculados[0][i].tipoObjetivoId+'-'+datosResultadosVinculados[0][i].objetivoAnho+'-'+datosResultadosVinculados[0][i].objetivoVersion+'">Vincular a PND</button>';
			}
			if(rol_jsp < 3){
			 tablaResultadoEsperadoVinculado+='<button type="button" class="btn btn-danger desvincular-indicador-resultado" id="desvincular-indicador-resultado-'+productoConcat+'-'+datosResultadosVinculados[1][i].id+'-'+datosResultadosVinculados[1][i].tipo_objetivo_id+'-'+datosResultadosVinculados[1][i].anho+'-'+datosResultadosVinculados[1][i].version+'-'+datosResultadosVinculados[0][i].objetivoId+'-'+datosResultadosVinculados[0][i].tipoObjetivoId+'-'+datosResultadosVinculados[0][i].objetivoAnho+'-'+datosResultadosVinculados[0][i].objetivoVersion+'">Desvincular</button>';
			}
					    '</td>'+
					'</tr>';
			sumaContrib = sumaContrib + datosResultadosVinculados[0][i].colaboracion;
		}
	
	}
	if (sumaContrib <= 1){//Si la contribución total es mayor a uno lo marca en color rojo.
		tablaResultadoEsperadoVinculado+='<tr style="font-weight: bold;"><td>Total de contribución: </td><td id="totalContrib">'+sumaContrib.round(2)+'</td></tr>'
	} else {
		tablaResultadoEsperadoVinculado+='<tr style="font-weight: bold;"><td>Total de contribución: </td><td id="totalContrib" style="color: red;">'+sumaContrib.round(2)+'</td></tr>'
	}
	
	tablaResultadoEsperadoVinculado+='</table></div>';
	
	//render de segunda tabla de resultados sugeridos para su vinculacion
	var datosResultadosSugeridos=cargarObjetivosSugeridos(objetivoIdParam,objetivoRelTipoIdParam);
	var tablaResultadoSugerido;
	var tablaOtros;
	var tablaResultadoSugerido=	'<div class="col-md-12">'+
									'<table class="table table-striped table-bordered table-hover" id="dataTablesResultadoSugerido">'+
										'<thead>'+
											'<tr class="active"><th colspan="3">'+tituloSugeridos+'</th></tr>'+
											'<tr class="active"><th>Id</th><th>Nombre</th><th>Administrar</th></tr>'+
										'</thead>'+
										'<tbody>';
											
											for(var i = 0; i < datosResultadosSugeridos.length ; i++){
												if (idsDeResultadosVinculados.indexOf(datosResultadosSugeridos[i].id)<0){
												   if (datosResultadosSugeridos[i].borrado==false){
													   tablaResultadoSugerido += '<tr><td>'+datosResultadosSugeridos[i].id+'</td><td>'+datosResultadosSugeridos[i].nombre+'</td><td>';
														if(rol_jsp < 3){
															tablaResultadoSugerido += '<button type="button" class="btn btn-success vincular-indicador-resultado" id="vincular-indicador-resultado-'+productoConcat+'-'+datosResultadosSugeridos[i].id+'-'+datosResultadosSugeridos[i].tipo_objetivo_id+'-'+datosResultadosSugeridos[i].anho+'-'+datosResultadosSugeridos[i].version+'-'+objetivoIdParam+'-'+objetivoTipoIdParam+'-'+anho+'-'+version+'">Agregar</button>';
														}
														tablaResultadoSugerido += '</td></tr>';
												   }
												   datosFiltrados.push(datosResultadosSugeridos[i].id);
												}
											}
			 tablaResultadoSugerido += '</tbody>'+
									'</table>'+
								'</div>';
	
	 var tablaOtros ='<div class="col-md-12">'+
						'<table class="table table-striped table-bordered table-hover" id="dataTablesOtros">'+
							'<thead>'+
								'<tr class="active"><th colspan="3">'+otroTitulos+'</th></tr>'+
								'<tr class="active"><th>Id</th><th>Nombre</th><th>Administrar</th></tr>'+
							'</thead>'+
							'<tbody>';
	 
								for(var j = 0; j < datosResultados.length; j++){
									if (datosFiltrados.indexOf(datosResultados[j].id)<0 && datosResultados[j].borrado==false){
										tablaOtros += '<tr><td>'+datosResultados[j].id+'</td><td>'+datosResultados[j].nombre+'</td><td>';
										if(rol_jsp < 3){
											tablaOtros += '<button type="button" class="btn btn-success vincular-indicador-resultado" id="vincular-indicador-resultado-'+productoConcat+'-'+datosResultados[j].id+'-'+objetivoRelTipoIdParam+'-'+anho+'-'+version+'-'+objetivoIdParam+'-'+objetivoTipoIdParam+'-'+anho+'-'+version+'">Agregar</button>';
										}
										tablaOtros +='</td></tr>';
									}
								}
								
				tablaOtros +='</tbody>'+
						'</table>'+
						'</div>';

 		var dato = [];
 		dato.push(tablaResultadoEsperadoVinculado);
 		dato.push(tablaResultadoSugerido);
 		dato.push(tablaOtros);
 		return dato;
}
    
	var seleccionPrevia;    
    $("body").on("focus", ".intermedioClass",function(event){
    	seleccionPrevia = this.value;
    });
    
    $("body").on("change", ".intermedioClass",function(event){
    	
    	var id=this.id
    	var res=id.split("-");
    	if (rol_jsp == 0 || rol_jsp == 1){
    			
    		seleccionPrevia = this.value;
    		//id="intermedio-'+nivel+'-'+ent+'-'+tip+'-'+pro+'-'+subp+'-'+proy+'-'+um+'-'+prod+'-'+anho+'-'+nf+'-'+prod
    		if(this.value=="intermedio"){
    			
    			var productoPresupuesto= new Object();
    			productoPresupuesto.intermedio=true;
    			
    			productoPresupuesto.nivel_id=res[1];
    			productoPresupuesto.entidad_id=res[2];
    			productoPresupuesto.tipo_presupuesto_id=res[3];
    			productoPresupuesto.programa_id=res[4];
    			productoPresupuesto.subprograma_id=res[5];
    			productoPresupuesto.proyecto_id=res[6];
    			productoPresupuesto.producto_id=res[7];
    			productoPresupuesto.unidad_medida_id=res[8];
    			productoPresupuesto.anho=res[9];
    			productoPresupuesto.numero_fila=res[10];
    			productoPresupuesto.id=res[11];
    			
    			//productoPresupuesto.version=res[11];
    				    
    			$.ajax({
    		        url: "ajaxUpdate?accion=actProductoPresupuestoIntermedio",
    		        type: 'POST',
    		        dataType: 'json',
    		        data: JSON.stringify(productoPresupuesto),
    		        contentType: 'application/json',
    		        mimeType: 'application/json',
    		        success: function (data) {
    		        	if(data.success == true){
    						//alert("Exito!");				
    		    		}else{
    						alert("ERROR");
    					}        	
    		        },
    		        error: function(data,status,er) {
    		        	alert("ERROR function");
    		        }
    			});
    		}else{
    			//final
    			if(this.value=="final"){
    				var productoPresupuesto= new Object();
    				productoPresupuesto.intermedio=false;
    				
    				productoPresupuesto.nivel_id=res[1];
    				productoPresupuesto.entidad_id=res[2];
    				productoPresupuesto.tipo_presupuesto_id=res[3];
    				productoPresupuesto.programa_id=res[4];
    				productoPresupuesto.subprograma_id=res[5];
    				productoPresupuesto.proyecto_id=res[6];
    				productoPresupuesto.producto_id=res[7];
    				productoPresupuesto.unidad_medida_id=res[8];
    				productoPresupuesto.anho=res[9];
    				productoPresupuesto.numero_fila=res[10];
    				productoPresupuesto.id=res[11];
    				
    				//productoPresupuesto.version=res[11];
    					    
    				$.ajax({
    			        url: "ajaxUpdate?accion=actProductoPresupuestoIntermedio",
    			        type: 'POST',
    			        dataType: 'json',
    			        data: JSON.stringify(productoPresupuesto),
    			        contentType: 'application/json',
    			        mimeType: 'application/json',
    			        success: function (data) {
    			        	if(data.success == true){
    							//alert("Exito!");				
    			    		}else{
    							alert("ERROR");
    						}        	
    			        },
    			        error: function(data,status,er) {
    			        	alert("ERROR function");
    			        }
    				});
    			}
    		}
    	}else{		
    		alert("No tiene permisos para editar ésta opción");
    		$(this).val(seleccionPrevia);
    	}
    });

$("body").on("click", ".classEtiqueta",function(event){
	
	if (rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
		if($(this).is(':checked')) {
			var id=this.id
			var res = id.split("-");	
			
			var etiquetapresupuesto= new Object();
			
			etiquetapresupuesto.productoConcat=res[1]+"-"+res[2]+"-"+res[3]+"-"+res[4]+"-"+res[5]+"-"+res[6]+"-"+res[7];
			etiquetapresupuesto.etiquetaId=res[8];
			etiquetapresupuesto.productoId=res[7];
			etiquetapresupuesto.proyectoId=res[6];
			etiquetapresupuesto.subProgramaId=res[5];
			etiquetapresupuesto.programaId=res[4];
			etiquetapresupuesto.tipoPresupuestoId=res[3];
			etiquetapresupuesto.entidadId=res[2];
			etiquetapresupuesto.nivelId=res[1];
			etiquetapresupuesto.version="3";
			etiquetapresupuesto.anho="2016";
			//etiquetapresupuesto.id="0";
			
			//"cmbEtiqueta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+producto+"-"+datosEtiquetas[c].id
			
			$.ajax({
		        url: "ajaxInserts?accion=insPresupuestoEtiquetas",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(etiquetapresupuesto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
						//alert("Exito!");				
		    		}else{
						//alert("ERROR");
					}        	
		        },
		        error: function(data,status,er) {
		        	//alert("ERROR function");
		        }
		 });		
		}else{
			//borrar presupuestoEtiquetas
			var id=this.id
			var res = id.split("-");	
			
			var etiquetapresupuesto= new Object();
			
			etiquetapresupuesto.productoConcat="";
			etiquetapresupuesto.etiquetaId=res[8];
			etiquetapresupuesto.productoId=res[7];
			etiquetapresupuesto.proyectoId=res[6];
			etiquetapresupuesto.subProgramaId=res[5];
			etiquetapresupuesto.programaId=res[4];
			etiquetapresupuesto.tipoPresupuestoId=res[3];
			etiquetapresupuesto.entidadId=res[2];
			etiquetapresupuesto.nivelId=res[1];
			etiquetapresupuesto.version="3";
			etiquetapresupuesto.anho="2016";
					
			$.ajax({
		        url: "ajaxDelete?accion=delPresupuestoEtiqueta&productoId="+etiquetapresupuesto.productoId+"&proyectoId="+etiquetapresupuesto.proyectoId+"&subprogramaId="+etiquetapresupuesto.subProgramaId+"&programaId="+etiquetapresupuesto.programaId+"&tipoPresupuestoId="+etiquetapresupuesto.tipoPresupuestoId+"&entidadId="+etiquetapresupuesto.entidadId+"&nivelId="+etiquetapresupuesto.nivelId+"&etiquetaId="+etiquetapresupuesto.etiquetaId,
		        type: 'POST',
		        dataType: 'json',
		        //data: JSON.stringify(etiquetapresupuesto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
					//	alert("Exito!");				
		    		}else{
					//	alert("ERROR");
					}        	
		        },
		        error: function(data,status,er) {
		        //	alert("ERROR function");
		        }
		 });
			
		}
	}else{
		event.preventDefault();
	    event.stopPropagation();
		alert("No tiene permisos para editar ésta opción");
	}	
});
	 
validacion=false;
function Combo(){
	
    this.nivelFocus = function(){
	
   	  var listaDatalist=document.getElementsByTagName('datalist');
      var datosNiveles = $.ajax({
          url:'/ajaxSelects?accion=getNiveles',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;  
  
        
        datosNiveles = JSON.parse(datosNiveles);
		
        if(listaDatalist.length === 0 )
        {
	        var datalistNiveles = document.createElement('datalist');
	        datalistNiveles.setAttribute('id','listaf1c2');
	        datalistNiveles.setAttribute('size','5'); 
	        var ubicacionDatalistNiveles = document.getElementById('formulario');
	        ubicacionDatalistNiveles.appendChild(datalistNiveles);
	
	        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
	        {    
	        	var option = document.createElement('option');
	          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
	          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
	          	datalistNiveles.appendChild(option);      
	      	} 
        }
    } 

    this.nivel = function(){
    	//var rutaNivel = document.getElementById('nivel-formulario').value;
    	var rutaNivel = nivel_id_jsp;
    	var datosNiveles = $.ajax({
        	url:'/ajaxSelects?accion=getNiveles',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        
        datosNiveles = JSON.parse(datosNiveles);
      	for(var x = 0; x < datosNiveles.niveles.length; x++)
      	{
        	if(datosNiveles.niveles[x].nivel === parseInt(rutaNivel))
        	{
	        	var mostrarNivel = datosNiveles.niveles[x].nombreNivel;
	          	var nt=document.createTextNode(mostrarNivel+" >");
	          	var nparrafo=document.getElementById('f1c2');
	          	nparrafo.innerHTML="";
	          	nparrafo.appendChild(nt);
	        }
      	}
    }  


    this.entidadFocus = function(){ 
      	//var linkEntidad = document.getElementById('nivel-formulario').value;
    	var linkEntidad = nivel_id_jsp;
    	var datosEntidades = $.ajax({
         	 url:'/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosEntidades = JSON.parse(datosEntidades);
 
        var datalistEntidades = document.createElement('datalist'); 
        datalistEntidades.setAttribute('id','listaf2c2'); 
        var ubicacionDatalistEntidades = document.getElementById('formulario');
        ubicacionDatalistEntidades.appendChild(datalistEntidades);

        for(var i = 0; i < datosEntidades.entidades.length ; i++) 
        {       
        	var option = document.createElement('option');
          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
          	datalistEntidades.appendChild(option);      
      	}   
    } 


    this.entidad = function(){ 
    	//var linkEntidad = document.getElementById('nivel-formulario').value;
      	//var rutaEntidad2 = document.getElementById('entidad-formulario').value;
    	var linkEntidad = nivel_id_jsp;
      	var rutaEntidad2 = entidad_id_jsp;
      	

      	var datosEntidades = $.ajax({
        	url:'/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosEntidades = JSON.parse(datosEntidades);
 
    	for(var x = 0; x < datosEntidades.entidades.length; x++)
      	{
        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
        	{
        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
          		var nt=document.createTextNode(mostrarEntidad);
          		var nparrafo=document.getElementById('f2c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
        	} 
      	} 
    }  

    this.tipoProgramaFocus = function(){

    	var rutaNivel = nivel_id_jsp;
    	var datosNiveles = $.ajax({
        	url:'/ajaxSelects?accion=getNiveles',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

		if ( $("#listaf3c2").length ) {
			$("#listaf3c2").remove();
			$('#tipoPrograma-formulario').val('');
			$("#listaf4c2").remove();
			$('#programa-formulario').val('');
			$("#listaf5c2").remove();
			$('#subPrograma-formulario').val('');
			$("#listaf6c2").remove();
			$('#proyecto-formulario').val('');
			$("#listaf7c2").remove();
		}
		
        
        datosNiveles = JSON.parse(datosNiveles);
      	for(var y = 0; y < datosNiveles.niveles.length; y++)
      	{
        	if(datosNiveles.niveles[y].nivel === parseInt(rutaNivel))
        	{
	        	var mostrarNivel = datosNiveles.niveles[y].nombreNivel;
	          	var nt=document.createTextNode(mostrarNivel+" >");
	          	var nparrafo=document.getElementById('f1c2');
	          	nparrafo.innerHTML="";
	          	nparrafo.appendChild(nt);
	        }
      	}
    	
    	var linkEntidad = nivel_id_jsp;
      	var rutaEntidad2 = entidad_id_jsp;
      	

      	var datosEntidades = $.ajax({
        	url:'/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosEntidades = JSON.parse(datosEntidades);
 
    	for(var x = 0; x < datosEntidades.entidades.length; x++)
      	{
        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
        	{
        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
          		var nt=document.createTextNode(mostrarEntidad);
          		var nparrafo=document.getElementById('f2c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
        	} 
      	} 
    	   	
    	
      	var datosTipoPrograma = $.ajax({
        	url:'/ajaxSelects?accion=getTiposPrograma',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosTipoPrograma = JSON.parse(datosTipoPrograma);
        var datalistEntidades = document.createElement('datalist'); 
        datalistEntidades.setAttribute('id','listaf3c2'); 
        var ubicacionDatalistEntidades = document.getElementById('formulario');
        ubicacionDatalistEntidades.appendChild(datalistEntidades);

        for(var i = 0; i < datosTipoPrograma.tiposPrograma.length ; i++) 
        {       
        	var option = document.createElement('option');
          	option.setAttribute('value',datosTipoPrograma.tiposPrograma[i].numeroFila);
          	option.setAttribute('label',datosTipoPrograma.tiposPrograma[i].nombreTipoPrograma);
          	datalistEntidades.appendChild(option);      
      	}      
    }
    this.tipoPrograma = function(){
    	//var linkTipoPrograma = parseInt(document.getElementById('row-body-programacionfisica').value);
    	var linkTipoPrograma = parseInt(document.getElementById('tipoPrograma-formulario').value);
    	validacion=false;
    	
      	var datosTipoPrograma = $.ajax({
        	url:'/ajaxSelects?accion=getTiposPrograma',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosTipoPrograma = JSON.parse(datosTipoPrograma);
 
    	for(var x = 0; x < datosTipoPrograma.tiposPrograma.length; x++)
      	{
        	if(datosTipoPrograma.tiposPrograma[x].numeroFila === parseInt(linkTipoPrograma)) 
        	{
        		var mostrarTipoPrograma = datosTipoPrograma.tiposPrograma[x].nombreTipoPrograma;
          		var nt=document.createTextNode(mostrarTipoPrograma);
          		var nparrafo=document.getElementById('f3c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
          		validacion=true;
        	} 
      	}
    	if(validacion==false){
    		modalError("Estructura inexistente, favor intente de nuevo",false);    		
    		$("#tipoPrograma-formulario").val("");    		
    	}
    }

    this.programasFocus = function(){
      	//var linkNivel = document.getElementById('nivel-formulario').value;
      	//var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
      	var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
      	
		if ( $("#listaf4c2").length ) {
			$("#listaf4c2").remove();
			$('#programa-formulario').val('');
			$("#listaf5c2").remove();
			$('#subPrograma-formulario').val('');
			$("#listaf6c2").remove();
			$('#proyecto-formulario').val('');
			$("#listaf7c2").remove();
		}

		if(isNaN(linkTipoPrograma)==false){
			var datosProgramas = $.ajax({
	        	url:'/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	        }).responseText;
	        
	        datosProgramas = JSON.parse(datosProgramas);
	        $("#listaf4c2").remove();
	        var datalistProgramas = document.createElement('datalist');
	        datalistProgramas.setAttribute('id','listaf4c2'); 
	        var ubicacionDatalistProgramas = document.getElementById('formulario');
	        ubicacionDatalistProgramas.appendChild(datalistProgramas);

	        for(var i = 0; i < datosProgramas.programas.length ; i++) 
	        {       
		        var option = document.createElement('option');
	    	    option.setAttribute('value',datosProgramas.programas[i].codigoPrograma);
	    	    option.setAttribute('label',datosProgramas.programas[i].nombrePrograma);
	        	datalistProgramas.appendChild(option);       
	      	}
		}
    }
    this.programas = function(){
      	//var linkNivel = document.getElementById('nivel-formulario').value;
      	//var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
      	var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
      	var numeroProgramaIngresado = document.getElementById("programa-formulario").value;
      	validacion=false;

      	if(isNaN(linkTipoPrograma)==true){
      		modalError("Debe ingresar valor para tipo de programa, favor intente de nuevo",false);
      		$("#programa-formulario").val("");
      	}else{
      		var datosProgramas = $.ajax({
            	url:'/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
              	type:'get',
              	dataType:'json',
              	async:false       
            }).responseText;

            datosProgramas = JSON.parse(datosProgramas);
    	    for(var x = 0; x < datosProgramas.programas.length; x++)
        	{
            	if(datosProgramas.programas[x].codigoPrograma === parseInt(numeroProgramaIngresado))
            	{
            		var mostrarNombrePrograma = datosProgramas.programas[x].nombrePrograma;
    		        var nt=document.createTextNode(mostrarNombrePrograma);
    		        var nparrafo=document.getElementById('f4c2');
    		        nparrafo.innerHTML="";
    		        nparrafo.appendChild(nt);
    		        validacion=true;
    		    }
          	}
    	    if(validacion==false){
    	    	modalError("Estructura inexistente, favor intente de nuevo",false);    		
        		$("#programa-formulario").val("");    		
        	}
      	}    	
    } 

    this.subProgramasFocus = function(){
	    //var linkNivel = document.getElementById('nivel-formulario').value;
	    //var linkEntidad = document.getElementById('entidad-formulario').value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;    	
	    var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
	    var linkPrograma = parseInt(document.getElementById("programa-formulario").value);
	    
		if ( $("#listaf5c2").length ) {
			$("#listaf5c2").remove();
			$('#subPrograma-formulario').val('');
			$("#listaf6c2").remove();
			$('#proyecto-formulario').val('');
			$("#listaf7c2").remove();
		}

		
		if(isNaN(linkTipoPrograma)==false || isNaN(linkPrograma)==false){
			var datosSubProgramas = $.ajax({
	        	url:'/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	        }).responseText;

	        datosSubProgramas = JSON.parse(datosSubProgramas);

	        var datalistSubProgramas = document.createElement('datalist');
	        datalistSubProgramas.setAttribute('id','listaf5c2'); 
	        var ubicacionDatalistProgramas = document.getElementById('formulario');
	        ubicacionDatalistProgramas.appendChild(datalistSubProgramas);

	          for(var i = 0; i < datosSubProgramas.subprogramas.length ; i++) 
	          {       
	          var option = document.createElement('option');
	          option.setAttribute('value', datosSubProgramas.subprogramas[i].id);
	          option.setAttribute('label', datosSubProgramas.subprogramas[i].nombre);
	          datalistSubProgramas.appendChild(option);     

	          }
         } 
    } 
    this.subProgramas = function(){
	    //var linkNivel = document.getElementById('nivel-formulario').value;
	    //var linkEntidad = document.getElementById('entidad-formulario').value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
	    var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
	    var linkPrograma = parseInt(document.getElementById("programa-formulario").value);
	    var numeroSubProgramaIngresado = document.getElementById("subPrograma-formulario").value;
	    validacion=false;
	    
	    if(isNaN(linkTipoPrograma)==true || isNaN(linkPrograma)==true || isNaN(numeroSubProgramaIngresado)==true){
      		modalError("Debe ingresar valor para tipo de programa, favor intente de nuevo",false);
      		$("#subPrograma-formulario").val("");      		
	    }else{
	    	var datosSubProgramas = $.ajax({
	        	url:'/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	        }).responseText;

	        datosSubProgramas = JSON.parse(datosSubProgramas);

	      	for(var x = 0; x < datosSubProgramas.subprogramas.length; x++)
	      	{
	        	if(datosSubProgramas.subprogramas[x].id === parseInt(numeroSubProgramaIngresado))
	        	{
		        	var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombre;
		          	var nt=document.createTextNode(mostrarNombrePrograma);
		          	var nparrafo=document.getElementById('f5c2');
		          	nparrafo.innerHTML="";
		          	nparrafo.appendChild(nt);
		          	validacion=true;
		        }	        	
	      	}
	      	if(validacion==false){
    	    	modalError("Estructura inexistente, favor intente de nuevo",false);    		
        		$("#subPrograma-formulario").val("");    		
        	}
	    }	
    } 

    this.proyectoFocus = function(){
	    //var linkNivel = document.getElementById("nivel-formulario").value;
	    //var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
	    var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
	    var linkPrograma = parseInt(document.getElementById('programa-formulario').value);
	    var linkSubPrograma = parseInt(document.getElementById('subPrograma-formulario').value);
	    
		if ( $("#listaf6c2").length ) {
			$("#listaf6c2").remove();
			$('#proyecto-formulario').val('');
			$("#listaf7c2").remove();
		}

		if(isNaN(linkTipoPrograma)==false || isNaN(linkPrograma)==false || isNaN(linkSubPrograma)==false){
			var datosProyectos = $.ajax({
		          url:'/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
		          type:'get',
		          dataType:'json',
		          async:false       
		        }).responseText;

		        
		        datosProyectos = JSON.parse(datosProyectos);

		        var datalistProyectos = document.createElement('datalist');
		        datalistProyectos.setAttribute('id','listaf6c2'); 
		        var ubicacionDatalistProyectos = document.getElementById('formulario');
		        ubicacionDatalistProyectos.appendChild(datalistProyectos);

		          for(var i = 0; i < datosProyectos.proyectos.length ; i++) 
		          {       
		          var option = document.createElement('option');
		          option.setAttribute('value', datosProyectos.proyectos[i].codigoProyecto);
		          option.setAttribute('label', datosProyectos.proyectos[i].nombreProyecto);
		          datalistProyectos.appendChild(option);      
		      }
		} 
    }
    this.proyecto = function(){
	    //var linkNivel = document.getElementById("nivel-formulario").value;
	    //var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
	    var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
	    var linkPrograma = parseInt(document.getElementById('programa-formulario').value);
	    var linkSubPrograma = parseInt(document.getElementById('subPrograma-formulario').value);
	    var numeroProyectoIngresado = parseInt(document.getElementById("proyecto-formulario").value);
	    validacion=false;
	    
	    if(isNaN(linkTipoPrograma)==true || isNaN(linkPrograma)==true || isNaN(linkSubPrograma)==true || isNaN(numeroProyectoIngresado)==true){
      		modalError("Debe ingresar valor para tipo de programa, favor intente de nuevo",false);
      		$("#proyecto-formulario").val("");      		
	    }else{
	    	var datosProyectos = $.ajax({
	            url:'/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
	            type:'get',
	            dataType:'json',
	            async:false  
	          }).responseText;

	          datosProyectos = JSON.parse(datosProyectos);

	  	    for(var x = 0; x < datosProyectos.proyectos.length; x++)
	        {
	          	if(datosProyectos.proyectos[x].codigoProyecto === parseInt(numeroProyectoIngresado))
	          	{
	          		var mostrarNombreProyecto = datosProyectos.proyectos[x].nombreProyecto;
	            		var nt=document.createTextNode(mostrarNombreProyecto);
	            		var nparrafo=document.getElementById('f6c2');
	            		nparrafo.innerHTML="";
	            		nparrafo.appendChild(nt);
	            		validacion=true;
	          	}
	        }
	  	  if(validacion==false){
  	    	modalError("Estructura inexistente, favor intente de nuevo",false);    		
      		$("#proyecto-formulario").val("");    		
	  	  }
	    }	
    }

    this.dibujar = function(){
     	//var linkNivel = document.getElementById("nivel-formulario").value;
      	//var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
      	var linkTipoPresupuesto = parseInt(document.getElementById("tipoPrograma-formulario").value);
      	var linkPrograma = parseInt(document.getElementById("programa-formulario").value);
      	var linkSubPrograma = parseInt(document.getElementById("subPrograma-formulario").value);
      	var linkProyecto = parseInt(document.getElementById("proyecto-formulario").value);
      	var anho = $("#periodoSeleccion option:selected").val();
		var version = $("#versionSeleccion option:selected").val();

		var filaProduct2="";
        //var metasProducto = [];//obtenemos todas las metas de un producto x
		var totalMetaC;//obtenemos el total de las meta de un producto en caso de ser del tipo C "constante" diferencia es que suma todas las metas dividido 12 PROMEDIO
		var totalMetaN;//obtenemos el total de las meta de un producto en caso de ser del tipo N suma todas las metas sin dividir
		var band;
		var cont = 0;
		var todosLosProductos = [];
		var contador=0;
			
/*		var todosLosProductosHacienda = $.ajax({
          url:'/ajaxSelects?accion=getPivotProductoFisico&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&anho='+anho,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
		todosLosProductosHacienda = JSON.parse(todosLosProductosHacienda);*/

      	if(isNaN(linkNivel)==false && isNaN(linkEntidad)==false && isNaN(linkTipoPresupuesto)==false && isNaN(linkPrograma)==false &&
      			isNaN(linkSubPrograma)==false && isNaN(linkProyecto)==false){
      	
      //crear nuevo producto
    	$("#anho-crear-producto").attr("value",2017);
    	$("#nivel-crear-producto").attr("value",linkNivel);
    	$("#entidad-crear-producto").attr("value",linkEntidad);
    	$("#tipo-crear-producto").attr("value",linkTipoPresupuesto);
    	$("#programa-crear-producto").attr("value",linkPrograma);
    	$("#subprograma-crear-producto").attr("value",linkSubPrograma);
    	$("#proyecto-crear-producto").attr("value",linkProyecto);
    //	$("#crear-producto").toggle();
    	var optionProducto="";
    	var productos = $.ajax({
	    	url:'/ajaxSelects?accion=getProductos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	productos = JSON.parse(productos);
    	productos = productos.productos;
    	
        var datosProductos = $.ajax({
            url:'/ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
            type:'get',
            dataType:'json',
            async:false       
          }).responseText;
          datosProductos = JSON.parse(datosProductos);
          
  		for(r = 0;r<datosProductos.producto.length; r++){
  			todosLosProductos.push(datosProductos.producto[r].producto_id);
  			$("#programacionFisica-"+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[r].producto_id).remove(); //borra el modal si por ahi busca la misma estructura pero con el periodo diferente
		}
        
		for(var i = 0;i<productos.length; i++){
    			if (todosLosProductos.indexOf(productos[i].codigoCatalogo)<0){ 
    				optionProducto+='<option value="'+productos[i].codigoCatalogo+'">'+productos[i].codigoCatalogo+") "+productos[i].nombreCatalogo+'</option>';
    			}
    		}
        
//		for(i = 0;i<productos.length; i++){
//			optionProducto+='<option value="'+productos[i].codigoCatalogo+'">'+productos[i].codigoCatalogo+") "+productos[i].nombreCatalogo+'</option>';
//		}
//		
		$("#producto_id-crear-producto").append(optionProducto);
		
		var optionTiposDestinatarios="";
    	var  tiposDestinatarios= $.ajax({
	    	url:'ajaxSelects?accion=getTiposDestinatarios',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	tiposDestinatarios = JSON.parse(tiposDestinatarios);
    	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
    	
		for(i = 0;i<tiposDestinatarios.length; i++){
			optionTiposDestinatarios+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
		}
		//$("#producto_id-crear-producto").append(optionProducto);
		
		function numeroConComa(x) {
            return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }

     	var datosMeses = $.ajax({
          url:'/ajaxSelects?accion=getMeses',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        datosMeses = JSON.parse(datosMeses);

        var datosDepartamentos = $.ajax({
          url:'/ajaxSelects?accion=getDepartamentos',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        datosDepartamentos = JSON.parse(datosDepartamentos);


//      var datosProductos = $.ajax({
//          url:'/ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
//          type:'get',
//          dataType:'json',
//          async:false       
//        }).responseText;
//        datosProductos = JSON.parse(datosProductos);
        
        var objeto_gasto =  $.ajax({
	        url:'/ajaxSelects?accion=getObjetoGasto',
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
        objeto_gasto = JSON.parse(objeto_gasto);
        
    	var option_objeto_gasto="";
    	for(i = 0;i<objeto_gasto.length; i++){
    		if(objeto_gasto[i].id!=0){
    			option_objeto_gasto+='<option value="'+objeto_gasto[i].id+'">'+objeto_gasto[i].id+") "+objeto_gasto[i].nombre+'</option>';
    		}
    	}
        
        var fuente_financiamiento =  $.ajax({
	        url:'/ajaxSelects?accion=getFuenteFinanciamiento',
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
        fuente_financiamiento = JSON.parse(fuente_financiamiento);
        
        var option_fuente="";
    	for(i = 0;i<fuente_financiamiento.length; i++){
    		if(fuente_financiamiento[i].id!=0){
    			option_fuente+='<option value="'+fuente_financiamiento[i].id+'">'+fuente_financiamiento[i].id+") "+fuente_financiamiento[i].nombre+'</option>';
    		}
    	}
                       
        var organismo_financiador =  $.ajax({
	        url:'/ajaxSelects?accion=getOrganismoFinanciador',
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
        organismo_financiador = JSON.parse(organismo_financiador);
        
        var option_organismo="";
    	for(i = 0;i<organismo_financiador.length; i++){
    		if(organismo_financiador[i].id!=0){
    			option_organismo+='<option value="'+organismo_financiador[i].id+'">'+organismo_financiador[i].id+") "+organismo_financiador[i].nombre+'</option>';
    		}
    	}

        //Obtnemos solo los anhos y versiones que posee todo el sistema
        var anhos =  $.ajax({
	        url:'/ajaxSelects?accion=getAsignacionPresiAnho',
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	    anhos = JSON.parse(anhos);
	    
	    //Obtenemos los años que posee un proyecto determinado
	    var anhosPorProyecto =  $.ajax({
	        url:'/ajaxSelects?accion=getAsignacionPresiAnhoProyecto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoo='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	    anhosPorProyecto = JSON.parse(anhosPorProyecto);
	    
      var datosAsignacion =  $.ajax({
          url:'/ajaxSelects?accion=getAsignacionPresi&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&anho='+anho+'&versionReporte='+version,
          type:'get',
          dataType:'json',
          async:false 
        }).responseText;
      datosAsignacion = JSON.parse(datosAsignacion);
      
      //Obtenemos un array con los valores de un proyecto determinado con esto tenemos la lista de anho y version para seleccionar 
      var datosAsignacionPorProyecto =  $.ajax({
          url:'/ajaxSelects?accion=getAsignacionPresi&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto,
          type:'get',
          dataType:'json',
          async:false 
        }).responseText;
      datosAsignacionPorProyecto = JSON.parse(datosAsignacionPorProyecto);
      
      	
    var cajaSelector="";
  	var versiones = [];
    $("#row-body-programacionfisica").html(""); 
    
          

        for(var i = 0; i < datosProductos.producto.length ; i++) 
        {
                   
       		var contenedorDeProducto = document.createElement('div');
       		contenedorDeProducto.setAttribute('nivel',linkNivel);
   			contenedorDeProducto.setAttribute('entidad',linkEntidad);
			contenedorDeProducto.setAttribute('tipoPresupuesto',linkTipoPresupuesto);
			contenedorDeProducto.setAttribute('programa',linkPrograma);
			contenedorDeProducto.setAttribute('subprograma',linkSubPrograma);
			contenedorDeProducto.setAttribute('proyecto',linkProyecto);
			contenedorDeProducto.setAttribute('id',"producto-"+datosProductos.producto[i].id);
			contenedorDeProducto.setAttribute('producto',datosProductos.producto[i].id);
			contenedorDeProducto.setAttribute('class',"col-md-12");
			var cajaProductoFinanciero="";
			$('#programacionFinanciera-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id).remove();
			
			cajaProductoFinanciero+=' <!-- PRODUCTO -->'+
            '<div class="box box-info direct-chat direct-chat-info col-md-12" id="AsignacionFinanciera-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'">'+
            '<form class="form-horizontal" id="form-asig-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'" >'+
            	'<input type="hidden" name="accion" value="updateProductoFinaciero">'+
            	''+
              '<div class="box-header with-border">'+

            	'<h3 class="box-title" id="tituloProducto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"></h3>'+
            		'<div class="box-tools pull-right">'+
             //    '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
                '</div>'+
              '</div><!-- /.box-header -->'+
              '<div class="box-body" style="display:block;">'+
              '<div class="table-responsive">'+
                '<table class="table table-striped table-bordered  table-hover" id="tableAsignacion-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'">'+
                ' 	<thead><tr>'+
                '		<th>OG</th>'+
                '		<th>OF</th>'+
                '		<th>FF</th>'+
                '		<th>Ene</th>'+
                '		<th>Feb</th>'+
                '		<th>Mar</th>'+
                '		<th>Abr</th>'+
                '		<th>May</th>'+
                '		<th>Jun</th>'+
                '		<th>Jul</th>'+
                '		<th>Ago</th>'+
                '		<th>Set</th>'+
                '		<th>Oct</th>'+
                '		<th>Nov</th>'+
                '		<th>Dic</th>'+
                '		<th><b>Total</b></th>'+
                '	</tr></thead>'+
                '<tbody class="table-body-producto" categoria="finaciero" producto="'+producto+'-og" >';
                
			var totalTotal = 0;
			var objetoGasto = new Array();			
			for(var j = 0; j < datosAsignacion.length ; j++){
				var sumObG=parseFloat(0.0);
				if (datosAsignacion[j].nivel==linkNivel && 
					datosAsignacion[j].entidad == linkEntidad &&
					datosAsignacion[j].tipo == linkTipoPresupuesto &&
					datosAsignacion[j].programa == linkPrograma &&
					datosAsignacion[j].subPrograma == linkSubPrograma &&
					datosAsignacion[j].proyecto == linkProyecto &&
					datosAsignacion[j].producto == datosProductos.producto[i].id ){
					
					sumObG=parseFloat(datosAsignacion[j].planificado1)+
					parseFloat(datosAsignacion[j].planificado2)+
					parseFloat(datosAsignacion[j].planificado3)+
					parseFloat(datosAsignacion[j].planificado4)+
					parseFloat(datosAsignacion[j].planificado5)+
					parseFloat(datosAsignacion[j].planificado6)+
					parseFloat(datosAsignacion[j].planificado7)+
					parseFloat(datosAsignacion[j].planificado8)+
					parseFloat(datosAsignacion[j].planificado9)+
					parseFloat(datosAsignacion[j].planificado10)+
					parseFloat(datosAsignacion[j].planificado11)+
					parseFloat(datosAsignacion[j].planificado12);
					
					objetoGasto.push(datosAsignacion[j].objetoGasto);
					totalTotal += sumObG;
					cajaProductoFinanciero+=' 	<tr>'+
						'		<td>'+datosAsignacion[j].objetoGasto+'</td>'+
	                      '		<td>'+datosAsignacion[j].organismoFinanciador+'</td>'+
	                      '		<td>'+datosAsignacion[j].fuenteFinanciamiento+'</td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado1+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+1+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-1-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado2+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+2+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-2-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado3+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+3+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-3-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado4+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+4+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-4-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado5+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+5+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-5-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado6+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+6+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-6-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado7+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+7+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-7-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado8+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+8+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-8-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado9+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+9+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-9-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado10+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+10+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-10-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado11+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+11+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-11-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td><input type="number" value='+datosAsignacion[j].planificado12+' class="suma-financiera" name="cantidad-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-'+12+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'-12-'+datosAsignacion[j].fuenteFinanciamiento+'-'+datosAsignacion[j].organismoFinanciador+'-'+datosAsignacion[j].departamento+'-'+datosAsignacion[j].pais+'-'+datosAsignacion[j].anho+'-'+datosAsignacion[j].version+'"></td>'+
	                      '		<td id="sumaOG-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosAsignacion[j].producto+'-'+datosAsignacion[j].objetoGasto+'"><b>'+numeroConComa(parseFloat(sumObG).toFixed(0))+'</b></td>'+
	                      '	</tr>';
	
				}
			}
			
			var asigMes = new Array();
			var sumaMesAsig=0;
			for(var a = 1; a <=12 ; a++){
				for(var b = 0; b < datosAsignacion.length ; b++){
					if (datosAsignacion[b].nivel==linkNivel && 
							datosAsignacion[b].entidad == linkEntidad &&
							datosAsignacion[b].tipo == linkTipoPresupuesto &&
							datosAsignacion[b].programa == linkPrograma &&
							datosAsignacion[b].subPrograma == linkSubPrograma &&
							datosAsignacion[b].proyecto == linkProyecto &&
							datosAsignacion[b].producto == datosProductos.producto[i].id ){
						var col="planificado"+a;
						sumaMesAsig+=datosAsignacion[b][col];
					}
				}
				asigMes.push(sumaMesAsig);
				sumaMesAsig=0;	
			}
            
			cajaProductoFinanciero+='</tbody><tfoot><tr class="success"><td colspan="3"><h5><strong>Total</strong></h5></td>'+
					'<td id="sumaOG-1-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[0])+'</strong></td>'+
					'<td id="sumaOG-2-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[1])+'</strong></td>'+
					'<td id="sumaOG-3-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[2])+'</strong></td>'+
					'<td id="sumaOG-4-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[3])+'</strong></td>'+
					'<td id="sumaOG-5-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[4])+'</strong></td>'+
					'<td id="sumaOG-6-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[5])+'</strong></td>'+
					'<td id="sumaOG-7-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[6])+'</strong></td>'+
					'<td id="sumaOG-8-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[7])+'</strong></td>'+
					'<td id="sumaOG-9-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[8])+'</strong></td>'+
					'<td id="sumaOG-10-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[9])+'</strong></td>'+
					'<td id="sumaOG-11-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[10])+'</strong></td>'+
					'<td id="sumaOG-12-'+linkNivel+"-"+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"><strong>'+numeroConComa(asigMes[11])+'</strong></td>'+
					'<td><strong>'+numeroConComa(totalTotal)+'</strong></td></tr></tfoot>'+
				'</table>'+
			'</div>'+
            '<br>'+
          '</div>'+
          '<div class="box-footer">'+

          '</div>'+
         '<input type="hidden" name="unidad_medida_id" value="" id="unidad_medida-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
        '</form></div>';
			
			var programacionFinancieraModal="";
			
			programacionFinancieraModal+='<div class="modal fade" id="programacionFinanciera-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="height: auto;min-height: 100%; border-radius: 0;" >'+
									 		'<div class="modal-dialog modal-lg" style="width: 100%;height: 100%;margin: 0; padding: 0;" >'+
									 			'<div class="modal-content" style="height: auto;min-height: 100%; border-radius: 0;" >'+
									 				'<div class="modal-header">'+
									 					'<div class="box-header box-warning">'+
									 						'<h3 class="box-title"+9><b>Programación Financiera de Producto</b></h3>'+
									 						'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
									 					'</div>'+
									 				'</div>	'+
													'<div class="modal-body" id="cuerpoasig">'+
									                '<form class="form-horizontal" id="form-asig-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'" >'+

														cajaProductoFinanciero+
													'</form>'+
													'</div>'+
													'<div class="modal-footer">'+
														'<div class="row">'+
													    '	<div class="col-sm-6">'+
															    '<h4>Objeto de Gasto</h4><select id="selObjetoGasto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'">'+option_objeto_gasto+'</select>'+  
																'<h4>Fuente de Financiamiento</h4><select id="selFuenteFinanciamiento-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'">'+option_fuente+'</select>'+
																'<h4>Organismo Financiador</h4><select id="selOrganismoFinanciador-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'">'+option_organismo+'</select>'+
																'<div><br><button type="button" class="btn btn-primary" id="AgregarObjetoGasto" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'">Agregar Objeto Gasto</button></div>'+
														'   </div>'+															    
													    '	<div class="col-sm-6">'+
															    '<button type="button" class="btn btn-primary" data-toggle="modal" id="editarAsignacionFinanciera" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos.producto[i].id+'-'+objetoGasto+'">Guardar</button>'+
																'<button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>'+	
															'</div>'+
													    '</div>'+
													'</div>'+ 
												'</div>'+
											'</div>'+
										'</div>';
			
			var cajaProductoBotones="";
			var producto = datosProductos.producto[i].id;
			var cajaProductoRow="";

			if(datosProductos.producto[i].borrado == true)
			{
				if (rol_jsp == 1 || rol_jsp == 0 ){
					cajaProductoRow=' <!-- PRODUCTO -->'+
		            '<div class="box box-danger direct-chat direct-chat-danger">'+
		              '<div class="box-header with-border">'+
		              	'<div class="col-md-11">'+
		              		'<h3 class="box-title"><del>Nombre Producto</del></h3>'+
		              	'</div>'+
		              	'<div class="col-md-1">'+
			                '<div class="box-tools pull-right">'+
			                	'<button type="button" class="btn btn-box-tool consultaBorrarProductoPresupuesto" data-widget="remove" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"><i class="fa fa-recycle"></i>'+
								'</button>'+
			                '</div>'+
		                '</div>'+
		              '</div><!-- /.box-header -->'+
		            '</div>';
				}
			}else{


				cajaProductoRow=' <!-- PRODUCTO -->'+
	            '<div class="box box-warning direct-chat direct-chat-warning">'+
	              '<div class="box-header with-border">'+
	            		'<div class="row">'+
		              		'<div class="col-md-11">'+
				              	'<h3 class="box-title">Nombre Producto</h3>'+
					              	'<br>'+
	                				'<b>FINAL O INTERMEDIO: </b> <select name="intermedio" class="intermedioClass" id="intermedio-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'-'+datosProductos.producto[i].unidad_medida_id+'-'+datosProductos.producto[i].anho+'-'+datosProductos.producto[i].numero_fila+'-'+datosProductos.producto[i].id+'">'+
	                				'<option value="intermedio">INTERMEDIO</option>'+
	               					'<option value="final">FINAL</option>'+    
					                '</select>'+
			              	'</div>'+
		              	'<div class="col-md-1">'+
	                '<div class="box-tools pull-right">'+
						'<button type="button" class="btn btn-box-tool consultaBorrarProductoPresupuesto" data-widget="remove" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"><i class="fa fa-trash-o"></i>'+
						'</button>'+
					'</div>'+
				'</div>'+
	          '</div>'+
	        '</div><!-- /.box-header -->'+
	              '<div class="box-body" style="display:block;">'+
					'<div class="form-group">'+
	          		  '<div class="row">'+
	          		    '<div class="form-group col-md-8">'+
							'<button class="btn btn-warning vincularCadena" data-toggle="modal" data-target="#vincularCadena-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" id="vincular-cadena-valores-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" owner="" style="margin-top:10px">Vincular Cadena de Valor</button><small id="fechaUltActCadenaValor-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>'+
							'  <br> '+
							'<button class="btn btn-warning" data-toggle="modal" data-target="#programacionFisica-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" id="programacion-fisica-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" owner="" style="margin-top:10px">Programación Física de Producto</button><small id="fechaUltActProgramacionFisica-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>'+
							'  <br> '+
							'<button class="btn btn-warning" data-toggle="modal" data-target="#programacionFinanciera-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" id="programacion-financiera-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" owner="" style="margin-top:10px">Programación Financiera de Producto</button><small id="fechaUltActProgramacionFinanciera-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>'+
							'  <br> '+
							'<button class="btn btn-warning modalDestinatario" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" style="margin-top:10px">Asignar Destinatario</button><small id="fechaUltActDestinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>'+
							'  <br> '+
							'<button class="btn btn-warning modalJustificacion" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" style="margin-top:10px">Justificación</button><small id="fechaUltActJustificacion-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>'+
							'  <br> '+
//							'<button class="btn btn-warning modalDictamen" parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" style="margin-top:10px">Dictamen STP</button><small id="fechaUltActDictamen-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>'+
						'</div>'+
						'<div class="from-group col-md-4"><div id="contenedorEtiqueta-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"><h4><p>	ETIQUETAS: </p></h4></div>'+
						'</div>'+
					  '</div>'+
	        		'</div>'+
	              '</div>'+
	            '</div>';
			}

			cajaSelector="";
	    	versiones = [];
	      	cajaSelector =	'<select name="Enlaces" class="selectorAnhoVersion form-control">' +
	      					'<option selected>Seleccione Año/Versión </option>';

	      	for (var a = 0; a < anhosPorProyecto.length; a++) {
	      	versiones = [];
	      	//obtner todas las versiones del anho especifico
		      	for (var b = 0; b < datosAsignacionPorProyecto.length; b++){
			      	if ((anhosPorProyecto[a].anho == datosAsignacionPorProyecto[b].anho) && (versiones.indexOf(datosAsignacionPorProyecto[b].version) < 0)){
			      		versiones.push(datosAsignacionPorProyecto[b].version);
			      	}
		      	}
		      	cajaSelector += '<optgroup label="' + anhosPorProyecto[a].anho + '">';
		      	//Insertar todas las versiones que pertenece a esa version
		      	for (var c = 0; c < versiones.length; c++){
		      		cajaSelector += '<option parametros="'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto +'-'+ producto +'-'+ anhosPorProyecto[a].anho + '-' + versiones[c] + '">'+anhosPorProyecto[a].anho+' Versión: '+versiones[c]+'</option>';
		      	}
		      	cajaSelector += '</optgroup>';
	      	}
	      	cajaSelector += '</select></br>';
			
		    //contenedorDeProducto.innerHTML=cajaProducto+cajaSelector+cajaProductoFinanciero;
		    //contenedorDeProducto.innerHTML=cajaProducto;
	      	
	      	contenedorDeProducto.innerHTML=cajaProductoRow;
      				
		    //contenedorDeProducto.innerHTML= ;
		    
          	
    		var codigoProducto = datosProductos.producto[i].id;
		    var productos = $.ajax({
		        url:'/ajaxSelects?accion=getProductos&producto='+codigoProducto,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	productos = JSON.parse(productos);
        	
		    var productos2 = $.ajax({
		        url:'/ajaxSelects?accion=getProductos&producto='+codigoProducto,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	productos2 = JSON.parse(productos2);
        	//var mostrarTituloProducto = codigoProducto+") "+productos.productos[0].nombreCatalogo;
      		//var nt=document.createTextNode(mostrarTituloProducto);
      		var linkProducto = datosProductos.producto[i].id;
      		//$('div [nivel="'+linkNivel+'"][entidad="'+linkEntidad+'"][tipopresupuesto="'+linkTipoPresupuesto+'"][programa="'+linkPrograma+'"][subprograma="'+linkSubPrograma+'"][proyecto="'+linkProyecto+'"][id="producto-'+linkProducto+'"]').find('h3').html(nt);
      		

        	var codigoUnidadMedida = datosProductos.producto[i].unidad_medida_id;
		    var unidadMedida = $.ajax({
		        url:'/ajaxSelects?accion=getUnidadesMedida&unidadMedida='+codigoUnidadMedida,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	unidadMedida = JSON.parse(unidadMedida);
        	var unidadMedida=unidadMedida.unidadesMedida[0];
        	

////////////generar tabla de metas
        	var depto =0;
		    var deptoN ="";
		    var filaProduct="";
		    var mes=0;
		    var mesN="";
		    var mPDeptoMes="0.0";
		    var metaProducto = $.ajax({
		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
		    metaProducto = JSON.parse(metaProducto);
		    metaProducto=metaProducto.productoPresupuestoMeta;
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
		    metaProducto.getMaxDepto = function(deptoB ) {
		    	var depto;
		    	var max =0;
		        for( var mes in this ) {
		            if( this.hasOwnProperty( mes ) ) {
		            	depto=this[mes][ 'departamento' ];
		                 if(this[mes][ 'departamento' ] == deptoB && this[mes][ 'anho' ]==2017)
		                     if (this[mes][ 'cantidad' ]>max) max =this[mes][ 'cantidad' ];
		            }
		        }
		        return max;
		    }
		    
		    metaProducto.getProDepto = function(deptoB ) {
		    	var depto;
		    	var max =0;
		    	var cant=0;
		        for( var mes in this ) {
		            if( this.hasOwnProperty( mes ) ) {
		            	depto=this[mes][ 'departamento' ];
		                 if(this[mes][ 'departamento' ] == deptoB && this[mes][ 'anho' ]==2017)
		                     //if (this[mes][ 'cantidad' ]>max) max =this[mes][ 'cantidad' ];
		                	if (this[mes][ 'cantidad' ] > 0)
		                    {
		                		max += this[mes][ 'cantidad' ];
		                		cant = cant + 1;
		                    }

		            }
		        }
		        if(max > 0 || cant > 0){
			        max = max/cant;
		        }
		        return max;
		    }
	
		    function obtenerCantidad(meta, anho, mes, departamento) {
		    	var cantidad=0;
				for (var i = 0; i < meta.length; i++) {
					if(meta[i].anho==anho  && meta[i].mes==mes && meta[i].departamento==departamento){
						cantidad= meta[i].cantidad;
					}	
				}
				return cantidad;
			}
			
		    var cant=0.0;
		    var sumaMes=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
		    var max= 0.0;
		    var sumaTotal=0.0;
			for(var j = 0; j < datosDepartamentos.departamentos.length; j++  )
			{
				var suma=0.0;
				var max=.00;
				depto = datosDepartamentos.departamentos[j].deptoPais;
				deptoN = datosDepartamentos.departamentos[j].abrevDepartamento;
				filaProduct+="<tr departamento=\""+depto+"\"><td>"+deptoN+"</td>";
				for (var k = 0; k < datosMeses.meses.length; k++)
				{	
					mes = datosMeses.meses[k].id;
					var flag=0;
					cant = metaProducto.getCantidadPorMesDepto(mes,depto,2017);
					if (cant>0){
						filaProduct+='<td><input type="text" productoClase="'+productos2.productos[0].clase+'" class= "cantidad-depto-mes" size="5px" name="cantidad-'+linkProducto+'-'+depto+'-'+mes+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'-'+mes+'" value="'+cant+'"></td>';
						flag=1;
						suma += cant;
						sumaMes[mes]+=cant;
						sumaTotal+=cant;
						
					}
						
					if (flag==0) 
						filaProduct+='<td><input type="text" productoClase="'+productos2.productos[0].clase+'" class= "cantidad-depto-mes" size="5px" name="cantidad-'+linkProducto+'-'+depto+'-'+mes+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'-'+mes+'" value=""></td>';				    
				}
				for(var z = 0; z < productos2.productos.length; z++)
			    {
					if(productos2.productos[z].codigoCatalogo == parseInt(producto) && productos2.productos[z].clase == "C")
					{
						filaProduct+='<td id="suma-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'" suma="">'+metaProducto.getProDepto(depto).round(2)+'</td></tr>';
					}else{
						if(productos2.productos[z].codigoCatalogo == parseInt(producto) && productos2.productos[z].clase == "N"){
							filaProduct+='<td id="suma-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'" suma="">'+suma.round(2)+'</td></tr>';	
						}
						
					}
			    }
							  
			}

			//metasProducto = [];
			totalMetaC = 0;
			totalMetaN = 0;
			cont = 0;
			

			function colorear(num1,num2 ){
				var estadoColor;
				
				if(num1 == num2 && num1 != null){
					estadoColor = "success";
				}else if(num1 != num2 && num1 != null){
					estadoColor = "danger";
				}else{
					estadoColor = "active";
				}
	
				return estadoColor;
			}
			
			
  /*      	for(var t = 0; t < todosLosProductosHacienda.length; t++){
        		
        		if(datosProductos.producto[i].producto_id == todosLosProductosHacienda[t].codigoProducto){
//        			metasProducto.push(todosLosProductosHacienda[t].meta1);
//        			metasProducto.push(todosLosProductosHacienda[t].meta2);
//        			metasProducto.push(todosLosProductosHacienda[t].meta3);
//        			metasProducto.push(todosLosProductosHacienda[t].meta4);
//        			metasProducto.push(todosLosProductosHacienda[t].meta5);
//        			metasProducto.push(todosLosProductosHacienda[t].meta6);
//        			metasProducto.push(todosLosProductosHacienda[t].meta7);
//        			metasProducto.push(todosLosProductosHacienda[t].meta8);
//        			metasProducto.push(todosLosProductosHacienda[t].meta9);
//        			metasProducto.push(todosLosProductosHacienda[t].meta10);
//        			metasProducto.push(todosLosProductosHacienda[t].meta11);
//        			metasProducto.push(todosLosProductosHacienda[t].meta12);
        			contador = 0;
        			if(todosLosProductosHacienda[t].meta1 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta2 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta3 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta4 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta5 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta6 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta7 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta8 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta9 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta10 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta11 != 0 )contador = contador + 1;
        			if(todosLosProductosHacienda[t].meta12 != 0 )contador = contador + 1;

        			
        			totalMetaC = ((todosLosProductosHacienda[t].meta1 + todosLosProductosHacienda[t].meta2 + todosLosProductosHacienda[t].meta3 + todosLosProductosHacienda[t].meta4 + todosLosProductosHacienda[t].meta5 + todosLosProductosHacienda[t].meta6 + todosLosProductosHacienda[t].meta7 + todosLosProductosHacienda[t].meta8 + todosLosProductosHacienda[t].meta9 + todosLosProductosHacienda[t].meta10 + todosLosProductosHacienda[t].meta11 + todosLosProductosHacienda[t].meta12)/contador);
        			totalMetaN = (todosLosProductosHacienda[t].meta1 + todosLosProductosHacienda[t].meta2 + todosLosProductosHacienda[t].meta3 + todosLosProductosHacienda[t].meta4 + todosLosProductosHacienda[t].meta5 + todosLosProductosHacienda[t].meta6 + todosLosProductosHacienda[t].meta7 + todosLosProductosHacienda[t].meta8 + todosLosProductosHacienda[t].meta9 + todosLosProductosHacienda[t].meta10 + todosLosProductosHacienda[t].meta11 + todosLosProductosHacienda[t].meta12);
        		}
        		
        	}*/
			filaProduct2="";
			band = 0;

        /*	for(var e = 0; e < todosLosProductosHacienda.length; e++){

        		if(datosProductos.producto[i].producto_id == todosLosProductosHacienda[e].codigoProducto){
            		
            		band = 1;
        			filaProduct2+=
        				'<tr>'+
        					'<th data-toggle="tooltip" title="Meta física mensual registrada en el Plan Financiero">Total Mes PF</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-1" class="'+colorear(todosLosProductosHacienda[e].meta1,sumaMes[1])+'">'+todosLosProductosHacienda[e].meta1+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-2" class="'+colorear(todosLosProductosHacienda[e].meta2,sumaMes[2])+'">'+todosLosProductosHacienda[e].meta2+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-3" class="'+colorear(todosLosProductosHacienda[e].meta3,sumaMes[3])+'">'+todosLosProductosHacienda[e].meta3+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-4" class="'+colorear(todosLosProductosHacienda[e].meta4,sumaMes[4])+'">'+todosLosProductosHacienda[e].meta4+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-5" class="'+colorear(todosLosProductosHacienda[e].meta5,sumaMes[5])+'">'+todosLosProductosHacienda[e].meta5+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-6" class="'+colorear(todosLosProductosHacienda[e].meta6,sumaMes[6])+'">'+todosLosProductosHacienda[e].meta6+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-7" class="'+colorear(todosLosProductosHacienda[e].meta7,sumaMes[7])+'">'+todosLosProductosHacienda[e].meta7+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-8" class="'+colorear(todosLosProductosHacienda[e].meta8,sumaMes[8])+'">'+todosLosProductosHacienda[e].meta8+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-9" class="'+colorear(todosLosProductosHacienda[e].meta9,sumaMes[9])+'">'+todosLosProductosHacienda[e].meta9+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-10" class="'+colorear(todosLosProductosHacienda[e].meta10,sumaMes[10])+'">'+todosLosProductosHacienda[e].meta10+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-11" class="'+colorear(todosLosProductosHacienda[e].meta11,sumaMes[11])+'">'+todosLosProductosHacienda[e].meta11+'</th>'+
        					'<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-12" class="'+colorear(todosLosProductosHacienda[e].meta12,sumaMes[12])+'">'+todosLosProductosHacienda[e].meta12+'</th>';
        			
        				if(todosLosProductosHacienda[e].codigoProducto == parseInt(linkProducto) && todosLosProductosHacienda[e].clase == "C")
        				{
        					//filaProduct2+='<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13" class="'+colorear(Math.max.apply(null, metasProducto),sumaTotal)+'">'+Math.max.apply(null, metasProducto)+'</th>';
        					filaProduct2+='<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13" class="'+colorear(totalMetaC,sumaTotal/contador)+'">'+totalMetaC.round(2)+'</th>';

        				}else{
        					if(todosLosProductosHacienda[e].codigoProducto == parseInt(linkProducto) && todosLosProductosHacienda[e].clase == "N"){
        						filaProduct2+='<th id="sumaMesMH-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13" class="'+colorear(totalMetaN,sumaTotal)+'">'+totalMetaN.round(2)+'</th>';	
        					}
        				}
        			
        			filaProduct2+='</tr>';
        			
        			filaProduct2+=
        				'<tr>'+
        					'<th data-toggle="tooltip" title="Meta física mensual registrada en el Plan Operativo Institucional">Total Mes POI</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-1"  class="'+colorear(todosLosProductosHacienda[e].meta1,sumaMes[1])+'">'+parseFloat(sumaMes[1]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-2" class="'+colorear(todosLosProductosHacienda[e].meta2,sumaMes[2])+'">'+parseFloat(sumaMes[2]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-3" class="'+colorear(todosLosProductosHacienda[e].meta3,sumaMes[3])+'">'+parseFloat(sumaMes[3]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-4" class="'+colorear(todosLosProductosHacienda[e].meta4,sumaMes[4])+'">'+parseFloat(sumaMes[4]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-5" class="'+colorear(todosLosProductosHacienda[e].meta5,sumaMes[5])+'">'+parseFloat(sumaMes[5]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-6" class="'+colorear(todosLosProductosHacienda[e].meta6,sumaMes[6])+'">'+parseFloat(sumaMes[6]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-7" class="'+colorear(todosLosProductosHacienda[e].meta7,sumaMes[7])+'">'+parseFloat(sumaMes[7]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-8" class="'+colorear(todosLosProductosHacienda[e].meta8,sumaMes[8])+'">'+parseFloat(sumaMes[8]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-9" class="'+colorear(todosLosProductosHacienda[e].meta9,sumaMes[9])+'">'+parseFloat(sumaMes[9]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-10" class="'+colorear(todosLosProductosHacienda[e].meta10,sumaMes[10])+'">'+parseFloat(sumaMes[10]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-11" class="'+colorear(todosLosProductosHacienda[e].meta11,sumaMes[11])+'">'+parseFloat(sumaMes[11]).round(2)+'</th>'+
        					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-12" class="'+colorear(todosLosProductosHacienda[e].meta12,sumaMes[12])+'">'+parseFloat(sumaMes[12]).round(2)+'</th>';
            		}
        		}*/
        	if(band == 0){
    			filaProduct2+=
    				'<tr>'+
    					'<th data-toggle="tooltip" title="Meta física mensual registrada en el Plan Operativo Institucional">Total Mes POI</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-1">'+parseFloat(sumaMes[1]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-2" >'+parseFloat(sumaMes[2]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-3">'+parseFloat(sumaMes[3]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-4">'+parseFloat(sumaMes[4]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-5">'+parseFloat(sumaMes[5]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-6">'+parseFloat(sumaMes[6]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-7">'+parseFloat(sumaMes[7]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-8">'+parseFloat(sumaMes[8]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-9">'+parseFloat(sumaMes[9]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-10">'+parseFloat(sumaMes[10]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-11">'+parseFloat(sumaMes[11]).round(2)+'</th>'+
    					'<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-12">'+parseFloat(sumaMes[12]).round(2)+'</th>';
    					
    					contador = 0;
    					if(sumaMes[1] != 0 )contador = contador + 1;
    					if(sumaMes[2] != 0 )contador = contador + 1;
    					if(sumaMes[3] != 0 )contador = contador + 1;
    					if(sumaMes[4] != 0 )contador = contador + 1;
    					if(sumaMes[5] != 0 )contador = contador + 1;
    					if(sumaMes[6] != 0 )contador = contador + 1;
    					if(sumaMes[7] != 0 )contador = contador + 1;
    					if(sumaMes[8] != 0 )contador = contador + 1;
    					if(sumaMes[9] != 0 )contador = contador + 1;
    					if(sumaMes[10] != 0 )contador = contador + 1;
    					if(sumaMes[11] != 0 )contador = contador + 1;
    					if(sumaMes[12] != 0 )contador = contador + 1;

            	}
    			
    			for(var z = 0; z < productos2.productos.length; z++)
    		    {
    				if(productos2.productos[z].codigoCatalogo == parseInt(linkProducto) && productos2.productos[z].clase == "C")
    				{
    					filaProduct2+='<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13" class="'+colorear(totalMetaC,sumaTotal/contador)+'">'+(sumaTotal/contador).round(2)+'</th>';
    				}else{
    					if(productos2.productos[z].codigoCatalogo == parseInt(linkProducto) && productos2.productos[z].clase == "N"){
    						filaProduct2+='<th id="sumaMesSPR-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13" class="'+colorear(totalMetaN,sumaTotal)+'">'+sumaTotal.round(2)+'</th>';	
    					}
    				}
    		    }
    			
    			filaProduct2+='</tr>';

			//$("div [nivel='"+linkNivel+"'][entidad='"+linkEntidad+"'][tipopresupuesto='"+linkTipoPresupuesto+"'][programa='"+linkPrograma+"'][subprograma='"+linkSubPrograma+"'][proyecto='"+linkProyecto+"'][id='producto-"+datosProductos.producto[i].id+"']").find("[producto="+datosProductos.producto[i].id+"]").html(filaProduct);
			
			var programacionFisicaModal="";
			programacionFisicaModal+='<div class="modal fade" id="programacionFisica-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
			'<div class="modal-dialog modal-lg" style="width: 100%;height: 100%;margin: 0; padding: 0;">'+
			'<div class="modal-content" style="height: auto;min-height: 100%; border-radius: 0;">'+
				'<div class="modal-header">'+
					'<div class="box-header box-warning">'+
						'<h3 class="box-title">'+codigoProducto+')'+productos.productos[0].nombreCatalogo+' <small><b>Unidad de Medida:</b> '+unidadMedida.nombre+', <b>CLASE:</b> '+productos.productos[0].clase+'</small></h3>'+ //agregar nombre del producto
						'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
					'</div>'+
				'</div>	'+
				'<div class="modal-body ">'+
					'<div class="box-body progamacionFisicaClase" id="cuerpoProgramacionFisicaModal-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
				//cajaDeProducto
				' <!-- PRODUCTO -->'+
	                  '<div class="box box-warning direct-chat direct-chat-warning" style="overflow-y: initial !important;overflow-x: initial !important">'+
	                  '<form class="form-horizontal" id="form-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" >'+
	                  	'<input type="hidden" name="accion" value="updateProductoMeta">'+
	                    '<div class="box-header with-border">'+
	                    '</div><!-- /.box-header -->'+
	                    '<div class="box-body" style="display:block; scroll-x pre-scrollable">'+

	                      '<table class="table table-striped table-bordered  table-hover">'+
	                      filaProduct2+
		                     ' 	<tr>'+
		                      '		<th colspan="14"></th>'+
		                      '	</tr>'+
	                     ' 	<tr>'+
	                     ' 	<tr>'+
	                      '		<th>Depto</th><th>Ene</th><th>Feb</th><th>Mar</th><th>Abr</th><th>May</th><th>Jun</th>'+
	                      '		<th>Jul</th><th>Ago</th><th>Set</th><th>Oct</th><th>Nov</th><th>Dic</th><th>Tot</th>'+
	                      '	</tr>'+
	                      '<tbody class="table-body-producto" producto='+producto+'>'+
	                      filaProduct+
	                      '</tbody>'+
	                      '</table>'+
	                      '<br>'+
	                    '</div>'+
	                    '<div class="box-footer">'+
	                    '<div class="form-group">'+
	                    	'<p style="float:left;margin-left:50px">Total 2019: <input  type="text" name="anho2" id="anho2-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"'+' placeholder="Total para 2018"></p>'+	
	                    	'<p style="float:left;margin-left:50px">Total 2020: <input  type="text" name="anho3" id="anho3-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"'+' placeholder="Total para 2019"></p>';
	                    	
	                    if(rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
	                    	programacionFisicaModal+='<button type="submit" style="margin-right:50px" class="btn btn-primary" id="guardar-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" >Guardar</button><small id="fechaUltActProductoPresupuestoMeta-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"></small>';
	                    } 						
	                    	
	                    	programacionFisicaModal+='<br/><div width="200px" id="spinProgFisica-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" style="display:none; margin: 0 auto;"><span>GUARDANDO... Espere por favor.<img src="dist/img/loading_spinner.gif" width="50px"></img></div>'+
	                    '</div>'+
	                   '</div>'+
	                   '<input type="hidden" name="unidad_medida_id" value="" id="unidad_medida-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
	                  '</form>'+
	                   '<div class="box footer" id="footerAsignacion-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'
	                   '</div></div>'+
					'</div>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>';
//////////// Primer modal que aparece al dar clic en vincular cadena de valor
//            var cadenaDeValorModal="";
//            cadenaDeValorModal+='<div class="modal fade" id="vincularCadena-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
//									'<div class="modal-dialog modal-lg">'+
//										'<div class="modal-content">'+
//											'<div class="modal-header">'+
//												'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
//											'</div>	'+
//											'<div class="modal-body ">'+
//												'<div class="box box-warning box-solid">'+
//													'<div class="box-header box-warning">'+
//														'<h3 class="box-title">Vinculacion Cadena de Valor</h3>'+
//													'</div>'+
//													'<div class="box-body " id="vincularCadenaCuerpo-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
//														//cargarCadenaValor(linkNivel, linkEntidad, linkTipoPresupuesto, linkPrograma, linkSubPrograma, linkProyecto, producto, anho, version, producto, 3)+
//														//cajaProducto+=
//													'</div>'+
//												'</div>'+
//											'</div>'+
//											'<div class="modal-footer">'+
//												'<button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>'+
//											'</div>'+
//										'</div>'+
//									'</div>'+
//								'</div>';

////////////Segundo modal que aparece al dar clic en indicadores dentro del modal cadena de valor            
           /* if ( $('#vincularCadena-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).length ){
				$('#vincularCadena-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).remove();
			}
            */
//            var indicadoresModalProducto="";
//			indicadoresModalProducto+='<div class="modal fade" id="indicador-modal-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
//											'<div class="modal-dialog modal-lg" style="width:90%">'+
//												'<div class="modal-content">'+
//													'<div class="modal-header">'+
//														'<button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>'+
//													'</div>	'+
//													'<div class="modal-body ">'+
//														'<div class="box box-warning box-solid">'+
//															'<div class="box-header box-warning">'+
//																'<h3 class="box-title">Indicadores</h3>'+
//																'<div class="box-tools pull-right">'+
//																'</div>'+
//															'</div>'+
//															'<div class="box-body indicadoresModalProductoClase" id="cuerpoIndicadoresModalProducto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
//																//cargarCadenaValor(linkNivel, linkEntidad, linkTipoPresupuesto, linkPrograma, linkSubPrograma, linkProyecto, producto, anho, version, producto, 3)+
//																//cajaProducto+=
//															'</div>'+
//														'</div>'+
//													'</div>'+
//													'<div class="modal-footer">'+
//														'<button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>'+
//													'</div>'+
//												'</div>'+
//											'</div>'+
//										'</div>';
                        
//			var departamentos = datosDepartamentos.departamentos;
//			var optionDepartamentoDestinatarios = "";
//			
//			for(w = 0;w<departamentos.length; w++){
//				optionDepartamentoDestinatarios+='<option value="'+departamentos[w].deptoPais+'">'+departamentos[w].abrevDepartamento+'</option>';
//			}
//
//		    var destinatarioModal="";
//		    destinatarioModal+='<div class="modal fade" id="destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
//							'	<div class="modal-dialog modal-lg" style="width:90%">'+
//							'		<div class="modal-content" >'+
//							'			<div class="modal-header">'+
//							'				<button type="button" class="close" data-dismiss="modal">&times;</button>'+
//							'			</div>'+
//							'		    <div class="modal-body">'+
//							
//							'		      		<div class="row">'+		
//
//							'		      		<div class="col-md-12">'+
//							'						<div class="box box-warning box-solid">'+
//							'		                	<div class="box-header with-border">'+
//							'	                  			<h3 class="box-title">Destinatarios</h3>'+
//							'	                  			<div class="box-tools pull-right">'+
//							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
//							'		                    		</button>'+
//							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
//							'		                    		</button>'+
//							'		                  		</div>'+
//							'              				</div>'+
//							'               			<div class="box-body">'+
//			
//							'		      					<div class="col-md-12">'+
//							'									<div class="box box-default box-solid">'+
//							'		                				<div class="box-header with-border">'+
//							'		                  					<h3 class="box-title">Agregar Destinatarios</h3>'+
//							'	                  						<div class="box-tools pull-right">'+
//							'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
//							'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
//							'		                  					</div>'+
//							'              							</div>'+
//							'              						<div class="box-body">'+
//							
//							'										<div class="table-responsive">'+
//							'											<table class="table table-hover">'+
//							'												<tbody>'+
//							'			      									<form class="form-horizontal" role="form">'+
//							'													<tr><td><label for="tipoDestinatario">Tipo</label><select id="tipoDestinatario" class="form-control">'+optionTiposDestinatarios+'</select></td><td><label for="grupoDestinatario">Grupo</label><select id="grupoDestinatario" class="form-control"></select></td></tr>'+
//							'													<tr><td><label for="cantidadDestinatarioAccion">Cantidad</label><input type="number" id="cantidadDestinatarioAccion" class="form-control" placeholder="Ingrese una Cantidad" /></td><td><label for="descripcionDestinatarioAccion">Descripción</label><input type="text" id="descripcionDestinatarioAccion" class="form-control" placeholder="Ingrese una Descripción" /></td></tr>'+
//							'													<tr><td><label for="departamentoDestinatario">Departamento</label><select id="departamentoDestinatario" class="form-control">'+optionDepartamentoDestinatarios+'</select></td></tr>'+
//							'			      									</form>	'+				
//							'												</tbody>'+
//							'											</table>'+
//							'				      					</div>'+
//							
//							'				      				 </div>'+//fin box body
//							'									 <div class="modal-footer">'+ 
//							'									 	  <button type="button" class="btn btn-warning" id="guardar-destinatarios-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" >Guardar Destinatario</button>'+
////							'										  <button class="btn btn-warning" data-toggle="modal" data-target="#destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" id="asignar-destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" owner="" >Asignar Destinatario</button>'+
//							'									 </div>'+									
//							'				      			 	</div>'+
//							'				      			</div>'+							
//
//							'		      					<div class="col-md-12">'+
//							'									<div class="box box-default box-solid">'+
//							'		                				<div class="box-header with-border">'+
//							'		                  					<h3 class="box-title">Lista Destinatarios</h3>'+
//							'	                  						<div class="box-tools pull-right">'+
//							'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
//							'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
//							'		                  					</div>'+
//							'              							</div>'+
//							'              						<div class="box-body" id="cuerpoTablaModalDestinatarios">'+	
//
//							
//							'				      				</div>'+
//							'				      			</div>'+
//							'              				</div>'+
//			
//							'              				</div>'+
//							'                		</div>'+	
//							'               	</div>'+
//							'                </div>'+//fin row																	
//							
//							'		    </div>'+
//							'			<div class="modal-footer">'+							
//					      	'			</div>'+														
//							'		</div>'+ 
//							'	</div>'+
//							'</div>';
//		    				
		    				
			var nparrafo=document.getElementById('row-body-programacionfisica'); 
          	nparrafo.appendChild(contenedorDeProducto);
          	//destinatarioModal+=filaProduct;
          	//$('.content-wrapper').append(destinatarioModal);
          	//$('.content-wrapper').append(cadenaDeValorModal); 
          	$('.content-wrapper').append(programacionFisicaModal);
          	$('.content-wrapper').append(programacionFinancieraModal);
          	$('#tituloProducto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).append('Nombre Producto: '+codigoProducto+') '+productos.productos[0].nombreCatalogo);
          	//$('.content-wrapper').append(indicadoresModalProducto);
          	if(metaProducto.length > 0){
          		$("#fechaUltActProductoPresupuestoMeta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+producto).html("Última Actualización: "+ metaProducto[0].fechaActualizacion);
          	}
         	
          	if(datosProductos.producto[i].borrado == true)
			{
				if (rol_jsp == 1 || rol_jsp == 0 ){
					$("#producto-"+linkProducto).find('h3').html("<del>"+codigoProducto+") "+productos.productos[0].nombreCatalogo+"</del>");
		          	$("#producto-"+linkProducto).find('h3').append("<del> ("+unidadMedida.nombre+")"+" CLASE: "+productos.productos[0].clase+"</del>");
				}
			}else{
          		$("#producto-"+linkProducto).find('h3').html(codigoProducto+") "+productos.productos[0].nombreCatalogo );
	        	$("#producto-"+linkProducto).find('h3').append(" ("+unidadMedida.nombre+")"+" CLASE: "+productos.productos[0].clase);
	        	$('#unidad_medida-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).attr("value",unidadMedida.codigoUnidadMedida);
        	}			

			//$('#anho2'+'-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).val(metaProducto[240].cantidad);
			//$('#anho3'+'-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).val(metaProducto[241].cantidad);
			$('#anho2'+'-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).val(obtenerCantidad(metaProducto,"2018","1","99"));
			$('#anho3'+'-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).val(obtenerCantidad(metaProducto,"2019","1","99"));
		}
     }
        
        var datosProductos1 = $.ajax({
            url:'ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
            type:'get',
            dataType:'json',
            async:false       
          }).responseText;
        datosProductos1 = JSON.parse(datosProductos1);
        datosProductos1=datosProductos1.producto        
        
        if(datosProductos1.length > 0){
        	
            var getObjetivosVinculadosAct = $.ajax({
                url:'ajaxSelects?accion=getObjetivoHasObjetivo&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
                type:'get',
                dataType:'json',
                async:false       
              	}).responseText;
         		getObjetivosVinculadosAct=JSON.parse(getObjetivosVinculadosAct);
         		getObjetivosVinculadosAct=getObjetivosVinculadosAct.objetivos;
         		         		
         		if(getObjetivosVinculadosAct.length > 0){
         			
         			var ultFechaActVincular=new Date(1900,01,01,0,0,0);
             		var productoAnterior=getObjetivosVinculadosAct[0].producto;
             		
         			for(var k = 0; k < getObjetivosVinculadosAct.length ; k++){
  	          		  if(productoAnterior==getObjetivosVinculadosAct[k].producto){
  	          			  var fechaActual = new Date(getObjetivosVinculadosAct[k].fechaActualizacion);
  	              		  if(fechaActual >= ultFechaActVincular){ 
  	              			  ultFechaActVincular=fechaActual;
  	              		  }            		  
  	              	  }else{
  	              		  productoAnterior=getObjetivosVinculadosAct[k].producto;
  	              		  $("#fechaUltActCadenaValor-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+getObjetivosVinculadosAct[k-1].producto).html("  Ultima Actualización: "+ ultFechaActVincular.getDate()+"/"+(ultFechaActVincular.getMonth()+1)+"/"+ultFechaActVincular.getFullYear()+" "+ultFechaActVincular.getHours()+":"+ultFechaActVincular.getMinutes()+":"+ultFechaActVincular.getSeconds());
  	              		  k=k-1;
  	              		  ultFechaActVincular=new Date(1900,01,01,0,0,0);
  	              	  }  
  	          		  //falta preguntar si es ultimo imprimir
  	          		  if(k==(getObjetivosVinculadosAct.length-1)){
  	          			$("#fechaUltActCadenaValor-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+getObjetivosVinculadosAct[k].producto).html("  Ultima Actualización: "+ ultFechaActVincular.getDate()+"/"+(ultFechaActVincular.getMonth()+1)+"/"+ultFechaActVincular.getFullYear()+" "+ultFechaActVincular.getHours()+":"+ultFechaActVincular.getMinutes()+":"+ultFechaActVincular.getSeconds());
  	          		  }
  	         		}
         		}
	         		
         				
         		var metaProductoAct = $.ajax({
        		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
        		        type:'get',
        		        dataType:'json',
        		        async:false       
        		    }).responseText;
          		metaProductoAct = JSON.parse(metaProductoAct);
          		metaProductoAct=metaProductoAct.productoPresupuestoMeta;
          		
          		if(metaProductoAct.length > 0){
          			
          			var ultFechaActProgramacion=new Date(1900,01,01,0,0,0);
	         		productoAnterior=metaProductoAct[0].producto_id;
	         		
	         		for(var k = 0; k < metaProductoAct.length ; k++){
	         	  		  if(productoAnterior==metaProductoAct[k].producto_id){
	         	  			  var fechaActual = new Date(metaProductoAct[k].fechaActualizacion);
	         	      		  if(fechaActual >= ultFechaActProgramacion){ 
	         	      			ultFechaActProgramacion=fechaActual;
	         	      		  }            		  
	         	      	  }else{
	         	      		  productoAnterior=metaProductoAct[k].producto_id;
	         	      		  $("#fechaUltActProgramacionFisica-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+metaProductoAct[k-1].producto_id).html("  Ultima Actualización: "+ ultFechaActProgramacion.getDate()+"/"+(ultFechaActProgramacion.getMonth()+1)+"/"+ultFechaActProgramacion.getFullYear()+" "+ultFechaActProgramacion.getHours()+":"+ultFechaActProgramacion.getMinutes()+":"+ultFechaActProgramacion.getSeconds());
	         	      		  k=k-1;
	         	      		ultFechaActProgramacion=new Date(1900,01,01,0,0,0);
	         	      	  }  
	         	  		  //falta preguntar si es ultimo imprimir
	         	  		  if(k==(metaProductoAct.length-1)){
	         	  			$("#fechaUltActProgramacionFisica-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+metaProductoAct[k].producto_id).html("  Ultima Actualización: "+ ultFechaActProgramacion.getDate()+"/"+(ultFechaActProgramacion.getMonth()+1)+"/"+ultFechaActProgramacion.getFullYear()+" "+ultFechaActProgramacion.getHours()+":"+ultFechaActProgramacion.getMinutes()+":"+ultFechaActProgramacion.getSeconds());
	         	  		  }
	         	 		}
          		}
         		
	          		
         		
         		var productoDestinatariosAct = $.ajax({
        			//url:'/ajaxSelects?accion=getProductoDestinatario',
        			url:'ajaxSelects?accion=getProductoDestinatarioSinDpto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
          		}).responseText;
          		productoDestinatariosAct = JSON.parse(productoDestinatariosAct);
          		productoDestinatariosAct = productoDestinatariosAct.productoDestinatarios;
          		          		
          		if(productoDestinatariosAct.length > 0){
          			
          			var ultFechaActDestinatario=new Date(1900,01,01,0,0,0);
	         		productoAnterior=productoDestinatariosAct[0].producto;
	         		
	         		for(var k = 0; k < productoDestinatariosAct.length ; k++){
	        	  		  if(productoAnterior==productoDestinatariosAct[k].producto){
	        	  			  var fechaActual = new Date(productoDestinatariosAct[k].fechaActualizacion);
	        	      		  if(fechaActual >= ultFechaActDestinatario){ 
	        	      			ultFechaActDestinatario=fechaActual;
	        	      		  }            		  
	        	      	  }else{
	        	      		  productoAnterior=productoDestinatariosAct[k].producto;
	        	      		  $("#fechaUltActDestinatario-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+productoDestinatariosAct[k-1].producto).html("  Ultima Actualización: "+ ultFechaActDestinatario.getDate()+"/"+(ultFechaActDestinatario.getMonth()+1)+"/"+ultFechaActDestinatario.getFullYear()+" "+ultFechaActDestinatario.getHours()+":"+ultFechaActDestinatario.getMinutes()+":"+ultFechaActDestinatario.getSeconds());
	        	      		  k=k-1;
	        	      		ultFechaActDestinatario=new Date(1900,01,01,0,0,0);
	        	      	  }  
	        	  		  //falta preguntar si es ultimo imprimir
	        	  		  if(k==(productoDestinatariosAct.length-1)){
	        	  			$("#fechaUltActDestinatario-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+productoDestinatariosAct[k].producto).html("  Ultima Actualización: "+ ultFechaActDestinatario.getDate()+"/"+(ultFechaActDestinatario.getMonth()+1)+"/"+ultFechaActDestinatario.getFullYear()+" "+ultFechaActDestinatario.getHours()+":"+ultFechaActDestinatario.getMinutes()+":"+ultFechaActDestinatario.getSeconds());
	        	  		  }
	        	 	}
          		}
         		
	           		
         		
                for(var i = 0; i < datosProductos1.length ; i++){
                
                	  if(datosProductos1[i].intermedio==true){
                		  $('#intermedio-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos1[i].producto_id+'-'+datosProductos1[i].unidad_medida_id+'-'+datosProductos1[i].anho+'-'+datosProductos1[i].numero_fila+'-'+datosProductos1[i].id).val('intermedio');
                	  }else{        		  
                		  $('#intermedio-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+datosProductos1[i].producto_id+'-'+datosProductos1[i].unidad_medida_id+'-'+datosProductos1[i].anho+'-'+datosProductos1[i].numero_fila+'-'+datosProductos1[i].id).val('final');
                	  }
                	  
                	  
                	  	var linkNivel = nivel_id_jsp;
                    	var linkEntidad = entidad_id_jsp;
                    	var linkTipoPresupuesto = parseInt(document.getElementById("tipoPrograma-formulario").value);
                    	var linkPrograma = parseInt(document.getElementById("programa-formulario").value);
                    	var linkSubPrograma = parseInt(document.getElementById("subPrograma-formulario").value);
                    	var linkProyecto = parseInt(document.getElementById("proyecto-formulario").value);
                	  
                	  
                	  var datosEtiquetas = $.ajax({
                        url:'ajaxSelects?accion=getEtiquetas',
                        type:'get',
                        dataType:'json',
                        async:false       
                      }).responseText;
                  	datosEtiquetas = JSON.parse(datosEtiquetas);
                  	datosEtiquetas= datosEtiquetas.etiquetas;
                  	
                  	var datosEtiquetasSeleccionadas = $.ajax({
                        url:'ajaxSelects?accion=getPresupuestoEtiquetas&productoId='+datosProductos1[i].producto_id+'&proyectoId='+linkProyecto+'&subprogramaId='+linkSubPrograma+'&programaId='+linkPrograma+'&tipoPresupuestoId='+linkTipoPresupuesto+'&entidadId='+linkEntidad+'&nivelId='+linkNivel,
                        type:'get',
                        dataType:'json',
                        async:false       
                      }).responseText;
        	      	datosEtiquetasSeleccionadas = JSON.parse(datosEtiquetasSeleccionadas);
        	      	datosEtiquetasSeleccionadas= datosEtiquetasSeleccionadas.presupuestoetiquetas;
                  	
                  	for (var c = 0; c < datosEtiquetas.length; c++){	      		
                  		var checkbox = document.createElement('input');
            			checkbox.type = "checkbox";
            			checkbox.name = "cmbEtiqueta";
            			checkbox.setAttribute('class',"classEtiqueta");
            			checkbox.value = linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos1[i].producto_id+"-"+datosEtiquetas[c].id;
            			checkbox.id = "cmbEtiqueta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos1[i].producto_id+"-"+datosEtiquetas[c].id;
            			
            			var label = document.createElement('label')
            			label.htmlFor = "id";
            			label.appendChild(document.createTextNode(datosEtiquetas[c].nombre));

            			
            	      	
            	      	for (var p = 0; p < datosEtiquetasSeleccionadas.length; p++){
            	      		var producto_concat=linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos1[i].producto_id+"-"+datosEtiquetas[c].id;
            	      		var producto_concat_seleccionado=datosEtiquetasSeleccionadas[p].nivelId+"-"+datosEtiquetasSeleccionadas[p].entidadId+"-"+datosEtiquetasSeleccionadas[p].tipoPresupuestoId+"-"+
                  			datosEtiquetasSeleccionadas[p].programaId+"-"+datosEtiquetasSeleccionadas[p].subProgramaId+"-"+datosEtiquetasSeleccionadas[p].proyectoId+"-"+
                  			datosEtiquetasSeleccionadas[p].productoId+"-"+datosEtiquetasSeleccionadas[p].etiquetaId;
            	      		if(producto_concat==producto_concat_seleccionado){
            	      			checkbox.setAttribute('checked', 'true');
//            	      			$("#cmbEtiqueta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+producto+"-"+datosEtiquetas[c].id+"").attr('checked', true);
            	      		}
            	      	}
            	      	//contenedorDeProducto.appendChild(checkbox);
            			//contenedorDeProducto.appendChild(label);
            	      	//otroContenedor.appendChild(checkbox);
            	      	//otroContenedor.appendChild(label);
            			$("#contenedorEtiqueta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos1[i].producto_id+"").append(checkbox);
            			$("#contenedorEtiqueta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos1[i].producto_id+"").append(label);
            			$("#contenedorEtiqueta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos1[i].producto_id+"").append("<br>");    			
            			
            			//$("#fechaUltActCadenaValor-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos[i].producto_id).html("  Ultima Actualización: "+ ultFechaActVincular.getDate()+"/"+(ultFechaActVincular.getMonth()+1)+"/"+ultFechaActVincular.getFullYear()+" "+ultFechaActVincular.getHours()+":"+ultFechaActVincular.getMinutes()+":"+ultFechaActVincular.getSeconds());
            			//$("#fechaUltActProgramacionFisica-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos[i].producto_id).html("  Ultima Actualización: "+ ultFechaActProgramacion.getDate()+"/"+(ultFechaActProgramacion.getMonth()+1)+"/"+ultFechaActProgramacion.getFullYear()+" "+ultFechaActProgramacion.getHours()+":"+ultFechaActProgramacion.getMinutes()+":"+ultFechaActProgramacion.getSeconds());
            			//$("#fechaUltActDestinatario-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+datosProductos[i].producto_id).html("  Ultima Actualización: "+ ultFechaActDestinatario.getDate()+"/"+(ultFechaActDestinatario.getMonth()+1)+"/"+ultFechaActDestinatario.getFullYear()+" "+ultFechaActDestinatario.getHours()+":"+ultFechaActDestinatario.getMinutes()+":"+ultFechaActDestinatario.getSeconds());    			
                  	} 

        	}
    	}  
    }
    $( ".cantidad-depto-mes" ).each(function() {
	 	$(this).change();
	 });
    
    $("body").on("click", "#AgregarObjetoGasto",function(event){
    	var id = $(this).attr("parametros");
	 	var idParsed = id.split("-");
	    var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];    	
    	
		//var OF=$("#organismoFinanciador-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).val();
    	//var FF=$("#fuenteFinanciamiento-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).val();
		var OF=$( "#selOrganismoFinanciador-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" option:selected" ).val();
		var FF=$( "#selFuenteFinanciamiento-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" option:selected" ).val();
    	var objetoGasto=$( "#selObjetoGasto-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" option:selected" ).val();
    	var ogconcat=objetoGasto+'-'+OF+'-'+FF;
    	var OGComparado=new Array(); 
    		
    	if(OF!="" && FF!=""){
    		var OG=new Array();        	
    		
    		$("#tableAsignacion-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" > tbody > tr").each(function() {
    		    //if (!this.rowIndex) return; // skip first row    		    
    		    OGComparado.push(this.cells[0].innerHTML+'-'+this.cells[1].innerHTML+'-'+this.cells[2].innerHTML);    		    
    		});
    		
        	for (var i=0;i<OGComparado.length;i++){        		
        		if(OGComparado[i]==ogconcat){
        			alert("Ya existe objeto de gasto");
        			//modalError("Ya existe objeto de gasto", false);        			        			
        			return;
        		}
        	}
        	
        	var asigPresi= new Object();
			
        	asigPresi.fila=0;
			asigPresi.nivel=nivel;
			asigPresi.entidad=entidad;
			asigPresi.tipo=tipo;
			asigPresi.programa=programa;
			asigPresi.subPrograma=subprograma;
			asigPresi.proyecto=proyecto;
			asigPresi.objetoGasto=objetoGasto;
			asigPresi.fuenteFinanciamiento=FF;
			asigPresi.organismoFinanciador=OF;
			asigPresi.pais="1";
			asigPresi.departamento="99";
			asigPresi.producto=producto;
			asigPresi.observacion="";
			asigPresi.planificado1=0;
			asigPresi.ejecutado1=0;
			asigPresi.planificado2=0;
			asigPresi.ejecutado2=0;
			asigPresi.planificado3=0;
			asigPresi.ejecutado3=0;
			asigPresi.planificado4=0;
			asigPresi.ejecutado4=0;
			asigPresi.planificado5=0;
			asigPresi.ejecutado5=0;
			asigPresi.planificado6=0;
			asigPresi.ejecutado6=0;
			asigPresi.planificado7=0;
			asigPresi.ejecutado7=0;
			asigPresi.planificado8=0;
			asigPresi.ejecutado8=0;
			asigPresi.planificado9=0;
			asigPresi.ejecutado9=0;
			asigPresi.planificado10=0;
			asigPresi.ejecutado10=0;
			asigPresi.planificado11=0;
			asigPresi.ejecutado11=0;
			asigPresi.planificado12=0;
			asigPresi.ejecutado12=0;
			asigPresi.anho="2017";
			asigPresi.version="50";
			
			$.ajax({
		        url: "ajaxInserts?accion=insAsignacionPresi",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(asigPresi),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == "Exito"){
		        		
		        		var fila=	"<tr>" +
										"<td>"+objetoGasto+"</td>" +
										"<td>"+OF+"</td>" +
										"<td>"+FF+"</td>" +
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-1'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-1-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-2'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-2-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-3'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-3-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-4'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-4-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-5'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-5-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-6'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-6-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-7'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-7-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-8'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-8-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-9'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-9-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-10'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-10-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-11'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-11-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><input type='number' value='0' class='suma-financiera' name='cantidad-"+producto+"-"+objetoGasto+"-12'"+" id='cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto+"-12-"+FF+"-"+OF+"-99-1-2017-50"+"'></td>"+
										"<td><b>0<b></td>" +
									"</tr>"; 
    	
		        		$("#tableAsignacion-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" tbody").append(fila);
		        		
						//alert("Exito!");				
		    		}else{
						alert("Error al agregar objeto de gasto");
					}        	
		        },
		        error: function(data,status,er) {
		        	//alert("ERROR function");
		        }
		 });
    	}
    	
    });
    
    $("body").on("change", ".suma-financiera",function(event){    
	 	var id = $(this).attr("id");	 	
	 	var idParsed = id.split("-");
	    var nivel=idParsed[1];
		var entidad=idParsed[2];
		var tipo=idParsed[3];
		var programa=idParsed[4];
		var subprograma=idParsed[5];
		var proyecto=idParsed[6];
		var producto=idParsed[7];
		var objetoGasto=idParsed[8];
		var mes=idParsed[9];
		var fuenteFinanciamiento=idParsed[10];
		var organismoFinanciador=idParsed[11];
		var departamento=idParsed[12];
		var pais=idParsed[13];
		var anho=idParsed[14];
		var version=idParsed[15];
		var sumafila=0;
		var sumacolumna=0;				
		var col=parseInt(mes)+3;
		var fila=parseInt($(this).parent().parent().index()+1);
		
		$("#tableAsignacion-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" tbody tr td:nth-child("+col+") input").each( function(){			   
			sumacolumna+=parseFloat($(this).val());
		});
		$("#sumaOG-"+mes+"-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).html("<b>"+numeroConComa(sumacolumna.round(2))+"</b>");
		
		$("#tableAsignacion-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" tr:eq("+fila+") input").each( function(){			   
			sumafila+=parseFloat($(this).val());
		});		
		$("#sumaOG-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+objetoGasto).html("<b>"+numeroConComa(sumafila.round(2))+"</b>");
		
	 });
    
  }
  
  var eje1 = new Combo();
  document.getElementById('nivel-formulario').addEventListener('focus',eje1.nivelFocus,false);
  document.getElementById('nivel-formulario').addEventListener('change',eje1.nivel,false);
  document.getElementById('entidad-formulario').addEventListener('focus',eje1.entidadFocus,false);
  document.getElementById('entidad-formulario').addEventListener('change',eje1.entidad,false);
  document.getElementById('tipoPrograma-formulario').addEventListener('focus',eje1.tipoProgramaFocus,false); 
  document.getElementById('tipoPrograma-formulario').addEventListener('change',eje1.tipoPrograma,false);
  document.getElementById('programa-formulario').addEventListener('focus',eje1.programasFocus,false); 
  document.getElementById('programa-formulario').addEventListener('change',eje1.programas,false); 
  document.getElementById('subPrograma-formulario').addEventListener('focus',eje1.subProgramasFocus,false); 
  document.getElementById('subPrograma-formulario').addEventListener('change',eje1.subProgramas,false);  
  document.getElementById('proyecto-formulario').addEventListener('focus',eje1.proyectoFocus,false); 
  document.getElementById('proyecto-formulario').addEventListener('change',eje1.proyecto,false);
  
  document.getElementById('proyecto-formulario').addEventListener('change',eje1.dibujar,false);

$( document ).ready(function() {
	//cargar producto
	/*
	$("nivel-formulario").val(nivel_id);
	$("nivel-formulario").change();
	$("entidad-formulario").val(entidad_id);
	$("entidad-formulario").change();
	*/
	
	var periodo = $.ajax({
		url:'/ajaxSelects?accion=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);
	
	var periodoActual = '2018';
			
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
		
		if ( $("#listaf3c2").length ) {
			$("#listaf3c2").remove();
			$('#tipoPrograma-formulario').val('');
			$("#listaf4c2").remove();
			$('#programa-formulario').val('');
			$("#listaf5c2").remove();
			$('#subPrograma-formulario').val('');
			$("#listaf6c2").remove();
			$('#proyecto-formulario').val('');
			$("#listaf7c2").remove();
		}
	   	
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
	 	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
	   
	});
	
	$("body").on("change", "#versionSeleccion",function(event){	
		periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		var versionSeleccionado = $("#versionSeleccion option:selected").val();
	 	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();

	   	renderInsLineaAccion(periodoSeleccionado, versionSeleccionado, etiquetaSeleccionado);
	   
	});
	
	$("body").on("change", ".selectorAnhoVersion",function(event){
      var id = $('option:selected', this).attr('parametros');
      var idParsed = id.split("-");
      var nivel = idParsed[0];
      var entidad = idParsed[1];
      var tipo = idParsed[2];
      var programa = idParsed[3];
      var subPrograma = idParsed[4];
      var proyecto = idParsed[5];
      var producto = idParsed[6];
      var anho = idParsed[7];
      var version = idParsed[8];
      
	$( "div" ).remove( '#AsignacionFinanciera-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto);

    //crear nuevo producto
  	$("#anho-crear-producto").attr("value",anho);
  	$("#nivel-crear-producto").attr("value",nivel);
  	$("#entidad-crear-producto").attr("value",entidad);
  	$("#tipo-crear-producto").attr("value",tipo);
  	$("#programa-crear-producto").attr("value",programa);
  	$("#subprograma-crear-producto").attr("value",subPrograma);
  	$("#proyecto-crear-producto").attr("value",proyecto);
  	$("#crear-producto").toggle();
  	
  	var optionProducto="";
  	var productos = $.ajax({
	    	url:'/ajaxSelects?accion=getProductos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
  	productos = JSON.parse(productos);
  	productos = productos.productos;
	
	for(i = 0;i<productos.length; i++){
		optionProducto+='<option value="'+productos[i].codigoCatalogo+'">'+productos[i].codigoCatalogo+") "+productos[i].nombreCatalogo+'</option>';
	}
		
	$("#producto_id-crear-producto").append(optionProducto);
		
	var optionTiposDestinatarios="";
  	var  tiposDestinatarios= $.ajax({
	    	url:'ajaxSelects?accion=getTiposDestinatarios',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
  	tiposDestinatarios = JSON.parse(tiposDestinatarios);
  	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
		for(i = 0;i<tiposDestinatarios.length; i++){
			optionTiposDestinatarios+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
		}
		//$("#producto_id-crear-producto").append(optionProducto);
		
		function numeroConComa(x) {
          return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      }

   	var datosMeses = $.ajax({
        url:'/ajaxSelects?accion=getMeses',
        type:'get',
        dataType:'json',
        async:false       
      }).responseText;
      datosMeses = JSON.parse(datosMeses);

      var datosDepartamentos = $.ajax({
        url:'/ajaxSelects?accion=getDepartamentos',
        type:'get',
        dataType:'json',
        async:false       
      }).responseText;
      datosDepartamentos = JSON.parse(datosDepartamentos);


    var datosProductos = $.ajax({
        url:'/ajaxSelects?accion=getProductosPresupuesto&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subPrograma+'&proyecto='+proyecto+'&producto='+producto,
        type:'get',
        dataType:'json',
        async:false       
      }).responseText;
      datosProductos = JSON.parse(datosProductos);

	    
	    //Obtenemos los años que posee un proyecto determinado
	    var anhosPorProyecto =  $.ajax({
	        url:'/ajaxSelects?accion=getAsignacionPresiAnhoProyecto&nivel='+nivel+'&entidad='+entidad+'&tipoo='+tipo+'&programa='+programa+'&subprograma='+subPrograma+'&proyecto='+proyecto,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	    anhosPorProyecto = JSON.parse(anhosPorProyecto);
	    
    var datosAsignacion =  $.ajax({
        url:'/ajaxSelects?accion=getAsignacionPresi&nivel='+nivel+'&entidad='+entidad+'&tipo='+tipo+'&programa='+programa+'&subprograma='+subPrograma+'&proyecto='+proyecto+'&anho='+anho+'&versionReporte='+version+'&producto='+producto,
        type:'get',
        dataType:'json',
        async:false 
      }).responseText;
    datosAsignacion = JSON.parse(datosAsignacion);
       

      for(var i = 0; i < datosProductos.producto.length ; i++) 
      {       
                 
     		var contenedorDeProducto = document.createElement('div');
     		contenedorDeProducto.setAttribute('nivel',nivel);
 			contenedorDeProducto.setAttribute('entidad',entidad);
			contenedorDeProducto.setAttribute('tipoPresupuesto',tipo);
			contenedorDeProducto.setAttribute('programa',programa);
			contenedorDeProducto.setAttribute('subprograma',subPrograma);
			contenedorDeProducto.setAttribute('proyecto',proyecto);
			contenedorDeProducto.setAttribute('id',"producto-"+datosProductos.producto[i].id);
			contenedorDeProducto.setAttribute('producto',datosProductos.producto[i].id);
			contenedorDeProducto.setAttribute('class',"col-md-12");
			var cajaProductoFinanciero="";
			cajaProductoFinanciero+=' <!-- PRODUCTO -->'+
          '<div class="box box-info direct-chat direct-chat-info col-md-12" id="AsignacionFinanciera-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'">'+
          '<form class="form-horizontal" id="form-producto-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+datosProductos.producto[i].id+'-og-'+datosAsignacion.codigoObjetoGasto+'" >'+
          	'<input type="hidden" name="accion" value="updateProductoFinaciero">'+
          	''+
            '<div class="box-header with-border">'+
              '<h3 class="box-title">Nombre Producto</h3>'+
              '<div class="box-tools pull-right">'+
             //  '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
              '</div>'+
            '</div><!-- /.box-header -->'+
            '<div class="box-body" style="display:block;">'+
            '<div class="table-responsive">'+
              '<table class="table table-striped table-bordered  table-hover">'+
             ' 	<tr>'+
              '		<th>OG</th>'+
              '		<th>OF</th>'+
              '		<th>Ene</th>'+
              '		<th>Feb</th>'+
              '		<th>Mar</th>'+
              '		<th>Abr</th>'+
              '		<th>May</th>'+
              '		<th>Jun</th>'+
              '		<th>Jul</th>'+
              '		<th>Ago</th>'+
              '		<th>Set</th>'+
              '		<th>Oct</th>'+
              '		<th>Nov</th>'+
              '		<th>Dic</th>'+
              '		<th><b>Total</b></th>'+
              '	</tr>'+
              '<tbody class="table-body-producto" categoria="finaciero" producto="'+datosProductos.producto[i].id+'-og">'+
              '</tbody>';
			var totalTotal = 0;
			for(var j = 0; j < datosAsignacion.length ; j++){
				var sumObG=parseFloat(0.0);
				if (datosAsignacion[j].nivel==nivel && 
					datosAsignacion[j].entidad == entidad &&
					datosAsignacion[j].tipo == tipo &&
					datosAsignacion[j].programa == programa &&
					datosAsignacion[j].subPrograma == subPrograma &&
					datosAsignacion[j].proyecto == proyecto &&
					datosAsignacion[j].producto == datosProductos.producto[i].id ){
					
					sumObG=parseFloat(datosAsignacion[j].planificado1)+
					parseFloat(datosAsignacion[j].planificado2)+
					parseFloat(datosAsignacion[j].planificado3)+
					parseFloat(datosAsignacion[j].planificado4)+
					parseFloat(datosAsignacion[j].planificado5)+
					parseFloat(datosAsignacion[j].planificado6)+
					parseFloat(datosAsignacion[j].planificado7)+
					parseFloat(datosAsignacion[j].planificado8)+
					parseFloat(datosAsignacion[j].planificado9)+
					parseFloat(datosAsignacion[j].planificado10)+
					parseFloat(datosAsignacion[j].planificado11)+
					parseFloat(datosAsignacion[j].planificado12);
					
					totalTotal += sumObG;
					cajaProductoFinanciero+=' 	<tr>'+
	                      '		<td>'+datosAsignacion[j].objetoGasto+'</th>'+
	                      '		<td>'+datosAsignacion[j].organismoFinanciador+'</th>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado1)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado2)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado3)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado4)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado5)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado6)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado7)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado8)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado9)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado10)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado11)+'</td>'+
	                      '		<td>'+numeroConComa(datosAsignacion[j].planificado12)+'</td>'+
	                      '		<td><b>'+numeroConComa(parseFloat(sumObG).toFixed(0))+'</b></td>'+
	                      '	</tr>';
	
				}
			}

          
			cajaProductoFinanciero+='<tr class="success"><td colspan="14"><h5><strong>Total</strong></h5></td><td><strong>'+numeroConComa(totalTotal)+'</strong></td></tr>'+
				'</table>'+
			'</div>'+
          '<br>'+
        '</div>'+
        '<div class="box-footer">'+

        '</div>'+
       '<input type="hidden" name="unidad_medida_id" value="" id="unidad_medida-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+datosProductos.producto[i].id+'">'+
      '</form></div>';
						
		    				contenedorDeProducto.innerHTML=cajaProductoFinanciero;
      
      }
		var nparrafo=document.getElementById('footerAsignacion-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto);
      	nparrafo.appendChild(contenedorDeProducto);
	     	      
	});
	
	
	
	$("body").on("change", "#producto_id-crear-producto",function(event){
		var productos = $.ajax({
	    	url:'/ajaxSelects?accion=getProductos&producto='+$("#producto_id-crear-producto").val(),
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	productos = JSON.parse(productos);
    	productos = productos.productos;
    	
		var unidadesMedida = $.ajax({
			url:'/ajaxSelects?accion=getUnidadesMedida&unidadMedida='+productos[0].codUnidadMedida,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadesMedida = JSON.parse(unidadesMedida);
		unidadesMedida = unidadesMedida.unidadesMedida;
		$("#producto_unidad_medida_id-crear-producto").val(unidadesMedida[0].codigoUnidadMedida);
		$("#producto_unidad_medida_nombre-crear-producto").val(unidadesMedida[0].nombre);
		$("#producto_unidad_medida_nombre-crear-producto").attr("disabled","");
		$("#producto_unidad_medida_nombre-crear-producto").attr("size",	unidadesMedida[0].nombre.length+5);
		$("#producto_clase-crear-producto").attr("disabled","");
		$("#producto_tipo_producto").val(productos[0].clase);
		$("#producto_tipo_producto").attr("disabled","");
		
		event.stopPropagation();
	});
	$("body").on("click", "#crear-producto-boton",function(event){
		$("#crear-producto-boton").attr("disabled","");
		if(validacion==true){
			var productoPresupuesto= new Object();
			var accion = "insProductoPresupuesto";
			productoPresupuesto.anho=$("#anho-crear-producto").val();
			productoPresupuesto.nivel_id=$("#nivel-crear-producto").val();
			productoPresupuesto.entidad_id=$("#entidad-crear-producto").val();
			productoPresupuesto.tipo_presupuesto_id=$("#tipo-crear-producto").val();
			productoPresupuesto.programa_id=$("#programa-crear-producto").val();
			productoPresupuesto.subprograma_id=$("#subprograma-crear-producto").val();
			productoPresupuesto.proyecto_id=$("#proyecto-crear-producto").val();
			productoPresupuesto.id=$("#producto_id-crear-producto").val();
			productoPresupuesto.producto_id=$("#producto_id-crear-producto").val();
			productoPresupuesto.unidad_medida_id=$("#producto_unidad_medida_id-crear-producto").val();		
			 $.ajax({
			        url: "ajaxInserts?accion="+accion,
			        type: 'POST',
			        dataType: 'json',
			        data: JSON.stringify(productoPresupuesto),
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data){
			        	if(data.success == true){
				        	alert("Guardado!");
				    		$("#producto_id-crear-producto").html("");
				        	$("#row-body-programacionfisica").html("");
				        	eje1.dibujar();
				        	$("#crear-producto-boton").attr("disabled",false);
			        	}else{
			        		alert("ERROR al intentar agregar este producto. Probablemente ya existe!!");
				        	$("#crear-producto-boton").attr("disabled",false);
			        	}
			        },
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {$("#row-body-programacionfisica").html("");eje1.dibujar();}
			 });
			
			
			event.stopPropagation();
		}else{
			modalError("Estructura inexistente, intente de nuevo por favor",false);
		}
		
	});
	
	$("body").on("click", "#buscarProductos",function(event){

		
		 event.preventDefault();
		event.stopPropagation();
	});
	
	$("body").on("submit", "#formulario-crear-producto",function(event){
		 event.preventDefault();
		 return false;
	});
	
	function renderDestinatario(nivel,entidad,tipo,programa,subprograma,proyecto,producto){
		if ( $("#modalDestinatario").length )
		{
			$("#modalDestinatario").remove();
		}
		if ( $("#modalEditarDestinatario").length )
		{
			$("#modalEditarDestinatario").remove();
		}
		if ( $("#modalBorrarDestinatario").length )
		{
			$("#modalBorrarDestinatario").remove();
		}	
						
    	var  tiposDestinatarios= $.ajax({
	    	url:'ajaxSelects?accion=getTiposDestinatarios',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	tiposDestinatarios = JSON.parse(tiposDestinatarios);
    	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
    	
    	var optionTiposDestinatarios="";
		for(i = 0;i<tiposDestinatarios.length; i++){
			optionTiposDestinatarios+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
		}
		
        var departamentos = $.ajax({
          url:'ajaxSelects?accion=getDepartamentos',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        departamentos = JSON.parse(departamentos);				
		departamentos = departamentos.departamentos;
				
		var optionDepartamentoDestinatarios = "";		
		for(w = 0;w<departamentos.length; w++){
			optionDepartamentoDestinatarios+='<option value="'+departamentos[w].deptoPais+'">'+departamentos[w].abrevDepartamento+'</option>';
		}
		
		
	    var cuerpoModalDestinatario="";
	    cuerpoModalDestinatario+='<div class="modal fade" id="modalDestinatario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'				<button type="button" class="close" data-dismiss="modal">&times;</button>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						
						'		      		<div class="row">'+		

						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning box-solid">'+
						'		                	<div class="box-header with-border">'+
						'	                  			<h3 class="box-title">Destinatarios</h3>'+
						'	                  			<div class="box-tools pull-right">'+										                  
						'		                  		</div>'+
						'              				</div>'+
						'               			<div class="box-body">';
						if(rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
						cuerpoModalDestinatario+='		<div class="col-md-12">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Asignar Destinatarios</h3>'+
						'	                  						<div class="box-tools pull-right">'+												
						'		                  					</div>'+
						'              							</div>'+
						'              						<div class="box-body">'+
						
						'										<div class="table-responsive">'+
						'											<table class="table table-hover">'+
						'												<tbody>'+
						'			      									<form class="form-horizontal" role="form">'+
						'													<tr><td><label for="tipoDestinatario">Tipo</label><select id="tipoDestinatario" class="form-control">'+optionTiposDestinatarios+'</select></td><td><label for="grupoDestinatario">Grupo</label><select id="grupoDestinatario" class="form-control"></select></td></tr>'+
						'													<tr><td><label for="cantidadDestinatario">Cantidad</label><input type="number" id="cantidadDestinatario" class="form-control" placeholder="Ingrese una Cantidad" /></td><td><label for="descripcionDestinatario">Descripción</label><input type="text" id="descripcionDestinatario" class="form-control" placeholder="Ingrese una Descripción" /></td></tr>'+
						'													<tr><td><label for="departamentoDestinatario">Departamento</label><select id="departamentoDestinatario" class="form-control">'+optionDepartamentoDestinatarios+'</select></td></tr>'+
						'			      									</form>	'+				
						'												</tbody>'+
						'											</table>'+
						'				      					</div>'+
						
						'				      				 </div>'+//fin box body
						'									 <div class="modal-footer">'+ 
						'									 	  <button type="button" class="btn btn-success guardarDestinatario" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" >Guardar Destinatario</button>'+//						
						'									 </div>'+									
						'				      			 	</div>'+
						'				      			</div>';					
						}
						cuerpoModalDestinatario+='		<div class="col-md-12">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Lista Destinatarios</h3>'+
						'	                  						<div class="box-tools pull-right">'+												
						'		                  					</div>'+
						'              							</div>'+
						'              						<div class="box-body" id="cuerpoTablaModalDestinatarios">'+
						'										<div class="table-responsive">'+
						'											<table class="table table-hover table-bordered" id="dataTableDestinatario">'+
						'												<thead>'+
						'													<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th>Departamento</th><th class="text-center">Administrar</th></tr>'+
						'												</thead>'+
						'												<tfoot><tr><th></th><th></th><th></th><th></th><th></th><th></th></tr></tfoot>'+
						'												<tbody id="listaDestinatario">'+
																			
						'												</tbody>'+
						'									 		</table>'+
						'										</div>'+		       	      			       	   
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
	    
	      var cuerpoDestinatario = "";		     
			
	      var productoDestinatarios = $.ajax({
				//url:'/ajaxSelects?accion=getProductoDestinatario',
				url:'ajaxSelects?accion=getProductoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
	      }).responseText;
	      productoDestinatarios = JSON.parse(productoDestinatarios);
	      productoDestinatarios = productoDestinatarios.productoDestinatarios;
	      
			var grupoDestinatario = $.ajax({
				url:'ajaxSelects?accion=getDestinatarios',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			grupoDestinatario = JSON.parse(grupoDestinatario);
			grupoDestinatario = grupoDestinatario.destinatarios;												
	      			
			var nombreDepto;
			var grupo;
			var tipoDest;					    
			
	      for(var a = 0; a < productoDestinatarios.length; a++)
	      {				
	    	  nombreDepto = "";
	    	  grupo = "";
	    	  tipoDest = "";
				
				for(var g = 0; g <grupoDestinatario.length; g++){
					if(grupoDestinatario[g].id == productoDestinatarios[a].catalogo_destinatario)
					{
						grupo = grupoDestinatario[g].nombre;
						
						for(var j = 0; j < tiposDestinatarios.length; j++){
							if(grupoDestinatario[g].tipo_catalogo_destianatario_id == tiposDestinatarios[j].id)
							{
								tipoDest = tiposDestinatarios[j].nombre;
							}
						}
					}
				}
				
				for(var p = 0; p <departamentos.length; p++){
					if(productoDestinatarios[a].departamento == departamentos[p].deptoPais)
					{
						nombreDepto = departamentos[p].abrevDepartamento;
					}
				}

				
				if(productoDestinatarios[a].borrado == true)
				{
					if (rol_jsp == 0 || rol_jsp == 1){
						cuerpoDestinatario += '<tr><td><del>'+tipoDest+'</del></td><td><del>'+grupo+'</del></td><td><del>'+productoDestinatarios[a].descripcion+'</del></td><td><del>'+productoDestinatarios[a].cantidad+'</del></td><td><del>'+nombreDepto+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatario" data-toggle="tooltip" data-placement="top" title="Restaurar Destinatario" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+productoDestinatarios[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
					}
				}else{
					if (rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
						cuerpoDestinatario += '<tr><td>'+tipoDest+'</td><td>'+grupo+'</td><td>'+productoDestinatarios[a].descripcion+'</td><td>'+productoDestinatarios[a].cantidad+'</td><td>'+nombreDepto+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarDestinatario" data-toggle="tooltip" data-placement="top" title="Editar Destinatario" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+productoDestinatarios[a].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatario" data-toggle="tooltip" data-placement="top" title="Borrar Destinatario" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+productoDestinatarios[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
					} else if (rol_jsp == 3){
						cuerpoDestinatario += '<tr><td>'+tipoDest+'</td><td>'+grupo+'</td><td>'+productoDestinatarios[a].descripcion+'</td><td>'+productoDestinatarios[a].cantidad+'</td><td>'+nombreDepto+'</td><td class="text-center"></td></tr>';
					}
				}
			}	
	      
	     $("body").append(cuerpoModalDestinatario); 
	     $('#listaDestinatario').append(cuerpoDestinatario);  
	     if ( $("#dataTableDestinatario").length){
				$('#dataTableDestinatario').DataTable().destroy();
			}
	     $('#dataTableDestinatario').DataTable( {
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
		              ],
		        "footerCallback": function ( row, data, start, end, display ) {
		        	var api = this.api(), data;
		        	// saca los puntos y <del> de la cadena para pasarlo a entero
		        	var intVal = function(i){
		            	if(typeof i==='string'){	
		            		if (i.match(/<\/?del>/g)) {//si está borrado devuelve 0 y no suma.
		            			return i = 0;
		            		} else {//si no está borrado le quita los caracteres que estan demas y devuelve el valor entero.
		            			i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
								i=i.replace(/[","]/g, '.');
								i=i*1;
		            		}		  
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
	                total3 = api
	                    .column( 3 )
	                    .data()
	                    .reduce( function (a, b) {
	                        return intVal(a) + intVal(b);
	                    }, 0 );

	                // total por pagina 
	                pageTotal3 = api
	                    .column( 3, { page: 'current'} )
	                    .data()
	                    .reduce( function (a, b) {
	                        return intVal(a) + intVal(b);
	                    }, 0 );
	                
	                // se muestran los valores de los totales en el footer del table
	                $( api.column( 3 ).footer() ).html(
	                		'Total Pág. '+numeroConComa(pageTotal3) +' (Total Gral. '+ numeroConComa(total3) +')'	                		
	                );
				}
		    } );  	 		 
							 		 
		 $('#tipoDestinatario > option[value="1"]').attr('selected', 'selected');	    	  
	  	 $('#departamentoDestinatario > option[value="0"]').attr('selected', 'selected');
		 
	  	 $('#modalDestinatario').modal('show');
		 $('#tipoDestinatario').change();
	}
	
	$("body").on("click", ".modalDestinatario",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var nivel=idParsed[0];
	    var entidad=idParsed[1];
	    var tipo=idParsed[2];
	    var programa=idParsed[3];
	    var subprograma=idParsed[4];
	    var proyecto=idParsed[5];
	    var producto=idParsed[6];  
	    
	    renderDestinatario(nivel,entidad,tipo,programa,subprograma,proyecto,producto);
				
	});
	
	$("body").on("click", ".guardarDestinatario",function(event){
		  var parametros = $(this).attr("parametros");
		  var idParsed = parametros.split("-"); 
		  var nivel=idParsed[0];
		  var entidad=idParsed[1];
		  var tipo=idParsed[2];
		  var programa=idParsed[3];
		  var subprograma=idParsed[4];
		  var proyecto=idParsed[5];
		  var producto=idParsed[6];  
		
		  var destinatarios = new Object();
	  	  destinatarios.nivel=nivel;
	  	  destinatarios.entidad=entidad;
	  	  destinatarios.tipo_presupuesto=tipo;
	  	  destinatarios.programa=programa;
	  	  destinatarios.subprograma=subprograma;
	  	  destinatarios.proyecto=proyecto;
	  	  destinatarios.producto=producto;
	  	  destinatarios.departamento=$('#departamentoDestinatario').val();
	  	  destinatarios.catalogo_destinatario=$('#grupoDestinatario').val();	    	  
	  	  destinatarios.cantidad=$('#cantidadDestinatario').val();
	  	  destinatarios.descripcion=$('#descripcionDestinatario').val();
	  	   	    	 	    	  
	  	  var dat = JSON.stringify(destinatarios);
		       $.ajax({
			        url: "ajaxInserts?accion=insProductoPresupuestoDestinatario",
			        type: 'POST',
			        dataType: 'json',
			        data: dat,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
			        	if(data.success == "Exito"){
			        	    $("#descripcionDestinatario").val('');
			        		$("#tipoDestinatario").val('');
			        		$("#grupoDestinatario").val('');
			        		$("#cantidadDestinatario").val('');
			        		$("#departamentoDestinatario").val('');
			        		
			        	  var cuerpoDestinatario = "";		     
			     			
			       	      var productoDestinatarios = $.ajax({
			       				//url:'/ajaxSelects?accion=getProductoDestinatario',
			       				url:'ajaxSelects?accion=getProductoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
			       			  	type:'get',
			       			  	dataType:'json',
			       			  	async:false       
			       	      }).responseText;
			       	      productoDestinatarios = JSON.parse(productoDestinatarios);
			       	      productoDestinatarios = productoDestinatarios.productoDestinatarios;
			       	      
			       			var grupoDestinatario = $.ajax({
			       				url:'ajaxSelects?accion=getDestinatarios',
			       			  	type:'get',
			       			  	dataType:'json',
			       			  	async:false       
			       			}).responseText;
			       			grupoDestinatario = JSON.parse(grupoDestinatario);
			       			grupoDestinatario = grupoDestinatario.destinatarios;
			       			
			       			var  tiposDestinatarios= $.ajax({
			       		    	url:'ajaxSelects?accion=getTiposDestinatarios',
			       		      	type:'get',
			       		      	dataType:'json',
			       		      	async:false       
			       		    }).responseText;
			       	    	tiposDestinatarios = JSON.parse(tiposDestinatarios);
			       	    	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
			       	    	
			       	    	var optionTiposDestinatarios="";
			       			for(i = 0;i<tiposDestinatarios.length; i++){
			       				optionTiposDestinatarios+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
			       			}
			       			
			       	        var departamentos = $.ajax({
			       	          url:'ajaxSelects?accion=getDepartamentos',
			       	          type:'get',
			       	          dataType:'json',
			       	          async:false       
			       	        }).responseText;
			       	        departamentos = JSON.parse(departamentos);				
			       			departamentos = departamentos.departamentos;
			       					
			       			var optionDepartamentoDestinatarios = "";		
			       			for(w = 0;w<departamentos.length; w++){
			       				optionDepartamentoDestinatarios+='<option value="'+departamentos[w].deptoPais+'">'+departamentos[w].abrevDepartamento+'</option>';
			       			}
			       	      			
			       			var nombreDepto;
			       			var grupo;
			       			var tipoDest;					    
			       			
			       	      for(var a = 0; a < productoDestinatarios.length; a++)
			       	      {				
			       	    	  nombreDepto = "";
			       	    	  grupo = "";
			       	    	  tipoDest = "";
			       				
			       				for(var g = 0; g <grupoDestinatario.length; g++){
			       					if(grupoDestinatario[g].id == productoDestinatarios[a].catalogo_destinatario)
			       					{
			       						grupo = grupoDestinatario[g].nombre;
			       						
			       						for(var j = 0; j < tiposDestinatarios.length; j++){
			       							if(grupoDestinatario[g].tipo_catalogo_destianatario_id == tiposDestinatarios[j].id)
			       							{
			       								tipoDest = tiposDestinatarios[j].nombre;
			       							}
			       						}
			       					}
			       				}
			       				
			       				for(var p = 0; p <departamentos.length; p++){
			       					if(productoDestinatarios[a].departamento == departamentos[p].deptoPais)
			       					{
			       						nombreDepto = departamentos[p].abrevDepartamento;
			       					}
			       				}

			       				
			       				if(productoDestinatarios[a].borrado == true)
			    				{
			    					if (rol_jsp == 0 || rol_jsp == 1){
			    						cuerpoDestinatario += '<tr><td><del>'+tipoDest+'</del></td><td><del>'+grupo+'</del></td><td><del>'+productoDestinatarios[a].descripcion+'</del></td><td><del>'+productoDestinatarios[a].cantidad+'</del></td><td><del>'+nombreDepto+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatario" data-toggle="tooltip" data-placement="top" title="Restaurar Destinatario" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+productoDestinatarios[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
			    					}
			    				}else{
			    					if (rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
			    						cuerpoDestinatario += '<tr><td>'+tipoDest+'</td><td>'+grupo+'</td><td>'+productoDestinatarios[a].descripcion+'</td><td>'+productoDestinatarios[a].cantidad+'</td><td>'+nombreDepto+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarDestinatario" data-toggle="tooltip" data-placement="top" title="Editar Destinatario" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+productoDestinatarios[a].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatario" data-toggle="tooltip" data-placement="top" title="Borrar Destinatario" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+productoDestinatarios[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
			    					} else if (rol_jsp == 3){
			    						cuerpoDestinatario += '<tr><td>'+tipoDest+'</td><td>'+grupo+'</td><td>'+productoDestinatarios[a].descripcion+'</td><td>'+productoDestinatarios[a].cantidad+'</td><td>'+nombreDepto+'</td><td class="text-center"></td></tr>';
			    					}
			    				}
			       			}	
			        		
			       	      var tablaDestinatario;
			       	      
							tablaDestinatario = '<div class="table-responsive">'+
												'	<table class="table table-hover table-bordered" id="dataTableDestinatario">'+
												'		<thead>'+
												'			<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th>Departamento</th><th class="text-center">Administrar</th></tr>'+
												'		</thead>'+
												'		<tfoot><tr><th></th><th></th><th></th><th></th><th></th><th></th></tr></tfoot>'+
												'		<tbody id="listaDestinatario">'+
														
												'		</tbody>'+
												'	</table>'+
												'</div>';
			       	      
				       	    $("#cuerpoTablaModalDestinatarios").html("");
				       	    $("#cuerpoTablaModalDestinatarios").append(tablaDestinatario);
			        		//$("#listaDestinatario").html("");
			        		$("#listaDestinatario").html(cuerpoDestinatario);			        		 
			        		$('#dataTableDestinatario').DataTable( {
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
			    		              ],
			    		        "footerCallback": function ( row, data, start, end, display ) {
			    		        	var api = this.api(), data;
			    		        	// saca los puntos y <del> de la cadena para pasarlo a entero
			    		        	var intVal = function(i){
			    		            	if(typeof i==='string'){	
			    		            		if (i.match(/<\/?del>/g)) {//si está borrado devuelve 0 y no suma.
			    		            			return i = 0;
			    		            		} else {//si no está borrado le quita los caracteres que estan demas y devuelve el valor entero.
			    		            			i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
			    								i=i.replace(/[","]/g, '.');
			    								i=i*1;
			    		            		}		            		
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
			    	                total3 = api
			    	                    .column( 3 )
			    	                    .data()
			    	                    .reduce( function (a, b) {
			    	                        return intVal(a) + intVal(b);
			    	                    }, 0 );

			    	                // total por pagina 
			    	                pageTotal3 = api
			    	                    .column( 3, { page: 'current'} )
			    	                    .data()
			    	                    .reduce( function (a, b) {
			    	                        return intVal(a) + intVal(b);
			    	                    }, 0 );
			    	                
			    	                // se muestran los valores de los totales en el footer del table
			    	                $( api.column( 3 ).footer() ).html(
			    	                		'Total Pág. '+ numeroConComa(pageTotal3) +' (Total Gral. '+ numeroConComa(total3) +')'	                		
			    	                );
			    				}
			    		    } );
			        		
			        		
			        		$('#tipoDestinatario').val('1').change();
			        		$('#departamentoDestinatario').val('0').change();			        		
			        		 	 					        					        			    	 			       	  	 				       		 			       	  	 				       	  	 				       	  	 			        		
			        	}else{
			        		alert(data.success);        		
			        	}
			        },
			        	
			        error: function(data,status,er) {
			        	alert("ERROR");
			        }
		  });		
	});
	
	$("body").on("click", ".consultaEditarDestinatario",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes variables se utilizan en esta funcion para redibujar el modal anterior
		var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];  
		var destinatarioId = idParsed[7];


		if ( $("#modalDestinatario").length )
		{
			$("#modalDestinatario").remove();
		}	
		
		var productoDestinatario = $.ajax({
			url:'ajaxSelects?accion=getProductoDestinatario&destinatarioId='+destinatarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		productoDestinatario = JSON.parse(productoDestinatario);
		productoDestinatario = productoDestinatario.productoDestinatarios;				
		
		var tiposDestinatarios= $.ajax({
	    	url:'ajaxSelects?accion=getTiposDestinatarios',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	tiposDestinatarios = JSON.parse(tiposDestinatarios);
    	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
    	    	
    	var optionTiposDestinatarios="";
    	
		for(i = 0;i<tiposDestinatarios.length; i++){
			optionTiposDestinatarios+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
		}						 
		
		var departamentos = $.ajax({
            url:'ajaxSelects?accion=getDepartamentos',
            type:'get',
            dataType:'json',
            async:false       
        }).responseText;
        departamentos = JSON.parse(departamentos);				
		departamentos = departamentos.departamentos;
				
		var optionDepartamentoDestinatarios = "";		
		for(w = 0;w<departamentos.length; w++){
			optionDepartamentoDestinatarios+='<option value="'+departamentos[w].deptoPais+'">'+departamentos[w].abrevDepartamento+'</option>';
		}
		
		
		var contenido = "";

		contenido +=		'<div class="modal fade" id="modalEditarDestinatario" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalDestinatario"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Editar Destinatario</h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoModalEditarDestinatarios">'+
											
							'				<div class="table-responsive">'+
							'					<table class="table table-hover">'+
							'						<tbody>'+
							'			      			<form class="form-horizontal" role="form">'+
							'								<tr><td><label for="tipoDestinatario">Tipo</label><select id="tipoDestinatario" class="form-control">'+optionTiposDestinatarios+'</select></td><td><label for="grupoDestinatario">Grupo</label><select id="grupoDestinatario" class="form-control"></select></td></tr>'+
							'								<tr><td><label for="cantidadDestinatario">Cantidad</label><input type="number" id="cantidadDestinatario" class="form-control" placeholder="Ingrese una Cantidad" value="'+productoDestinatario[0].cantidad+'" /></td><td><label for="descripcionDestinatario">Descripción</label><input type="text" id="descripcionDestinatario" class="form-control" placeholder="Ingrese una Descripción" value="'+productoDestinatario[0].descripcion+'" /></td></tr>'+
							'								<tr><td><label for="departamentoDestinatario">Departamento</label><select id="departamentoDestinatario" class="form-control">'+optionDepartamentoDestinatarios+'</select></td></tr>'+
							'			      			</form>	'+				
							'						</tbody>'+
							'					</table>'+
							'				</div>'+
							
							'		    </div>'+
							'			<div class="modal-footer">'+
							' 				<button type="button" class="btn btn-success btn-sm editarDestinatario" id="botonGuardarDestinatario" parametros='+destinatarioId+'>Guardar Cambios</button>'+
							' 				<button type="button" class="btn btn-success btn-sm modalDestinatario" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'">Cerrar</button>'+						
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
									
		
		$("body").append(contenido);				
		
		var grupoAux = $.ajax({
	    	url:'ajaxSelects?accion=getDestinatarios&catalogoProdPresDest='+productoDestinatario[0].catalogo_destinatario,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	grupoAux = JSON.parse(grupoAux);
    	grupoAux = grupoAux.destinatarios;
    	var tipoDestinatarioId = grupoAux[0].tipo_catalogo_destianatario_id;		
		
    	$('#tipoDestinatario > option[value="'+tipoDestinatarioId+'"]').attr('selected', 'selected');
    	$('#tipoDestinatario').change();
    	$('#grupoDestinatario > option[value="'+productoDestinatario[0].catalogo_destinatario+'"]').attr('selected', 'selected');
    	$('#departamentoDestinatario > option[value="'+productoDestinatario[0].departamento+'"]').attr('selected', 'selected');
		$('#modalEditarDestinatario').modal('show');		
	});
	
	$("body").on("click", ".editarDestinatario",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		var destinatarioId = idParsed[0];// es el id de la tabla producto_presupuesto_destinatario
		
		var grupo = $("#grupoDestinatario").val();
		var cantidad = $("#cantidadDestinatario").val();
		var descripcion = $("#descripcionDestinatario").val();
		var departamento = $("#departamentoDestinatario").val();

		
		var objeto = new Object();
		
		objeto.id = destinatarioId;		
		objeto.catalogo_destinatario = grupo;
		objeto.cantidad = cantidad;
		objeto.descripcion = descripcion;
		objeto.departamento = departamento;
		
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate?accion=actProductoPresupuestoDestinatario",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == true)
	        	{
	        		$("#botonGuardarDestinatario").remove();
	            	$("#cuerpoModalEditarDestinatarios").html("");
	            	$("#cuerpoModalEditarDestinatarios").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
	        	}else{
	        		alert("ERROR");        		
	        	}
	        	
	        },
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        		alert("ERROR");
	        }
		 });
		
	});
	
	$("body").on("click", ".consultaBorrarDestinatario",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes variables se utilizan en esta funcion para redibujar el modal anterior
	    var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];  
		var destinatarioId = idParsed[7];

		if ( $("#modalDestinatario").length )
		{
			$("#modalDestinatario").remove();
		}		
		
		var productoDestinatario = $.ajax({
			url:'ajaxSelects?accion=getProductoDestinatario&destinatarioId='+destinatarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		productoDestinatario = JSON.parse(productoDestinatario);
		productoDestinatario = productoDestinatario.productoDestinatarios;	
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarDestinatario"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalDestinatario"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" ><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Borrar - Restaurar Destinatario</h4>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							'				<div id="mensajeBorradoDestinatario"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoDestinatario">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("body").append(contenido);
			
			if(productoDestinatario[0].borrado == true){
				$("#mensajeBorradoDestinatario").html("");
				$("#mensajeBorradoDestinatario").append('<h3 class="text-center">Ud. está seguro que desea RESTABLACER éste registro</h3>');
				$("#agregarBotonBorradoDestinatario").html("");
				$("#agregarBotonBorradoDestinatario").append('<button type="button" class="btn btn-success btn-sm borrarDestinatario" id="botonRestaurarDestinatario" parametros='+destinatarioId+'-r>Restaurar Destinatario</button>');
				$("#agregarBotonBorradoDestinatario").append('<button type="button" class="btn btn-success btn-sm modalDestinatario" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'">Cerrar</button>');
			}else{
				$("#mensajeBorradoDestinatario").html("");
				$("#mensajeBorradoDestinatario").append('<h3 class="text-center">Ud. está seguro que desea BORRAR éste registro</h3');
				$("#agregarBotonBorradoDestinatario").html("");
				$("#agregarBotonBorradoDestinatario").append('<button type="button" class="btn btn-danger btn-sm borrarDestinatario" id="botonBorradoDestinatario" parametros='+destinatarioId+'-b>Borrar Destinatario</button>');
				$("#agregarBotonBorradoDestinatario").append('<button type="button" class="btn btn-success btn-sm modalDestinatario" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'">Cerrar</button>');
			}
			
			$('#modalBorrarDestinatario').modal('show');
				
	});
	$("body").on("click", ".borrarDestinatario",function(event){	
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var destinatarioId = idParsed[0];
	    var estado = idParsed[1];
	    
	    var productoDestinatario = $.ajax({
			url:'ajaxSelects?accion=getProductoDestinatario&destinatarioId='+destinatarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		productoDestinatario = JSON.parse(productoDestinatario);
		productoDestinatario = productoDestinatario.productoDestinatarios;	
	    
	    var objeto = new Object();
	    objeto.id = destinatarioId;
	    objeto.borrado= productoDestinatario[0].borrado;

	    
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate?accion=actBorrarProductoPresupuestoDestinatario",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	
	        	if(data.success == true){
	            	if(estado == "b"){
		        		$("#botonBorradoDestinatario").remove();
		            	$("#mensajeBorradoDestinatario").html("");
		            	$("#mensajeBorradoDestinatario").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
		            }else{
		        		$("#botonRestaurarDestinatario").remove();
		            	$("#mensajeBorradoDestinatario").html("");
		            	$("#mensajeBorradoDestinatario").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
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
	
//============MODAL JSUTIFICACION=========//	
	$("body").on("click", ".modalJustificacion",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var nivel=idParsed[0];
	    var entidad=idParsed[1];
	    var tipo=idParsed[2];
	    var programa=idParsed[3];
	    var subprograma=idParsed[4];
	    var proyecto=idParsed[5];
	    var producto=idParsed[6];  
	    
	    renderJustificacion(nivel,entidad,tipo,programa,subprograma,proyecto,producto);
				
	});
	
	function renderJustificacion(nivel,entidad,tipo,programa,subprograma,proyecto,producto){
		if ( $("#modalJustificacion").length )
		{
			$("#modalJustificacion").remove();
		}
		if ( $("#modalEditarJustificacion").length )
		{
			$("#modalEditarJustificacion").remove();
		}
		if ( $("#modalBorrarJustificacion").length )
		{
			$("#modalBorrarJustificacion").remove();
		}
		if ( $("#modalDictamen").length )
		{
			$("#modalDictamen").remove();
		}
		
	    var cuerpoModalJustificacion="";
	    cuerpoModalJustificacion+='<div class="modal fade" id="modalJustificacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'				<button type="button" class="close" data-dismiss="modal">&times;</button>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'		      	<div class="row">'+		
						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning box-solid">'+
						'		                	<div class="box-header with-border">'+
						'	                  			<h3 class="box-title">Justificación</h3>'+
						'	                  			<div class="box-tools pull-right">'+										                  
						'		                  		</div>'+
						'              				</div>'+
						'               			<div class="box-body">';
						if(rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
						cuerpoModalJustificacion+='		<div class="col-md-12">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Insertar Justificación</h3>'+
						'	                  						<div class="box-tools pull-right">'+												
						'		                  					</div>'+
						'              							</div>'+
						'              							<div class="box-body">'+
						'											<div class="table-responsive">'+
						'												<table class="table table-hover">'+
						'													<tbody>'+
						'			      										<form class="form-horizontal" role="form">'+
						'															<tr><td><label for="descripcionJustificacion">Descripción</label><input type="text" id="descripcionJustificacion" class="form-control" placeholder="Ingrese la descripción" /></td></tr>'+
						'														</form>	'+				
						'													</tbody>'+
						'												</table>'+
						'				      						</div>'+
						'				      				 	</div>'+//fin box body
						'										<div class="modal-footer">'+ 
						'									 		<button type="button" class="btn btn-success guardarJustificacion" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" >Guardar Justificación</button>'+//
//						'											<button type="button" class="btn btn-warning modalDictamen" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" >Dictamen STP</button><small id="fechaUltActDictamen-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'"></small>'+
						'										</div>'+									
						'									</div>'+
						'				      			</div>';//fin col-md-12				
						}
						cuerpoModalJustificacion+='		<div class="col-md-12">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Lista de Justificaciones</h3>'+
						'	                  						<div class="box-tools pull-right">'+												
						'		                  					</div>'+
						'              							</div>'+
						'              							<div class="box-body" id="cuerpoTablaModalJustificacion">'+
						'											<div class="table-responsive">'+
						'												<table class="table table-hover table-bordered" >'+ //id="dataTableJustificacion">'+
						'													<thead>'+
						'														<tr class="active"><th>Descripción</th><th>Fecha</th><th>Administrar</th></tr>'+
						'													</thead>'+
						'													<tfoot><tr><th></th><th></th><th></th></tr></tfoot>'+
						'													<tbody id="listaJustificacion">'+
						'													</tbody>'+
						'									 			</table>'+
						'											</div>'+		       	      			       	   
						'				      					</div>'+
						'				      				</div>'+
						'              					</div>'+//fin col-md-12
						'              				</div>'+//fin box-body						
						'                		</div>'+
						'               	</div>'+
						'                </div>'+//fin row																	
						
						'		    </div>'+
						'			<div class="modal-footer">'+							
				      	'			</div>'+														
						'		</div>'+ 
						'	</div>'+
						'</div>';

	      var cuerpoJustificacion = "";		     
			
	      var justificacion = $.ajax({
				url:'ajaxSelects?accion=getJustificacion&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
	      }).responseText;
	      justificacion = JSON.parse(justificacion);
	      //justificacion = justificacion.justificacion;

	      if(justificacion != null){	    	  
	    	  for(var a = 0; a < justificacion.length; a++){
	    		  if(justificacion[a].borrado == true){
	    			  if (rol_jsp == 0 || rol_jsp == 1){
	    				  cuerpoJustificacion += '<tr><td><del>'+justificacion[a].descripcion+'</del></td><td><del>'+justificacion[a].fechaActualizacion+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarJustificacion" data-toggle="tooltip" data-placement="top" title="Restaurar Justificacion" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
	    			  }
	    		  }else{
	    			  if (rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
	    				  cuerpoJustificacion += '<tr><td>'+justificacion[a].descripcion+'</td><td>'+justificacion[a].fechaActualizacion+'</td><td class="text-center">'+
	    				  						 '			<button type="button" class="btn btn-default btn-sm modalDictamen" data-toggle="tooltip" data-placement="top" title="Agregar Dictamen" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+'" ><span class="fa fa-plus"></span></button>'+
	    				  						 '			<button type="button" class="btn btn-default btn-sm consultaEditarJustificacion" data-toggle="tooltip" data-placement="top" title="Editar Justificacion" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+' ><span class="fa fa-pencil"></span></button>'+
	    				  						 '			<button type="button" class="btn btn-default btn-sm consultaBorrarJustificacion" data-toggle="tooltip" data-placement="top" title="Borrar Justificacion" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
	    			  } else if (rol_jsp == 3){
	    				  cuerpoJustificacion += '<tr><td>'+justificacion[a].descripcion+'</td><td>'+justificacion[a].fechaActualizacion+'</td><td class="text-center"></td></tr>';
	    			  }
	    		  }
	    	  }	
	      }
	      
	     $("body").append(cuerpoModalJustificacion); 
	     $('#listaJustificacion').append(cuerpoJustificacion);  
	     if ( $("#dataTableJustificacion").length){
				$('#dataTableJustificacion').DataTable().destroy();
			}
	     $('#dataTableJustificacion').DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		                  {
		                      extend: 'copy',
		                      exportOptions: {
		                  columns: [ 0 ]
		              }
		                  },
		                  {
		                      extend: 'csv',
		                      exportOptions: {
		                  columns: [ 0 ]
		              }
		                  },
		                  {
		                      extend: 'excel',
		                      exportOptions: {
		                  columns: [ 0]
		              }
		                  },
		                  {
		                      extend: 'pdf',
		                      exportOptions: {
		                  columns: [ 0 ]
		              }
		                  },
		                  {
		                      extend: 'print',
		                      exportOptions: {
		                  columns: [ 0 ]
		              }
		                  }
		              ],
		        "footerCallback": function ( row, data, start, end, display ) {
		        	var api = this.api(), data;
		        	// saca los puntos y <del> de la cadena para pasarlo a entero
		        	var intVal = function(i){
		            	if(typeof i==='string'){	
		            		if (i.match(/<\/?del>/g)) {//si está borrado devuelve 0 y no suma.
		            			return i = 0;
		            		} else {//si no está borrado le quita los caracteres que estan demas y devuelve el valor entero.
		            			i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
								i=i.replace(/[","]/g, '.');
								i=i*1;
		            		}		  
		            	}else{
		            		if(typeof i==='number'){
		            			i=i;		            			
			            	}else{
			            		i=0;
			            	}
		            	}
		            	return i;
		            };
				}
		    } );  	 		

	     
	  	 $('#modalJustificacion').modal('show');
	}
	
	
	$("body").on("click", ".guardarJustificacion",function(event){
		  var parametros = $(this).attr("parametros");
		  var idParsed = parametros.split("-"); 
		  var nivel=idParsed[0];
		  var entidad=idParsed[1];
		  var tipo=idParsed[2];
		  var programa=idParsed[3];
		  var subprograma=idParsed[4];
		  var proyecto=idParsed[5];
		  var producto=idParsed[6];  		  		
						
		  if ($('#descripcionJustificacion').val() == ""){
			  alert("Error! Inserte la descripción para guardar.");
			  return;
		  }
		
		  var justificacion = new Object();
		  justificacion.nivel=nivel;
		  justificacion.entidad=entidad;
		  justificacion.tipoPresupuesto=tipo;
		  justificacion.programa=programa;
		  justificacion.subprograma=subprograma;
		  justificacion.proyecto=proyecto;
		  justificacion.producto=producto;
		  justificacion.descripcion=$('#descripcionJustificacion').val();
	  	   	    	 	    	  
	  	  var dat = JSON.stringify(justificacion);
		       $.ajax({
			        url: "ajaxInserts?accion=insJustificacion",
			        type: 'POST',
			        dataType: 'json',
			        data: dat,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
			        	if(data.success == "Exito"){
			        	    $("#descripcionJustificacion").val('');
			        		
			        	    if ( $("#modalJustificacion").length )
			        		{
			        			$("#modalJustificacion").remove();
			        		}
			        	    if ( $("#modalBorrarJustificacion").length )
			        		{
			        			$("#modalBorrarJustificacion").remove();
			        		}
			        	  var cuerpoJustificacion = "";	
			        	  
			        	  var justificacion = $.ajax({
			  				url:'ajaxSelects?accion=getJustificacion&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
			  			  	type:'get',
			  			  	dataType:'json',
			  			  	async:false       
					  	      }).responseText;
					  	      justificacion = JSON.parse(justificacion);
					  	      //justificacion = justificacion.justificacion;
					  	      
					  	      if(justificacion != null){	    	  
					  	    	  for(var a = 0; a < justificacion.length; a++){
					  	    		  if(justificacion[a].borrado == true){
					  	    			  if (rol_jsp == 0 || rol_jsp == 1){
					  	    				  cuerpoJustificacion += '<tr><td><del>'+justificacion[a].descripcion+'</del></td><td><del>'+justificacion[a].fechaActualizacion+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarJustificacion" data-toggle="tooltip" data-placement="top" title="Restaurar Justificacion" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
					  	    			  }
					  	    		  }else{
					  	    			  if (rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
					  	    				  cuerpoJustificacion += '<tr><td>'+justificacion[a].descripcion+'</td><td>'+justificacion[a].fechaActualizacion+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarJustificacion" data-toggle="tooltip" data-placement="top" title="Editar Justificacion" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarJustificacion" data-toggle="tooltip" data-placement="top" title="Borrar Justificacion" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacion[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
					  	    			  } else if (rol_jsp == 3){
					  	    				  cuerpoJustificacion += '<tr><td>'+justificacion[a].descripcion+'</td><td>'+justificacion[a].fechaActualizacion+'</td><td class="text-center"></td></tr>';
					  	    			  }
					  	    		  }
					  	    	  }	
					  	      }
			        	  
			        	  var nombreDepto;
			        	  var grupo;
			        	  var tipoDest;					    
			       			
			       	      var tablaJustificacion;
			       	      
							tablaJustificacion ='<div class="modal fade" id="modalJustificacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'				<button type="button" class="close" data-dismiss="modal">&times;</button>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							
							'		      		<div class="row">'+		

							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning box-solid">'+
							'		                	<div class="box-header with-border">'+
							'	                  			<h3 class="box-title">Justificación</h3>'+
							'	                  			<div class="box-tools pull-right">'+										                  
							'		                  		</div>'+
							'              				</div>'+
							'               			<div class="box-body">';
							if(rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
								tablaJustificacion+='		<div class="col-md-12">'+
							'									<div class="box box-default box-solid">'+
							'		                				<div class="box-header with-border">'+
							'		                  					<h3 class="box-title">Insertar Justificación</h3>'+
							'	                  						<div class="box-tools pull-right">'+												
							'		                  					</div>'+
							'              							</div>'+
							'              						<div class="box-body">'+
							
							'										<div class="table-responsive">'+
							'											<table class="table table-hover">'+
							'												<tbody>'+
							'			      									<form class="form-horizontal" role="form">'+
							'													<tr><td><label for="descripcionJustificacion">Descripción</label><input type="text" id="descripcionJustificacion" class="form-control" placeholder="Ingrese la descripción" /></td></tr>'+
							'													</form>	'+				
							'												</tbody>'+
							'											</table>'+
							'				      					</div>'+
							
							'				      				 </div>'+//fin box body
							'									 <div class="modal-footer">'+ 
							'									 	  <button type="button" class="btn btn-success guardarJustificacion" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" >Guardar Justificación</button>'+//						
							'									 </div>'+									
							'				      			 	</div>'+
							'				      			</div>';					
							}
							tablaJustificacion+='		<div class="col-md-12">'+
							'									<div class="box box-default box-solid">'+
							'		                				<div class="box-header with-border">'+
							'		                  					<h3 class="box-title">Lista de Justificaciones</h3>'+
							'	                  						<div class="box-tools pull-right">'+												
							'		                  					</div>'+
							'              							</div>'+
							'              						<div class="box-body" id="cuerpoTablaModalJustificacion">'+
							'										<div class="table-responsive">'+
							'											<table class="table table-hover table-bordered" >'+ //id="dataTableJustificacion">'+
							'												<thead>'+
							'													<tr class="active"><th>Descripción</th><th>Fecha</th><th>Administrar</th></tr>'+
							'												</thead>'+
							'												<tfoot><tr><th></th><th></th><th></th></tr></tfoot>'+
							'												<tbody id="listaJustificacion">'+
																				
							'												</tbody>'+
							'									 		</table>'+
							'										</div>'+		       	      			       	   
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
			       	      
				       	   // $("#cuerpoTablaModalJustificacion").html("");
				       	    //$("#cuerpoTablaModalJustificacion").append(tablaJustificacion);
			        		//$("#listaJustificacion").html(cuerpoJustificacion);	
			        		$("body").append(tablaJustificacion); 
			        		$('#listaJustificacion').append(cuerpoJustificacion);
			        		$('#dataTableJustificacion').DataTable( {
			    		        dom: 'Bfrtip',
			    		        buttons: [
			    		                  {
			    		                      extend: 'copy',
			    		                      exportOptions: {
			    		                  columns: [ 0 ]
			    		              }
			    		                  },
			    		                  {
			    		                      extend: 'csv',
			    		                      exportOptions: {
			    		                  columns: [ 0 ]
			    		              }
			    		                  },
			    		                  {
			    		                      extend: 'excel',
			    		                      exportOptions: {
			    		                  columns: [ 0]
			    		              }
			    		                  },
			    		                  {
			    		                      extend: 'pdf',
			    		                      exportOptions: {
			    		                  columns: [ 0 ]
			    		              }
			    		                  },
			    		                  {
			    		                      extend: 'print',
			    		                      exportOptions: {
			    		                  columns: [ 0 ]
			    		              }
			    		                  }
			    		              ],
			    		        "footerCallback": function ( row, data, start, end, display ) {
			    		        	var api = this.api(), data;
			    		        	// saca los puntos y <del> de la cadena para pasarlo a entero
			    		        	var intVal = function(i){
			    		            	if(typeof i==='string'){	
			    		            		if (i.match(/<\/?del>/g)) {//si está borrado devuelve 0 y no suma.
			    		            			return i = 0;
			    		            		} else {//si no está borrado le quita los caracteres que estan demas y devuelve el valor entero.
			    		            			i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
			    								i=i.replace(/[","]/g, '.');
			    								i=i*1;
			    		            		}		  
			    		            	}else{
			    		            		if(typeof i==='number'){
			    		            			i=i;		            			
			    			            	}else{
			    			            		i=0;
			    			            	}
			    		            	}
			    		            	return i;
			    		            };
			    				}
			    		    } );  	 
			        		$('#modalJustificacion').modal('show');
			        				        					        			    	 			       	  	 				       		 			       	  	 				       	  	 				       	  	 			        		
			        	}else{
			        		alert(data.success);        		
			        	}
			        },
			        	
			        error: function(data,status,er) {
			        	alert("ERROR");
			        }
		  });		
	});
	
	$("body").on("click", ".consultaBorrarJustificacion",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes variables se utilizan en esta funcion para redibujar el modal anterior
	    var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];  
		var id = idParsed[7];

		if ( $("#modalJustificacion").length )
		{
			$("#modalJustificacion").remove();
		}		
		if ( $("#modalEditarJustificacion").length )
		{
			$("#modalEditarJustificacion").remove();
		}
		if ( $("#modalBorrarJustificacion").length )
		{
			$("#modalBorrarJustificacion").remove();
		}
		var justificacion = $.ajax({
			url:'ajaxSelects?accion=getJustificacion&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;
		justificacion = JSON.parse(justificacion);	
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarJustificacion"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalJustificacion"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" ><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Borrar - Restaurar Justificación</h4>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							'				<div id="mensajeBorradoJustificacion"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoJustificacion">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("body").append(contenido);
			
			if(justificacion[0].borrado == true){
				$("#mensajeBorradoJustificacion").html("");
				$("#mensajeBorradoJustificacion").append('<h3 class="text-center">Ud. está seguro que desea RESTABLACER éste registro</h3>');
				$("#agregarBotonBorradoJustificacion").html("");
				$("#agregarBotonBorradoJustificacion").append('<button type="button" class="btn btn-success btn-sm borrarJustificacion" id="botonRestaurarJustificacion" parametros='+id+'-r>Restaurar Justificación</button>');
				$("#agregarBotonBorradoJustificacion").append('<button type="button" class="btn btn-success btn-sm modalJustificacion" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'">Cerrar</button>');
			}else{
				$("#mensajeBorradoJustificacion").html("");
				$("#mensajeBorradoJustificacion").append('<h3 class="text-center">Ud. está seguro que desea BORRAR éste registro</h3');
				$("#agregarBotonBorradoJustificacion").html("");
				$("#agregarBotonBorradoJustificacion").append('<button type="button" class="btn btn-danger btn-sm borrarJustificacion" id="botonBorradoJustificacion" parametros='+id+'-b>Borrar Justificación</button>');
				$("#agregarBotonBorradoJustificacion").append('<button type="button" class="btn btn-success btn-sm modalJustificacion" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'">Cerrar</button>');
			}
			
			$('#modalBorrarJustificacion').modal('show');
				
	});
	$("body").on("click", ".borrarJustificacion",function(event){	
		var parametros = $(this).attr("parametros");
		var idParsed = parametros.split("-"); 
		var id = idParsed[0];
		var estado = idParsed[1];
	    
		var justificacion = $.ajax({
				url:'ajaxSelects?accion=getJustificacion&id='+id,
				type:'get',
				dataType:'json',
				async:false       
			}).responseText;
		justificacion = JSON.parse(justificacion);
	    
	    var objeto = new Object();
	    objeto.id = id;
	    objeto.borrado= justificacion[0].borrado;

	    
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate?accion=actBorradoJustificacion",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	
	        	if(data.success == true){
	            	if(estado == "b"){
		        		$("#botonBorradoJustificacion").remove();
		            	$("#mensajeBorradoJustificacion").html("");
		            	$("#mensajeBorradoJustificacion").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
		            }else{
		        		$("#botonRestaurarJustificacion").remove();
		            	$("#mensajeBorradoJustificacion").html("");
		            	$("#mensajeBorradoJustificacion").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
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
	
	
	$("body").on("click", ".consultaEditarJustificacion",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes variables se utilizan en esta funcion para redibujar el modal anterior
		var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];  
		var id = idParsed[7];


		if ( $("#modalJustificacion").length )
		{
			$("#modalJustificacion").remove();
		}	
		if ( $("#modalEditarJustificacion").length )
		{
			$("#modalEditarJustificacion").remove();
		}	
		if ( $("#modalBorrarJustificacion").length )
		{
			$("#modalBorrarJustificacion").remove();
		}
		var justificacion = $.ajax({
			url:'ajaxSelects?accion=getJustificacion&id='+id,
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;
	justificacion = JSON.parse(justificacion);
		
		var contenido = "";

		contenido +=		'<div class="modal fade" id="modalEditarJustificacion" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalJustificacion"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Editar Justificación</h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoModalEditarJustificacion">'+
											
							'				<div class="table-responsive">'+
							'					<table class="table table-hover">'+
							'						<tbody>'+
							'			      			<form class="form-horizontal" role="form">'+
							'								<tr><td><label for="descripcionJustificacion">Descripción</label><input type="text" id="descripcionJustificacion" class="form-control" placeholder="Ingrese una Descripción" value="'+justificacion[0].descripcion+'" /></td></tr>'+
							'			      			</form>	'+				
							'						</tbody>'+
							'					</table>'+
							'				</div>'+
							
							'		    </div>'+
							'			<div class="modal-footer">'+
							' 				<button type="button" class="btn btn-success btn-sm editarJustificacion" id="botonGuardarJustificacion" parametros='+id+'>Guardar Cambios</button>'+
							' 				<button type="button" class="btn btn-success btn-sm modalJustificacion" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'">Cerrar</button>'+						
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
									
		
		$("body").append(contenido);				
			
		$('#modalEditarJustificacion').modal('show');		
	});
	
	$("body").on("click", ".editarJustificacion",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		var id = idParsed[0];// es el id de la tabla producto_presupuesto_destinatario
		
		var descripcion = $("#descripcionJustificacion").val();
		
		var objeto = new Object();
		
		objeto.id = id;
		objeto.descripcion = descripcion;
		
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate?accion=actJustificacion",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == true)
	        	{
	        		$("#botonGuardarJustificacion").remove();
	            	$("#cuerpoModalEditarJustificacion").html("");
	            	$("#cuerpoModalEditarJustificacion").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
	        	}else{
	        		alert("ERROR");        		
	        	}
	        	
	        },
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        		alert("ERROR");
	        }
		 });
		
	});
	
	//============MODAL DICTAMEN=========//	
	$("body").on("click", ".modalDictamen",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var nivel=idParsed[0];
	    var entidad=idParsed[1];
	    var tipo=idParsed[2];
	    var programa=idParsed[3];
	    var subprograma=idParsed[4];
	    var proyecto=idParsed[5];
	    var producto=idParsed[6];
	    var justificacionId=idParsed[7];
	    
	    renderDictamen(nivel,entidad,tipo,programa,subprograma,proyecto,producto,justificacionId);
				
	});
	
	function renderDictamen(nivel,entidad,tipo,programa,subprograma,proyecto,producto,justificacionId){
		if ( $("#modalDictamen").length )
		{
			$("#modalDictamen").remove();
		}
		if ( $("#modalEditarDictamen").length )
		{
			$('#modalEditarDictamen').remove();
		}
		if ( $("#modalBorrarDictamen").length )
		{
			$('#modalBorrarDictamen').remove();
		}
		if ( $("#modalJustificacion").length )
		{
			$("#modalJustificacion").remove();
		}
		 var cuerpoDictamen = "";		     
			
  	      var dictamenSTP = $.ajax({
  				url:'ajaxSelects?accion=getDictamenSTP&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&justificacionId='+justificacionId,
  			  	type:'get',
  			  	dataType:'json',
  			  	async:false       
  	      }).responseText;
      	   dictamenSTP = JSON.parse(dictamenSTP);     	      	       				       	      				   
  			
  	      for(var a = 0; a < dictamenSTP.length; a++)
  	      {					
  	    	    //generación del texto para despliegue de la elección del dictamen.
  	    	  	var eleccionDictamen = "";
  	    	  	var eleccionColor = "";
	  	    	switch(dictamenSTP[a].eleccion) {
	  	    	  	case 0:
	  	    	  		eleccionDictamen = "Favorable";
	  	    	  		eleccionColor = "style='color: green; font-weight: bold;'";
	  	    	  		break;
	  	    	  	case 1:
	  	    	  		eleccionDictamen = "Rechazado";
	  	    	  		eleccionColor = "style='color: #B70000; font-weight: bold;'";
	  	    	  		break;
	  	    	  	case 2:
	  	    	  		eleccionDictamen = "Consulta";
	  	    	  		eleccionColor = "style='color: #f39c12; font-weight: bold;'";
	  	    	  		break;
	  	    	  	default:
	  	    	  		eleccionDictamen = "";
	  	    	}
	  	    	
  	    	  
	  	    	//generación de url para descarga del archivo de dictamen.  
	  	    	var donwloadName=""; 
				var downloadTarget='target="_blank"';
				var botonDescarga="";
				
				if (dictamenSTP[a].urlDocumento) {
					//el botón de descarga no se despliega si urlDocumento es null.
					botonDescarga = '<a href="http://spr.stp.gov.py/DownloadServlet?urlDocumento='+dictamenSTP[a].urlDocumento+'" target="_blank" Download ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Dictamen" ><span class="fa fa-download" ></span></button></a>';
				}
	  	    	  				
				//generación del cuerpo del dictamen.
  				if(dictamenSTP[a].borrado == true)
				{
					if (rol_jsp == 0 || rol_jsp == 1){
						cuerpoDictamen += '<tr><td><del>'+eleccionDictamen+'</del></td>'+
											  '<td><del>'+dictamenSTP[a].observacion+'</del></td>'+
											  '<td><del>'+dictamenSTP[a].fechaActualizacion+'</del></td>'+
											  '<td class="text-center">'+
											  		botonDescarga +
											  	   '<button type="button" class="btn btn-default btn-sm consultaBorrarDictamen" data-toggle="tooltip" data-placement="top" title="Restaurar Dictamen" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+dictamenSTP[a].id+'-'+justificacionId+' ><span class="fa fa-recycle"></span></button>'+
											  '</td>'+
										  '</tr>';
					}
				}else{
					if (rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
						cuerpoDictamen += '<tr><td '+eleccionColor+'>'+eleccionDictamen+'</td>'+
											  '<td>'+dictamenSTP[a].observacion+'</td>'+
											  '<td>'+dictamenSTP[a].fechaActualizacion+'</td>'+
											  '<td class="text-center">'+
											  		botonDescarga +											  		
											  		'<button type="button" class="btn btn-default btn-sm consultaEditarDictamen" data-toggle="tooltip" data-placement="top" title="Editar Dictamen" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+dictamenSTP[a].id+'-'+justificacionId+' ><span class="fa fa-pencil"></span></button>'+
											  		'<button type="button" class="btn btn-default btn-sm consultaBorrarDictamen" data-toggle="tooltip" data-placement="top" title="Borrar Dictamen" parametros='+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+dictamenSTP[a].id+'-'+justificacionId+' ><span class="fa fa-trash"></span></button>'+
											  '</td>'+
										  '</tr>';
					} else if (rol_jsp == 3){
						cuerpoDictamen += '<tr><td '+eleccionColor+'>'+eleccionDictamen+'</td>'+
											  '<td>'+dictamenSTP[a].observacion+'</td>'+
											  '<td>'+dictamenSTP[a].fechaActualizacion+'</td>'+
											  '<td class="text-center">'+
											  		botonDescarga +
											  '</td>'+
										  '</tr>';
					}
				}
  			}		
		
	    var cuerpoModalDictamen="";
	    cuerpoModalDictamen+='<div class="modal fade" id="modalDictamen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'				<button type="button" class="close modalJustificacion"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'" data-dismiss="modal">&times;</button>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						
						'		      		<div class="row">'+		

						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning box-solid">'+
						'		                	<div class="box-header with-border">'+
						'	                  			<h3 class="box-title">Dictamen STP</h3>'+
						'	                  			<div class="box-tools pull-right">'+										                  
						'		                  		</div>'+
						'              				</div>'+
						'               			<div class="box-body">';
						if(rol_jsp == 0 || rol_jsp == 1 || rol_jsp == 2){
							cuerpoModalDictamen+='		<div class="col-md-12">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Asignar Dictamen</h3>'+
						'	                  						<div class="box-tools pull-right">'+												
						'		                  					</div>'+
						'              							</div>'+
						'              						<div class="box-body">'+
						
						'										<div class="table-responsive">'+
						'											<table class="table table-hover">'+
						'												<tbody>'+
						'			      									<form class="form-horizontal" role="form">'+
						'														<tr>'+
						'															<td>'+
						'																<fieldset>'+
						'																	<legend>Elección:</legend>'+
						
						'																	<label><input type="radio" name="eleccion" id="eleccion" value="0">Favorable</label>'+
						'																	<label><input type="radio" name="eleccion" id="eleccion" value="1">Rechazado</label>'+
						'																	<label><input type="radio" name="eleccion" id="eleccion" value="2">Consulta</label>'+
						
						'																</fieldset>'+
						'															</td>'+
						'														</tr>'+
						'														<tr><td><label for="observacionDictamen">Observación</label><input type="text" id="observacionDictamen" class="form-control" placeholder="Ingrese una observacion" /></td></tr>'+
						' 														<tr><td><label for="documentoDictamen">Adjuntar Documento</label><input type="file" id="documentoDictamen" name="documentoDictamen" />'+
						'														<input type="hidden" id="urlDocDictamen" value="" />'+
						'													</form>	'+				
						'												</tbody>'+
						'											</table>'+
						'				      					</div>'+
						
						'				      				 </div>'+//fin box body
						'									 <div class="modal-footer">'+ 
						'									 	  <button type="button" class="btn btn-success guardarDictamen" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'" >Guardar Dictamen</button>'+//						
						'									 </div>'+									
						'				      			 	</div>'+
						'				      			</div>';					
						}
						cuerpoModalDictamen+='		<div class="col-md-12">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Lista de Dictamen</h3>'+
						'	                  						<div class="box-tools pull-right">'+												
						'		                  					</div>'+
						'              							</div>'+
						'              						<div class="box-body" id="cuerpoTablaModalDictamen">'+
						'										<div class="table-responsive">'+
						'											<table class="table table-hover table-bordered" id="dataTableDictamen">'+
						'												<thead>'+
						'													<tr class="active"><th>Eleccion</th><th>Observación</th><th>Fecha</th><th class="text-center">Administrar</th></tr>'+
						'												</thead>'+
						'												<tfoot><tr><th></th><th></th><th></th><th></th></tr></tfoot>'+
						'												<tbody id="listaDictamen">'+
																			cuerpoDictamen +																			
						'												</tbody>'+
						'									 		</table>'+
						'										</div>'+		       	      			       	   
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

	     $("body").append(cuerpoModalDictamen); 
	        
	  	 $('#modalDictamen').modal('show');
	  	 $('#dataTableDictamen').DataTable();	
	}
	
	$("body").on("click", ".guardarDictamen",function(event){		 
		var parametros = $(this).attr("parametros");
		var idParsed = parametros.split("-"); 
		var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6]; 
		var justificacionId=idParsed[7];
      
		//guardado del archivo.
		var docDictamenFile = document.getElementById("documentoDictamen").files[0];
	    
		if (docDictamenFile != null){
		    var formdata = new FormData();
		    formdata.append('documento', docDictamenFile);
		    
		    $.ajax({
			         type: "POST",
			         url: "/UploadServlet", /* contextPath + servletPath, */
			         data: formdata, /* + $('#custIdList').val(), */
			         async: false,
			         processData: false,  // tell jQuery not to process the data
			         contentType: false,   // tell jQuery not to set contentType
			         success: function(data){
			        	 $("#urlDocDictamen").val(data);
			         }
			});
		}
		else {
			alert("Error! Agregue un archivo de dictamen STP para guardar.");
			return;
		}
		
		if ($('input[name=eleccion]:checked').val() == undefined){
			alert("Error! Seleccione una de las opciones del campo Elección para guardar.");
			return;
		}
		
		var dictamenSTP = new Object();
      
		dictamenSTP.nivel=nivel;
	  	dictamenSTP.entidad=entidad;
	  	dictamenSTP.tipoPresupuesto=tipo;
	  	dictamenSTP.programa=programa;
	  	dictamenSTP.subprograma=subprograma;
	  	dictamenSTP.proyecto=proyecto;
	  	dictamenSTP.producto=producto;
	  	dictamenSTP.eleccion=$('input[name=eleccion]:checked').val();
	  	dictamenSTP.observacion=$("#observacionDictamen").val();
	  	dictamenSTP.urlDocumento = $("#urlDocDictamen").val();	
	  	dictamenSTP.version="50";
	  	dictamenSTP.justificacionId=justificacionId;
	  	//dictamenSTP.anho="2016";
	  	//dictamenSTP.unidadResponable=0;	      
	  	dictamenSTP.borrado=false;
	  	      	      
	  	$.ajax({
	        url: "ajaxInserts?accion=insDictamenSTP",
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(dictamenSTP),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == "Exito"){
	        		alert(data.success);
	        		renderDictamen(nivel,entidad,tipo,programa,subprograma,proyecto,producto,justificacionId);	        	
	        	}else{
	        		alert(data.success);
	        	}        		 	 					        					        			    	 			       	  	 				       		 			       	  	 				       	  	 				       	  	 			        		
	        },
	        error: function(data,status,er) {
	        	alert("Error!");
	        }
	  });      
	
      event.stopPropagation();
      event.preventDefault();
});
	
	$("body").on("click", ".consultaEditarDictamen",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];  
		var dictamenId = idParsed[7];
		var justificacionId = idParsed[8];

		if ( $("#modalDictamen").length )
		{
			$("#modalDictamen").remove();
		}	
		
		var dictamenSTP = $.ajax({
			url:'ajaxSelects?accion=getDictamenSTP&dictamenId='+dictamenId+'&justificacionId='+justificacionId,
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;
   	   	dictamenSTP = JSON.parse(dictamenSTP);   
							
		var contenido = "";

		contenido +=		'<div class="modal fade" id="modalEditarDictamen" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalDictamen"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Editar Dictamen</h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoModalEditarDictamen">'+
											
							'				<div class="table-responsive">'+
							'					<table class="table table-hover">'+
							'						<tbody>'+
							'			      			<form class="form-horizontal" role="form">'+							
							'								<tr><td><label><input type="radio" name="eleccion" id="eleccion" value="0" '+ (dictamenSTP[0].eleccion == '0' ? 'checked="checked"' : '') +'>Favorable</label>'+
							'										<label><input type="radio" name="eleccion" id="eleccion" value="1" '+ (dictamenSTP[0].eleccion == '1' ? 'checked="checked"' : '') +'>Rechazado</label>'+
							'										<label><input type="radio" name="eleccion" id="eleccion" value="2" '+ (dictamenSTP[0].eleccion == '2' ? 'checked="checked"' : '') +'>Consulta</label>'+
							'								</td></tr>'+
							'								<tr><td><label for="observacionDictamen">Observación</label>'+
							'										<input type="text" id="observacionDictamen" class="form-control" placeholder="Ingrese una observacion" value='+dictamenSTP[0].observacion+' />'+
							'								</td></tr>'+
							'								<tr><td><label for="documentoDictamen">Adjuntar Documento</label><input type="file" id="documentoDictamen" name="documentoDictamen" />'+
							'										<input type="hidden" id="urlDocDictamen" value="" />'+
							'			      			</form>	'+				
							'						</tbody>'+
							'					</table>'+
							'				</div>'+
							
							'		    </div>'+
							'			<div class="modal-footer">'+
							' 				<button type="button" class="btn btn-success btn-sm editarDictamen" id="botonGuardarDictamen" parametros="'+dictamenId+'-'+justificacionId+'" >Guardar Cambios</button>'+
							' 				<button type="button" class="btn btn-success btn-sm modalDictamen" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'">Cerrar</button>'+						
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
									
		
		$("body").append(contenido);				
						
    	$('#modalEditarDictamen').modal('show');		
	});
	
	$("body").on("click", ".editarDictamen",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		var dictamenId = idParsed[0];// es el id de la tabla dictamen_stp
		var justificacionId = idParsed[1];
		
		//guardado del archivo.
		var docDictamenFile = document.getElementById("documentoDictamen").files[0];
	    
		if (docDictamenFile != null){
		    var formdata = new FormData();
		    formdata.append('documento', docDictamenFile);
		    
		    $.ajax({
			         type: "POST",
			         url: "/UploadServlet", /* contextPath + servletPath, */
			         data: formdata, /* + $('#custIdList').val(), */
			         async: false,
			         processData: false,  // tell jQuery not to process the data
			         contentType: false,   // tell jQuery not to set contentType
			         success: function(data){
			        	 $("#urlDocDictamen").val(data);
			         }
			});
		}
		
		var eleccion=$('input[name=eleccion]:checked').val();
	  	var observacion=$("#observacionDictamen").val();
		var urlDocumento=$("#urlDocDictamen").val();
		
		var objeto = new Object();
		
		objeto.id = dictamenId;		
		objeto.justificacionId = justificacionId;
		objeto.eleccion = eleccion;
		objeto.observacion = observacion;
		if (urlDocumento != null && urlDocumento != "") 
			objeto.urlDocumento = urlDocumento;
		
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate?accion=actDictamenSTP",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == true)
	        	{	   
	        		$("#botonGuardarDictamen").remove();
	            	$("#cuerpoModalEditarDictamen").html("");
	            	$("#cuerpoModalEditarDictamen").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");
	            	
	        	}else{
	        		alert("ERROR");        		
	        	}
	        	
	        },
	        error: function(data,status,er) {
	        		alert("ERROR");
	        }
		 });
		
	});
	
	$("body").on("click", ".consultaBorrarDictamen",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes variables se utilizan en esta funcion para redibujar el modal anterior
	    var nivel=idParsed[0];
		var entidad=idParsed[1];
		var tipo=idParsed[2];
		var programa=idParsed[3];
		var subprograma=idParsed[4];
		var proyecto=idParsed[5];
		var producto=idParsed[6];  
		var dictamenId = idParsed[7];
		var justificacionId = idParsed[8];

		if ( $("#modalDictamen").length )
		{
			$("#modalDictamen").remove();
		}
		if ( $("#modalJustificacion").length )
		{
			$("#modalJustificacion").remove();
		}
		
		var dictamenSTP = $.ajax({
			url:'ajaxSelects?accion=getDictamenSTP&dictamenId='+dictamenId+'&justificacionId='+justificacionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		dictamenSTP = JSON.parse(dictamenSTP);	
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarDictamen"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalDictamen"  parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'" ><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Borrar - Restaurar Dictamen STP</h4>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							'				<div id="mensajeBorradoDictamen"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoDictamen">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("body").append(contenido);
			
			if(dictamenSTP[0].borrado == true){
				$("#mensajeBorradoDictamen").html("");
				$("#mensajeBorradoDictamen").append('<h3 class="text-center">Ud. está seguro que desea RESTABLACER éste registro</h3>');
				$("#agregarBotonBorradoDictamen").html("");
				$("#agregarBotonBorradoDictamen").append('<button type="button" class="btn btn-success btn-sm borrarDictamen" id="botonRestaurarDictamen" parametros='+dictamenId+'-r>Restaurar Dictamen</button>');
				$("#agregarBotonBorradoDictamen").append('<button type="button" class="btn btn-success btn-sm modalDictamen" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'">Cerrar</button>');
			}else{
				$("#mensajeBorradoDictamen").html("");
				$("#mensajeBorradoDictamen").append('<h3 class="text-center">Ud. está seguro que desea BORRAR éste registro</h3');
				$("#agregarBotonBorradoDictamen").html("");
				$("#agregarBotonBorradoDictamen").append('<button type="button" class="btn btn-danger btn-sm borrarDictamen" id="botonBorradoDictamen" parametros='+dictamenId+'-b>Borrar Dictamen</button>');
				$("#agregarBotonBorradoDictamen").append('<button type="button" class="btn btn-success btn-sm modalDictamen" parametros="'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+justificacionId+'">Cerrar</button>');
			}
			
			$('#modalBorrarDictamen').modal('show');
				
	});	
	
	$("body").on("click", ".borrarDictamen",function(event){	
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var dictamenId = idParsed[0];
	    var estado = idParsed[1];
	    
	    var dictamenSTP = $.ajax({
			url:'ajaxSelects?accion=getDictamenSTP&dictamenId='+dictamenId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		dictamenSTP = JSON.parse(dictamenSTP);			
	    
	    var objeto = new Object();
	    objeto.id = dictamenId;
	    objeto.borrado= dictamenSTP[0].borrado;

	    
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate?accion=actBorrarDictamen",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	
	        	if(data.success == true){
	            	if(estado == "b"){
		        		$("#botonBorradoDictamen").remove();
		            	$("#mensajeBorradoDictamen").html("");
		            	$("#mensajeBorradoDictamen").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
		            }else{
		        		$("#botonRestaurarDictamen").remove();
		            	$("#mensajeBorradoDictamen").html("");
		            	$("#mensajeBorradoDictamen").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
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
	
	
	$("body").on("change", "#tipoDestinatario",function(event){
		//var departamentoId = $(this).attr("parametro");
		var tipoDestinatarioId = $("#tipoDestinatario option:selected").val();
		
		var destinatarioGrupo = $.ajax({			
			url:'ajaxSelects?accion=getDestinatarios&tipoDestinatario='+tipoDestinatarioId+'&borrado=false',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		destinatarioGrupo = JSON.parse(destinatarioGrupo);
		destinatarioGrupo = destinatarioGrupo.destinatarios; 
		
		var optionDestinatarioGrupo="";
		
		for(var o = 0; o < destinatarioGrupo.length; o++){
			optionDestinatarioGrupo+='<option value="'+destinatarioGrupo[o].id+'" >'+destinatarioGrupo[o].nombre+'</option>';
		}
		
		$("#grupoDestinatario").html("");
		$("#grupoDestinatario").append(optionDestinatarioGrupo);
		
	});
	

	//edicion de producto meta
	$("body").on("change", ".cantidad-depto-mes",function(event){
		$(this).val($(this).val().replace(",","."));
	      var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var nivel=idParsed[1];
	      var entidad=idParsed[2];
	      var tipo=idParsed[3];
	      var programa=idParsed[4];
	      var subprograma=idParsed[5];
	      var proyecto=idParsed[6];
	      var producto=idParsed[7];
	      var departamento=idParsed[8];
	      var mes=idParsed[9];
	      var datos;
	      var suma =parseFloat(0);
	      var sumaMes =parseFloat(0);
	      var sumaTotal =parseFloat(0);
	      var mayor=parseFloat(0);
	      var productoClase =$(this).attr("productoClase");
	      var cont = 0;
	     /* 
	      var productos = $.ajax({
		    	url:'/ajaxSelects?accion=getProductos&producto='+producto,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
	    	productos = JSON.parse(productos);
	    	productos = productos.productos;  
	    	*/
           
	      $("#suma-"+id).html("");
	     
	     //En este if comprueba si el producto tiene como valor "N" en su clase si es N suma de lo contrario no suma nada
	      
		    if(productoClase == "N")
		     {
		    	 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-1").val());
		    	 for (var i=0;i<13;i++)
			     {
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()>0)
			    	 {
		    			 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// if(suma < parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()))
		    			 //{
		    				 suma += parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// }
			    	 }
			      }
		    	 $("#suma-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento).html(suma.round(2));
		         
		    	 for (var x=0;x<19;x++){
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val()>0)
		    			 sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val());
			      }
		    	 
		    	  if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val());
			      if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val());
			      
		    	 
		      }
		    if( productoClase == "C")
		     {
		    	 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-1").val());
		    	 var promedio=0;
		    	 for (var i=0;i<13;i++)
			     {	
		    		
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()>0)
			    	 {
		    			 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// if(suma < parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()))
		    			 //{
//		    				 if (max < parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()))
//		    					 	max =parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    				 
		    			 	//Ya no se obtiene mas el maximo para tipo C, se obtiene el promedio
		    				 promedio += parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    				 cont = cont + 1;

		    			// }
			    	 }
			      }
		    	 promedio = promedio / cont;
		    	 $("#suma-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento).html(promedio.round(2));
		         
		    	 for (var x=0;x<19;x++){
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val()>0)
		    			 sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val()).round(2);
			      }
		    	 
		    	  if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()).round(2);
			      if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()).round(2);
			      
		    	 
		      }
		      //vuelta al for
		    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).html(sumaMes.round(2));
		    
		    if( ($("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).text()) == ($("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).text()) )
		    {
		    	$("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).removeClass("danger");
			    $("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).addClass("success");
		    	$("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).removeClass("danger");
			    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).addClass("success");
			    $("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').removeClass("danger");
			    $("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').addClass("success");
			    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').removeClass("danger");
			    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').addClass("success");
		    }else{
		    	$("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).removeClass("success");
			    $("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).addClass("danger");
		    	$("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).removeClass("success");
			    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).addClass("danger");
			    $("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').removeClass("success");
			    $("#sumaMesMH-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').addClass("danger");
			    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').removeClass("success");
			    $("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').addClass("danger");
		    }

		      //sumaTotal = parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-1').text());
		    cont = 0;
		      for (var i=0;i<13;i++)
		      {
		    	  if (parseFloat($("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text())>0)
		    	  {
		    		  //sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text());
		    		 // if(sumaTotal < parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text()))
		    		//  {
		    			  sumaTotal += parseFloat($("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text());
		    			  cont = cont + 1;
		    		//  }
		    	  }
			  }
		      
			if(productoClase == "N")
			{
				$("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').html(sumaTotal.round(2));
			}else{
				if(sumaTotal > 0 ){
					sumaTotal = sumaTotal / cont;
				}
				$("#sumaMesSPR-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').html(sumaTotal.round(2));
			}
	     
	    
	     
	     /* if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+88).text())>0)
	    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+88).text());
	      if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+99).text())>0)
	    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+99).text());
	      */
	      
	        
	      
	    });
	
	$("body").on("click", "#editarAsignacionFinanciera",function(event){
			
			var id = $(this).attr("parametros");
			var idParsed = id.split("-");
			var nivel=idParsed[0];
			var entidad=idParsed[1];
			var tipo=idParsed[2];
			var programa=idParsed[3];
			var subprograma=idParsed[4];
			var proyecto=idParsed[5];
			var producto=idParsed[6];
			var todosObjetos = idParsed[7];
			var idParsed = todosObjetos.split(",");
			
//			for(var t = 0; t < idParsed.length; t++){
//				og.push(idParsed[t]);
//			}
			var formulario="#form-asig-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto;
			  	  
	    	  
	    	 // metas.cantidades= new Array(); //tiene los meses
	    	  var detalleMes = new Array(); //tiene los departamentos
	    	  var programacionFinaciera = new Array();
	    	  var OG= new Array();
	    	  
	    	  $("#tableAsignacion-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+" tbody tr td:nth-child(1)").each( function(){
	    		   OG.push($(this).text());       
	    		});	    	  
	    	  //OG.splice(-1,1);

	    	  for (var i=0;i < OG.length ;i++){
	    		  var metas= new Object();
	    		  
	    		  for (var iMes=1;iMes<13;iMes++){
	    			  var inputVal= "input[name='cantidad-"+producto+"-"+OG[i]+"-"+iMes+"']";	
	    			  var extra = $("input[name='cantidad-"+producto+"-"+OG[i]+"-"+iMes+"']").attr("id");
	    			  var info = extra.split("-");
	    			  detalleMes[iMes]=$(formulario).find(inputVal).val();
	    			  
	       			  metas.fuenteFinanciamiento=info[10];
	    			  metas.organismoFinanciador=info[11];
	    			  metas.departamento=info[12];
	    			  metas.pais=info[13];
	    			  metas.anho=info[14];
	    			  metas.version=info[15];
	    			  
	    			  if (detalleMes[iMes]==""){ 
	    				  detalleMes[iMes]=0;
	    			  } 
	    		  }
	  				
	    		  
						metas.nivel=nivel;	    	  
						metas.entidad=entidad;
						metas.tipo=tipo;
						metas.programa=programa;
						metas.subPrograma=subprograma;
						metas.proyecto=proyecto;
						metas.producto=producto;
						metas.objetoGasto=OG[i];
						
						metas.planificado1 = detalleMes[1];
						metas.planificado2 = detalleMes[2];
						metas.planificado3 = detalleMes[3];
						metas.planificado4 = detalleMes[4];
						metas.planificado5 = detalleMes[5];
						metas.planificado6 = detalleMes[6];
						metas.planificado7 = detalleMes[7];
						metas.planificado8 = detalleMes[8];
						metas.planificado9 = detalleMes[9];
						metas.planificado10 = detalleMes[10];
						metas.planificado11 = detalleMes[11];
						metas.planificado12 = detalleMes[12];
					
					programacionFinaciera.push(metas);
	    		  
	    	  }
	    	  
		       var dat = JSON.stringify(programacionFinaciera);
		       $.ajax({
			        url: "ajaxUpdate?accion=actAsignacionFinanciera",
			        type: 'POST',
			        dataType: 'json',
			        data: dat,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
				        	if(data.success == true)
				        	{
				        		//$("#editarAsignacionFinanciera").remove();
				            	//modalError("Registros guardados",true);
				        		alert("Registro guardado");
				        		
				        	}
			        	},
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {
			        	//modalError("Error al guardar datos",false);
			        	alert("Error al guardar");
			        	}
			 });
		       //event.stopPropagation();
			   //event.preventDefault();
	});
	
	$("body").on("click", ".btn-primary",function(event){
		
	      var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var nivel=idParsed[2];
	      var entidad=idParsed[3];
	      var tipo=idParsed[4];
	      var programa=idParsed[5];
	      var subprograma=idParsed[6];
	      var proyecto=idParsed[7];
	      var producto=idParsed[8];
	      var accion=idParsed[0];
	      var elemento=idParsed[1];
	      var formulario="#form-producto-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto;
	      $("#spinProgFisica-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).show();
	      
	      if (accion==="guardar" && elemento==="producto"){
	    	  var metas= new Object();
	    	  metas.nivel_id=nivel;
	    	  metas.catalogo_destianatario_id="1";
	    	  metas.entidad_id=entidad;
	    	  metas.tipo_presupuesto_id=tipo;
	    	  metas.programa_id=programa;
	    	  metas.subprograma_id=subprograma;
	    	  metas.proyecto_id=proyecto;
	    	  metas.producto_id=producto;
	    	  metas.unidad_medida_id="";
	    	  metas.unidad_medida_id=$("#unidad_medida-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).val();
	    	  metas.cantidades= new Array(); //tiene los meses
	    	  var detalleMes = new Array(); //tiene los departamentos
	    	  var frm = $(formulario);
	    	  
	    	  for (var iDepto=0;iDepto<19;iDepto++){
	    		  detalleMes=new Array();
	    		  for (var iMes=1;iMes<13;iMes++){
	    			  var inputVal= "input[name='cantidad-"+producto+"-"+iDepto+"-"+iMes+"']";
	    			  detalleMes[iMes]=$(formulario).find(inputVal).val();
	    			  if (detalleMes[iMes]=="") detalleMes[iMes]=0;
	    			  
	    		  }
	    		  metas.cantidades[iDepto]=detalleMes;
	    	  }
	    	  
	    	  for (var iMes=1;iMes<13;iMes++){
    			  var inputVal= "input[name='cantidad-"+producto+"-88-"+iMes+"']";
    			  detalleMes[iMes]=$(formulario).find(inputVal).val();
    			  if (detalleMes[iMes]=="") detalleMes[iMes]=0;
    			  
    		  }
	    	  metas.cantidades[19]=detalleMes;
	    	  var detalleMes2 = new Array(); //tiene los departamentos
	    	  for (var iMes=1;iMes<13;iMes++){
    			  var inputVal= "input[name='cantidad-"+producto+"-99-"+iMes+"']";
    			  detalleMes2[iMes]=$(formulario).find(inputVal).val();
    			  if (detalleMes2[iMes]=="") detalleMes2[iMes]=0;
    			  
    		  }
	    	  metas.cantidades[20]=detalleMes2;
	    	  
	    	   metas.tipoDestinatario=$(formulario).find('select[name="tipo_destinatario"]  option:selected').val();
	    	   metas.anho2 = $(formulario).find('input[name="anho2"]').val();
	    	   if ( metas.anho2=="")  metas.anho2=0;
	    	   metas.anho3 = $(formulario).find('input[name="anho3"]').val();
	    	   if ( metas.anho3=="")  metas.anho3=0;
		      // var dat = JSON.stringify(frm.serializeArray());
	
		       //alert("Prueba de guardado de productos:\n\n" + metas);
	    	   
		       var dat = JSON.stringify(metas);
		       $.ajax({
			        url: "ajaxUpdate?accion=actProductoPresupuestoDetalle",
			        type: 'POST',
			        dataType: 'json',
			        data: dat,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
				        	if(data.success == true)
				        	{
				        		$("#spinProgFisica-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).hide();
				        		alert("Guardado!");
				        	/*	
				        		var metaProductoAct = $.ajax({
				    		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				    		        type:'get',
				    		        dataType:'json',
				    		        async:false       
				    		    }).responseText;
				        		metaProductoAct = JSON.parse(metaProductoAct);
				        		metaProductoAct=metaProductoAct.productoPresupuestoMeta;
				    		    
				    		    $("#fechaUltActProductoPresupuestoMeta-"+linkNivel+"-"+linkEntidad+"-"+linkTipoPresupuesto+"-"+linkPrograma+"-"+linkSubPrograma+"-"+linkProyecto+"-"+producto).html("Fecha Ultima Actualización: "+ metaProducto[0].fechaActualizacion);			    		    
				        	*/
				        		var metaProductoAct = $.ajax({
				    		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto,
				    		        type:'get',
				    		        dataType:'json',
				    		        async:false       
				    		    }).responseText;
				        		metaProductoAct = JSON.parse(metaProductoAct);
				        		metaProductoAct=metaProductoAct.productoPresupuestoMeta;
				    		    
				    		    $("#fechaUltActProductoPresupuestoMeta-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).html("Fecha Ultima Actualización: "+ metaProductoAct[0].fechaActualizacion);
				        		
				        		
				        	}
			        	},
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {alert("ERROR");}
			 });
		       event.stopPropagation();
				 event.preventDefault();
				 return false;
	      }
	      
	     
	    });
	
//	$("body").on("click", ".btn-warning",function(event){
//		
//	      var id = $(this).attr("id");
//	      var idParsed = id.split("-");
//	      var nivel=idParsed[2];
//	      var entidad=idParsed[3];
//	      var tipo=idParsed[4];
//	      var programa=idParsed[5];
//	      var subprograma=idParsed[6];
//	      var proyecto=idParsed[7];
//	      var producto=idParsed[8];
//	      var accion=idParsed[0];
//	      var elemento=idParsed[1];
//
//	      
//	      
//	      
//	});
	
	
	
	
	$("body").on("click", ".vincular-indicador-resultado",function(event){
		
		
		  var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var accion="insObjetivoHasObjetivo";
	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      
	      var oho= new Object();
	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.colaboracion=0;
	      oho.influencia=0;
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	      
	      $.ajax({
		        url: "ajaxInserts?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(oho),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
			        	//$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
			    	    dato = cargarCadenaValor(idParsed[3], idParsed[4], idParsed[5], idParsed[6], idParsed[7], idParsed[8], idParsed[9], 2016, 3, idParsed[14], idParsed[15]);//rafa me dijo que el año y la version no varia por eso esta fijo año y version
			    	    $("#vincularCadenaCuerpo-"+oho.productoConcat).html("");
			    	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[0]);
			    	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[1]);
			    		$("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[2]);
			     
			    	    $('#modalVincularCadena').modal('show');
			     		$('#dataTablesResultadoSugerido').DataTable();
			     		$('#dataTablesOtros').DataTable();
		        	}else{
		        		alert("ERROR al intentar agregar este registro");
		        	}
		        },
		        error: function(data,status,er) {
		        	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        }
		 });
	      
		event.stopPropagation();
	});
	
	$("body").on("click", ".desvincular-indicador-resultado",function(event){
		
		 var id = $(this).attr("id");
	      var idParsed = id.split("-");
	    //  var accion=idParsed[0];
	      var accion="actBorradoObjetivoHasObjetivo";
	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];
	      
	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];
	      
	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.colaboracion=0;
	      oho.influencia=0;
	      
	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	      
	      $.ajax({
		        url: "ajaxUpdate?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(oho),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
			        	//$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId)); no estoy seguro al desvincular pnd es el original
		        		
		        		//obtiene desde O.H.O.
		        		var getObjetivosVinculados = $.ajax({
			    	         //url:'ajaxSelects?accion=getObjetivoHasObjetivo&productoConcat='+oho.productoConcat+'&borrado='+estado, "oho.borrado"
		        			 url:'ajaxSelects?accion=getObjetivoHasObjetivo&productoConcat='+oho.productoConcat+'&borrado='+oho.borrado,
			    	         type:'get',
			    	         dataType:'json',
			    	         async:false       
			    	       }).responseText;
				    		getObjetivosVinculados=JSON.parse(getObjetivosVinculados);
				    		getObjetivosVinculados=getObjetivosVinculados.objetivos;
		        		
		        		
		        		// se borran los indicadores vinculados y mas abajo se borran las metas de los indicadores
		        		var indicadoresVinculados = $.ajax({
					    	url:'ajaxSelects?accion=getObjetivoHasIndicador&productoConcat='+oho.productoConcat+'&objetivoId='+oho.objetivoRelId,
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
					    			url: 'ajaxDelete?accion=delPorResultadoObjetivoHasIndicador&productoConcat='+oho.productoConcat+'&objetivoId='+oho.objetivoRelId,
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
					  	
				    	
					    	//Borra metas completamente, los relacionados al indicador
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
		        		
			    	    dato = cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId)
			    	    $("#vincularCadenaCuerpo-"+oho.productoConcat).html("");
			    	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[0]);
			    	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[1]);
			    		$("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[2]);
			     
			    	    $('#modalVincularCadena').modal('show');
			     		$('#dataTablesResultadoSugerido').DataTable();
			     		$('#dataTablesOtros').DataTable();
		        	}
		        },
		        error: function(data,status,er) {
		        	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        }
		 });
		
		
		event.stopPropagation();
	});
	
	$("body").on("change", ".select-otros-objetivos",function(event){
		
		 var id = $(this).attr("id");
		 var seleccionado=$("#"+id+" option:selected").val();		
		 
	      var idParsed = id.split("-");

	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.colaboracion=0;
	      oho.influencia=0;

	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	      
	      //var comboBoxText = ;
	      
	      if ($('#'+id).val() == '-99'){
	    	  $( "tr.trComboOtros" ).find( "button.vincular-indicador-resultado" ).attr('disabled', 'disabled');
	    	  $( "tr.trComboOtros" ).find( "button.vincular-indicador-resultado" ).attr("id", 'vincular-indicador-resultado-'+oho.productoConcat+'-0-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion);
		  }else{
			  $( "tr.trComboOtros" ).find( "button.vincular-indicador-resultado" ).removeAttr("disabled");
			  $( "tr.trComboOtros" ).find( "button.vincular-indicador-resultado" ).attr("id", 'vincular-indicador-resultado-'+oho.productoConcat+'-'+seleccionado+'-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion);
			  
			  //$('#ver-indicador-resultado-'+oho.productoConcat+'-0-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion).prop('disabled', false);
		      //$('#ver-indicador-resultado-'+oho.productoConcat+'-0-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion).attr("id", 'ver-indicador-resultado-'+oho.productoConcat+'-'+seleccionado+'-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion);
		      //$('#vincular-indicador-resultado-'+oho.productoConcat+'-0-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion).prop('disabled', false);			  
			  //$('#vincular-indicador-resultado-'+oho.productoConcat+'-0-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion).attr("id", 'vincular-indicador-resultado-'+oho.productoConcat+'-'+seleccionado+'-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion);			
		  }
	      
	      //$('#ver-indicador-resultado-'+oho.productoConcat+'-'+0+'-'+'2'+'-'+'2016'+'-'+'3').prop('disabled', false);
	      //$('#ver-indicador-resultado-'+oho.productoConcat+'-'+0+'-'+'2'+'-'+'2016'+'-'+'3').attr("id", '#ver-indicador-resultado-'+oho.productoConcat+'-'+seleccionado+'-'+'2'+'-'+'2016'+'-'+'3');
	      
	      
		event.stopPropagation();
	});
	
	$("body").on("click", ".vincular-indicador-pnd",function(event){
		
		 var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      
	      var oho= new Object();
	      oho.objetivoId=idParsed[10];
	      oho.tipoObjetivoId=idParsed[11];
	      oho.objetivoAnho=idParsed[12];
	      oho.objetivoVersion=idParsed[13];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=1;
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.colaboracion=0;
	      oho.influencia=0;
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	            
	      var tituloPND=$("#vincular-indicador-pnd-"+oho.productoConcat+"-"+oho.objetivoId+"-"+oho.tipoObjetivoId+"-"+oho.objetivoAnho+"-"+oho.objetivoVersion+"-"+oho.producto+"-"+oho.objetivoVersion+"-"+oho.objetivoAnho+"-"+oho.objetivoVersion).parent("td").parent("tr").find(".nombreREV").text();
	      var titulo=$("#tituloVincularDescripto").text();
	      $("#tituloVincularDescripto").text(titulo+" PND: "+tituloPND);
	      
//	      $.ajax({
//		        url: "ajaxUpdate?accion="+accion,
//		        type: 'POST',
//		        dataType: 'json',
//		        data: JSON.stringify(oho),
//		        contentType: 'application/json',
//		        mimeType: 'application/json',
//		        success: function (data) {
//		        	if(data.success == true){
//			        	//$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion));
//		        	}
//		        },
//		        error: function(data,status,er) {
//		        	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion));
//		        }
//		 });
		
	     //$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
  	    dato = cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId)
	    $("#vincularCadenaCuerpo-"+oho.productoConcat).html("");
	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[0]);
	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[1]);
		$("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[2]);
 
	    //$('#modalVincularCadena').modal('show');
 		$('#dataTablesResultadoSugerido').DataTable();
 		$('#dataTablesOtros').DataTable();
		event.stopPropagation();
	});
	 
	$("body").on("click", ".vincularCadena",function(event){
		 var id = $(this).attr("id");
	     var idParsed = id.split("-");
	     var oho= new Object();
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      
	      /*if ( $("#vincularCadena-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'").length )
			{
				$("#vincularCadena-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'").remove();
			}*/
	      			  
  		if ( $("#modalVincularCadena").length )
		{
			$("#modalVincularCadena").remove();
		}	
		  if ( $("#modalIndicadorProducto").length )
		  {
			  $("#modalIndicadorProducto").remove();
		  }	
		  if ( $("#consultaModalBorrarIndicadorVinculado").length )
			{
				$("#consultaModalBorrarIndicadorVinculado").remove();
			}
		 
		 var nivelTitulo=$("#f1c2").text(); 
		 nivelTitulo=nivelTitulo.split('>');
		 nivelTitulo=nivelTitulo[0];
		 var entidadTitulo=$("#f2c2").text();
		 var tipoPresupuestoTitulo=$("#f3c2").text();
		 var programaTitulo=$("#f4c2").text();
		 var subprogramaTitulo=$("#f5c2").text();
		 var proyectoTitulo=$("#f6c2").text();
		 var productoTitulo=$("#f7c2").text();
		  
        var cadenaDeValorModal="";
        cadenaDeValorModal+='<div class="modal fade" id="modalVincularCadena" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
								'<div class="modal-dialog modal-lg">'+
									'<div class="modal-content">'+
										'<div class="modal-header">'+
											'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
										'</div>	'+
										'<div class="modal-body ">'+
											'<div class="box box-warning box-solid">'+
												'<div class="box-header box-warning">'+
													'<h3 class="box-title">Vinculación Cadena de Valor</h3><br>'+
												'<small id="tituloVincularDescripto">'+oho.nivel+') '+nivelTitulo+'  '+oho.entidad+") "+entidadTitulo+'   '+ oho.tipoPresupuesto+") "+tipoPresupuestoTitulo+"   "+oho.programa+") "+programaTitulo+"   "+oho.subprograma+") "+subprogramaTitulo+"   "+oho.proyecto+" )"+proyectoTitulo+"   "+$(this).parent().parent().parent().parent().parent().find("h3").text()+'.</small>'+
												'</div>'+
												'<div class="box-body " id="vincularCadenaCuerpo-'+ oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto+'">'+
													//cargarCadenaValor(linkNivel, linkEntidad, linkTipoPresupuesto, linkPrograma, linkSubPrograma, linkProyecto, producto, anho, version, producto, 3)+
													//cajaProducto+=				 		
												'</div>'+
											'</div>'+
										'</div>'+
										'<div class="modal-footer">'+
											'<button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>'+
										'</div>'+
									'</div>'+
								'</div>'+
							'</div>';
        var dato = [];
		$("body").append(cadenaDeValorModal);
	    dato = cargarCadenaValor(idParsed[3], idParsed[4], idParsed[5], idParsed[6], idParsed[7], idParsed[8], idParsed[9], 2016, 3, idParsed[9], 3);
	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[0]);
	    $("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[1]);
		$("#vincularCadenaCuerpo-"+oho.productoConcat).append(dato[2]);
 
	    //$("#vincularCadenaCuerpo-"+oho.productoConcat).append(cargarCadenaValor(idParsed[3], idParsed[4], idParsed[5], idParsed[6], idParsed[7], idParsed[8], idParsed[9], 2016, 3, idParsed[9], 3));
	    $('#modalVincularCadena').modal('show');
 		$('#dataTablesResultadoSugerido').DataTable();
 		$('#dataTablesOtros').DataTable();
 		
	});
	
	
	$("body").on("click", ".modificar-contrib-resultado",function(event){		 
		  var id = $(this).attr("id");
	      var idParsed = id.split("-");

	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.colaboracion=$(this).parent().prev().prev().html();
	      $(this).parent().prev().prev().html('<from><input type="text" size="10px" value="'+oho.colaboracion+'"></from>');
	      $(this).html("Guardar Contrib");
	      $(this).attr("class","btn btn-warning guardar-contrib-resultado");
	      oho.influencia=$(this).parent().prev().html();

	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
		
	      event.stopPropagation();
	      event.preventDefault();
	});
	$("body").on("click", ".modificar-influe-resultado",function(event){		 
		  var id = $(this).attr("id");
	      var idParsed = id.split("-");

	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.colaboracion=$(this).parent().prev().prev().html();
	      oho.influencia=$(this).parent().prev().html();
	      $(this).parent().prev().html('<from><input type="text" size="10px" value="'+oho.influencia+'"></from>');
	      $(this).html("Guardar Influe");
	      $(this).attr("class","btn btn-secondary guardar-influe-resultado");
	     

	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
		
	      event.stopPropagation();
	      event.preventDefault();
	});
	
	$("body").on("click", ".guardar-contrib-resultado",function(event){		 
		  var id = $(this).attr("id");
	      var idParsed = id.split("-");

	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.colaboracion=$(this).parent().prev().prev().children().children().val();
	      oho.colaboracion=oho.colaboracion.replace(",", ".");
	      $(this).parent().prev().prev().html("");
	      $(this).parent().prev().prev().html(oho.colaboracion);
	      $(this).html("Modificar Contrib");
	      $(this).attr("class","btn btn-warning modificar-contrib-resultado");
	      oho.influencia=$(this).parent().prev().html();

	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	      
	      
	      var sumaContrib = 0;
	      $("#tablaResultadosVinculados").find(".valContrib").each(function() {
	    	  sumaContrib = sumaContrib+ parseFloat($(this).html());
	      });
	      
	      $("#totalContrib").html(sumaContrib.round(2));
	      if (sumaContrib > 1){
	    	  $("#totalContrib").css("color","red");
	      } else {
	    	  $("#totalContrib").css("color","black");
	      }
	      
	      
	      $.ajax({
		        url: "ajaxUpdate?accion=actObjetivoHasObjetivo",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(oho),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	 $(this).parent().prev().prev().html(oho.colaboracion);
		        //	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        },
		        error: function(data,status,er) {
		        	 $(this).parent().prev().prev().html(oho.colaboracion);
		        //	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        }
		 });
	      
		
	      event.stopPropagation();
	      event.preventDefault();
	});
	$("body").on("click", ".guardar-influe-resultado",function(event){		 
		  var id = $(this).attr("id");
	      var idParsed = id.split("-");

	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.influencia=$(this).parent().prev().children().children().val();
	      oho.influencia=oho.influencia.replace(",", ".");
	      $(this).parent().prev().html("");
	      $(this).parent().prev().html(oho.influencia);
	      $(this).html("Modificar Influe");
	      $(this).attr("class","btn btn-secondary modificar-influe-resultado");
	      oho.colaboracion=$(this).parent().prev().prev().html();

	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	      
	      	      
	      $.ajax({
		        url: "ajaxUpdate?accion=actObjetivoHasObjetivo",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(oho),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	 $(this).parent().prev().html(oho.influencia);
		        //	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        },
		        error: function(data,status,er) {
		        	 $(this).parent().prev().html(oho.influencia);
		        //	$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        }
		 });
	      
		
	      event.stopPropagation();
	      event.preventDefault();
	});
	
	
	$("body").on("click", ".indicadores-modal-objetivo",function(event){
		
		
		  var id = $(this).attr("id");
	      var idParsed = id.split("-");

	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var oho= new Object();
	      
	      oho.nivel=idParsed[3];
	      oho.entidad=idParsed[4];
	      oho.tipoPresupuesto=idParsed[5];
	      oho.programa=idParsed[6];
	      oho.subprograma=idParsed[7];
	      oho.proyecto=idParsed[8];
	      oho.producto=idParsed[9];

	      oho.objetivoRelId=idParsed[10];
	      oho.relTipoObjetivoId=idParsed[11];
	      oho.relAnho=idParsed[12];
	      oho.relVersion=idParsed[13];

	      oho.objetivoId=idParsed[14];
	      oho.tipoObjetivoId=idParsed[15];
	      oho.objetivoAnho=idParsed[16];
	      oho.objetivoVersion=idParsed[17];
	      
	      oho.unidadResponable=0;
	      oho.productoConcat=oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto;
	      oho.borrado=false;
	      
		  if ( $("#modalVincularCadena").length )
		  {
			  $("#modalVincularCadena").remove();
		  }	
		  if ( $("#modalIndicadorProducto").length )
		  {
			  $("#modalIndicadorProducto").remove();
		  }
		  if ( $("#modalMetas").length )
		  {
			  $("#modalMetas").remove();
		  }	
		  if ( $("#modalIndicador").length )
		  {
			  $("#modalIndicador").remove();
		  }
		  if ( $("#modalIndicadorGuardado").length )
		  {
			  $("#modalIndicadorGuardado").remove();
		  }
		  if ( $("#consultaModalBorrarIndicador").length )
		  {
			  $("#consultaModalBorrarIndicador").remove();
		  }	
		  if ( $("#modalIndicadorEditado").length )
		  {
			  $("#modalIndicadorEditado").remove();
		  }
		  if ( $("#modalEditarIndicador").length )
		  {
			  $("#modalEditarIndicador").remove();
		  }	
		  if ( $("#consultaModalBorrarIndicadorVinculado").length )
		  {
			  $("#consultaModalBorrarIndicadorVinculado").remove();
		  }
			
	      var parametroRetorno = oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto+'-'+oho.objetivoRelId+'-'+oho.relTipoObjetivoId+'-'+oho.relAnho+'-'+oho.relVersion+'-'+oho.objetivoId+'-'+oho.tipoObjetivoId+'-'+oho.objetivoAnho+'-'+oho.objetivoVersion;

	      
	      var indicadoresModalProducto="";
	      indicadoresModalProducto+='<div class="modal fade" id="modalIndicadorProducto" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
											'<div class="modal-dialog modal-lg" style="width:90%">'+
												'<div class="modal-content">'+
													'<div class="modal-header">'+
														'<button type="button" class="close vincularCadena" id="vincular-cadena-valores-'+oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto+'" data-dismiss="modal" aria-label="Close">&times;</button>'+
													'</div>	'+
													'<div class="modal-body ">'+
														'<div class="box box-warning box-solid">'+
															'<div class="box-header box-warning">'+
																'<h3 class="box-title">Indicadores</h3>'+
																'<div class="box-tools pull-right">'+
																'</div>'+
															'</div>'+
															'<div class="box-body indicadoresModalProductoClase" id="cuerpoIndicadoresModalProducto-'+oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto+'">'+
																//cargarCadenaValor(linkNivel, linkEntidad, linkTipoPresupuesto, linkPrograma, linkSubPrograma, linkProyecto, producto, anho, version, producto, 3)+
																//cajaProducto+=
															'</div>'+
														'</div>'+
													'</div>'+
													'<div class="modal-footer">'+
														'<button type="button" class="btn btn-success vincularCadena" data-dismiss="modal" id="vincular-cadena-valores-'+oho.nivel+'-'+oho.entidad+'-'+oho.tipoPresupuesto+'-'+oho.programa+'-'+oho.subprograma+'-'+oho.proyecto+'-'+oho.producto+'">Cerrar</button>'+
													'</div>'+
												'</div>'+
											'</div>'+
										'</div>';
	      
	      $("body").append(indicadoresModalProducto);	      
	      
	      var cuerpoModalIndicadores="cuerpoIndicadoresModalProducto-"+oho.productoConcat;
	      
		      var modalContenido='<section class="content" id="cuerpoIndicador">'+
							  	'<div class="row">'+
							  	'	<div class="col-md-12">'+
							    '      	<div class="box box-default box-solid" height="1000px">'+
							    '        	<div class="box-header with-border" height="1000px">'+
							    '          		<h3 class="box-title">Indicadores Vinculados</h3>'+
							    //'          		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>'+
							    '        	</div>'+
							    '        	<div class="box-body" id="cuerpoIndicadoresVinculados-'+oho.productoConcat+'">'+
							    '        	</div>'+
							    ' 		</div>'+
							    '	</div>'+
							  	'</div>';
							  	
			  if(oho.tipoObjetivoId != 2){
			      modalContenido+='<div class="row">'+
							  	'	<div class="col-md-12">'+
							    '      	<div class="box box-default box-solid" height="1000px">'+
							    '        	<div class="box-header with-border" height="1000px">'+
							    '          		<h3 class="box-title">Vincular otros Indicadores</h3>'+
							    //'          		<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>'+
							    '        	</div>'+
							    '        	<div class="box-body" id="cuerpoIndicadores-'+oho.productoConcat+'">'+
							    '        	</div>'+
							    ' 		</div>'+
							    '	</div>'+
							  	'</div>';    
			  }
		      modalContenido+='</section>';

			  $("#"+cuerpoModalIndicadores).html(modalContenido);
			  renderIndicadores(oho.productoConcat,oho.objetivoRelId, oho.relTipoObjetivoId, oho.objetivoAnho, oho.objetivoVersion, parametroRetorno);
			  cargarIndicadoresVinculados(oho.productoConcat,oho.objetivoRelId, oho.relTipoObjetivoId, oho.objetivoAnho, oho.objetivoVersion, parametroRetorno);
			  $('#modalIndicadorProducto').modal('show');
	   });    
	
	$("body").on("click", ".agregarIndicadorAResultado",function(event){
		var id = $(this).attr("parametros");
		//id,desagregacion_tipo_zona_geografica_id,tipo_demografica_id,productoConcat,
		//objId,objTipoId,objA,objV,
		//tipoIndId,metCalcId,UMId, DTZG,TDI,FV
	      var idParsed = id.split("-");
	     
	      var elemento=idParsed[1];
	      var elemento2=idParsed[2];
	      var concat= new Object();
	      var ohi= new Object();
	      
	      concat.nivel=idParsed[3];
	      concat.entidad=idParsed[4];
	      concat.tipoPresupuesto=idParsed[5];
	      concat.programa=idParsed[6];
	      concat.subprograma=idParsed[7];
	      concat.proyecto=idParsed[8];
	      concat.producto=idParsed[9];
	      
	      ohi.objetivoId=idParsed[10];
	      ohi.objetivoTipoObjetivoId=idParsed[11];
	      ohi.objetivoAnho=idParsed[12];
	      ohi.objetivoVersion=idParsed[13];
	      
	      ohi.indicadorId=idParsed[0];
	      ohi.indicadorTipoIndicadorId=idParsed[14];
	    //  ohi.indicadorMetodoCalculoId=idParsed[15];
	      ohi.indicadorUnidadMedidaId=idParsed[15];
	      ohi.indicadorDesagregacionTipoZonaGeograficaId=idParsed[16];
	      ohi.indicadorTipoDemograficaId=idParsed[17];
	      ohi.indicadorFuenteVerificacionId=idParsed[18];
	      
	      //ohi.unidadResponable=0;
	      concat.productoConcat=concat.nivel+'-'+concat.entidad+'-'+concat.tipoPresupuesto+'-'+concat.programa+'-'+concat.subprograma+'-'+concat.proyecto+'-'+concat.producto;
	      ohi.productoConcat=concat.productoConcat;
	      
	      parametroRetorno = idParsed[19]+'-'+idParsed[20]+'-'+idParsed[21]+'-'+idParsed[22]+'-'+idParsed[23]+'-'+idParsed[24]+'-'+idParsed[25]+'-'+idParsed[26]+'-'+idParsed[27]+'-'+idParsed[28]+'-'+idParsed[29]+'-'+idParsed[30]+'-'+idParsed[31]+'-'+idParsed[32]+'-'+idParsed[33];
	      
	   
	      
	      
	      $.ajax({
		        url: "ajaxInserts?accion=insObjetivoHasIndicador",
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(ohi),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
						alert("Éxito!");
					    renderIndicadores(concat.productoConcat, ohi.objetivoId, ohi.objetivoTipoObjetivoId, ohi.objetivoAnho, ohi.objetivoVersion, parametroRetorno);
					    cargarIndicadoresVinculados(concat.productoConcat, ohi.objetivoId, ohi.objetivoTipoObjetivoId, ohi.objetivoAnho, ohi.objetivoVersion, parametroRetorno);
		    		}else{
						alert("ERROR");
					}
		        	//$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        },
		        error: function(data,status,er) {
		        	//$("#vincularCadenaCuerpo-"+oho.productoConcat).html(cargarCadenaValor(oho.nivel, oho.entidad, oho.tipoPresupuesto, oho.programa, oho.subprograma, oho.proyecto, oho.producto, oho.objetivoAnho, oho.objetivoVersion, oho.objetivoId, oho.tipoObjetivoId));
		        }
		 });
	      
	});

	$("body").on("submit", "form",function(event){
		event.stopPropagation();
		 event.preventDefault();
		 return false;
	});
		
});
