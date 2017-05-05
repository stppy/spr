$( document ).ready(function() {
	
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
		     '                                    <td>+595 985 321761 </td>'+
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
	
	function numeroConComa(x) {
		return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	}
	
	$("body").on("click", "#guardar-entidad",function(event){
		var entidad = "actInstitucion";
		var entidadObj= new Object();
		entidadObj.id=$("#formulario").find('[name="id"]').val();
		entidadObj.anho=parseInt(2017);
		entidadObj.nivelId=$("#formulario").find('[name="nivelId2"]').val();
		entidadObj.entidadId=$("#formulario").find('[name="entidadId2"]').val();
		entidadObj.abrev=$("#formulario").find('[name="abrev"]').val();
		entidadObj.unidadResponsableId=$("#formulario").find('[name="unidadResponsableId2"]').val();
		entidadObj.unidadJerarquicaId=$("#formulario").find('[name="unidadJerarquicaId2"]').val();
		entidadObj.baseLegal=$("#formulario").find('[name="baseLegal"]').val();
		entidadObj.mision=$("#formulario").find('[name="mision"]').val();
		entidadObj.vision=$("#formulario").find('[name="vision"]').val();
		entidadObj.diagnostico=$("#formulario").find('[name="diagnostico"]').val();
		entidadObj.objetivo=$("#formulario").find('[name="objetivo"]').val();
		entidadObj.politica=$("#formulario").find('[name="politica"]').val();
		entidadObj.version=parseInt(50);
		$.ajax({
	        url: "ajaxUpdate?accion="+entidad, //actInstitucion
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(entidadObj),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	
	        	if(data.success == true)
	        	{
	        		//alert("Guardado!");
	        		
	        		var datosEntidadAct = $.ajax({
	                    url:'/ajaxSelects?accion=getInstitucion&nivel='+event.currentTarget.form[2].value+'&entidad='+event.currentTarget.form[5].value+'&unidadResponsable='+event.currentTarget.form[3].value,
	                    type:'get',
	                    dataType:'json',
	                    async:false       
	                  }).responseText;
	            	datosEntidadAct = JSON.parse(datosEntidadAct);
	            	datosEntidadAct= datosEntidadAct.instituciones;
	            	var fechaUlt = new Date(datosEntidadAct[0].fechaActualizacion);

	                  $("#fechaUltActInstitucion").html("  Ultima Actualización: "+ fechaUlt.getDate()+"/"+(fechaUlt.getMonth()+1)+"/"+fechaUlt.getFullYear()+" "+fechaUlt.getHours()+":"+fechaUlt.getMinutes()+":"+fechaUlt.getSeconds());	                  


	                  modalExito();	                  

	        	}else{

	        		modalError();
	        		

	        	}
	        },
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	modalError();
	        }
	   });
	   
	   event.preventDefault();
	   event.stopPropagation();
	   return false;
	});
	
	$("body").on("click", "#botonPresupuestoIngreso",function(event){
		
		var nivel=$("#formulario").find('[name="nivel"]').val();
		var entidad = $("#formulario").find('[name="entidad"]').val();
		var anho = 2016;
		var version = 6;
		var titulo = "Reporte Presupuesto Ingreso";
		var presupuestoIngresoHistorico=[];
		var contenido="";

		var caja;
		caja=	"<div class='table-responsive'>"+
				"<table class='table'>"+
				"<thead><th>CodigoOrigen</th><th>CodigoDetalle</th><th>FuenteFinanciamiento</th><th>MontoProgramado</th></thead>";

			var presupuestoIngreso = $.ajax({
				url:'/ajaxSelects?accion=getPresupuestoIngresoPresi&nivel='+nivel+'&entidad='+entidad+'&versionReporte='+version+'&anho='+anho,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			presupuestoIngreso = JSON.parse(presupuestoIngreso);
								

			var total=parseFloat(0);
			for(var s=0;s<presupuestoIngreso.length;s++)
			{
				var fuenteFinanciamiento = $.ajax({
					url:'/ajaxSelects?accion=getFuentesFinanciamiento&codigoFuenteFinanciamiento='+presupuestoIngreso[s].fuenteFinanc,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
			fuenteFinanciamiento = JSON.parse(fuenteFinanciamiento);
			fuenteFinanciamiento = fuenteFinanciamiento.fuentesFinanciamiento;
			total+=parseFloat(presupuestoIngreso[s].montoProgramado);
				caja+="<tr><td>"+presupuestoIngreso[s].codOrigen+"</td><td>"+presupuestoIngreso[s].codDetalle+"</td><td>"+presupuestoIngreso[s].fuenteFinanc+"-"+fuenteFinanciamiento[0].nombreFuenteFinanciamiento+"</td><td>"+numeroConComa(presupuestoIngreso[s].montoProgramado)+"</td>";
				
				presupuestoIngresoHistorico= $.ajax({
					url:'/ajaxSelects?accion=getPresupuestoIngresoPresi&nivel='+nivel+'&entidad='+entidad+'&origen='+presupuestoIngreso[s].codOrigen+'&detalleId='+presupuestoIngreso[s].codDetalle+'&fuenteFinanciamiento='+presupuestoIngreso[s].fuenteFinanc,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				presupuestoIngresoHistorico = JSON.parse(presupuestoIngresoHistorico);
				
				var valores = [];
				for (t=0;t<presupuestoIngresoHistorico.length;t++){
					valores.push(presupuestoIngresoHistorico[t] .montoProgramado);
				}
				 caja+='<td><span class="sparkline" data-type="bar" data-width="97%" data-height="100px" data-bar-Width="14" data-bar-Spacing="7" data-bar-Color="#f39c12" id="'+nivel+'-'+entidad+'-'+presupuestoIngreso[s].codOrigen+'-'+presupuestoIngreso[s].codDetalle+'-'+presupuestoIngreso[s].fuenteFinanc+'">';
				 contenido="";
				 for (t=0;t<presupuestoIngresoHistorico.length;t++){
					 contenido+=valores[t]+",";
				 }
				 contenido = contenido.substring(0, contenido.length - 1);
				 
				 //caja+=contenido;
				 caja+="</span></td></tr>"; 
				 	 
				 $('#'+nivel+'-'+entidad+'-'+presupuestoIngreso[s].codOrigen+'-'+presupuestoIngreso[s].codDetalle+'-'+presupuestoIngreso[s].fuenteFinanc+'').sparkline(presupuestoIngresoHistorico, {
					    type: 'line'});
			}
		caja+='<tfoot><tr><td colspan="3"><strong>TOTAL:</strong></td><td><strong>'+numeroConComa(total)+'</strong></td></tr> </tfoot>';
		caja+=	"</table>"+
				"</div>";
		
		$('#myModalPresupuestoIngreso').find("#modal-title").html("");
		$('#myModalPresupuestoIngreso').find(".modal-body").html("");
		$('#myModalPresupuestoIngreso').find(".modal-body").html(caja);
		$('#myModalPresupuestoIngreso').find("#myModalLabel").html(" "+titulo+" "+nivel+"-"+entidad);
		
		  
	});
	
});
