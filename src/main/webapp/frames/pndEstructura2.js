function numeroConComa(x) {
		if(x && !isNaN(x)) {
			return x.toFixed(2).toString().replace(".00","").replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
		}else{
			return 0;
			
		}
	}

function comparePresupuesto(a,b) {  
    if (a.presupuesto > b.presupuesto) return -1;
    if (a.presupuesto < b.presupuesto) return 1;
    return 0;
}


function renderEstructura(entregas, monto, resultados, productos, color){
	var text="";
	
	var text='<div class="row"><div class="col-md-6 col-sm-6 col-xs-12" >'+
    '<div class="info-box '+color+'">'+
     ' <span class="info-box-icon"><i class="fa fa-users"></i></span>'+
     ' <div class="info-box-content">'+
     '   <span class="info-box-text">Entregas de Productos</span>'+
     '   <span class="info-box-number ">'+entregas+'<small></small></span>'+
     '   <div class="progress">'+
     '     <div class="progress-bar" style="width:100%"></div>'+
     '   </div>'+
     '   <span class="progress-description"></span>'+
     ' </div><!-- /.info-box-content -->'+
    '</div><!-- /.info-box -->'+
  '</div>'+
  '<div class="col-md-6 col-sm-6 col-xs-12">'+
  '<div class="info-box '+color+'">'+
   '  <span class="info-box-icon"><i class="fa">₲</i></span>'+
   ' <div class="info-box-content">'+
   '   <span class="info-box-text">Asignación Financiera</span>'+
   '   <span class="info-box-number">'+monto+'<small></small></span>'+
   '   <div class="progress">'+
   '     <div class="progress-bar" style="width:100%"></div>'+
   '   </div>'+
   '   <span class="progress-description"></span>'+
   ' </div><!-- /.info-box-content -->'+
  '</div><!-- /.info-box -->'+
'</div>';
	
	 text+='<div class="col-md-12 col-sm-12 col-xs-12" >';
	 text+= 	'<div class="table-responsive">'+
	'	<table class="table table-striped table-bordered table-hover" id="dataTableResultados">'+
	'		<thead><th>Resultados Esperados</th></thead>'+
	'		<tbody>';
	
	for (var r=0; r<resultados.length;r++){
		text+='<tr><td>'+resultados[r]+'</td></tr>';
	}
	
	text+=		'		</tbody>'+
	'	</table>'+
	'</div>';
	
	text+= 	'<div class="table-responsive">'+
				'	<table class="table table-striped table-bordered table-hover" id="dataTableProductos">'+
				'		<thead><th>Productos</th><th>Clase</th><th>Cantidad</th><th>Unidad de Medida</th></thead>'+
				'		<tbody>';
	
	var idParsed = "";
	var prodUnico=[];
	var esUnico=1;
	for (var i=0; i<productos.length;i++){
		var esUnico=1;
		for (var j=0; j<prodUnico.length;j++){
			if(prodUnico[j].nombre===productos[i].nombre){
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
			producto.nombre=productos[i].nombre
			producto.presupuesto=productos[i].presupuesto
			producto.cantidad2017=productos[i].cantidad2017;
			producto.clase=productos[i].clase
			producto.unidad_medida=productos[i].unidad_medida
			prodUnico.push(producto);
		}
	}
	for (var i=0; i<prodUnico.length;i++){
		text+='<tr><td><a href="../pndProductos.jsp?parametros=" target="_blank" >'+prodUnico[i].nombre+'</a></td><td>'+prodUnico[i].clase+'</td><td class="text-right">'+numeroConComa(prodUnico[i].cantidad2017)+'</td><td>'+prodUnico[i].unidad_medida+'</td></tr>';
	}
	text+=		'		</tbody>'+
				'	</table>'+
				'</div>';
	text+='</div>'+
	'</div>';
	return text;
	
	
	
}