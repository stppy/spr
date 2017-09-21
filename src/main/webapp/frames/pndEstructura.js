//function numeroConComa(x) {
//	if(x && !isNaN(x)) {
//		return x.toFixed(2).toString().replace(".00","").replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
//	}else{
//		return 0;
//	}
//}

function comparePresupuesto(a,b) {  
    if (a.presupuesto > b.presupuesto) return -1;
    if (a.presupuesto < b.presupuesto) return 1;
    return 0;
}

function renderEstructura(entregas, monto, resultados, productos, color, objetivos){
	var text="";
	
	  text='<div class="row">'+
		   '	<div class="col-md-6 col-sm-6 col-xs-12" >'+
	 	   '		<div class="info-box '+color+'">'+
	 	   '			<span class="info-box-icon"><i class="fa fa-users"></i></span>'+
	 	   '			<div class="info-box-content">'+
	 	   '				<span class="info-box-text">Entregas de Productos</span>'+
	 	   '				<span class="info-box-number ">'+entregas+'<small></small></span>'+
	 	   '				<div class="progress">'+
	 	   '					<div class="progress-bar" style="width:100%"></div>'+
	 	   '				</div>'+
	       '				<span class="progress-description"></span>'+
	 	   '			</div><!-- /.info-box-content -->'+
	 	   '		</div><!-- /.info-box -->'+
	 	   '	</div>'+
	 	   
	 	   '	<div class="col-md-6 col-sm-6 col-xs-12">'+
	 	   '		<div class="info-box '+color+'">'+
	 	   '			<span class="info-box-icon"><i class="fa">₲</i></span>'+
	 	   '			<div class="info-box-content">'+
	 	   '				<span class="info-box-text">Presupuesto</span>'+
	 	   '				<span class="info-box-number">'+monto+'<small></small></span>'+
	 	   '				<div class="progress">'+
	 	   '					<div class="progress-bar" style="width:100%"></div>'+
	 	   '				</div>'+
  		   '				<span class="progress-description"></span>'+
		   '			</div><!-- /.info-box-content -->'+
		   '		</div><!-- /.info-box -->'+
	 	   '	</div>';
  
	 /*----------  TABLA DE PRODUCTOS  --------------*/
	 text+='	<div class="col-md-12 col-sm-12 col-xs-12" >';
	 text+='		<div class="table-responsive">'+
		   '			<table class="table table-striped table-bordered table-hover" id="dataTableProductosEst">'+
		   '				<thead><th>Tipos de Productos</th><th>Clase</th><th>Cantidad</th><th>Unidad de Medida</th></thead>'+
		   '				<tfoot><th></th><th></th><th></th><th></th></tfoot>'+
		   '				<tbody>';
								var idParsed = "";
								var prodUnico=[];
								var esUnico=1;
								for (var i=0; i<productos.length;i++){
									var esUnico=1;
									for (var j=0; j<prodUnico.length;j++){
										if(prodUnico[j].prod_id==productos[i].prod_id){
											if (prodUnico[j].unidad_medida==="PORCENTAJE"){
												if(productos[i].cantidad2017>prodUnico[j].cantidad2017){
													prodUnico[j].cantidad2017=productos[i].cantidad2017
												}
											}
											prodUnico[j].presupuesto+=productos[i].presupuesto
											prodUnico[j].cantidad2017+=productos[i].cantidad2017
											esUnico=0;
										}
									}
									if (esUnico){
										var producto=new Object();
										producto.prod_id=productos[i].prod_id
										producto.nombre=productos[i].nombre
										producto.presupuesto=productos[i].presupuesto
										producto.cantidad2017=productos[i].cantidad2017;
										producto.clase=productos[i].clase
										producto.unidad_medida=productos[i].unidad_medida
										prodUnico.push(producto);
									}
								}
								for (var i=0; i<prodUnico.length;i++){
									text+='<tr><td>' + prodUnico[i].prod_id + ' - ' + prodUnico[i].nombre + '</td><td>'+prodUnico[i].clase+'</td><td class="text-right">'+numeroConComa(prodUnico[i].cantidad2017)+'</td><td>'+prodUnico[i].unidad_medida+'</td></tr>';
								}
	 text+='				</tbody>'+
		   '			</table>'+
		   '		</div>'+
		   '	</div>';
	/*---------- EO TABLA DE PRODUCTOS  --------------*/
	
	/*----------  TABLA DE OBJETIVOS  --------------*/
	 text+='	<div class="col-md-12 col-sm-12 col-xs-12" >';
	 text+='		<div class="table-responsive">'+
	 	   '			<table class="table table-striped table-bordered table-hover" id="dataTableObjetivosEst">'+
	 	   '				<thead><th>Objetivos PND</th></thead>'+
	 	   '				<tbody>';
	 							for (var r=0; r<objetivos.length;r++){
	 								text+='<tr><td>'+objetivos[r]+'</td></tr>';
	 							}
	text+='					</tbody>'+
		  '				</table>'+
		  '			</div>'+
	  	  '		</div>';
	
	/*---------- EO TABLA DE OBJETIVOS --------------*/
	

	/*----------  TABLA DE RESULTADOS  --------------*/
	 text+='	<div class="col-md-12 col-sm-12 col-xs-12" >';
	 text+='		<div class="table-responsive">'+
	 	   '			<table class="table table-striped table-bordered table-hover" id="dataTableResultadosEst">'+
	 	   '				<thead><th>Resultados Esperados</th></thead>'+
	 	   '				<tbody>';
	 							for (var i=0; i<resultados.length;i++){
	 								text+='<tr><td>'+resultados[i]+'</td></tr>';
	 							}
	text+= '				</tbody>'+
		   '			</table>'+
		   '		</div>'+
		   '	</div>';
	
	/*---------- EO TABLA DE RESULTADOS --------------*/
	
	text+= '</div>';	
	
	return text;
}
