function renderGastos(financiamientos, financiamientosDec, financiamientosUnidad, objetoGastosFiltrados, objetoGastosXDecenas, objetoGastosXUnidad){ //aca recibir la variable nueva
	var text="";
	var idParsed = "";
	totalFinanciamientos=0;
	totalfinanciamientosDec=0;
	totalfinanciamientosUnidad=0;
	
	for (var i=0; i<financiamientos.length;i++){
		if(isNaN(financiamientos[i].presupuesto)){
			totalFinanciamientos+=0;
		}else{
			totalFinanciamientos+=financiamientos[i].presupuesto;
		}
	}
	for (var i=0; i<financiamientosDec.length;i++){
		if(isNaN(financiamientosDec[i].presupuestoDec)){
			totalfinanciamientosDec+=0;
		}else{
			totalfinanciamientosDec+=financiamientosDec[i].presupuestoDec;
		}		
	}
	for (var i=0; i<financiamientosUnidad.length;i++){
		if(isNaN(financiamientosUnidad[i].presupuestoUnitario)){
			totalfinanciamientosUnidad+=0;	
		}else{
			totalfinanciamientosUnidad+=financiamientosUnidad[i].presupuestoUnitario;
		}
	}
	
	/*----------  TABLA DE GASTOS --------------*/
	text= '<div class="row">'+
		  '		<div class="col-md-12 col-sm-12 col-xs-12" >'+
	'					<div class="radio selectorGrupos">'+
	'					 	<label><input type="radio" id="verTablaAgrupado" name="optionObjetosRangos" checked="checked">Grupos</label>'+
	'						<label><input type="radio" id="verTablaDecena" name="optionObjetosRangos" >Subgrupos</label>'+
	'						<label><input type="radio" id="verTablaUnidad" name="optionObjetosRangos" >Objetos</label>'+
	'					</div>';					//SELECTOR DE CUAL QUIERO VER
	/******************Tabla filtrada por centenas*********************/
	text+='			<div class="table-responsive" id="tablaAgrupado">'+
		  '				<table class="table table-striped table-bordered table-hover" id="dataTableGastosCen">'+
		  '					<thead><th>Fuente de Financiamiento</th><th>Organismo Financiador</th><th>Grupo de Gasto</th><th style="display:none;">Monto 1</th><th>Monto</th><th>Porcentaje</th></thead>'+
		  '					<tfoot><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th></tfoot>'+
		  '					<tbody>';
								for (var i=0; i<financiamientos.length;i++){
									var presupuesto = numeroEntero(numeroConComa(financiamientos[i].presupuesto));
									if(typeof presupuesto[0] !== "undefined" && presupuesto[0]!="undefined"){
										text+='<tr class"'+financiamientos[i].clase+'"><td>'+financiamientos[i].fuenteFinanciamientoId+' - '+financiamientos[i].fuenteFinanciamiento+'</td>';
										if(financiamientos[i].organismoFinanciadorId != null){											
											text+='<td>'+financiamientos[i].organismoFinanciadorId+' - '+financiamientos[i].organismoFinanciador+'</td>';
										}else{
												text+='<td> - </td>';
											 }
										text+='<td>'+financiamientos[i].objetoGastoId+' - '+financiamientos[i].objetoGastoNombre+'</td><td align="right">'+presupuesto[0]+'</td><td align="right" style="display:none;">'+financiamientos[i].presupuesto+'</td><td>'+(((financiamientos[i].presupuesto*100))/totalFinanciamientos).toFixed(2)+' %</td></tr>';
									}
								};
	text+='					</tbody>'+
		  '				</table>'+
		  '			</div>';
	/******************Tabla filtrada por decenas*********************/
	text+='			<div class="table-responsive hidden" id="tablaXDecena">'+
		  '				<table class="table table-striped table-bordered table-hover" id="dataTableGastosDec">'+
		  '					<thead><th>Fuente de Financiamiento</th><th>Organismo Financiador</th><th>Subgrupo de Gasto</th><th style="display:none;">Monto 1</th><th>Monto</th><th>Porcentaje</th></thead>'+
		  '					<tfoot><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th></tfoot>'+
		  '					<tbody>';
								for (var y=0; y<financiamientosDec.length;y++){
									var presupuestoDec = numeroEntero(numeroConComa(financiamientosDec[y].presupuestoDec));
									if(typeof presupuestoDec[0] !== "undefined" && presupuestoDec[0]!="undefined"){
										text+='<tr class"'+financiamientosDec[y].clase+'"><td>'+financiamientosDec[y].fuenteFinanciamientoId+' - '+financiamientosDec[y].fuenteFinanciamiento+'</td>';
										if(financiamientosDec[y].organismoFinanciadorId != null){											
											text+='<td>'+financiamientosDec[y].organismoFinanciadorId+' - '+financiamientosDec[y].organismoFinanciador+'</td>';
										}else{
												text+='<td> - </td>';
											 }
										text+='<td>'+financiamientosDec[y].objetoGastoId+' - '+financiamientosDec[y].objetoGastoNombre+'</td><td align="right">'+presupuestoDec[0]+'</td><td align="right" style="display:none;">'+financiamientosDec[y].presupuestoDec+'</td><td>'+(((financiamientosDec[y].presupuestoDec*100))/totalfinanciamientosDec).toFixed(2)+' %</td></tr>';
									}
								};	
	text+='					</tbody>'+
		  '				</table>'+
		  '			</div>';
	/******************Tabla filtrada por unidad*********************/
	text+='			<div class="table-responsive hidden" id="tablaXUnidad">'+
		  '				<table class="table table-striped table-bordered table-hover" id="dataTableGastosUni">'+
		  '					<thead><th>Fuente de Financiamiento</th><th>Organismo Financiador</th><th>Objeto de Gasto</th><th style="display:none;">Monto 1</th><th>Monto</th><th>Porcentaje</th></thead>'+
		  '					<tfoot><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th></tfoot>'+
		  '					<tbody>';
								for (var x=0; x<financiamientosUnidad.length;x++){
									var presupuestoUnitario = numeroEntero(numeroConComa(financiamientosUnidad[x].presupuestoUnitario));
									if(typeof presupuestoUnitario[0] !== "undefined" && presupuestoUnitario[0]!="undefined"){
										text+='<tr class"'+financiamientosUnidad[x].clase+'"><td>'+financiamientosUnidad[x].fuenteFinanciamientoId+' - '+financiamientosUnidad[x].fuenteFinanciamiento+'</td>';
										if(financiamientosUnidad[x].organismoFinanciadorId != null){											
											text+='<td>'+financiamientosUnidad[x].organismoFinanciadorId+' - '+financiamientosUnidad[x].organismoFinanciador+'</td>';
										}else{
												text+='<td> - </td>';
											 }
										text+='<td>'+financiamientosUnidad[x].objetoGastoId+' - '+financiamientosUnidad[x].objetoGastoNombre+'</td><td align="right">'+presupuestoUnitario[0]+'</td><td align="right" style="display:none;">'+financiamientosUnidad[x].presupuestoUnitario+'</td><td>'+(((financiamientosUnidad[x].presupuestoUnitario*100))/totalfinanciamientosUnidad).toFixed(2)+' %</td></tr>';
									}
								};
	text+='					</tbody>'+
		  '				</table>'+
		  '			</div>'+
		  '		</div>'+
		  '</div>';
	/*---------- EO TABLA DE GASTOS  --------------*/
	
	return text;
}
