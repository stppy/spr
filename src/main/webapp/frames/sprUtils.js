
//	$('#myModal2').on('show', function() {
//	  	$('#myModal').css('opacity', .5);
//	  	$('#myModal').unbind();
//	});
//	$('#myModal2').on('hidden', function() {
//	  	$('#myModal').css('opacity', 1);
//	  	$('#myModal').removeData("modal").modal({});
//	});
	
	modalOperacion = function(status, element){
		
		switch (status){
			case 'cargando':
				var $loading = $("#indicadorDeTransaccion");
				break;
			case 'error':
				var $loading = $("#modalMensajeError");
				break;
			case 'exito':
				var $loading = $("#modalMensajeExito");
				break;
			default:
				var $loading = $("#consultaModalBorrarProductoPresupuesto");
			break;
		}

		$loading.css('opacity', 1);
		$loading.show();
		$(element).closest(".modal").css('opacity', .5);
	  	$(element).closest(".modal").unbind();
		
		
		if (status != 'cargando' && status != ''){
			$loading.animate({
		      opacity:1
			}, 4000, function(){
		    $loading.hide();
			});
		}
		
	  }
	
	cerrarModalOperacion = function(element){
		switch (status){
			case 'cargando':
				var $loading = $("#indicadorDeTransaccion");
			case 'error':
				var $loading = $("#modalMensajeError");
			case 'exito':
				var $loading = $("#modalMensajeExito");
			default:
				var $loading = $("#indicadorDeTransaccion");
		}
		  
	    $loading.animate({
	      opacity: 0
	    }, 500, function(){
	      $loading.hide();
	      $(document).unbind('DOMSubtreeModified');
	    });
	  }
	  
	function modalError() {
		$('#modalMensajeError').modal('show');
	}



function numeroEntero(x) {
	if (x == 0)
		return x;			
	else
		return x.split(",");
}

function numeroConComa(x) {
	if(x && !isNaN(x))
		return x.toFixed(2).toString().replace(".00","").replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	else
		return 0;
}