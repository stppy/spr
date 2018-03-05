$( document ).ready(function() {
	var anho = 2017;
	var version = 50;

	var entidad=0; var nivel=0; var tipoPrograma=0; var programa=0; var subprograma=-1; var proyecto=-1; var producto=0; var unidadResponsable=-1; 

	var totalEntidadesGeneral = 0;
	var totalTiposProductosGeneral = 0;
	var datosUnidadResponsable 
	var unidadResponsableAux = 0;
	var pndNivelEntidad
	/**********selector de niveles***********/
	var datosNiveles = $.ajax({
		url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles'+'&borrado=false',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	datosNiveles = JSON.parse(datosNiveles);
	datosNiveles = datosNiveles.niveles;

	var optionPNDnivel="<option value='' selected>Nivel</option>";

	for(var a = 0; a < datosNiveles.length; a++){
		if (datosNiveles[a].nivel != 1 && datosNiveles[a].nivel != 10 && datosNiveles[a].nivel != 20){
			optionPNDnivel+='<option value="'+datosNiveles[a].nivel+'" >'+datosNiveles[a].nivel+' - '+datosNiveles[a].nombreNivel+'</option>';
		}
	}
	$("#selectorDeNivel").html(optionPNDnivel);
	
	function mostrarSpinnerMatrizTotales(){
		$("[objeto=estrategia][cod=0]").html( '<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>' 
			       + $("[objeto=estrategia][cod=0]").html() );		
	};
	
	function ocultarSpinnerMatrizTotales(){
		$("[objeto=estrategia][cod=0]").find(".overlay").remove();
	}
	
	//-------------change de nivel-------------//
	$("body").on("change", "#selectorDeNivel",function(event){
		var parametros = $("#selectorDeNivel option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    var optionPNDentidad="";
	    
	    //limpieza de los selectores dependientes, variables y la matriz
	    $("#selectorDeEntidad").html("<option value='' selected >Entidad</option>");
	    $("#selectorDeUnidadResponsable").html("<option value='' selected >Unidad Responsable</option>");
	    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");    	
    	entidad=0; unidadResponsable=-1; tipoPrograma=0; programa=0; subprograma=-1; proyecto=-1; producto=0; 
    	vaciarMatriz();
	    
	    if (parametros != "0" && parametros != ""){
	    	obtenerTotales(parametros, nivel);
			
			//falta actualizar el modal
			vaciarMatriz();	
			
			
		    /**********selector de entidades***********/
			pndNivelEntidad = $.ajax({
				url:'http://spr.stp.gov.py/ajaxSelects?accion=getPNDne&nivel='+nivel,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			pndNivelEntidad = JSON.parse(pndNivelEntidad);
			
			if (pndNivelEntidad != null){
				var optionPNDentidad='<option value="'+nivel+'" selected >Entidad</option>';
				for(var e = 0; e < pndNivelEntidad.length; e++){
					optionPNDentidad+='<option value="'+nivel+'-'+pndNivelEntidad[e].id+'" >'+pndNivelEntidad[e].id+' - '+pndNivelEntidad[e].nombre+'</option>';
				}
				$("#selectorDeEntidad").html(optionPNDentidad);
			}else{
				var optionPNDentidad="<option value=''>No posee entidades</option>";
				$("#selectorDeEntidad").html(optionPNDentidad);
			}
	    } else {	    	
	    	//Obtiene los totales a nivel pais si se deselecciona un nivel.
	    	nivel=0;
	    	obtenerTotales("");
	    	
			vaciarMatriz();
	    }
			    
	});
	
	
	
	//-------------change de entidad-------------//
	$("body").on("change", "#selectorDeEntidad",function(event){
		var parametros = $("#selectorDeEntidad option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    var optionPNDur ="";
	    
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeUnidadResponsable").html("<option value='' selected >Unidad Responsable</option>");
	    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	unidadResponsable=-1;  tipoPrograma=0; programa=0; subprograma=-1; proyecto=-1; producto=0; 
	    
	    if (entidad != undefined){
	    	obtenerTotales(parametros, nivel, entidad);
			
			//falta actualizar el modal
			vaciarMatriz();		
		
			/**********selector de unidad responsable***********/
			datosUnidadResponsable = $.ajax({
			      url:'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesResponsablesPND&nivel='+nivel+'&entidad='+entidad,
			      type:'get',
			      dataType:'json',
			      async:false       
			    }).responseText;
				datosUnidadResponsable = JSON.parse(datosUnidadResponsable);
				//datosUnidadResponsable = datosUnidadResponsable.unidadesResponsables;
			
		    if (datosUnidadResponsable != null){
	    		var optionPNDur='<option value="'+nivel+'-'+entidad+'-'+unidadResponsableAux+'" selected >Todos</option>';
		    	
		    	for(var u = 0; u < datosUnidadResponsable.length; u++){
		    		if(datosUnidadResponsable[u].unrNombre != null){
			    		optionPNDur+='<option value="'+nivel+'-'+entidad+'-'+datosUnidadResponsable[u].unrCodigo+'" >'+datosUnidadResponsable[u].unrCodigo+' - '+datosUnidadResponsable[u].unrNombre+'</option>';
		    		}
		    	}
		    	$("#selectorDeUnidadResponsable").html(optionPNDur);
		    }else{
		    	var optionPNDur="<option value=''>No posee unidad responsable</option>";
		    	$("#selectorDeUnidadResponsable").html(optionPNDur);
		    }

		    /**********selector de tipo programa si el selector es cero***********/
		    if (unidadResponsableAux == 0){
			    var tiposPrograma = $.ajax({
			    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposProgramaPND'+'&borrado=false&nivel='+nivel+'&entidad='+entidad,
			    	type:'get',
			    	dataType:'json',
			    	async:false       
			    }).responseText;
			    tiposPrograma = JSON.parse(tiposPrograma);
			    tiposPrograma = tiposPrograma.tiposPrograma;
		    }
		    if (tiposPrograma != null){
		    	var optionPNDtipoPrograma='<option value="'+nivel+'-'+entidad+'-'+unidadResponsableAux+'" selected >Tipo de Programa</option>';
		    	for(var o = 0; o < tiposPrograma.length; o++){
		    		optionPNDtipoPrograma+='<option value="'+nivel+'-'+entidad+'-'+unidadResponsableAux+'-'+tiposPrograma[o].numeroFila+'" >'+tiposPrograma[o].numeroFila+' - '+tiposPrograma[o].nombreTipoPrograma+'</option>';
		    	}
		    	$("#selectorDeTipoPresupuesto").html(optionPNDtipoPrograma);
		    }else{
		    	var optionPNDtipoPrograma="<option value=''>No existe tipo</option>";
		    	$("#selectorDeTipoPresupuesto").html(optionPNDtipoPrograma);
		    }
		    
		} else {	    		    		    		    	
			entidad=0;			   	
			obtenerTotales(parametros, nivel, entidad);
			
			vaciarMatriz();
	    }
	});
	
	 //-------------change de unidad responsable-------------//
    $("body").on("change", "#selectorDeUnidadResponsable",function(event){
		var parametros = $("#selectorDeUnidadResponsable option:selected").val();
	    var idParsed = parametros.split("-");  
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    unidadResponsable = idParsed[2];
	    var optionPNDtipoPrograma = "";
	    
	  //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	tipoPrograma=0; programa=0; subprograma=-1; proyecto=-1; producto=0; 
    	
	    if (unidadResponsable != undefined){
	    	obtenerTotales(parametros, nivel, entidad, unidadResponsable);
	    	
			//falta actualizar el modal
			vaciarMatriz();
			if (unidadResponsable != 0){
				/**********selector de tipo programa si el selector cambia de cero***********/
			    var tiposPrograma = $.ajax({
			    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposProgramaPND'+'&borrado=false&nivel='+nivel+'&entidad='+entidad+'&unidadResponsable='+unidadResponsable,
			    	type:'get',
			    	dataType:'json',
			    	async:false       
			    }).responseText;
			    tiposPrograma = JSON.parse(tiposPrograma);
			    tiposPrograma = tiposPrograma.tiposPrograma;
			}else{
				var tiposPrograma = $.ajax({
			    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposProgramaPND'+'&borrado=false&nivel='+nivel+'&entidad='+entidad,
			    	type:'get',
			    	dataType:'json',
			    	async:false       
			    }).responseText;
			    tiposPrograma = JSON.parse(tiposPrograma);
			    tiposPrograma = tiposPrograma.tiposPrograma;
			}
		    if (tiposPrograma != null){
		    	var optionPNDtipoPrograma='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'" selected >Tipo de Programa</option>';
		    	for(var o = 0; o < tiposPrograma.length; o++){
		    		optionPNDtipoPrograma+='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tiposPrograma[o].numeroFila+'" >'+tiposPrograma[o].numeroFila+' - '+tiposPrograma[o].nombreTipoPrograma+'</option>';
		    	}
		    	$("#selectorDeTipoPresupuesto").html(optionPNDtipoPrograma);
		    }else{
		    	var optionPNDtipoPrograma="<option value=''>No existe tipo</option>";
		    	$("#selectorDeTipoPresupuesto").html(optionPNDtipoPrograma);
		    }
	
			
	    } else {
	    	unidadResponsable=0;
			obtenerTotales(parametros, nivel, entidad);
			
			vaciarMatriz();
		}
    });
    
	

	
	
    //-------------change de tipo programa-------------//
	$("body").on("change", "#selectorDeTipoPresupuesto",function(event){
		var parametros = $("#selectorDeTipoPresupuesto option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    unidadResponsable = idParsed[2];
	    tipoPrograma = idParsed[3];
	    var optionPNDprograma ="";

	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	programa=0; subprograma=-1; proyecto=-1; producto=0;
	    
	    if (tipoPrograma != undefined){
		    obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma);
			
			//falta actualizar el modal
			vaciarMatriz();
			var unr = '';
			if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) unr = '&unidadResponsable='+unidadResponsable;

			/**********selector de programa***********/
			var datosProgramas = $.ajax({
		    	url:'/ajaxSelects?accion=getProgramasPND&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&borrado=false'+unr,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		    datosProgramas = JSON.parse(datosProgramas);
		    datosProgramas = datosProgramas.programas;
	    		
	    	if (datosProgramas != null){
		    	var optionPNDprograma='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'" selected >Programa</option>';
		    	for(var u = 0; u < datosProgramas.length; u++){
		    		optionPNDprograma+='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+datosProgramas[u].codigoPrograma+'" >'+datosProgramas[u].codigoPrograma+' - '+datosProgramas[u].nombrePrograma+'</option>';
		    	}
		    	$("#selectorDePrograma").html(optionPNDprograma);
		    }else{
		    	var optionPNDprograma="<option value=''>No posee programas</option>";
		    	$("#selectorDePrograma").html(optionPNDprograma);
		    }
		} else {		
			tipoPrograma=0;
	    	obtenerTotales(parametros, nivel, entidad, unidadResponsable );
			
			vaciarMatriz();
		}
	    
	});
	
	
    
    //-------------change de programa-------------//
	$("body").on("change", "#selectorDePrograma",function(event){
		var parametros = $("#selectorDePrograma option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    unidadResponsable = idParsed[2];
	    tipoPrograma = idParsed[3];
	    programa = idParsed[4];
	    var optionPNDsubprograma="";
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	subprograma=-1; proyecto=-1; producto=0; 
	    
	    if (programa != undefined){
	    
		    obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa);
			
			//falta actualizar el modal
			vaciarMatriz();
			
			var unr = '';
			if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) unr = '&unidadResponsable='+unidadResponsable;

			/**********selector de sub programa***********/
			var datosSubProgramas = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramasPND&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&borrado=false'+unr,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
	
		    datosSubProgramas = JSON.parse(datosSubProgramas);
		    datosSubProgramas = datosSubProgramas.subprogramas;
	    

	    	if (datosSubProgramas != null){
		    	var optionPNDsubprograma='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+programa+'" selected >Sub Programa</option>';
		    	for(var u = 0; u < datosSubProgramas.length; u++){
		    		optionPNDsubprograma+='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+programa+'-'+datosSubProgramas[u].id+'" >'+datosSubProgramas[u].id+' - '+datosSubProgramas[u].nombre+'</option>';
		    	}
		    	$("#selectorDeSubPrograma").html(optionPNDsubprograma);
		    }else{
		    	var optionPNDsubprograma="<option value=''>No posee sub programas</option>";
		    	$("#selectorDeSubPrograma").html(optionPNDsubprograma);
		    }
		} else {			
			programa=0;
	    	obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma);
			
			vaciarMatriz();
		}
	});
	
	
    
    //-------------change de sub programa-------------//
    $("body").on("change", "#selectorDeSubPrograma",function(event){
		var parametros = $("#selectorDeSubPrograma option:selected").val();
	    var idParsed = parametros.split("-");  
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    unidadResponsable = idParsed[2];
	    tipoPrograma = idParsed[3];
	    programa = idParsed[4];
	    subprograma = idParsed[5];
	    var optionPNDproyecto="";
	    
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	proyecto=-1; producto=0; 
	    
	    if (subprograma != undefined){
	    	obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma);
			
			//falta actualizar el modal
			vaciarMatriz();
			
			var unr = '';
			if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) unr = '&unidadResponsable='+unidadResponsable;
				
			/**********selector de proyecto***********/
			var proyectos = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectosPND&borrado=false&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma+unr,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
	
			proyectos = JSON.parse(proyectos);
			//proyectos = proyectos.proyectos;
	
		    if (proyectos != null){
		    	var optionPNDproyecto='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'" selected >Proyecto</option>';
		    	for(var u = 0; u < proyectos.length; u++){
		    		optionPNDproyecto+='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[u].codigoProyecto+'" >'+proyectos[u].codigoProyecto+' - '+proyectos[u].nombreProyecto+'</option>';
		    	}
		    	$("#selectorDeProyecto").html(optionPNDproyecto);
		    }else{
		    	var optionPNDproyecto="<option value=''>No posee proyectos</option>";
		    	$("#selectorDeProyecto").html(optionPNDproyecto);
		    }
		} else {				      		    	
			subprograma=-1;
			obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa);
			
			vaciarMatriz();
		}
	});
    
   
    
    //-------------change de proyecto-------------//
    $("body").on("change", "#selectorDeProyecto",function(event){
		var parametros = $("#selectorDeProyecto option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    unidadResponsable = idParsed[2];
	    tipoPrograma = idParsed[3];
	    programa = idParsed[4];
	    subprograma = idParsed[5];
	    proyecto = idParsed[6];
	    var optionPNDproductos ="";
	    

	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeProducto").html("<option value='' selected >Producto</option>");
	    producto=0; 
	    
	    if (proyecto != undefined){
	    	obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto);
			
			//falta actualizar el modal
			vaciarMatriz();
			
			var unr = '';
			if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) unr = '&unidadResponsable='+unidadResponsable;
				
			/**********selector de producto***********/
			var datosProductos = $.ajax({
		      url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductosPresupuestoPND&borrado=false'+'&anho='+anho+'&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+unr,
		      type:'get',
		      dataType:'json',
		      async:false       
		    }).responseText;
		    datosProductos = JSON.parse(datosProductos);
		    //datosProductos = datosProductos.producto;
	    
		    if (datosProductos != null){
		    	var optionPNDproductos='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'" selected >Producto</option>';
		    	
		    	for(var u = 0; u < datosProductos.length; u++){		    		
		    		var producto = $.ajax({
		  		      url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+datosProductos[u].producto_id,
		  		      type:'get',
		  		      dataType:'json',
		  		      async:false       
		  		    }).responseText;
		  		    producto = JSON.parse(producto);
		  		    producto = producto.productos;
		  		    
		    		optionPNDproductos+='<option value="'+nivel+'-'+entidad+'-'+unidadResponsable+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+datosProductos[u].producto_id+'" >'+datosProductos[u].producto_id+' - '+producto[0].nombreCatalogo+'</option>';

		    	}
		    	$("#selectorDeProducto").html(optionPNDproductos);
		    }else{
		    	var optionPNDproductos="<option value=''>No posee productos</option>";
		    	$("#selectorDeProducto").html(optionPNDproductos);
		    }
		} else {				    		    	
			proyecto=-1;
			obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma);
			
			vaciarMatriz();
		}
    });
    
    
    
    //-------------change de producto-------------//
    $("body").on("change", "#selectorDeProducto",function(event){
		var parametros = $("#selectorDeProducto option:selected").val();
	    var idParsed = parametros.split("-");  
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    unidadResponsable = idParsed[2];
	    tipoPrograma = idParsed[3];
	    programa = idParsed[4];
	    subprograma = idParsed[5];
	    proyecto = idParsed[6];
	    producto = idParsed[7];
	    
	    if (producto != undefined){
	    	obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto);
	    	
			//falta actualizar el modal
			vaciarMatriz();
	    } else {
	    	producto=0;
			obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto);
			
			vaciarMatriz();
		}
    });
    
    $("body").on("change", "#optionTipoProductoAsig",function(event){
    	var catalogo_producto=$(this).find('option:selected').val();
    	getPorcentajesTotales(0, catalogo_producto, 0);
		layerMapa="mapaAsignacion";
		deptoAsig.eachLayer(function(l){deptoAsig.resetStyle(l);});
	});
    
    $("body").on("change", "#optionTipoProductoMeta",function(event){
    	var catalogo_producto=$(this).find('option:selected').val();
		var catalogo_mes=$("#optionMes").find('option:selected').val();
		cargarSelectoresMapa("meta",catalogo_producto,0,catalogo_mes);		
		getPorcentajesTotales(0, catalogo_producto, catalogo_mes);	
		layerMapa="mapaMetas";
		deptoMeta.eachLayer(function(l){deptoMeta.resetStyle(l);});
	});
    
	$("body").on("change", "#optionDestinatario",function(event){
		var catalogo_dest=$(this).find('option:selected').val();
		var catalogo_prod=$("#optionTipoProducto").find('option:selected').val();
		cargarSelectoresMapa("destinatario",catalogo_prod,catalogo_dest,0);		
		getPorcentajesTotales(catalogo_dest, catalogo_prod,0);	
		layerMapa="mapaDestinatarios";
		deptoDest.eachLayer(function(l){deptoDest.resetStyle(l);});
	});
	
	$("body").on("change", "#optionTipoProducto",function(event){
		var catalogo_producto=$(this).find('option:selected').val();
		var catalogo_dest=$("#optionDestinatario").find('option:selected').val();
		cargarSelectoresMapa("destinatario",catalogo_producto,catalogo_dest,0);
		getPorcentajesTotales(catalogo_dest, catalogo_producto,0);	
		layerMapa="mapaDestinatarios";
		deptoDest.eachLayer(function(l){deptoDest.resetStyle(l);});
	});
	
	$("body").on("change", "#optionMes",function(event){
		var catalogo_mes=$(this).find('option:selected').val();
		var catalogo_producto=$("#optionTipoProductoMeta").find('option:selected').val();
		cargarSelectoresMapa("meta",catalogo_producto,0,catalogo_mes);
		getPorcentajesTotales("meta", catalogo_producto, 0, catalogo_mes);	
		layerMapa="mapaMetas";
		deptoMeta.eachLayer(function(l){deptoMeta.resetStyle(l);});
	});
	
	function obtenerTotales(parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto){
		
		var url1 = 'http://spr.stp.gov.py/ajaxSelects?accion=getTotalesPnd';
		
		if (nivel != null && nivel !="") url1 = url1 + '&nivelId='+nivel;
		if (entidad != null && entidad !="") url1 = url1 + '&entidadId='+entidad;
		if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) url1 = url1 + '&unidadResponsable='+unidadResponsable;
		if (tipoPrograma != null) url1 = url1 + '&tipoPrograma='+tipoPrograma;
		if (programa != null) url1 = url1 + '&programa='+programa;
		if (subprograma != null) url1 = url1 + '&subprograma='+subprograma;
		if (proyecto != null) url1 = url1 + '&proyecto='+proyecto;
		if (producto != null) url1 = url1 + '&producto='+producto;
		
		var totalesPorNivelEntidad = $.ajax({
			url: url1,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		totalesPorNivelEntidad = JSON.parse(totalesPorNivelEntidad);
		
		actualizarTotalPND(totalesPorNivelEntidad, parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto);
		
		var url2 = 'http://spr.stp.gov.py/ajaxSelects?accion=getTotalesPorEje';
		
		if (nivel != null && nivel !="") url2 = url2 + '&nivelId='+nivel;
		if (entidad != null && entidad !="") url2 = url2 + '&entidadId='+entidad;
		if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) url2 = url2 + '&unidadResponsable='+unidadResponsable;
		if (tipoPrograma != null) url2 = url2 + '&tipoPrograma='+tipoPrograma;
		if (programa != null) url2 = url2 + '&programa='+programa;
		if (subprograma != null) url2 = url2 + '&subprograma='+subprograma;
		if (proyecto != null) url2 = url2 + '&proyecto='+proyecto;
		if (producto != null) url2 = url2 + '&producto='+producto;
		
		var totalesPorEjePorNivelEntidad = $.ajax({
			url: url2,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		totalesPorEjePorNivelEntidad = JSON.parse(totalesPorEjePorNivelEntidad);
		
		actualizarTotalesPorEjes(totalesPorEjePorNivelEntidad, totalEntidadesGeneral, totalTiposProductosGeneral, parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto);			

		var url3 = '/ajaxSelects?accion=getEntidadesPorEstrategia';
		
		if (nivel != null && nivel !="") url3 = url3 + '&nivelId='+nivel;
		if (entidad != null && entidad !="") url3 = url3 + '&entidadId='+entidad;
		if (unidadResponsable != null && unidadResponsable !="" && unidadResponsable !=-1 && unidadResponsable !=0) url3 = url3 + '&unidadResponsable='+unidadResponsable;
		if (tipoPrograma != null) url3 = url3 + '&tipoPrograma='+tipoPrograma;
		if (programa != null) url3 = url3 + '&programa='+programa;
		if (subprograma != null) url3 = url3 + '&subprograma='+subprograma;
		if (proyecto != null) url3 = url3 + '&proyecto='+proyecto;
		if (producto != null) url3 = url3 + '&producto='+producto;
		
		var cantEntidades = $.ajax({
			url: url3,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		cantEntidades = JSON.parse(cantEntidades);
		
		if(cantEntidades != null){			
			cantEntidades=cantEntidades.sort(compareEstrategia);
		}
		
		actualizarTotalesPorEstrategia(totalesPorNivelEntidad, cantEntidades, parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto);
		
		
		//falta arreglar modal
		vaciarMatriz();
	}
	
	/**********-----Se actualiza la matriz del total-----*********/
	function actualizarTotalPND(totalesPorNivelEntidad, parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto){
		$(" [objeto=estrategia][cod=0]").find(".bj-entidades").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].entidades)));
		if(nivel != undefined && entidad == undefined){
			$(" [objeto=estrategia][cod=0]").find(".bj-entidades").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].entidades)));
		}else{
			if(nivel != undefined && entidad != undefined && unidadResponsable == undefined){
				for(var e = 0; e < pndNivelEntidad.length; e++){
					var entAbrev;
					if (entidad == pndNivelEntidad[e].id){
						entAbrev = '<i>'+ pndNivelEntidad[e].entidad_sigla+'</i>';
					}
		    	}
				$(" [objeto=estrategia][cod=0]").find(".bj-entidades").html(entAbrev);
			}else{
				if(nivel != undefined && entidad != undefined && unidadResponsable !='-1' && unidadResponsable !='0'){
					for(var u = 0; u < datosUnidadResponsable.length; u++){
						var unrAbrev;
						if (unidadResponsable == datosUnidadResponsable[u].unrCodigo){
							var unrAbrev = '<i>'+ datosUnidadResponsable[u].unrAbrev+'</i>';
						}
			    	}
					$(" [objeto=estrategia][cod=0]").find(".bj-entidades").html(unrAbrev);
				}else{
					if(nivel != undefined && entidad != undefined && unidadResponsable !='-1' && unidadResponsable =='0'){
						for(var e = 0; e < pndNivelEntidad.length; e++){
							var entAbrev;
							if (entidad == pndNivelEntidad[e].id){
								entAbrev = '<i>'+ pndNivelEntidad[e].entidad_sigla+'</i>';
							}
				    	}
						$(" [objeto=estrategia][cod=0]").find(".bj-entidades").html(entAbrev);
					}
				}
			}
		}
		$(" [objeto=estrategia][cod=0]").find(".bj-resultados").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].objetivos)));
		$(" [objeto=estrategia][cod=0]").find(".bj-productos").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].productos)));
		$(" [objeto=estrategia][cod=0]").find(".bj-destinatarios").html(numeroConComa(parseInt(totalesPorNivelEntidad[0].destinatarios)));
		$(" [objeto=estrategia][cod=0]").find(".bj-presupuesto").html(numeroConComa(parseInt(totalesPorNivelEntidad[0].presupuesto/1000000))+" MM");
	}
	
	function actualizarTotalesPorEjes(totalesPorEje, totalEntidadesGeneral, totalTiposProductosGeneral, parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto){
		var totalDestinatarios=parseFloat(0);
		var totalPresupuesto=parseFloat(0);
		var fraccionPresupuesto=parseFloat(0);
		var totalEntidades=parseFloat(0);
		var totalObjetivos=parseFloat(0);
		var totalProductos=parseFloat(0);
		var indice = 0;
		var ejes = [];
		
		for (var i=1; i<=3; i++){
			$("[objeto=eje][cod="+i+"]").addClass("collapsed-box");
			$("[objeto=eje][cod="+i+"]").find(".bj-entidades").html("0   <small>0%</small>");
			$("[objeto=eje][cod="+i+"]").find(".bj-resultados").html("0   <small>0%</small>");
			$("[objeto=eje][cod="+i+"]").find(".bj-productos").html("0   <small>0%</small>");
			$("[objeto=eje][cod="+i+"]").find(".bj-destinatarios").html("0   <small>0%</small>");
			$("[objeto=eje][cod="+i+"]").find(".bj-presupuesto").html("0   <small>0%</small>");
			$("[objeto=eje][cod="+i+"]").find(".destinatarios-ratio").attr("style","width:0%");
			$("[objeto=eje][cod="+i+"]").find(".productos-ratio").attr("style","width:0%");
			$("[objeto=eje][cod="+i+"]").find(".resultados-ratio").attr("style","width:0%");
			$("[objeto=eje][cod="+i+"]").find(".entidades-ratio").attr("style","width:0%");
			$("[objeto=eje][cod="+i+"]").find(".presupuesto-ratio").attr("style","width:0%");
		}

		if(totalesPorEje != null){			
			for (var i=0; i<totalesPorEje.length; i++){
				if (totalesPorEje[i].destinatarios != null)	totalDestinatarios+=parseFloat(totalesPorEje[i].destinatarios);
				if (totalesPorEje[i].presupuesto != null) totalPresupuesto+=parseFloat(totalesPorEje[i].presupuesto);
				//totalEntidades+=parseFloat(totalesPorEje[i].entidades);
				if (totalesPorEje[i].objetivos != null)	totalObjetivos+=parseFloat(totalesPorEje[i].objetivos);
				//totalProductos+=parseFloat(totalesPorEje[i].productos);
			}
			if (totalEntidadesGeneral != null) totalEntidades=parseFloat(totalEntidadesGeneral);
			if (totalTiposProductosGeneral != null)	totalProductos=parseFloat(totalTiposProductosGeneral);
		}		
		
		if(totalesPorEje != null){	
			for (var i=0; i<totalesPorEje.length; i++){
				var eje = {destinatarios: 0, presupuesto: 0, entidades: 0, objetivos: 0, productos: 0, eje_estrategico_id: 0};
				for (var j=0; j<3; j++){
					if (j == totalesPorEje[i].eje_estrategico_id-1){
						totalesPorEje[i].destinatarios==0 || totalesPorEje[i].destinatarios==undefined ? eje.destinatarios=0: eje.destinatarios=totalesPorEje[i].destinatarios;
						totalesPorEje[i].presupuesto==0 || totalesPorEje[i].presupuesto==undefined ? eje.presupuesto=0: eje.presupuesto=totalesPorEje[i].presupuesto;
						totalesPorEje[i].entidades==0 || totalesPorEje[i].entidades==undefined ? eje.entidades=0: eje.entidades=totalesPorEje[i].entidades;
						totalesPorEje[i].objetivos==0 || totalesPorEje[i].objetivos==undefined ? eje.objetivos=0: eje.objetivos=totalesPorEje[i].objetivos;
						totalesPorEje[i].productos==0 || totalesPorEje[i].productos==undefined ? eje.productos=0: eje.productos=totalesPorEje[i].productos;
						totalesPorEje[i].eje_estrategico_id==0 || totalesPorEje[i].eje_estrategico_id==undefined ? eje.eje_estrategico_id=0: eje.eje_estrategico_id=totalesPorEje[i].eje_estrategico_id;
					}
					ejes.push(eje);
				}
			}
		}

		for (var i=0; i<ejes.length; i++){
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").removeClass("collapsed-box");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html(ejes[i].entidades+"   <small>"+parseInt((ejes[i].entidades/totalEntidades)*100)+"%</small>");
			if(nivel != undefined && entidad == undefined){
				$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html(ejes[i].entidades+"   <small>"+parseInt((ejes[i].entidades/totalEntidades)*100)+"%</small>");
			}else{
				if(nivel != undefined && entidad != undefined && unidadResponsable == undefined){
					for(var e = 0; e < pndNivelEntidad.length; e++){
						var entAbrev;
						if (entidad == pndNivelEntidad[e].id){
							entAbrev = '<i>'+ pndNivelEntidad[e].entidad_sigla+'</i>';
						}
			    	}
					$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html(entAbrev);
				}else{
					if(nivel != undefined && entidad != undefined && unidadResponsable !='-1' && unidadResponsable !='0'){
						for(var u = 0; u < datosUnidadResponsable.length; u++){
							var unrAbrev;
							if (unidadResponsable == datosUnidadResponsable[u].unrCodigo){
								var unrAbrev = '<i>'+ datosUnidadResponsable[u].unrAbrev+'</i>';
							}
				    	}
						$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html(unrAbrev);
					}else{
						if(nivel != undefined && entidad != undefined && unidadResponsable !='-1' && unidadResponsable =='0'){
							for(var e = 0; e < pndNivelEntidad.length; e++){
								var entAbrev;
								if (entidad == pndNivelEntidad[e].id){
									entAbrev = '<i>'+ pndNivelEntidad[e].entidad_sigla+'</i>';
								}
					    	}
							$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html(entAbrev);
						}
					}
				}
			}
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-resultados").html(ejes[i].objetivos+"   <small>"+parseInt(((ejes[i].objetivos/totalObjetivos)*100).toFixed(0))+"%</small>");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-productos").html(ejes[i].productos+"   <small>"+parseInt(((ejes[i].productos/totalProductos)*100).toFixed(0))+"%</small>");
			if (totalDestinatarios != 0){
				$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-destinatarios").html(numeroConComa(parseInt(ejes[i].destinatarios))+"   <small>"+parseInt((((ejes[i].destinatarios)/totalDestinatarios)*100).toFixed(0))+"%</small>");
			}else{
				$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-destinatarios").html(numeroConComa(parseInt(ejes[i].destinatarios))+"   <small>"+parseInt(totalDestinatarios)+"%</small>");
			}
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-presupuesto").html(numeroConComa(parseInt(ejes[i].presupuesto/1000000))+" MM    <small>"+parseInt((((ejes[i].presupuesto)/totalPresupuesto)*100).toFixed(0))+"%</small>");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".destinatarios-ratio").attr("style","width:"+parseInt((((ejes[i].destinatarios)/totalDestinatarios)*100).toFixed(0))+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".productos-ratio").attr("style","width:"+parseInt((((ejes[i].productos)/totalProductos)*100).toFixed(0))+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".resultados-ratio").attr("style","width:"+parseInt((((ejes[i].objetivos)/totalObjetivos)*100).toFixed(0))+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".entidades-ratio").attr("style","width:"+parseInt((((ejes[i].entidades)/totalEntidades)*100).toFixed(0))+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".presupuesto-ratio").attr("style","width:"+parseInt((((ejes[i].presupuesto)/totalPresupuesto)*100).toFixed(0))+"%");
		}
	}

	function actualizarTotalesPorEstrategia(totalesPorNivelEntidad, cantEntidades, parametros, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto){

		var totalDestinatarios=parseFloat(0);
		var totalPresupuesto=parseFloat(0);
		var totalEntidades=parseFloat(0);
		var totalObjetivos=parseFloat(0);
		var totalProductos=parseFloat(0);
		if(cantEntidades != null){
		 	for (var i=0; i<cantEntidades.length; i++){
		 		totalDestinatarios+=cantEntidades[i].destinatarios;
		 		if (cantEntidades[i].presupuesto != null) totalPresupuesto+=parseFloat(cantEntidades[i].presupuesto);
		 		totalEntidades+=parseFloat(cantEntidades[i].entidades);
		 		totalObjetivos+=parseFloat(cantEntidades[i].objetivos);
		 		totalProductos+=parseFloat(cantEntidades[i].productos);
		 	}
		}

		for (var i=1; i<=12; i++){
			$("[objeto=estrategia][cod="+i+"]").addClass("collapsed-box");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-entidades").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-resultados").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-productos").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-destinatarios").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-presupuesto").html("0");
		}
		if(cantEntidades != null){
			for (var i=0; i<cantEntidades.length; i++){
				$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").removeClass("collapsed-box");
				fraccionPresupuesto=numeroConComa(parseFloat((cantEntidades[i].presupuesto)/totalPresupuesto)*100);
				$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-entidades").html(cantEntidades[i].entidades);
				if(nivel != undefined && entidad == undefined){
					$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-entidades").html(cantEntidades[i].entidades);
				}else{
					if(nivel != undefined && entidad != undefined && unidadResponsable == undefined){
						$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-entidades").html(cantEntidades[i].entidades);
					}else{
						if(nivel != undefined && entidad != undefined && unidadResponsable !='-1'){
							$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-entidades").html(cantEntidades[i].entidades);
						}
					}
				}
			   	$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-resultados").html(cantEntidades[i].objetivos);
				$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-productos").html(cantEntidades[i].productos);
				if (totalDestinatarios != 0){
					$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-destinatarios").html(numeroConComa((parseFloat(cantEntidades[i].destinatarios)/totalDestinatarios)*100)+"%");
				}else{
					$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-destinatarios").html(numeroConComa(parseFloat(cantEntidades[i].destinatarios))+"%");
				}
				$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-presupuesto").html(fraccionPresupuesto+"%: "+numeroConComa(parseInt(cantEntidades[i].presupuesto/1000000))+" MM");
			}
		}
	}

	var deptoDest, mapDest, catalogo_destinatario=0, promedioDestinatario=[], eje, linea, estrategia, rango_dest, rango_meta, q;
	var mapMeta, layerMapa;
	var deptoMeta, deptoAsig;

	//$("#indicadorDeCarga").attr("aria-hidden","false");
	var mapa_destinatario
	var pndMetasDeptojson
	var pndAsignacionjson
	var pndMetasDepto
	var pndAsignacion
	var condicion ="";
	var optioncatalogo_dest="";
	var optioncatalogo_tipo_producto="";
	var optioncatalogo_tipo_producto_meta="";
	var catalogo_dest
	var catalogo_producto=[];	
	var catalogo_destinatario=[];
	
	function obtenerTotalesMapa(nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto, eje, linea, estrategia){
		//llamadas que alimentan a los mapas
		condicion="";
		
		if (entidad != null )condicion += '&entidad='+entidad;
		if (nivel != null )condicion += '&nivel='+nivel;
		if (unidadResponsable != null && unidadResponsable != -1 && unidadResponsable !=0)condicion += '&unidadResponsable='+unidadResponsable;
		if (tipoPrograma != null) condicion += '&tipoPrograma='+tipoPrograma;
		if (programa != null) condicion += '&programa='+programa;
		if (subprograma != null)condicion += '&subprograma='+subprograma;
		if (proyecto != null && proyecto != -1) condicion += '&proyecto='+proyecto;
		if (producto != null) condicion += '&producto='+producto;
		
		if (eje != 0) condicion += '&eje='+eje;
		if (linea != 0) condicion += '&linea='+linea;
		if (estrategia != 0) condicion += '&estrategia='+estrategia;
				
		mapa_destinatario = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getMapaDestinatarioPND'+condicion,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		mapa_destinatario = JSON.parse(mapa_destinatario);
			
		pndMetasDeptojson = $.ajax({
			url:'ajaxSelects?accion=getTotalPndMetas&anho=2017&version='+version+condicion,
			type:'get',
			dataType:'json',
			crossDomain:true,
			async:false       
		}).responseText;
		pndMetasDepto=JSON.parse(pndMetasDeptojson);
		
		pndAsignacionjson = $.ajax({
			url:'ajaxSelects?accion=getTotalAsignacionFinanciera&anho='+anho+'&version='+version+condicion,
			type:'get',
			dataType:'json',
			crossDomain:true,
			async:false       
		}).responseText;
		pndAsignacion=JSON.parse(pndAsignacionjson);

		catalogo_dest = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getCatalogoDestinatarioPND'+condicion,
			type:'get',
			dataType:'json',
			async:false       
		}).responseText;
		catalogo_dest = JSON.parse(catalogo_dest);
		catalogo_dest=catalogo_dest.catalogo_destinatario;
		optioncatalogo_dest="";
	}

	var datosMeses = $.ajax({
		url:'http://spr.stp.gov.py/ajaxSelects?accion=getMeses',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	datosMeses = JSON.parse(datosMeses);
	datosMeses = datosMeses.meses;
	
	
	function compareEstrategia(a,b) {  
	    if (a.estrategia_id < b.estrategia_id) return -1;
	    if (a.estrategia_id > b.estrategia_id) return 1;
	    return 0;
	}

	var cantEntidades = $.ajax({
		url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidadesPorEstrategia&anho='+anho+'&version='+version,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	cantEntidades = JSON.parse(cantEntidades);
	
	var totalesPresupuesto = $.ajax({
		url:'http://spr.stp.gov.py/ajaxSelects?accion=getTotalesPnd&anho='+anho+'&version='+version,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	totalesPresupuesto = JSON.parse(totalesPresupuesto);
	
	totalEntidadesGeneral = totalesPresupuesto[0].entidades;
	totalTiposProductosGeneral = totalesPresupuesto[0].productos;
	
	var totalesPorEje = $.ajax({
		url:'http://spr.stp.gov.py/ajaxSelects?accion=getTotalesPorEje&anho='+anho+'&version='+version,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	totalesPorEje = JSON.parse(totalesPorEje);
	
	cantEntidades=cantEntidades.sort(compareEstrategia);
	
	var TotalMetaFinanciera = 0;
	var TotalMetaFisica = 0;
	var cantAsigXDepto = new Array(18);
	var cantMetaXDepto = new Array(18);
	var costoUnitarioSupuesto = new Array(18);
	porcentajeAsignacion = new Array(18);
	var totalAsigPais = 0;
	var totalMetaPais = 0;
	var acumTotalAsig = 0;
	var acumTotalMeta = 0;

	function AsignacionPND(tipo_producto){
		totalPlanificado= 0;
		prod=0;
		SumPlanificado=new Array();
		SumPPM=new Array();
		SumPPMDEPTO=new Array();
		totalMetasDpto=0;
		totalMetas=0;
		totalFinanciamientoAux=[];
		totalFinanDepto = 0;
		totalFinanciamiento = [];
		var porcentajeDistri=0; porcentajeDistriMetas=[];
		
		porcentajeDistriDestinatarioAux = new Array(18);
		porcentajeDistriMetaAux = new Array(18);
		
		if (pndMetasDepto !== null && pndAsignacion !== null){
			prod=pndAsignacion[0].producto_nombre;
			for (x=0;x<pndAsignacion.length;x++){
				if(pndAsignacion[x].producto_nombre == prod){
					totalPlanificado+=pndAsignacion[x].total_asignacion;
				}else{
					SumPlanificado.push(totalPlanificado+'-'+pndAsignacion[x-1].producto_nombre);
					prod=pndAsignacion[x].producto_nombre;
					x-=1;
					totalPlanificado=0
				}
				if(x==(pndAsignacion.length-1)){
					if(x==0){
						SumPlanificado.push(totalPlanificado+'-'+pndAsignacion[x].producto_nombre);
					}else{
						SumPlanificado.push(totalPlanificado+'-'+pndAsignacion[x-1].producto_nombre);
					}
				}
			}
	
			for (x=0;x<SumPlanificado.length;x++){
				prod=SumPlanificado[x].split("-");
				for (y=0;y<pndMetasDepto.length;y++){										
					if(prod[1]== pndMetasDepto[y].producto_nombre){
						totalMetas+=pndMetasDepto[y].total_metas;
					}
				}
				SumPPM.push(totalMetas+"-"+prod[1]);
				totalMetas=0;
			}
			
			var uniqueProducto=[];
			if(tipo_producto==0){				
				for (var i=0; i<pndMetasDepto.length;i++){
					if(uniqueProducto.indexOf(pndMetasDepto[i].producto_nombre)<0){
						uniqueProducto.push(pndMetasDepto[i].producto_nombre);
					}
				}
			}else{
				uniqueProducto.push(tipo_producto);
			}
						
			for(w=0;w<=17;w++){				
				for (var i=0; i<uniqueProducto.length;i++){
					for (y=0;y<pndMetasDepto.length;y++){
						if(pndMetasDepto[y].producto_nombre==uniqueProducto[i] && pndMetasDepto[y].departamento_id==w){
							totalMetasDpto+=pndMetasDepto[y].total_metas;
						}
					}
					if(totalMetasDpto>0){
						SumPPMDEPTO.push(w+"-"+totalMetasDpto+"-"+uniqueProducto[i]);
					}					
					totalMetasDpto=0;
				}
			}									
			
			for(w=0;w<=17;w++){
				for (var i=0; i<SumPPMDEPTO.length;i++){
					prodMetaDepto=SumPPMDEPTO[i].split("-");
					if(prodMetaDepto[0]==w){
						for (y=0;y<SumPPM.length;y++){
							prodMetaTotal=SumPPM[y].split("-");
							totalFinanProd=SumPlanificado[y].split("-");
							if(prodMetaDepto[2]==prodMetaTotal[1]){
								porcDistDeptoProd=prodMetaDepto[1]/prodMetaTotal[0];								
								if(prodMetaDepto[2]==totalFinanProd[1]){
									totalFinanDepto+=Math.round(porcDistDeptoProd*totalFinanProd[0]);
								}	
							}							
						}						
					}
				}
				totalFinanciamiento.push(totalFinanDepto);
				totalFinanciamientoAux[w] = new Array(1);
				totalFinanciamientoAux[w][0]=w;
				totalFinanciamientoAux[w][1]=totalFinanDepto;
				totalFinanDepto=0;
			}

			//totalFinanciamiento=totalFinanciamiento.sort(function(a, b){return b-a});
			totalFinanciamientoAux=totalFinanciamientoAux.sort(function (a, b) {
			    if (a[1] === b[1]) {
			        return 0;
			    }
			    else {
			        return (a[1] < b[1]) ? -1 : 1;
			    }
			});			
		}
	}
	
	function getPorcentajesTotales(catalogo_destinatario, tipo_producto, mes){
		AsignacionPND(tipo_producto);
		
		var porcentaje=0; porcentajeDestinatario=[], porcentajeMetas=[];
		
		porcentajeDestinatarioAux = new Array(18);
		porcentajeMetaAux = new Array(18);
		porcentajePresu = new Array(18);
		
		for(depto=0;depto<=17;depto++){
			if(mapa_destinatario!==null){
				porcentaje=getPorcentajeDestinatarioPorDepto(depto, catalogo_destinatario, tipo_producto);
				porcentajeDestinatario.push(porcentaje);
				porcentajeDestinatarioAux[depto] = new Array(1);
				porcentajeDestinatarioAux[depto][0]=depto;
				porcentajeDestinatarioAux[depto][1]=porcentaje;								
			}			
			if(pndMetasDepto!==null){
				porcentaje=0;
				porcentaje=getPorcentajeMetasPorDepto(depto, mes, tipo_producto);
				porcentajeMetas.push(porcentaje);
				porcentajeMetaAux[depto] = new Array(1);
				porcentajeMetaAux[depto][0]=depto;
				porcentajeMetaAux[depto][1]=porcentaje;
			}
			if(porcentajeAsignacion!==null){
				porcentajePresu[depto] = new Array(1);
				porcentajePresu[depto][0]=depto;
				porcentajePresu[depto][1]=porcentajeAsignacion[depto];
			}
		}
		porcentajeDestinatarioAux=porcentajeDestinatarioAux.sort(function (a, b) {
		    if (a[1] === b[1]) {
		        return 0;
		    }
		    else {
		        return (a[1] < b[1]) ? -1 : 1;
		    }
		});

		porcentajeMetaAux=porcentajeMetaAux.sort(function (a, b) {
		    if (a[1] === b[1]) {
		        return 0;
		    }
		    else {
		        return (a[1] < b[1]) ? -1 : 1;
		    }
		});

		porcentajePresu=porcentajePresu.sort(function (a, b) {
		    if (a[1] === b[1]) {
		        return 0;
		    }
		    else {
		        return (a[1] < b[1]) ? -1 : 1;
		    }
		});
		//rango_dest=d3.scale.quantile().domain(porcentajeDestinatario).range([0,25,50,75,100]);
		//rango_meta=d3.scale.quantile().domain(porcentajeMetas).range([0,10,20,30,40,50,60,70,80,90,100]);
	}
	
	function getPorcentajeDestinatarioPorDepto(depto, catalogo_destinatario, tipo_producto){
		var acum=0, porcentaje=0, total=0;
		
		if (mapa_destinatario != null && (mapa_destinatario != 0)){
			for(i=0;i<mapa_destinatario.length;i++){				
				if(catalogo_destinatario==0 && tipo_producto==0){
					if(mapa_destinatario[i].departamento==depto){
						acum=acum+mapa_destinatario[i].cant_destinatarios;
					}
					total=total+mapa_destinatario[i].cant_destinatarios;
				}else{
					if(catalogo_destinatario!=0 && tipo_producto==0){
						if(mapa_destinatario[i].departamento==depto && mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
							acum=acum+mapa_destinatario[i].cant_destinatarios;
						}
						if(mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
							total=total+mapa_destinatario[i].cant_destinatarios;
						}						
					}else{
						if(catalogo_destinatario==0 && tipo_producto!=0){
							if(mapa_destinatario[i].departamento==depto && mapa_destinatario[i].tipo_producto==tipo_producto){
								acum=acum+mapa_destinatario[i].cant_destinatarios;
							}
							if(mapa_destinatario[i].tipo_producto==tipo_producto){
								total=total+mapa_destinatario[i].cant_destinatarios;
							}							
						}else{
							if(catalogo_destinatario!=0 && tipo_producto!=0){
								if(mapa_destinatario[i].departamento==depto && mapa_destinatario[i].tipo_producto==tipo_producto && mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
									acum=acum+mapa_destinatario[i].cant_destinatarios;
								}
								if(mapa_destinatario[i].tipo_producto==tipo_producto && mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
									total=total+mapa_destinatario[i].cant_destinatarios;
								}
							}
						}
					}
				}				
			}
			if(acum!=0){
				porcentaje=(acum*100)/total;	
				return Math.round(porcentaje);	
			}else{					
				return 0;
			}						
		}else{				
			return 0;
		}
	}
	
	function getPorcentajeMetasPorDepto(depto, mes, tipo_producto){
		var acum=0, porcentaje=0, total=0;
		
		if (pndMetasDepto != null && (pndMetasDepto != 0)){
			for(i=0;i<pndMetasDepto.length;i++){				
				if(mes==0 && tipo_producto==0){
					if(pndMetasDepto[i].departamento_id==depto){
						acum=acum+pndMetasDepto[i].total_metas;
					}
					total=total+pndMetasDepto[i].total_metas;
				}else{
					if(mes!=0 && tipo_producto==0){
						if(pndMetasDepto[i].departamento_id==depto && pndMetasDepto[i].mes==mes){
							acum=acum+pndMetasDepto[i].total_metas;
						}
						if(pndMetasDepto[i].mes==mes){
							total=total+pndMetasDepto[i].total_metas;
						}						
					}else{
						if(mes==0 && tipo_producto!=0){
							if(pndMetasDepto[i].departamento_id==depto && pndMetasDepto[i].producto_nombre==tipo_producto){
								acum=acum+pndMetasDepto[i].total_metas;
							}
							if(pndMetasDepto[i].producto_nombre==tipo_producto){
								total=total+pndMetasDepto[i].total_metas;
							}							
						}else{
							if(mes!=0 && tipo_producto!=0){
								if(pndMetasDepto[i].departamento_id==depto && pndMetasDepto[i].producto_nombre==tipo_producto && pndMetasDepto[i].mes==mes){
									acum=acum+pndMetasDepto[i].total_metas;
								}
								if(pndMetasDepto[i].producto_nombre==tipo_producto && pndMetasDepto[i].mes==mes){
									total=total+pndMetasDepto[i].total_metas;
								}
							}
						}
					}
				}				
			}			
			if(acum!=0){
				porcentaje=(acum*100)/total;	
				return Math.round(porcentaje);	
			}else{					
				return 0;
			}		
		}else{
			return 0;
		}
	}
	
	$("#indicadorDeCarga").attr("aria-hidden","true", nivel, entidad);
	
	function mapaPrevio (eje, linea, estrategia, mesPND, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable){
			
		//getPorcentajesTotales(eje, linea, estrategia, 0, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
		getPorcentajesTotales(0,0,0);
		//MetasPND(eje, linea, estrategia, mesPND, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
		//MetasPND(0,0);

		function getColor(d) {
		    return d > 90	? '#33000f' :
		           d > 80	? '#800026' :
		           d > 70	? '#BD0026' :
		           d > 60   ? '#E31A1C' :
		           d > 50	? '#FC4E2A' :
		           d > 40	? '#FD8D3C' :
		           d > 30	? '#FEB24C' :
		           d > 20	? '#FED976' :
		           d > 10	? '#FFEDA0' :
		           '#FFFAE6' ;
		}

		function getColor2(depto, mapa){
			if(mapa=="destinatario"){
				for(i=0;i<porcentajeDestinatarioAux.length;i++){
					if(porcentajeDestinatarioAux[i][0]==depto){
						if(porcentajeDestinatarioAux[i][1]!=0){
							return i > 17   ? '#33000f' :
						           i > 14	? '#BD0026' :
						           i > 11	? '#FC4E2A' :
						           i > 8	? '#FEB24C' :
						           i > 5	? '#FED976' :
						           i > 2	? '#FFEDA0' :
						           '#FFFAE6' ;
						}else{
							return '#FFFAE6';
						}

					}
				}
			}else{
				if(mapa=="meta"){
					for(i=0;i<porcentajeMetaAux.length;i++){
						if(porcentajeMetaAux[i][0]==depto){
							if(porcentajeMetaAux[i][1]!=0){
								return i > 17   ? '#33000f' :
							           i > 14	? '#BD0026' :
							           i > 11	? '#FC4E2A' :
							           i > 8	? '#FEB24C' :
							           i > 5	? '#FED976' :
							           i > 2	? '#FFEDA0' :
							           '#FFFAE6' ;
							}else{
								return '#FFFAE6';
							}						    
						}
					}
				}else{
					if(mapa=="asignacion"){
						for(i=0;i<totalFinanciamientoAux.length;i++){
							if(totalFinanciamientoAux[i][0]==depto){
								if(totalFinanciamientoAux[i][1]!=0){
									return i > 17   ? '#33000f' :
								           i > 14	? '#BD0026' :
								           i > 11	? '#FC4E2A' :
								           i > 8	? '#FEB24C' :
								           i > 5	? '#FED976' :
								           i > 2	? '#FFEDA0' :
								           '#FFFAE6' ;
								}else{
									return '#FFFAE6';
								}						    
							}
						}
					}
				}
			}			
		}
		
		function getPorcentajes(depto, mapa){
			if(mapa=="destinatario"){
				return parseInt(porcentajeDestinatario[depto]);
			}else{
				if(mapa=="meta"){
					return parseInt(porcentajeMetas[depto]);	
				}
			}			
		}
		
		function verifDptoExistsMetas(dpto){
			if(porcentajeMetas[dpto]!= undefined){
				return porcentajeMetas[dpto];
			} else {
				return 0;
			}			
		}
		
		function verifDptoExistsAsig(dpto){
			if(porcentajeAsignacion[dpto]!= undefined){
				return porcentajeAsignacion[dpto];
			} else {
				return 0;
			}			
		}
		
		function style(feature) {		
			if(layerMapa=="mapaDestinatarios"){
					return {	 
						fillColor: getColor2(feature.properties.dpto, "destinatario"),
						//fillColor: getColor(rango_dest(getPorcentajes(feature.properties.dpto, "destinatario"))),
						//fillColor: getColor(rango_dest(parseInt(porcentajeDestinatario[feature.properties.dpto]))),
				        weight: 2,
				        color: 'white',
				        dashArray: '2',
				        fillOpacity: 0.6
				    };
				}else{
					if(layerMapa=="mapaMetas"){
						return {
							//fillColor: getColor(rango_meta(getPorcentajes(feature.properties.dpto, "meta"))),
							fillColor: getColor2(feature.properties.dpto, "meta"),
							//fillColor: getColor(q(verifDptoExistsMetas(parseInt(feature.properties.dpto)))),
					        weight: 2,
					        color: 'white',
					        dashArray: '2',
					        fillOpacity: 0.6
					    };
					}else{
						if(layerMapa=="mapaAsignacion"){
							return {
								//fillColor: getColor(asig(verifDptoExistsAsig(parseInt(feature.properties.dpto)))), //cambiar la variable q por otro
								fillColor: getColor2(feature.properties.dpto, "asignacion"),
						        weight: 2,
						        color: 'white',
						        dashArray: '2',
						        fillOpacity: 0.6
						    };
						}
					}		
				}									    
		}
		
		function highlightFeatureMouseHover(e) {
			var layer = e.target;
			
			if (typeof distLayer == "undefined") {//Highlight mouseHover por departamentos			
			    layer.setStyle({
			        weight: 5,
			        color: '#333',
			        dashArray: '2',
			        fillOpacity: 1
			    });
			    if (!L.Browser.ie && !L.Browser.opera) {
			        layer.bringToFront();
			    }
			    if(e.target._map._container.id=="mapaDestinatarios"){
			    	infoDest.update(layer.feature.properties);
			    			    	
			    }else{
			    	if(e.target._map._container.id=="mapaMetas"){
			    		infoMeta.update(layer.feature.properties);
			    		
			    	}else{
			    		if(e.target._map._container.id=="mapaAsignacion"){
				    		infoAsig.update(layer.feature.properties);
				    	}
			    	}
			    }		    
			}		
		}
		
		function resetHighlightMouseHover(e) {
			if(e.target._map._container.id=="mapaDestinatarios"){
				if (typeof distLayer == "undefined"){//reset por departamento
					layerMapa="mapaDestinatarios";
					deptoDest.eachLayer(function(l){deptoDest.resetStyle(l);});
					infoDest.update();
			    }
			}else{
		    	if(e.target._map._container.id=="mapaMetas"){
		    		if (typeof distLayer == "undefined"){//reset por departamento
		    			layerMapa="mapaMetas";
		    			deptoMeta.eachLayer(function(l){deptoMeta.resetStyle(l);});
		    			infoMeta.update();
		    		}
		    	}else{
		    		if(e.target._map._container.id=="mapaAsignacion"){
			    		if (typeof distLayer == "undefined"){//reset por departamento
			    			layerMapa="mapaAsignacion";
			    			deptoAsig.eachLayer(function(l){deptoAsig.resetStyle(l);});
			    			infoAsig.update();
			    		}
			    	}
			    }    	    
			}
		}	
		
		function onEachFeature(feature, layer) {
			layer.on({				
				mouseover: highlightFeatureMouseHover,
		        mouseout: resetHighlightMouseHover,	        
			});
		}
		
		if(mapa_destinatario!==null){
			//Se crean los tres mapas		
			mapDest = L.map('mapaDestinatarios',{
				maxZoom: 10,
				minZoom: 5,
				center: true
			}).setView([-23.2, -60], 5);
			layerMapa="mapaDestinatarios";
			deptoDest = new L.geoJson(deptoGeojson,{style:style, onEachFeature: onEachFeature});
			deptoDest.addTo(mapDest);
		}else{
			$("#mapaDestinatarios").html("<p style='color:red;'>NO EXISTEN DATOS PARA MOSTRAR</p>");
			$("#optionDestinatario").parent().remove();
			$("#optionTipoProducto").parent().remove();
		}

		if(pndMetasDepto!==null){
			mapMeta = L.map('mapaMetas',{
				maxZoom: 10,
				minZoom: 5,
				center: true
			}).setView([-23.2, -60], 5);
			
			layerMapa="mapaMetas";
			deptoMeta = new L.geoJson(deptoGeojson,{style:style, onEachFeature: onEachFeature});	
			deptoMeta.addTo(mapMeta);
		}else{
			$("#mapaMetas").html("<p style='color:red;'>NO EXISTEN DATOS PARA MOSTRAR</p>");
			$("#optionMes").parent().remove();
			$("#optionTipoProductoMeta").parent().remove();
		}		
				
		if(pndMetasDepto!==null && pndAsignacion!==null){
			mapAsig = L.map('mapaAsignacion',{
				maxZoom: 10,
				minZoom: 5,
				center: true
			}).setView([-23.2, -60], 5);
			layerMapa="mapaAsignacion";
			deptoAsig = new L.geoJson(deptoGeojson,{style:style,onEachFeature: onEachFeature});
			deptoAsig.addTo(mapAsig);
		}else{
			$("#mapaAsignacion").html("<p style='color:red;'>NO EXISTEN DATOS PARA MOSTRAR</p>");
			$("#optionTipoProductoAsig").parent().remove();			
		}
		
		if(pndMetasDepto!==null && pndAsignacion!==null){
			mapAsig.invalidateSize();
		}
		if(mapa_destinatario!==null){
			mapDest.invalidateSize();
		}		
		
		if(pndMetasDepto!==null){
			mapMeta.invalidateSize();
		}		
				
		if(porcentajeDestinatario.length > 0){
			//Despliega un Div con Información sobre el Departamento.
			var infoDest = L.control();
			infoDest.onAdd = function (map) {
			    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
			    this.update();
			    return this._div;
			};
			
			//metodo que usamos para actualizar el control basado en el feature
			infoDest.update = function (props) {	
				//si existe el objeto props y l es encontrada se despliega su nombre en el div, de lo contrario el texto.
			    this._div.innerHTML = '<h5>Departamento: </h5>' + (props ?
			       	 '<b>' + props.dpto_desc + '</b><br />' +
			       	numeroConComa(porcentajeDestinatario[props.dpto]) + '%' : 'Apunte sobre el mapa.');
			};
			infoDest.addTo(mapDest);
		}

		if(porcentajeMetas.length > 0){
			var infoMeta = L.control();
			infoMeta.onAdd = function (map) {
			    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
			    this.update();
			    return this._div;
			};
			//metodo que usamos para actualizar el control basado en el feature
			infoMeta.update = function (props) {	
				//si existe el objeto props y l es encontrada se despliega su nombre en el div, de lo contrario el texto.
			    this._div.innerHTML = '<h5>Departamento: </h5>' + (props ?
			       	 '<b>' + props.dpto_desc + '</b><br />' +
			       	 numeroConComa(porcentajeMetas[props.dpto]) + '%' : 'Apunte sobre el mapa.');
			};
			infoMeta.addTo(mapMeta);
		}

		if(porcentajeMetas.length > 0){
			var infoAsig = L.control();
			infoAsig.onAdd = function (map) {
			    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
			    this.update();
			    return this._div;
			};
			//metodo que usamos para actualizar el control basado en el feature
			infoAsig.update = function (props) {
				//si existe el objeto props y l es encontrada se despliega su nombre en el div, de lo contrario el texto.
			    this._div.innerHTML = '<h5>Departamento: </h5>' + (props ?
			       	 '<b>' + props.dpto_desc + '</b><br /> Costo Unitario Supuesto:<br/> ' +
			       	numeroConComa(totalFinanciamiento[props.dpto]) + ' Gs.' : 'Apunte sobre el mapa.');
			};		
			infoAsig.addTo(mapAsig);
		}
				
		//leyenda del mapa  
		var legend = L.control({position: 'bottomleft'});
		
		//creación de la leyenda
		legend.onAdd = function (map) {
	
		    this._div = L.DomUtil.create('div', 'info legend');// crea un div con la class "info legend"
		    
		    var div = L.DomUtil.create('div', 'info legend'),
	        grades = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
	        labels = [];
		    
		    this._div.innerHTML = 	'<h5>Rango: </h5>'+
		    '<p><i style="background:#FFFAE6"></i>MIN</p>'+
		    '<p><i style="background:#FFEDA0"></i></p><br>'+
		    '<p><i style="background:#FED976"></i></p><br>'+
		    '<p><i style="background:#FEB24C"></i></p><br>'+
		    '<p><i style="background:#FC4E2A"></i></p><br>'+
		    '<p><i style="background:#BD0026"></i>MAX</p>';
		    //bucle de creacion de porcentaje y generacion de una etiqueta con un cuadrado de color para cada intervalo
//		    	for (var i = 0; i < grades.length-1; i++) {
//					if(i==0){
//						this._div.innerHTML +=
//				        	'<p><i style="background:' + getColor(grades[i] + 1) + '"></i>MIN</p>';
//					}else{
//						if(i!=9){
//							this._div.innerHTML +=
//					            '<p><i style="background:' + getColor(grades[i]+1) + '"></i></p><br>';
//						}else{					
//							this._div.innerHTML +=
//					        	'<p><i style="background:' + getColor(grades[i]+1) + '"></i>MAX</p>';
//							}				
//					}	
//				}
				//this.update()
			return this._div;
		};
		
		//actualizador de leyenda
		legend.update = function (){
			var grades = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100], labels = [];
			
			this._div.innerHTML = '<h5>Rango: </h5>';
		
		    //bucle de creacion de porcentaje y generacion de una etiqueta con un cuadrado de color para cada intervalo
		    for (var i = 0; i < grades.length; i++) {
		        this._div.innerHTML +=
		            '<p><i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
		            grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '%' + '</p>' : '%' + '+' + '</p>');
		    }
		}
				
		if(pndMetasDepto!==null && pndAsignacion!==null){			
			legend.addTo(mapAsig);
		}
		if(mapa_destinatario!==null){
			legend.addTo(mapDest);
		}		
		
		if(pndMetasDepto!==null){
			legend.addTo(mapMeta);
		}
		
	}
	
	function renderGraficosEstrategia(objeto, tipoGrafico){
			
			$(function () {
				var datos=[];
				for(i=0;i<cantEntidades.length;i++){
					if(objeto=="Entidades"){
						datos.push(cantEntidades[i].entidades);
					}
					if(objeto=="Resultados"){
						datos.push(cantEntidades[i].objetivos);
					}
					if(objeto=="Productos"){
						datos.push(cantEntidades[i].productos);
					}
					if(objeto=="Destinatarios"){
						datos.push(cantEntidades[i].destinatarios);
					}
					if(objeto=="Presupuesto"){
						datos.push(cantEntidades[i].presupuesto);
					}
				}
				var tabla="#tabla"+objeto;
				//var domElement="#"+tipoGrafico+objeto;
				var domElement="#pieChart"+objeto;
				$(""+domElement).html("");
				$(""+domElement).siblings("iframe").remove();
				//estrategias por entidades
				for (var estrategia=1; estrategia<=12; estrategia++){
					$(""+tabla).find(".est"+estrategia).html(numeroConComa(datos[estrategia-1]));
				}
			 // var pieChartCanvas = $("#pieChartEntidades").get(0).getContext("2d");
				var ctx = $(""+domElement);
				var ctx2 = $("#barChart"+objeto);
				var ctx3 = $("#radarChart"+objeto);
	//			var etiquetas=[
	//							"DESARROLLO SOCIAL EQUITATIVO",						"SERVICIOS SOCIALES DE CALIDAD",							"DESARROLLO LOCAL PARTICIPATIVO",				"HÁBITAT ADECUADO Y SOSTENIBLE",
	//							"EMPLEO Y SEGURIDAD SOCIAL",						"COMPETITIVIDAD E INNOVACIÓN",								"REGIONALIZACIÓN Y DIVERSIFICACIÓN PRODUCTIVA", "VALORIZACIÓN DEL CAPITAL AMBIENTAL",
	//							"IGUALDAD DE OPORTUNIDADES EN UN MUNDO GLOBALIZADO","ATRACCIÓN DE INVERSIONES, COMERCIO EXTERIOR E IMAGEN PAÍS","INTEGRACIÓN ECONÓMICA REGIONAL",				"SOSTENIBILIDAD DEL HÁBITAT GLOBAL"
	//					    ];
				var etiquetas=["1","2","3","4","5","6","7","8","9","10","11","12"];

				var data = {
					    labels: etiquetas,
					    datasets: [
					        {
					            data: datos,
					            backgroundColor: [
		   							"#0B3B0B","#31B404","#2EFE64","#9FF781",
									"#FF8000","#FACC2E","#FAAC58","#FFBF00",
									"#2E2EFE","#5882FA","#8181F7","#5858FA"
					            ],
					            hoverBackgroundColor: [
		   							"#0B3B0B","#31B404","#2EFE64","#9FF781",
									"#FF8000","#FACC2E","#FAAC58","#FFBF00",
									"#2E2EFE","#5882FA","#8181F7","#5858FA"
					            ]
					        }]
				};
				/*var myDoughnutChart = new Chart(ctx, {
				    type: 'doughnut',
				    data: data,
				    options: {
				        hover: {mode: 'label'},
						legend: {display: false}
				    }
				});

				var myBarChart = new Chart(ctx2, {
				    type: 'horizontalBar',
				    data: data,
				    options: {
				        hover: {mode: 'label'},
						legend: {display: false}
				    }
				});
				var myRadarChart = new Chart(ctx3, {
				    type: 'radar',
				    data: data,
				    options: {
				        hover: {mode: 'label'},
						legend: {display: false}
				    }
				});*/
				
				$("#barChart"+objeto).hide();
				$("#radarChart"+objeto).hide();
			});
	
		}
	
	
	
		var totalMetasDepto=[];	
	
		$("body").attr("class", "skin-blue sidebar-mini sidebar-collapse");
		
		
		$(" [objeto=estrategia]").each(function(index) {
			if ($( this ).attr("cod")=="0"){
				$( this ).find(".bj-entidades").html(numeroConComa(parseFloat(totalesPresupuesto[0].entidades)));
				$( this ).find(".bj-resultados").html(numeroConComa(parseFloat(totalesPresupuesto[0].objetivos)));
				$( this ).find(".bj-productos").html(numeroConComa(parseFloat(totalesPresupuesto[0].productos)));
				$( this ).find(".bj-destinatarios").html(numeroConComa(parseInt(totalesPresupuesto[0].destinatarios)));
				$( this ).find(".bj-presupuesto").html(numeroConComa(parseInt(totalesPresupuesto[0].presupuesto/1000000))+" MM");
				$( this ).find(".destinatarios-ratio").attr("style","width:100%");
				$( this ).find(".productos-ratio").attr("style","width:100%");
				$( this ).find(".resultados-ratio").attr("style","width:100%");
				$( this ).find(".entidades-ratio").attr("style","width:100%");
				$( this ).find(".presupuesto-ratio").attr("style","width:100%");
				//$( this ).find(".bj-presupuesto").html(numeroConComa(parseFloat(totalesPresupuesto[0].presupuesto)));
			}
			var totalDestinatarios=parseFloat(0);
			var totalPresupuesto=parseFloat(0);
			var totalEntidades=parseFloat(0);
			var totalObjetivos=parseFloat(0);
			var totalProductos=parseFloat(0);
		 	for (var i=0; i<cantEntidades.length; i++){
		 		totalDestinatarios+=cantEntidades[i].destinatarios;
		 		if (cantEntidades[i].presupuesto != null) totalPresupuesto+=parseFloat(cantEntidades[i].presupuesto);
		 		totalEntidades+=parseFloat(cantEntidades[i].entidades);
		 		totalObjetivos+=parseFloat(cantEntidades[i].objetivos);
		 		totalProductos+=parseFloat(cantEntidades[i].productos);
		 	}

		 	for (var i=0; i<cantEntidades.length; i++){
			   if ($( this ).attr("cod")==cantEntidades[i].estrategia_id){
				   fraccionPresupuesto=numeroConComa(parseFloat((cantEntidades[i].presupuesto)/totalPresupuesto)*100);
				   $( this ).find(".bj-entidades").html(cantEntidades[i].entidades);
				   $( this ).find(".bj-resultados").html(cantEntidades[i].objetivos);
				   $( this ).find(".bj-productos").html(cantEntidades[i].productos);
				   if(totalDestinatarios != 0){
				   		$( this ).find(".bj-destinatarios").html(numeroConComa((parseFloat(cantEntidades[i].destinatarios)/totalDestinatarios)*100)+"%");
				   }else{
				   		$( this ).find(".bj-destinatarios").html(numeroConComa(parseFloat(cantEntidades[i].destinatarios))+"%");
				   }
				   $( this ).find(".bj-presupuesto").html(fraccionPresupuesto+"%: "+numeroConComa(parseInt(cantEntidades[i].presupuesto/1000000))+" MM");
				   if(totalDestinatarios != 0){
				   		$( this ).find(".destinatarios-ratio").attr("style","width:"+numeroConComa((parseFloat(cantEntidades[i].destinatarios)/totalDestinatarios)*100)+"%");
				   }else{
				   		$( this ).find(".destinatarios-ratio").attr("style","width:"+numeroConComa(parseFloat(cantEntidades[i].destinatarios))+"%");
				   }
				   	 $( this ).find(".productos-ratio").attr("style","width:"+numeroConComa((parseFloat(cantEntidades[i].productos)/totalProductos)*100)+"%");
					 $( this ).find(".resultados-ratio").attr("style","width:"+numeroConComa((parseFloat(cantEntidades[i].objetivos)/totalDestinatarios)*100)+"%");
					 $( this ).find(".entidades-ratio").attr("style","width:"+numeroConComa((parseFloat(cantEntidades[i].entidades)/totalDestinatarios)*100)+"%");
					 $( this ).find(".presupuesto-ratio").attr("style","width:"+numeroConComa((parseFloat(cantEntidades[i].presupuesto)/totalPresupuesto)*100)+"%");
				  // $( this ).find(".bj-presupuesto").html(fraccionPresupuesto+"%");
			   }
			   
		   }
		   
		   ocultarSpinnerMatrizTotales();
			   
		});
		
		$(" [objeto=eje]").each(function(index) {
				var totalDestinatarios=parseFloat(0);
				var totalPresupuesto=parseFloat(0);
				var fraccionPresupuesto=parseFloat(0);
				var totalEntidades=parseFloat(0);
				var totalObjetivos=parseFloat(0);
				var totalProductos=parseFloat(0);
				for (var i=0; i<totalesPorEje.length; i++){
					totalDestinatarios+=parseFloat(totalesPorEje[i].destinatarios);
					if (totalesPorEje[i].presupuesto != null) totalPresupuesto+=parseFloat(totalesPorEje[i].presupuesto);
					//totalEntidades+=parseFloat(totalesPorEje[i].entidades);
			 		totalObjetivos+=parseFloat(totalesPorEje[i].objetivos); 
			 		//totalProductos+=parseFloat(totalesPorEje[i].productos);
				}
				totalEntidades=parseFloat(totalEntidadesGeneral);
				totalProductos=parseFloat(totalTiposProductosGeneral);
			   
				for (var i=0; i<totalesPorEje.length; i++){
				   if ($( this ).attr("cod")==totalesPorEje[i].eje_estrategico_id){
					   $( this ).find(".bj-entidades").html(totalesPorEje[i].entidades+"   <small>"+parseInt(((totalesPorEje[i].entidades/totalEntidades)*100).toFixed(0))+"%</small>");
					   $( this ).find(".bj-resultados").html(totalesPorEje[i].objetivos+"   <small>"+parseInt(((totalesPorEje[i].objetivos/totalObjetivos)*100).toFixed(0))+"%</small>");
					   $( this ).find(".bj-productos").html(totalesPorEje[i].productos+"   <small>"+parseInt(((totalesPorEje[i].productos/totalProductos)*100).toFixed(0))+"%</small>");
					   $( this ).find(".bj-destinatarios").html(numeroConComa(parseInt(totalesPorEje[i].destinatarios))+"   <small>"+parseInt((((totalesPorEje[i].destinatarios)/totalDestinatarios)*100).toFixed(0))+"%</small>");
					  // $( this ).find(".bj-presupuesto").html(numeroConComa(parseFloat(totalesPorEje[i].presupuesto)));
					     $( this ).find(".bj-presupuesto").html(numeroConComa(parseInt(totalesPorEje[i].presupuesto/1000000))+" MM    <small>"+parseInt((((totalesPorEje[i].presupuesto)/totalPresupuesto)*100).toFixed(0))+"%</small>");
					     $( this ).find(".destinatarios-ratio").attr("style","width:"+parseInt((((totalesPorEje[i].destinatarios)/totalDestinatarios)*100).toFixed(0))+"%");
					     $( this ).find(".productos-ratio").attr("style","width:"+parseInt((((totalesPorEje[i].productos)/totalProductos)*100).toFixed(0))+"%");
					     $( this ).find(".resultados-ratio").attr("style","width:"+parseInt((((totalesPorEje[i].objetivos)/totalObjetivos)*100).toFixed(0))+"%");
						 $( this ).find(".entidades-ratio").attr("style","width:"+parseInt((((totalesPorEje[i].entidades)/totalEntidades)*100).toFixed(0))+"%");
						 $( this ).find(".presupuesto-ratio").attr("style","width:"+parseInt((((totalesPorEje[i].presupuesto)/totalPresupuesto)*100).toFixed(0))+"%");
					  // $( this ).find(".bj-presupuesto").html(fraccionPresupuesto+"%");
				   }
				   
			   }
			   
		});
	
	    var nb = 5; 
	    var f = new Array(4); // crea una matriz de longitud 4
	    function vaciarMatriz(){
		    //var nb = 5; 
		    //var f = new Array(4); // crea una matriz de longitud 4
		    for (var i = 0; i < 4; i++) {
		       f[i] = new Array(nb); // define cada elemento como una matriz de longitud 5
		       for (var j = 0; j < nb; j++) {
		          f[i][j] = "99"; // asigna a cada elemento de la matriz bidimensional los valores de i y j
		       }
		    }
	    }

	    for (var i = 0; i < 4; i++) {
		       f[i] = new Array(nb); // define cada elemento como una matriz de longitud 5
		       for (var j = 0; j < nb; j++) {
		          f[i][j] = "99"; // asigna a cada elemento de la matriz bidimensional los valores de i y j
		       }
		    }
	    
	    function cargarSelectoresMapa(mapa, producto, destinatario, mes){
			optionMeses="";	
			optioncatalogo_tipo_producto="";
			optioncatalogo_tipo_producto_meta="";
			optioncatalogo_dest="";			
			catalogo_producto=[];
			catalogo_mes=[];
			catalogo_destinatario=[];
			catalogo_producto_meta=[];
				
				if(producto=='0'){
					producto=parseInt(0);
				}
				
				if(pndMetasDepto!==null && (mapa=="meta" || mapa=="todos")){
					
					mes=parseInt(mes);
					//producto=parseInt(producto);
					
					$("#optionTipoProductoMeta").html("");
					$("#optionMes").html("");
					
					for(i = 0;i<pndMetasDepto.length; i++){	
						if(mes!==0 && producto==0){
							if(pndMetasDepto[i].mes==mes){
								catalogo_producto.push(pndMetasDepto[i].producto_nombre);								
							}
							catalogo_mes.push(pndMetasDepto[i].mes);
						}else{
							if(producto!==0 && mes==0){
								if(pndMetasDepto[i].producto_nombre==producto){									
									catalogo_mes.push(pndMetasDepto[i].mes);
								}
								catalogo_producto.push(pndMetasDepto[i].producto_nombre);
							}else{
								if(producto!==0 && mes!==0){
									if(pndMetasDepto[i].mes==mes){										
										catalogo_producto.push(pndMetasDepto[i].producto_nombre);
									}
									if(pndMetasDepto[i].producto_nombre==producto){										
										catalogo_mes.push(pndMetasDepto[i].mes);
									}
								}else{
									catalogo_producto.push(pndMetasDepto[i].producto_nombre);
									catalogo_mes.push(pndMetasDepto[i].mes);
								}
							}
						}							
					}
					catalogo_producto=catalogo_producto.sort();
					catalogo_mes=catalogo_mes.sort();
					
					var uniqueProducto = [];
					$.each(catalogo_producto, function(i, el){
					    if($.inArray(el, uniqueProducto) === -1) uniqueProducto.push(el);
					});
					
					optioncatalogo_tipo_producto_meta+='<option value="0" >TODOS</option>';				
					for(i = 0;i<uniqueProducto.length; i++){		
						//var tipo_prod=uniqueProducto[i].split("--");
						optioncatalogo_tipo_producto_meta+='<option value="'+uniqueProducto[i]+'" >'+uniqueProducto[i]+'</option>';
					}
					
					var uniqueMes = [];
					$.each(catalogo_mes, function(i, el){
					    if($.inArray(el, uniqueMes) === -1) uniqueMes.push(el);
					});		
					
					uniqueMes=uniqueMes.sort(function(a, b){return a-b});
					for(i = 0;i<uniqueMes.length; i++){
						switch (uniqueMes[i]) {
					    case 1:
					    	uniqueMes[i]=(uniqueMes[i]+"--Enero");
					        break;
					    case 2:
					    	uniqueMes[i]=(uniqueMes[i]+"--Febrero");
					        break;
					    case 3:
					    	uniqueMes[i]=(uniqueMes[i]+"--Marzo");
					        break;
					    case 4:
					    	uniqueMes[i]=(uniqueMes[i]+"--Abril");
					        break;
					    case 5:
					    	uniqueMes[i]=(uniqueMes[i]+"--Mayo");
					        break;
					    case 6:
					    	uniqueMes[i]=(uniqueMes[i]+"--Junio");
					    	break;
						case 7:
					    	uniqueMes[i]=(uniqueMes[i]+"--Julio");
					        break;
					    case 8:
					    	uniqueMes[i]=(uniqueMes[i]+"--Agosto");
					        break;
					    case 9:
					    	uniqueMes[i]=(uniqueMes[i]+"--Septiembre");
					        break;
					    case 10:
					    	uniqueMes[i]=(uniqueMes[i]+"--Octubre");
					        break;
					    case 11:
					    	uniqueMes[i]=(uniqueMes[i]+"--Noviembre");
					        break;
					    case 12:
					    	uniqueMes[i]=(uniqueMes[i]+"--Diciembre");
						}

					}					
					
					optionMeses+='<option value="0" >TODOS</option>';				
					for(i = 0;i<uniqueMes.length; i++){		
						var cata_mes=uniqueMes[i].split("--");
						optionMeses+='<option value="'+cata_mes[0]+'" >'+cata_mes[1]+'</option>';
					}
					
					$("#optionMes").html(optionMeses);
					$("#optionTipoProductoMeta").html(optioncatalogo_tipo_producto_meta);
					$("#optionMes").val(mes);
					$("#optionTipoProductoMeta").val(producto);					
					
				}
				
				if(mapa_destinatario!==null && (mapa=="destinatario" || mapa=="todos")){
					
					destinatario=parseInt(destinatario);
					//producto=parseInt(producto);
					catalogo_producto=[];
					
					$("#optionDestinatario").html("");
					$("#optionTipoProducto").html("");						
					
					// para cargar el selector de tipos de productos en destinatarios
					for(i = 0;i<mapa_destinatario.length; i++){	
						if(destinatario!==0 && producto==0){
							if(mapa_destinatario[i].catalogo_destinatario==destinatario){																
								catalogo_producto.push(mapa_destinatario[i].tipo_producto);
							}
							catalogo_destinatario.push(mapa_destinatario[i].nombre_catalogo+"--"+mapa_destinatario[i].catalogo_destinatario);
						}else{
							if(producto!==0 && destinatario==0){
								if(mapa_destinatario[i].tipo_producto==producto){									
									catalogo_destinatario.push(mapa_destinatario[i].nombre_catalogo+"--"+mapa_destinatario[i].catalogo_destinatario);
								}
								catalogo_producto.push(mapa_destinatario[i].tipo_producto);
							}else{
								if(producto!==0 && destinatario!==0){
									if(mapa_destinatario[i].catalogo_destinatario==destinatario){										
										catalogo_producto.push(mapa_destinatario[i].tipo_producto);
									}
									if(mapa_destinatario[i].tipo_producto==producto){										
										catalogo_destinatario.push(mapa_destinatario[i].nombre_catalogo+"--"+mapa_destinatario[i].catalogo_destinatario);
									}
								}else{
									catalogo_producto.push(mapa_destinatario[i].tipo_producto);
									catalogo_destinatario.push(mapa_destinatario[i].nombre_catalogo+"--"+mapa_destinatario[i].catalogo_destinatario);
								}
							}
						}							
					}
					catalogo_producto=catalogo_producto.sort();
					catalogo_destinatario=catalogo_destinatario.sort();
					
					var uniqueProducto = [];
					$.each(catalogo_producto, function(i, el){
					    if($.inArray(el, uniqueProducto) === -1) uniqueProducto.push(el);
					});
					
					optioncatalogo_tipo_producto+='<option value="0" >TODOS</option>';				
					for(i = 0;i<uniqueProducto.length; i++){
						optioncatalogo_tipo_producto+='<option value="'+uniqueProducto[i]+'" >'+uniqueProducto[i]+'</option>';
					}
					
					var uniqueDestinatario = [];
					$.each(catalogo_destinatario, function(i, el){
					    if($.inArray(el, uniqueDestinatario) === -1) uniqueDestinatario.push(el);
					});					
					
					optioncatalogo_dest+='<option value="0" >TODOS</option>';				
					for(i = 0;i<uniqueDestinatario.length; i++){		
						var cata_dest=uniqueDestinatario[i].split("--");
						optioncatalogo_dest+='<option value="'+cata_dest[1]+'" >'+cata_dest[0]+'</option>';
					}
					
					$("#optionDestinatario").html(optioncatalogo_dest);
					$("#optionTipoProducto").html(optioncatalogo_tipo_producto);
					$("#optionDestinatario").val(destinatario);
					$("#optionTipoProducto").val(producto);
				}
			
		}
	    
	    var pndContenido
		function renderModalEstrategiasPND(eje, linea, estrategia, objeto, mesPND, nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto){
			
			if (f[eje][linea] == "99"){
	
			if ($("#modalC1F1Entidades").length)
			{
				$("#modalC1F1Entidades").remove();
			}		
			var clase="";
			var estrategiaNombre="";
			var ejeNombre="";
			var lineaNombre="";
			var condicion="";

			if (nivel != 0 && nivel != null)condicion += '&nivel='+nivel;
			if (entidad != 0 && entidad != null)condicion += '&entidad='+entidad;
			if (unidadResponsable != null && unidadResponsable != -1 && unidadResponsable != 0)condicion += '&unidadResponsable='+unidadResponsable;
			if (tipoPrograma != null) condicion += '&tipoPrograma='+tipoPrograma;
			if (programa != null) condicion += '&programa='+programa;
			if (subprograma != null)condicion += '&subprograma='+subprograma;
			if (proyecto != null && proyecto != -1) condicion += '&proyecto='+proyecto;
			if (producto != null) condicion += '&producto='+producto;

			if (eje==0){clase="bg-teal";}
			if (eje==1){clase="bg-green"; ejeNombre="Reducción de pobreza y desarrollo social";}
			if (eje==2){clase="bg-orange"; ejeNombre="Crecimiento económico inclusivo";}
			if (eje==3){clase="bg-primary";ejeNombre="Inserción de Paraguay en el mundo";}
			var cuerpoModalC1F1Entidades = "";
			
			var cuerpoTablaObjetivos = "";
			var cabeceraBoxInfo = "";
			var contenedorCabeceraConcat = "";
			
			pndContenido = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getPnd&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			pndContenido = JSON.parse(pndContenido);
			
			var pndFinanciamiento = $.ajax({
				url:'http://spr.stp.gov.py/ajaxSelects?accion=getPndFinanciamiento&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			pndFinanciamiento = JSON.parse(pndFinanciamiento);
			
			var pndDestinatariosContenido = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getPndDestinatarios&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			pndDestinatariosContenido = JSON.parse(pndDestinatariosContenido);
			
			var pndProductosContenido = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getPndProductos&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			pndProductosContenido = JSON.parse(pndProductosContenido);
			
			var totalesEntidad = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getContadoresPNDporEntidad&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,

		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			totalesEntidad = JSON.parse(totalesEntidad);
			
			var totalesObjetivos = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getContadoresPNDporObjetivos&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			totalesObjetivos = JSON.parse(totalesObjetivos);
			
			var objetivosAbreviacion = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getObjetivoAbreviacion',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			objetivosAbreviacion = JSON.parse(objetivosAbreviacion);
			
			var objetoGastos = $.ajax({
				url:'http://spr.stp.gov.py/ajaxSelects?accion=getObjetosDeGasto',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			objetoGastos = JSON.parse(objetoGastos);
			objetoGastos = objetoGastos.objetosDeGasto;
			
			obtenerTotalesMapa(nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto, eje, linea, estrategia);
			
			for (var i=0; i<pndContenido.length;i++){
				if(pndContenido[i].eje_estrategico_id==eje){
					estrategiaNombre=pndContenido[i].estrategia_nombre;
					ejeNombre=pndContenido[i].eje_estrategico_nombre;
					lineaNombre=pndContenido[i].linea_transversal_nombre;
				}else{
					if(pndContenido[i].linea_transversal_id==linea){
						estrategiaNombre=pndContenido[i].estrategia_nombre;
						ejeNombre=pndContenido[i].eje_estrategico_nombre;
						lineaNombre=pndContenido[i].linea_transversal_nombre;
					}else{
						if(pndContenido[i].estrategia_id==estrategia){
							estrategiaNombre=pndContenido[i].estrategia_nombre;
							ejeNombre=pndContenido[i].eje_estrategico_nombre;
							lineaNombre=pndContenido[i].linea_transversal_nombre;
						}
					}
				}
			} 
			if (estrategia==0) {
				estrategiaNombre="TODAS";
			}
			if (eje==0) {
				ejeNombre="TODOS";
			}
			if (linea==0) {
				lineaNombre="TODAS";
			}

			var siglas=[];
			for (var i=0; i<pndContenido.length;i++){
				if(siglas.indexOf(pndContenido[i].entidad_sigla)<0){
					siglas.push(pndContenido[i].entidad_sigla);
				}
			} 

			var nombresEntidades=[];
			for (var i=0; i<pndContenido.length;i++){
				if(nombresEntidades.indexOf(pndContenido[i].entidad_nombre)<0){
					nombresEntidades.push(pndContenido[i].entidad_nombre);
				}
			} 
			
			var objetivos=[];
			for (var i=0; i<pndContenido.length;i++){
				if(objetivos.indexOf(pndContenido[i].objetivo_estrategico_id + ' - ' + pndContenido[i].objetivo_estrategico_nombre)<0){
					objetivos.push(pndContenido[i].objetivo_estrategico_id + ' - ' + pndContenido[i].objetivo_estrategico_nombre);
				}
			}
			var resultados=[];
			for (var i=0; i<pndContenido.length;i++){
				if(resultados.indexOf(pndContenido[i].resultado_esperado_id + ' - ' + pndContenido[i].resultado_esperado_nombre)<0){
					resultados.push(pndContenido[i].resultado_esperado_id + ' - ' + pndContenido[i].resultado_esperado_nombre);
				}
			} 
			
			/*************************** Funciones para tab Gastos ***************************/
			/*************************** CENTENA ***************************/
			var finan=[];//array de concats
			var financiamientos=[];//array de objetos
			var objetoGastosFiltrados=[];//array de gastos filtrados
			var index;

			for (var i=0; i<objetoGastos.length;i++){
				var objetoGasto=new Object();
				if (objetoGastos[i].codObjetoGasto%100 == 0){
					objetoGasto.objetoGastoId = objetoGastos[i].codObjetoGasto;
					objetoGasto.objetoGastoNombre = objetoGastos[i].nombre;
					objetoGastosFiltrados.push(objetoGasto);
				}
			}

			if(pndFinanciamiento!=null){
				for (var i=0; i<pndFinanciamiento.length;i++){
					var financiamiento=new Object();
					index = "";
					index = index.concat(pndFinanciamiento[i].fuente_financiamiento_id,'-',pndFinanciamiento[i].organismo_financiador_id,'-',((Math.floor(pndFinanciamiento[i].objeto_gasto_id/100))*100));
					if(finan.indexOf(index)<0){
						financiamiento.fuenteFinanciamiento = pndFinanciamiento[i].fuente_financiamiento;
						financiamiento.organismoFinanciador = pndFinanciamiento[i].organismo_financiador;
						financiamiento.objetoGasto = pndFinanciamiento[i].objeto_gasto;
						financiamiento.fuenteFinanciamientoId = pndFinanciamiento[i].fuente_financiamiento_id;
						financiamiento.organismoFinanciadorId = pndFinanciamiento[i].organismo_financiador_id;
						financiamiento.objetoGastoId = ((Math.floor(pndFinanciamiento[i].objeto_gasto_id/100))*100);			
						for (var j=0; j<objetoGastosFiltrados.length;j++){
							if (objetoGastosFiltrados[j].objetoGastoId == financiamiento.objetoGastoId){
								financiamiento.objetoGastoNombre = objetoGastosFiltrados[j].objetoGastoNombre;
								break;
							}
						}
						financiamiento.presupuesto = parseFloat(pndFinanciamiento[i].presupuesto) * parseFloat(pndFinanciamiento[i].colaboracion_resultado) * parseFloat(pndFinanciamiento[i].colaboracion_producto);
						financiamientos.push(financiamiento);
						finan.push(index);
					}else{
						for (var j=0; j<financiamientos.length;j++){
							if (financiamientos[j].fuenteFinanciamientoId == pndFinanciamiento[i].fuente_financiamiento_id &&
								financiamientos[j].organismoFinanciadorId == pndFinanciamiento[i].organismo_financiador_id &&
								financiamientos[j].objetoGastoId == (Math.floor(pndFinanciamiento[i].objeto_gasto_id/100))*100)
									financiamientos[j].presupuesto = parseFloat(financiamientos[j].presupuesto) + (parseFloat(pndFinanciamiento[i].presupuesto) * parseFloat(pndFinanciamiento[i].colaboracion_resultado) * parseFloat(pndFinanciamiento[i].colaboracion_producto));
						}
					}
				}
			}
			/*************************** DECENA ***************************/
			var finanDec=[];//array de concats
			var financiamientosDec=[];//array de objetos
			var objetoGastosXDecenas=[];//array de gastos filtrados por decenas
			var indexDec;

			for (var d=0; d<objetoGastos.length;d++){
				var objetoGastoDec=new Object();
				if (objetoGastos[d].codObjetoGasto%10 == 0 ){
					objetoGastoDec.objetoGastoId = objetoGastos[d].codObjetoGasto;
					objetoGastoDec.objetoGastoNombre = objetoGastos[d].nombre;
					objetoGastosXDecenas.push(objetoGastoDec);
				}
			}

			if(pndFinanciamiento!=null){
				for (var p=0; p<pndFinanciamiento.length;p++){
					var financiamientoDec=new Object();
					indexDec = "";
					indexDec = indexDec.concat(pndFinanciamiento[p].fuente_financiamiento_id,'-',pndFinanciamiento[p].organismo_financiador_id,'-',((Math.floor(pndFinanciamiento[p].objeto_gasto_id/10))*10));
					if(finanDec.indexOf(indexDec)<0){
						financiamientoDec.fuenteFinanciamiento = pndFinanciamiento[p].fuente_financiamiento;
						financiamientoDec.organismoFinanciador = pndFinanciamiento[p].organismo_financiador;
						financiamientoDec.objetoGastoDec = pndFinanciamiento[p].objeto_gasto;
						financiamientoDec.fuenteFinanciamientoId = pndFinanciamiento[p].fuente_financiamiento_id;
						financiamientoDec.organismoFinanciadorId = pndFinanciamiento[p].organismo_financiador_id;
						financiamientoDec.objetoGastoId = ((Math.floor(pndFinanciamiento[p].objeto_gasto_id/10))*10);				
						for (var k=0; k<objetoGastosXDecenas.length;k++){
							if (objetoGastosXDecenas[k].objetoGastoId == financiamientoDec.objetoGastoId){
								financiamientoDec.objetoGastoNombre = objetoGastosXDecenas[k].objetoGastoNombre;
								break;
							}
						}
						financiamientoDec.presupuestoDec = parseFloat(pndFinanciamiento[p].presupuesto) * parseFloat(pndFinanciamiento[p].colaboracion_resultado) * parseFloat(pndFinanciamiento[p].colaboracion_producto);
						financiamientosDec.push(financiamientoDec);
						finanDec.push(indexDec);
					}else{
						for (var m=0; m<financiamientosDec.length;m++){
							if (financiamientosDec[m].fuenteFinanciamientoId == pndFinanciamiento[p].fuente_financiamiento_id &&
								financiamientosDec[m].organismoFinanciadorId == pndFinanciamiento[p].organismo_financiador_id &&
								financiamientosDec[m].objetoGastoId == (Math.floor(pndFinanciamiento[p].objeto_gasto_id/10))*10)
									financiamientosDec[m].presupuestoDec = parseFloat(financiamientosDec[m].presupuestoDec) + (parseFloat(pndFinanciamiento[p].presupuesto) * parseFloat(pndFinanciamiento[p].colaboracion_resultado) * parseFloat(pndFinanciamiento[p].colaboracion_producto));
						}
					}
				}
			}
			/*************************** UNIDAD ***************************/
			var finanUni=[];//array de concats
			var financiamientosUnidad=[];//array de objetos sin filtro
			var objetoGastosXUnidad=[];//array de gastos sin filtrar
			var indexUni;

			for (var u=0; u<objetoGastos.length;u++){
				var objetoGastoUnitario=new Object();
				
					objetoGastoUnitario.objetoGastoId = objetoGastos[u].codObjetoGasto;
					objetoGastoUnitario.objetoGastoNombre = objetoGastos[u].nombre;
					objetoGastosXUnidad.push(objetoGastoUnitario);
				
			}
			

			if(pndFinanciamiento!=null){
				for (var q=0; q<pndFinanciamiento.length;q++){
					var financiamientoUnidad=new Object();
					indexUni = "";
					indexUni = indexUni.concat(pndFinanciamiento[q].fuente_financiamiento_id,'-',pndFinanciamiento[q].organismo_financiador_id,'-',pndFinanciamiento[q].objeto_gasto_id);
					if(finanUni.indexOf(indexUni)<0){
						financiamientoUnidad.fuenteFinanciamiento = pndFinanciamiento[q].fuente_financiamiento;
						financiamientoUnidad.organismoFinanciador = pndFinanciamiento[q].organismo_financiador;
						financiamientoUnidad.objetoGastoUni = pndFinanciamiento[q].objeto_gasto;
						financiamientoUnidad.fuenteFinanciamientoId = pndFinanciamiento[q].fuente_financiamiento_id;
						financiamientoUnidad.organismoFinanciadorId = pndFinanciamiento[q].organismo_financiador_id;
						financiamientoUnidad.objetoGastoId = pndFinanciamiento[q].objeto_gasto_id;
						for (var n=0; n<objetoGastosXUnidad.length;n++){
							if (objetoGastosXUnidad[n].objetoGastoId == financiamientoUnidad.objetoGastoId){
								financiamientoUnidad.objetoGastoNombre = objetoGastosXUnidad[n].objetoGastoNombre;
								break;
							}
						}
						financiamientoUnidad.presupuestoUnitario = parseFloat(pndFinanciamiento[q].presupuesto) * parseFloat(pndFinanciamiento[q].colaboracion_resultado) * parseFloat(pndFinanciamiento[q].colaboracion_producto);
						
						financiamientosUnidad.push(financiamientoUnidad);
						finanUni.push(indexUni);
					}else{
						for (var o=0; o<financiamientosUnidad.length;o++){
							if (financiamientosUnidad[o].fuenteFinanciamientoId == pndFinanciamiento[q].fuente_financiamiento_id &&
								financiamientosUnidad[o].organismoFinanciadorId == pndFinanciamiento[q].organismo_financiador_id &&
								financiamientosUnidad[o].objetoGastoId == pndFinanciamiento[q].objeto_gasto_id)
								financiamientosUnidad[o].presupuestoUnitario = parseFloat(financiamientosUnidad[o].presupuestoUnitario) + (parseFloat(pndFinanciamiento[q].presupuesto) * parseFloat(pndFinanciamiento[q].colaboracion_resultado) * parseFloat(pndFinanciamiento[q].colaboracion_producto));
						}
					}
				}
			}
			/*************************** EO Funciones para tab Gastos ***************************/
			
			var productosConcat=[];
			var productos=[];
			for (var i=0; i<pndProductosContenido.length;i++){
				if(productosConcat.indexOf(pndProductosContenido[i].prod_concat)<0){
					productosConcat.push(pndProductosContenido[i].prod_concat);
					var objeto=new Object();
					objeto.prod_id=pndProductosContenido[i].prod_id;
					objeto.concat=pndProductosContenido[i].prod_concat;
					objeto.nombre=pndProductosContenido[i].producto_nombre;
					objeto.clase=pndProductosContenido[i].producto_clase;
					objeto.unidad_medida=pndProductosContenido[i].unidad_medida;
					objeto.cantidad2017=parseInt(0);
					objeto.cantidad2018=parseInt(0);
					objeto.cantidad2019=parseInt(0);
					objeto.presupuesto=parseFloat(0.0);
					if( pndProductosContenido[i].anho=="2017"){
						objeto.cantidad2017=pndProductosContenido[i].cantidad;
						objeto.presupuesto=pndProductosContenido[i].presupuesto;
					}
					if( pndProductosContenido[i].anho=="2018"){
						objeto.cantidad2018=pndProductosContenido[i].cantidad;
					}
					if( pndProductosContenido[i].anho=="2019"){
						objeto.cantidad2019=pndProductosContenido[i].cantidad;
					}
					 productos.push(objeto);
				}else{
					if(productosConcat.indexOf(pndProductosContenido[i].prod_concat)>=0){
						for (var j=0; j<productos.length;j++){
							if(productos[j].concat==pndProductosContenido[i].prod_concat){
								if( pndProductosContenido[i].anho=="2017"){
									productos[j].cantidad2017=pndProductosContenido[i].cantidad;
									productos[j].presupuesto+=pndProductosContenido[i].presupuesto;
								}
								if( pndProductosContenido[i].anho=="2018"){
									productos[j].cantidad2018=pndProductosContenido[i].cantidad;
								}
								if( pndProductosContenido[i].anho=="2019"){
									productos[j].cantidad2019=pndProductosContenido[i].cantidad;
								}
								
							}
						}
					}
				}
			}
			
			var destinatariosCategoriaId=[];
			var destinatariosCategoriaNombre=[];
			var destinatariosCategoriaCantidad=[];
			var destinatariosCategoriaTipoId=[];
			var destinatariosCategoriaTipo=[];
			var destinatariosConcat=[];
			var productoDestinatarios=[];
			for (var i=0; i<pndDestinatariosContenido.length;i++){
				/*if(destinatariosCategoriaNombre.indexOf(pndContenido[i].nombre_catalogo_destinatario)<0 && destinatariosConcat.indexOf(pndDestinatariosContenido[i].prod_concat)<0) /*(destinatariosCategoriaId.indexOf(pndDestinatariosContenido[i].cod_catalogo_destinatario)<0 && destinatariosConcat.indexOf(pndDestinatariosContenido[i].prod_concat)>=0) ||
						(destinatariosCategoriaId.indexOf(pndDestinatariosContenido[i].cod_catalogo_destinatario)>=0 && destinatariosConcat.indexOf(pndDestinatariosContenido[i].prod_concat)<0) ||
						(destinatariosCategoriaId.indexOf(pndDestinatariosContenido[i].cod_catalogo_destinatario)<0 && destinatariosConcat.indexOf(pndDestinatariosContenido[i].prod_concat)<0)){*/
					destinatariosCategoriaId.push(pndDestinatariosContenido[i].cod_catalogo_destinatario);
					destinatariosCategoriaNombre.push(pndDestinatariosContenido[i].nombre_catalogo_destinatario);
					if (pndDestinatariosContenido[i].cant_destinatarios != null){
						destinatariosCategoriaCantidad.push(parseFloat(pndDestinatariosContenido[i].cant_destinatarios));
					}else{
						destinatariosCategoriaCantidad.push(parseFloat(0));
					}
					destinatariosCategoriaTipoId.push(pndDestinatariosContenido[i].tipo_catalogo_destinatario_id);
					destinatariosCategoriaTipo.push(pndDestinatariosContenido[i].tipo_nombre_catalogo_destinatario);
					destinatariosConcat.push(pndDestinatariosContenido[i].prod_concat);
					productoDestinatarios.push(pndDestinatariosContenido[i].producto_nombre)
				/*} else{
					for (var j=0; j<destinatariosCategoriaNombre.length;j++){
						if (destinatariosCategoriaNombre[j]==pndContenido[i].nombre_catalogo_destinatario){
							if (pndContenido[i].cod_catalogo_destinatario != null){
								if(parseFloat(pndDestinatariosContenido[i].colaboracion_resultado)>0){
									destinatariosCategoriaCantidad[j]+= (parseFloat(pndDestinatariosContenido[i].cant_destinatarios) * parseFloat(pndDestinatariosContenido[i].colaboracion_producto) * parseFloat(pndDestinatariosContenido[i].colaboracion_resultado));
								} else {
									destinatariosCategoriaCantidad[j]+= (parseFloat(pndDestinatariosContenido[i].cant_destinatarios) * parseFloat(pndDestinatariosContenido[i].colaboracion_producto));
								}
							}
						}
					}
				}*/
			}
		
			function renderEntidades(siglas){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableEntidades">'+
							'		<thead><th>Cód.</th><th>Entidad</th><th>Objetivos PND</th><th>Resultados</th><th>Tipos de Productos</th><th style="display:none">Entregas de Productos (oculto)</th><th>Entregas de Productos</th><th style="display:none">Presupuesto (oculto)</th><th>Presupuesto</th></thead>'+
							'		<tfoot><th>Total</th><th></th><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th></tfoot>'+
							'		<tbody>';
				for (var i=0; i<siglas.length;i++){
					if (siglas[i].destinatarios != null){
						 var entDestinatarios = siglas[i].destinatarios.toString();
						 entDestinatarios = entDestinatarios.split(".");
						 entDestinatarios = parseFloat(entDestinatarios);
					 }else{
						 entDestinatarios = 0;
					 }
					
					if (siglas[i].presupuesto != null){
						 var entPresupuesto = siglas[i].presupuesto.toString(); 
						 entPresupuesto=entPresupuesto.split(".");
						 entPresupuesto=parseFloat(entPresupuesto);
					 }else{
						 entPresupuesto = 0 ;
					 }
					
					//text+='<tr><td>'+siglas[i].ne_concat+'</td><td><a href="../pndEntidades.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+' " target="_blank">'+siglas[i].entidad_nombre+'</a></td><td>'+numeroConComa(siglas[i].objetivos)+'</td><td>'+numeroConComa(siglas[i].resultados)+'</td><td>'+numeroConComa(siglas[i].productos)+'</td><td>'+numeroConComa(siglas[i].destinatarios)+'</td><td class="text-right">'+numeroConComa(siglas[i].presupuesto)+'</td></tr>';
					text+='<tr><td>'+siglas[i].ne_concat+'</td><td>'+siglas[i].entidad_nombre+'</td><td>'+numeroConComa(siglas[i].objetivos)+'</td><td>'+numeroConComa(siglas[i].resultados)+'</td><td>'+numeroConComa(siglas[i].productos)+'</td><td class="text-right">'+numeroConComa(entDestinatarios)+'</td><td style="display:none;">'+entDestinatarios+'</td><td class="text-right">'+numeroConComa(entPresupuesto)+'</td><td style="display:none;">'+entPresupuesto+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			
			function renderObjetivos(objetivos){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableResultados">'+
							'		<thead><th>Id</th><th>Objetivos PND</th><th>Entidades</th><th>Resultados</th><th>Tipos de Productos</th><th style="display:none">Entregas de Productos (oculto)</th><th>Entregas de Productos</th><th style="display:none">Presupuesto (oculto)</th><th >Presupuesto</th></thead>'+
							'		<tfoot><th></th><th></th><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th></tfoot>'+
							'		<tbody>';
				objetivos=objetivos.sort(comparePresupuesto);
				for (var i=0; i<objetivos.length;i++){
					 if (objetivos[i].presupuesto != null){
						 var presupuesto = objetivos[i].presupuesto.toString(); 
						 presupuesto=presupuesto.split(".");
						 presupuesto=parseFloat(presupuesto);
					 }else{
						 presupuesto = 0 ;
					 }
					 var cantDestinatarios;
					 if (objetivos[i].destinatarios != null){
//						 var cantDestinatarios = objetivos[i].destinatarios.toString();
//						 cantDestinatarios = cantDestinatarios.split(".");
						 if (objetivos[i].resultado_colaboracion > 0)
							 cantDestinatarios = parseFloat(cantDestinatarios * objetivos[i].producto_colaboracion * objetivos[i].resultado_colaboracion);
						 else 
							 cantDestinatarios = parseFloat(cantDestinatarios * objetivos[i].producto_colaboracion);
					 }else{
						 cantDestinatarios = 0;
					 }
					//text+='<tr><td><a href="../pndObjetivos.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+' " target="_blank">'+objetivos[i].objetivo_estrategico_nombre+'</a></td><td>'+numeroConComa(objetivos[i].entidades)+'</td><td>'+numeroConComa(objetivos[i].resultados)+'</td><td>'+numeroConComa(objetivos[i].productos)+'</td><td>'+numeroConComa(objetivos[i].destinatarios)+'</td><td class="text-right">'+numeroConComa(presupuesto)+'</td><td style="display:none">'+presupuesto+'</td></tr>';
					var posObjAv = objetivosAbreviacion.map(function(o) { return o.id; }).indexOf(objetivos[i].objetivo_estrategico_id);
					text += //'<tr><td>'+objetivos[i].objetivo_estrategico_nombre+'</td>'+
							'<tr><td>'+objetivos[i].objetivo_estrategico_id+'</td>'+
							'<td>'+objetivosAbreviacion[posObjAv].nombre+'</td>'+
							'<td>'+numeroConComa(objetivos[i].entidades)+'</td>'+
						    '<td>'+numeroConComa(objetivos[i].resultados)+'</td>'+
						    '<td>'+numeroConComa(objetivos[i].productos)+'</td>'+
						    '<td class="text-right">'+numeroConComa(objetivos[i].destinatarios)+'</td>'+
						    '<td style="display:none;">'+numeroConComa(objetivos[i].destinatarios)+'</td>'+
						    '<td class="text-right">'+numeroConComa(presupuesto)+'</td>'+
						    '<td style="display:none;">'+presupuesto+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			
			function renderProductos(productos){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableProductos">'+
							'		<thead><th>Cód.</th><th>Productos</th><th>Clase</th><th>Unidad de Medida</th><th style="display:none;">Cantidad 2017 (oculto)</th><th>Cantidad 2017</th><th style="display:none;">Cantidad 2018 (oculto)</th><th>Cantidad 2018</th><th style="display:none;">Cantidad 2019 (oculto)</th><th>Cantidad 2019</th><th style="display:none;">Presupuesto</th><th>Presupuesto (Gs.)</th></thead>'+
							'		<tfoot><th></th><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th></tfoot>'+
							'		<tbody>';
				
				var idParsed = "";
				for (var i=0; i<productos.length;i++){
					if (productos[i].presupuesto != null){
						var productoPresupuesto = productos[i].presupuesto.toString(); 
						productoPresupuesto=productoPresupuesto.split(".");
						productoPresupuesto=parseFloat(productoPresupuesto);
					}else{
						productoPresupuesto = 0;
					}
					//text+='<tr><td>'+productos[i].concat+'</td><td><a href="../pndProductos.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+'" target="_blank" >'+productos[i].nombre+'</a></td><td>'+productos[i].clase+'</td><td>'+productos[i].unidad_medida+'</td><td>'+numeroConComa(productos[i].cantidad2017)+'</td><td>'+numeroConComa(productos[i].cantidad2018)+'</td><td>'+numeroConComa(productos[i].cantidad2019)+'</td><td class="text-right">'+numeroConComa(productos[i].presupuesto)+'</td></tr>';
					text+='<tr><td>'+productos[i].concat+'</td><td>'+productos[i].nombre+'</td><td>'+productos[i].clase+'</td><td>'+productos[i].unidad_medida+'</td><td class="text-right">'+numeroConComa(productos[i].cantidad2017)+'</td><td style="display:none;">'+productos[i].cantidad2017+'</td><td class="text-right">'+numeroConComa(productos[i].cantidad2018)+'</td><td style="display:none;">'+productos[i].cantidad2018+'</td><td class="text-right">'+numeroConComa(productos[i].cantidad2019)+'</td><td style="display:none;">'+productos[i].cantidad2019+'</td><td class="text-right">'+numeroConComa(productos[i].presupuesto)+'</td><td class="text-right" style="display:none;">'+productoPresupuesto+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			
			function renderDestinatarios(destinatariosCategoriaNombre,destinatariosCategoriaCantidad){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableDestinatarios">'+
							'		<thead><th>Cód.</th><th>Producto</th><th>Tipo de Destinatario</th><th>Grupo de Destinatario</th><th  style="display:none;">Cantidad 1</th><th>Cantidad</th></thead>'+
							'		<tfoot><th></th><th></th><th></th><th></th><th></th></tfoot>'+
							'		<tbody>';
				for (var i=0; i<destinatariosCategoriaNombre.length;i++){
					if(destinatariosCategoriaNombre[i]){
						text+='<tr><td>'+destinatariosConcat[i]+'</td><td>'+productoDestinatarios[i]+'</td><td>'+destinatariosCategoriaTipo[i]+'</td><td>'+destinatariosCategoriaNombre[i]+'</td><td class="text-right">'+numeroEntero(numeroConComa(destinatariosCategoriaCantidad[i]))+'</td><td  style="display:none;">'+destinatariosCategoriaCantidad[i]+'</td></tr>';
					}
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			
			function renderDepartamentos(){
				
				cargarSelectoresMapa("todos",0,0,0);
				
				var text=	'<div class="table-responsive">'+
	            			'	<div class="row">'+
	            			'		<div class="col-md-4">'+
	            			'			<div class="box box-default">'+
	            			'				<div class="box-header with-border">'+
	            			'               	<i class="fa fa-users"></i>'+
	            			'               	<h3 class="box-title">Destinatarios</h3>'+            			
	            			'              	</div>'+//fin-box-header
	            			'               <div class="box-body id="bodyDestinatario">'+
	            			'               	<div id="mapaDestinatarios" style="width: 600x; height: 400px"></div>'+
	            			'               </div>'+//fin-box-body
	            			'               <div class="box-footer">'+
	            			'					<form role="form">'+
							'	            		<div class="form-group">'+
							'	            			<label for="sel1">Seleccione el catalogo de destinatario:</label>'+
							'							<select name="catalogo_destinatario" id="optionDestinatario" class="form-control">'+optioncatalogo_dest+'</select>'+
							'	            		</div>'+
							'	            		<div class="form-group">'+
							'	            			<label for="sel1">Seleccione el catalogo de producto:</label>'+
							'							<select name="catalogo_producto" id="optionTipoProducto" class="form-control">'+optioncatalogo_tipo_producto+'</select>'+
							'	            		</div>'+
							'	            	</form>'+
	            			'               </div>'+//fin-box-footer
	            			'			</div>'+//fin-box
	            			'		</div>'+
	            			'       <div class="col-md-4">'+
	            			'       	<div class="box box-default">'+
	            			'           	<div class="box-header with-border">'+
	            			'               	<i class="fa fa-flag-checkered"></i>'+
	            			'                   <h3 class="box-title">Metas  '+

	            			'					</h3>'+
	            			'				</div>'+//fin-box-header
	            			'				<div class="box-body">'+
	            			'					<div id="mapaMetas" style="width: 600x; height: 400px"></div>'+
	            			'				</div>'+//fin-box-body
	            			'				<div class="box-footer" id="slider">'+
	            			'					<form role="form">'+
							'	            		<div class="form-group">'+
							'	            			<label for="sel1">Seleccione el mes:</label>'+
							'	            			<select class="form-control" id="optionMes" parametros="'+eje+'-'+linea+'-'+estrategia+'" title="Mes">'
														+optionMeses+
							'		            		</select>'+
							'	            		</div>'+
							'	            		<div class="form-group">'+
							'	            			<label for="sel1">Seleccione el catalogo de producto:</label>'+
							'							<select name="catalogo_producto" id="optionTipoProductoMeta" class="form-control">'+optioncatalogo_tipo_producto_meta+'</select>'+
							'	            		</div>'+
							'	            	</form>'+
	            			'				</div>'+//fin-box-footer
	            			'			</div>'+//fin-box
	            			'		</div>'+
	            			'		<div class="col-md-4">'+
	            			'   		<div class="box box-default">'+
	            			'    			<div class="box-header with-border">'+
	            			'        			<i class="fa fa-money"></i>'+
	            			'             		<h3 class="box-title">Presupuesto</h3>'+
	            			'          		</div>'+//fin-box-header
	            			'          		<div class="box-body">'+
	            			'            		<div id="mapaAsignacion" style="width: 600x; height: 400px"></div>'+
	            			'          		</div>'+//fin-box-body
	            			' 				<div class="box-footer" id="slider">'+
	            			'					<form role="form">'+							            		
							'	            		<div class="form-group">'+
							'	            			<label for="sel1">Seleccione el catalogo de producto:</label>'+
							'							<select name="catalogo_producto" id="optionTipoProductoAsig" class="form-control">'+optioncatalogo_tipo_producto_meta+'</select>'+
							'	            		</div>'+
							'	            	</form>'+
	            			'				</div>'+//fin-box-footer
	            			'      		</div>'+//fin-box
	            			'    	</div>'+
	            			'	</div>'+
	            			'</div>';
				return text;
			}
			
	        var entregas =parseFloat(0);
	        var monto =parseFloat(0);

	        for(var e = 0;e<productos.length; e++){
				if(productos[e].presupuesto != null){
					monto+=parseFloat(productos[e].presupuesto);
				}
			}
	        for(var e = 0;e<destinatariosCategoriaCantidad.length; e++){
				if(destinatariosCategoriaCantidad[e] != null && destinatariosCategoriaCantidad[e] != 0){
					entregas+=parseFloat(destinatariosCategoriaCantidad[e]);
				}
			}

	        var entregas1=numeroConComa(entregas);
	        var monto1=numeroConComa(monto);
	        
	        var entregas2=numeroEntero(entregas1);
	        var monto2=numeroEntero(monto1);
	        
		    if(entregas1 != 0){
		    	var idParsed = entregas1.split(",");  
		    	entregas = idParsed[0];
		    }
		    if(monto1 != 0){
			    var idParsed = monto1.split(",");  
			    monto = idParsed[0];
		    }
		    
			cuerpoModalC1F1Entidades =	'<div class="modal fade" id="modalC1F1Entidades" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'		<div class="modal-dialog modal-lg" style="width:90%">'+
									'			<div class="modal-content" >'+
									'				<div class="modal-header '+clase+'">'+
									'		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+									   
									'					<h3 class="modal-title"><strong>Estrategia: </strong>'+estrategiaNombre+'</h3>'+
									'		        	<h4 class="modal-title"><strong>Eje Estrategico: </strong>'+ejeNombre+' <strong>Linea Transversal: </strong>'+lineaNombre+' </h4>'+
									'					<br><h5 class="modal-title" id="concatCabecera"></h5>'+  
									'				</div>'+
									'			    <div class="modal-body" id="modalNivelGlobal">'+
							     	'					<div class="nav-tabs-custom">'+
					                '						<ul class="nav nav-tabs pull-right">'+
					                '							<li><a href="#tab_7-7" data-toggle="tab" title="Presupuesto"><i class="fa fa-money"></i></a></li>'+
					                '							<li><a href="#tab_5-5" data-toggle="tab" title="Departamentos"><i class="fa fa-map-marker"></i></a></li>'+
//					              	'							<li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li>'+
					              	'							<li><a href="#tab_4-4" data-toggle="tab" title="Entregas de Productos" id="Destinatarios"><i class="fa fa-users"></i></a></li>'+
					              	'							<li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li>'+
					              	'							<li><a href="#tab_3-3" data-toggle="tab" title="Metas"><i class="fa fa-truck"></i></a></li>'+
					                '							<li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li>'+
					                '							<li><a href="#tab_2-2" data-toggle="tab" title="Objetivos"><i class="fa  fa-chain "></i></a></li>'+
					                '							<li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li>'+
					                '							<!-- li><a href="#tab_8-8" data-toggle="tab" title="Visualizacion Cadena de Valor" id="Visualizacion"><i class="fa fa-connectdevelop"></i></a></li -->'+
					                '							<!-- li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li -->'+
					                '							<li><a href="#tab_6-6" data-toggle="tab" title="Cadena de Valor" id="Cadena"><i class="fa fa-sitemap"></i></a></li>'+
					                '							<li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li>'+
					                '							<li><a href="#tab_1-1" data-toggle="tab"  title="Entidades"><i class="fa fa-building"></i></a></li>'+
					                '						</ul>'+
					                '						<div class="tab-content">'+
					                '							<div class="tab-pane" id="tab_1-1">'+renderEntidades(totalesEntidad)+'</div>'+
					                '							<div class="tab-pane" id="tab_2-2"><p>'+renderObjetivos(totalesObjetivos)+'</p></div>'+
					                '							<div class="tab-pane" id="tab_3-3">'+renderProductos(productos)+'</div>'+
					                '							<div class="tab-pane" id="tab_4-4">'+renderDestinatarios(destinatariosCategoriaNombre,destinatariosCategoriaCantidad)+'</div>'+
					                '							<div class="tab-pane" id="tab_6-6">'+renderEstructura(entregas, monto, resultados, productos, clase, objetivos)+'</div>'+
					                '							<!-- div class="tab-pane" id="tab_8-8"><iframe width="1060" height="615" src="/frames/visualizacionCadenaValor.jsp" frameborder="0" ></iframe></div-->'+
					                '							<div class="tab-pane" id="tab_7-7">'+renderGastos(financiamientos, financiamientosDec, financiamientosUnidad, objetoGastosFiltrados, objetoGastosXDecenas, objetoGastosXUnidad)+'</div>'+//aca le tenemos que pasar la variable nueva
					                '							<div class="tab-pane" id="tab_5-5">'+renderDepartamentos()+'</div>'+
					                '						</div>'+
					              	'					</div>'+
									'				</div>'+								
									'			</div>'+ 
									'		</div>'+
									'	</div>'; 
			$("body").append(cuerpoModalC1F1Entidades);
			$("#modalC1F1Entidades").modal('show');
			
			//cuerpo de la tabla de objetivos por 
			cuerpoTablaObjetivos ='	<div class="box-body">'+
            '							<div><p>'+renderObjetivos(totalesObjetivos)+'</p></div>'+
			'						</div>';
			$("#tablaObjetivos").append(cuerpoTablaObjetivos);
			
			//cabecera del box contenedor de todo
			cabeceraBoxInfo ='	<div class="box-header '+clase+'">'+
			'					<h3 class="modal-title"><strong>Estrategia: </strong>'+estrategiaNombre+'</h3>'+
			'		        	<h4 class="modal-title"><strong>Eje Estrategico: </strong>'+ejeNombre+' <strong> Linea Transversal: </strong>'+lineaNombre+'</h4>'+
			'						<br><h5 class="modal-title" id="concatCabecera"></h5>'+ 
			'					</div>';

			$("#cabeceraTitulo").append(cabeceraBoxInfo);
			$("#concatCabecera").append(contenedorEvaluadorConcat(nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto));
			//'copy', 'csv', 'excel', 'pdf', 'print'

			$("#dataTableEntidades").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
		                total5 = api
		                    .column( 5 )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total por pagina 
		                pageTotal5 = api
		                    .column( 5, { page: 'current'} )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total general para todas las paginas
		                total7 = api
		                    .column( 7 )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total por pagina 
		                pageTotal7 = api
		                    .column( 7, { page: 'current'} )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );               
		                
		                $( api.column( 5 ).footer() ).html(
		                		'Subtotal: '+numeroConComa(pageTotal5) +' (Total: '+ numeroConComa(total5) +')'
		                );
		                $( api.column( 7 ).footer() ).html(
		                		'Subtotal: '+ numeroConComa(pageTotal7) +' (Total: '+ numeroConComa(total7) +')'
		                );
		        },
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
									
			$("#dataTableResultados").DataTable( {
		        dom: 'Bfrtip',
		        "order": [[ 7, "desc" ]],
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
				             columns: [ 1, 2, 3, 4, 6, 8 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
				             columns: [ 1, 2, 3, 4, 6, 8 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
	                total5 = api
	                    .column( 5 )
	                    .data()
	                    .reduce( function (a, b) {
	                        return intVal(a) + intVal(b);
	                    }, 0 );

	                // total por pagina 
	                pageTotal5 = api
	                    .column( 5, { page: 'current'} )
	                    .data()
	                    .reduce( function (a, b) {
	                        return intVal(a) + intVal(b);
	                    }, 0 );
		                
		                // total general para todas las paginas
		                total7 = api
		                    .column( 7 )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total por pagina 
		                pageTotal7 = api
		                    .column( 7, { page: 'current'} )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );
		                
		                $( api.column( 5 ).footer() ).html(
		                		'Subtotal: '+ numeroConComa(pageTotal5) +' (Total: '+ numeroConComa(total5) +')'
		                );
		                
		                $( api.column( 7 ).footer() ).html(
		                		'Subtotal: '+ numeroConComa(pageTotal7) +' (Total: '+ numeroConComa(total7) +')'
		                );		                
		        },
		        language: {
		            buttons: {
		                copy: 'Copiar',
	                print: 'Imprimir'
		            }
		        }
			} );
			$("#dataTableResultadosEstructura").DataTable( {
		        dom: 'Bfrtip',
		        "order": [[ 6, "desc" ]],
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				},
				"scrollX": false,
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );

			$("#dataTableProductos").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5,7,9,11 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5,7,9,11 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5,7,9,11 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5,7,9,11 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5,7,9,11 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
		                total10 = api
		                    .column( 10 )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total por pagina 
		                pageTotal10 = api
		                    .column( 10, { page: 'current'} )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );		                		                
		                
		                $( api.column( 10 ).footer() ).html(
		                		'Subtotal: '+ numeroConComa(pageTotal10) +' (Total: '+ numeroConComa(total10) +')'
		                );
		        },
		        language: {		        	
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			$("#dataTableProductosEstructura").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				},
				"scrollX": false,
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			$("#dataTableDestinatarios").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0,1,2,3,5 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
		                total4 = api
		                    .column( 4 )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total por pagina 
		                pageTotal4 = api
		                    .column( 4, { page: 'current'} )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );
		              		                		                
		                // se muestran los valores de los totales en el footer del table
		                $( api.column( 4 ).footer() ).html(
		                		'Subtotal: '+ numeroConComa(pageTotal4) +' (Total: '+ numeroConComa(total4) +')'
		                );		                
		        },
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			$("#dataTableProductosEst").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				},
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			$("#dataTableResultadosEst").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				},
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			$("#dataTableObjetivosEst").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				},
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			
			$("#dataTableGastosCen").DataTable( {
				//"order": [[ 4, "asc" ]],
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
	                		'Subtotal: '+ numeroConComa(pageTotal3) +' (Total: '+ numeroConComa(total3) +')'
	                );
				},
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			
			$("#dataTableGastosDec").DataTable( {
				//"order": [[ 4, "asc" ]],
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0,1,2,4 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
	                		'Subtotal: '+ numeroConComa(pageTotal3) +' (Total: '+ numeroConComa(total3) +')'
	                );
				},
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );

			$("#dataTableGastosUni").DataTable( {
				//"order": [[ 4, "asc" ]],
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0,1,2,4,5 ]
		                }
		                    }
		                ],
				"search": {
		            "regex": true
				},
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
	                		'Subtotal: '+ numeroConComa(pageTotal3) +' (Total: '+ numeroConComa(total3) +')'
	                );
				},
		        language: {
		            buttons: {
		                copy: 'Copiar',
		                print: 'Imprimir'
		            }
		        }
			} );
			
			f[eje][linea]=cuerpoModalC1F1Entidades;
		}else{
				if ( $("#modalC1F1Entidades").length )
				{
					$("#modalC1F1Entidades").remove();
				}
				$("body").append(f[eje][linea]);
				$("#modalC1F1Entidades").modal('show');
				$("#concatCabecera").append(contenedorEvaluadorConcat(nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto));
				
				$("#dataTableEntidades").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
			                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
			                    columns: [ 0, 1, 2, 3, 4, 6, 8 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
			                total5 = api
			                    .column( 5 )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total por pagina 
			                pageTotal5 = api
			                    .column( 5, { page: 'current'} )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total general para todas las paginas
			                total7 = api
			                    .column( 7 )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total por pagina 
			                pageTotal7 = api
			                    .column( 7, { page: 'current'} )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );
			              
			                $( api.column( 5 ).footer() ).html(
			                		'Subtotal: '+numeroConComa(pageTotal5) +' (Total: '+ numeroConComa(total5) +')'
			                );
			                $( api.column( 7 ).footer() ).html(
			                		'Subtotal: '+ numeroConComa(pageTotal7) +' (Total: '+ numeroConComa(total7) +')'
			                );
			        },
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				$("#dataTableResultados").DataTable( {
			        dom: 'Bfrtip',
			        "order": [[ 7, "desc" ]],
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
					             columns: [ 1, 2, 3, 4, 6, 8 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
					             columns: [ 1, 2, 3, 4, 6, 8 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
		                total5 = api
		                    .column( 5 )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );

		                // total por pagina 
		                pageTotal5 = api
		                    .column( 5, { page: 'current'} )
		                    .data()
		                    .reduce( function (a, b) {
		                        return intVal(a) + intVal(b);
		                    }, 0 );
			                
			                // total general para todas las paginas
			                total7 = api
			                    .column( 7 )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total por pagina 
			                pageTotal7 = api
			                    .column( 7, { page: 'current'} )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );
			                
			                $( api.column( 5 ).footer() ).html(
			                		'Subtotal: '+ numeroConComa(pageTotal5) +' (Total: '+ numeroConComa(total5) +')'
			                );
			                
			                $( api.column( 7 ).footer() ).html(
			                		'Subtotal: '+ numeroConComa(pageTotal7) +' (Total: '+ numeroConComa(total7) +')'
			                );		                
			        },
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				$("#dataTableProductos").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5,7,9,11 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5,7,9,11 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5,7,9,11 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5,7,9,11 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5,7,9,11 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
			                total10 = api
			                    .column( 10 )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total por pagina 
			                pageTotal10 = api
			                    .column( 10, { page: 'current'} )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );
			                		                
			                
			                $( api.column( 10 ).footer() ).html(
			                		'Subtotal: '+ numeroConComa(pageTotal10) +' (Total: '+ numeroConComa(total10) +')'
			                );
			        },
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				
				$("#dataTableDestinatarios").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
			                    columns: [ 0,1,2,3,5 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
			                total4 = api
			                    .column( 4 )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total por pagina 
			                pageTotal4 = api
			                    .column( 4, { page: 'current'} )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );
			              		                		                
			                // se muestran los valores de los totales en el footer del table
			                $( api.column( 4 ).footer() ).html(
			                		'Subtotal: '+ numeroConComa(pageTotal4) +' (Total: '+ numeroConComa(total4) +')'
			                );		                
			        },
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				$("#dataTableProductosEst").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					},
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
			                total2 = api
			                    .column( 2 )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );

			                // total por pagina 
			                pageTotal2 = api
			                    .column( 2, { page: 'current'} )
			                    .data()
			                    .reduce( function (a, b) {
			                        return intVal(a) + intVal(b);
			                    }, 0 );
			                
			                // se muestran los valores de los totales en el footer del table
			                $( api.column( 2 ).footer() ).html(
			                		'Subtotal: '+ numeroConComa(pageTotal2) +' (Total: '+ numeroConComa(total2) +')'
			                );
			        },
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );

				$("#dataTableResultadosEst").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					},
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				$("#dataTableObjetivosEst").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					},
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				$("#dataTableGastosCen").DataTable( {
					//"order": [[ 4, "asc" ]],
			        dom: 'Bfrtip',
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
		                		'Subtotal: '+ numeroConComa(pageTotal3) +' (Total: '+ numeroConComa(total3) +')'
		                );
					},
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );

				$("#dataTableGastosDec").DataTable( {
					//"order": [[ 4, "asc" ]],
			        dom: 'Bfrtip',
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
		                		'Subtotal: '+ numeroConComa(pageTotal3) +' (Total: '+ numeroConComa(total3) +')'
		                );
					},
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
				$("#dataTableGastosUni").DataTable( {
					//"order": [[ 4, "asc" ]],
			        dom: 'Bfrtip',
			        buttons: [
			                    {
			                        extend: 'copy',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'csv',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'excel',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'pdf',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    },
			                    {
			                        extend: 'print',
			                        exportOptions: {
			                    columns: [ 0,1,2,4,5 ]
			                }
			                    }
			                ],
					"search": {
			            "regex": true
					},
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
		                		'Subtotal: '+ numeroConComa(pageTotal3) +' (Total: '+ numeroConComa(total3) +')'
		                );
					},
			        language: {
			            buttons: {
			                copy: 'Copiar',
		                print: 'Imprimir'
			            }
			        }
				} );
			}
		}

		function contenedorEvaluadorConcat(nivel, entidad, unidadResponsable, tipoPrograma, programa, subprograma, proyecto, producto){
			var nivelNombre = $("#selectorDeNivel option:selected").text();
			var entidadNombre = $("#selectorDeEntidad option:selected").text();
			var unidadResponsableNombre = $("#selectorDeUnidadResponsable option:selected").text();
			var tipoProgramaNombre = $("#selectorDeTipoPresupuesto option:selected").text();
			var programaNombre = $("#selectorDePrograma option:selected").text();
			var subProgramaNombre = $("#selectorDeSubPrograma option:selected").text();
			var proyectoNombre = $("#selectorDeProyecto option:selected").text();
			var productoNombre = $("#selectorDeProducto option:selected").text();

			//cabecera modal concat
			if (nivel != 0 && entidad != 0 && unidadResponsable != -1 && tipoPrograma != undefined && programa != undefined && subprograma != undefined && proyecto != undefined && producto != undefined){
				var contenedorCabeceraConcat = "";
				contenedorCabeceraConcat = nivelNombre+' > '+entidadNombre+' > '+unidadResponsableNombre+' > '+tipoProgramaNombre+' > '+programaNombre+' > '+subProgramaNombre+' > '+proyectoNombre+' > <strong>'+productoNombre+'</strong>';
				$("#concatCabecera").append(contenedorCabeceraConcat);
			}else {
				if (nivel != 0 && entidad != 0 && unidadResponsable != -1 && tipoPrograma != undefined && programa != undefined && subprograma != undefined && proyecto != undefined){
					var contenedorCabeceraConcat = "";
					contenedorCabeceraConcat = nivelNombre+' > '+entidadNombre+' > '+unidadResponsableNombre+' > '+tipoProgramaNombre+' > '+programaNombre+' > '+subProgramaNombre+' > <strong>'+proyectoNombre+'</strong>';
					$("#concatCabecera").append(contenedorCabeceraConcat);
				}else {
					if (nivel != 0 && entidad != 0 && unidadResponsable != -1 && tipoPrograma != undefined && programa != undefined && subprograma != undefined){
						var contenedorCabeceraConcat = "";
						contenedorCabeceraConcat = nivelNombre+' > '+entidadNombre+' > '+unidadResponsableNombre+' > '+tipoProgramaNombre+' > '+programaNombre+' > <strong>'+subProgramaNombre+'</strong>';
						$("#concatCabecera").append(contenedorCabeceraConcat);
					}else{
						if (nivel != 0 && entidad != 0 && unidadResponsable != -1 && tipoPrograma != undefined && programa != undefined){
							var contenedorCabeceraConcat = "";
							contenedorCabeceraConcat = nivelNombre+' > '+entidadNombre+' > '+unidadResponsableNombre+' > '+tipoProgramaNombre+' > <strong>'+programaNombre+'</strong>';
							$("#concatCabecera").append(contenedorCabeceraConcat);
						}else{
							if (nivel != 0 && entidad != 0 && unidadResponsable != -1 && tipoPrograma != undefined){
								var contenedorCabeceraConcat = "";
								contenedorCabeceraConcat = nivelNombre+' > '+entidadNombre+' > '+unidadResponsableNombre+' > <strong>'+tipoProgramaNombre+'</strong>';
								$("#concatCabecera").append(contenedorCabeceraConcat);
							}else{
								if (nivel != 0 && entidad != 0 && unidadResponsable != -1){
									var contenedorCabeceraConcat = "";
									contenedorCabeceraConcat = nivelNombre+ ' > '+entidadNombre+' > <strong>'+unidadResponsableNombre+'</strong>';
									$("#concatCabecera").append(contenedorCabeceraConcat);
								}else{									
									if (nivel != 0 && entidad != 0){
										var contenedorCabeceraConcat = "";
										contenedorCabeceraConcat = nivelNombre+ ' > <strong>'+entidadNombre+'</strong>';
										$("#concatCabecera").append(contenedorCabeceraConcat);
									}else{
										if (nivel != 0){
											contenedorCabeceraConcat ='<strong>'+nivelNombre+'</strong>';
											$("#concatCabecera").append(contenedorCabeceraConcat);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		
		$("body").on("change", ".sizeSelector",function(event){
			$(this).closest(".contenedorCharts").attr("class", "col-md-"+$(this).val()+" contenedorCharts");
			
		});
		
		//EVENTO DE CHANGE DEL SELECTOR DE GRUPOS DE GASTOS.
		$("body").on("click", "#verTablaDecena",function(event){
			$("#tablaAgrupado").hide("slow");
			$("#tablaXDecena").removeClass('hidden');
			$("#tablaXDecena").show("slow");
			$("#tablaXUnidad").hide("slow");
		});
		$("body").on("click", "#verTablaUnidad",function(event){
			$("#tablaAgrupado").hide("slow");
			$("#tablaXDecena").hide("slow");
			$("#tablaXUnidad").removeClass('hidden');
			$("#tablaXUnidad").show("slow");
		});
		$("body").on("click", "#verTablaAgrupado",function(event){
			$("#tablaAgrupado").show("slow");
			$("#tablaXDecena").hide("slow");
			$("#tablaXUnidad").hide("slow");
		});
		
		$("body").on("change", ".chartSelector",function(event){
			var objeto=$(this).closest(".contenedorCharts").find("[id*='Chart']").hide();
			
			var tipoGrafico=$(this).val();
			var objeto=$(this).closest(".contenedorCharts").find("[id*='"+tipoGrafico+"']").show();
			//renderGraficosEstrategia(""+objeto,""+tipoGrafico);
			
		});
		$(".desagregacionLineas").hide();
		$("body").on("click", "#verEstrategias",function(event){
			$("#tablaPresupuestoPnd").hide("slow");
			$("#tablaPresupuestoPndEstrategias").show("slow");
		});
		$("body").on("click", "#verPndTotal",function(event){
			$("#tablaPresupuestoPnd").show("slow");
			$("#tablaPresupuestoPndEstrategias").hide("slow");
		});
		$("body").on("click", "#verPorLineas",function(event){
			$(".totalesPorEje").find("div.box-body").addClass("collapse");
			$("td.desagregacionLineas").css("vertical-align", "middle")
			$(".desagregacionLineas").show("slow");
			$("#verPorLineas").hide("slow");
		});
		$("body").on("click", "#ocultarLineas",function(event){
			$(".totalesPorEje").find("div.box-body").removeClass("collapse");
			$(".desagregacionLineas").hide("slow");
			$("#verPorLineas").show("slow");
			
		});
		
		//desagregacion de objetivos llamado desde la pagina de pndEntidades
		$("body").on("click", "#verObjetivos",function(event){
			$("#tablaInstitucionPnd").hide("slow");
			$("#tablaObjetivosPND").show("slow");
		});

		$("body").on("click", ".modalF1C1",function(event){
			var parametros = $(this).attr("parametros");
		    var idParsed = parametros.split("-"); 
		    eje = idParsed[0];
		    linea = idParsed[1];
		    estrategia= idParsed[2];
		    var objeto= idParsed[3];
		    var mesPND = idParsed[4];
		    var tab="";
		    var mapDest;
		    var mapMeta;
		    var mapAsig;
		    $("#tablaXDecena").addClass('hidden');
		    $("#tablaXUnidad").addClass('hidden');

		    //obtenerTotalesMapa(nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto);
		    
		    if(entidad != 0 &&  nivel != 0 &&  unidadResponsable != -1 &&  tipoPrograma != 0 &&  programa != 0 &&  subprograma != -1 &&  proyecto != -1 &&  producto != 0){
				renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(unidadResponsable), parseInt(tipoPrograma), parseInt(programa), parseInt(subprograma), parseInt(proyecto), parseInt(producto));    
		    }else
		    	if(entidad != 0 &&  nivel != 0 &&  unidadResponsable != -1 &&  tipoPrograma != 0 &&  programa != 0 &&  subprograma != -1 &&  proyecto != -1 ){
					renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(unidadResponsable), parseInt(tipoPrograma), parseInt(programa), parseInt(subprograma), parseInt(proyecto));    
			    }else
			    	if(entidad != 0 &&  nivel != 0 &&  unidadResponsable != -1 &&  tipoPrograma != 0 &&  programa != 0 &&  subprograma != -1){
						renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(unidadResponsable), parseInt(tipoPrograma), parseInt(programa), parseInt(subprograma));    
				    }else
				    	if(entidad != 0 &&  nivel != 0 &&  unidadResponsable != -1 &&  tipoPrograma != 0 &&  programa != 0){
							renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(unidadResponsable), parseInt(tipoPrograma), parseInt(programa));    
					    }else
					    	if(entidad != 0 &&  nivel != 0 &&  unidadResponsable != -1 &&  tipoPrograma != 0){
								renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(unidadResponsable), parseInt(tipoPrograma));    
						    }else
						    	if(entidad != 0 &&  nivel != 0 &&  unidadResponsable != -1 ){
									renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(unidadResponsable));    
							    }else
							    	if(entidad != 0 &&  nivel != 0){
										renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad));    
								    }else
								    	if(nivel != 0){
											renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel));    
									    }else{
				renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), 0,0);    
		    }
		
			if(parseInt(eje)!=0 && parseInt(linea)!=0 && parseInt(estrategia)!=0){
				if($(this).children().hasClass("bj-entidades")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("[title=Entidades]").click();
				}
				if($(this).children().hasClass("bj-resultados")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("[title=Objetivos]").click();
				}
				if($(this).children().hasClass("bj-productos")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("#Cadena").click();
				}
				if($(this).children().hasClass("bj-destinatarios")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("#Destinatarios").click();			
				}
				if($(this).children().hasClass("bj-presupuesto")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("[title=Presupuesto]").click();			
				}
			}else{
				if($(this).children().children().children().hasClass("bj-entidades")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);			
					$("[title=Entidades]").click();
					
				}
				if($(this).children().children().children().hasClass("bj-resultados")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("[title=Objetivos]").click();
				}
				if($(this).children().children().children().hasClass("bj-productos")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("#Cadena").click();
				}
				if($(this).children().children().children().hasClass("bj-destinatarios")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("#Destinatarios").click();			
				}
				if($(this).children().children().children().hasClass("bj-presupuesto")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidadResponsable);
					$("[title=Presupuesto]").click();			
				}
			}		
							
			});

		renderGraficosEstrategia("Entidades", 		"pieChart");
		renderGraficosEstrategia("Resultados",		"pieChart");
		renderGraficosEstrategia("Productos", 		"pieChart");
		renderGraficosEstrategia("Destinatarios", 	"pieChart");
		renderGraficosEstrategia("Presupuesto", 	"pieChart");
		
		var columnas=[];
		columnas.push()
		columnas.push(["DESARROLLO SOCIAL EQUITATIVO", 30, 200, 200, 400, 0, 250]);	
		columnas.push(["SERVICIOS SOCIALES DE CALIDAD", 130, 100, 100, 200, 150, 50]);
		columnas.push(["DESARROLLO LOCAL PARTICIPATIVO", 20, 200, 200, 0, 250, 250]);
		columnas.push(["HÁBITAT ADECUADO Y SOSTENIBLE", 3, 200, 200, 400, 50, 250]);
		columnas.push(["EMPLEO Y SEGURIDAD SOCIAL", 0, 200, 200, 300, 250, 250]);
		columnas.push(["COMPETITIVIDAD E INNOVACIÓN", 30, 200, 200, 400, 150, 250]);
		columnas.push(["REGIONALIZACIÓN Y DIVERSIFICACIÓN PRODUCTIVA", 130, 100, 100, 200, 150, 50]);
		columnas.push(["VALORIZACIÓN DEL CAPITAL AMBIENTAL", 230, 200, 200, 300, 250, 250]);
		columnas.push(["IGUALDAD DE OPORTUNIDADES EN UN MUNDO GLOBALIZADO", 30, 200, 200, 400, 0, 250]);
		columnas.push(["ATRACCIÓN DE INVERSIONES, COMERCIO EXTERIOR E IMAGEN PAÍS", 130, 100, 100, 200, 150, 50]);
		columnas.push(["INTEGRACIÓN ECONÓMICA REGIONAL", 30, 200, 200, 300, 250, 250]);
		columnas.push(["SOSTENIBILIDAD DEL HÁBITAT GLOBAL", 20, 200, 200, 400, 50, 250]);

		var estrategias=["DESARROLLO SOCIAL EQUITATIVO","SERVICIOS SOCIALES DE CALIDAD","DESARROLLO LOCAL PARTICIPATIVO","HÁBITAT ADECUADO Y SOSTENIBLE","EMPLEO Y SEGURIDAD SOCIAL","COMPETITIVIDAD E INNOVACIÓN","REGIONALIZACIÓN Y DIVERSIFICACIÓN PRODUCTIVA","VALORIZACIÓN DEL CAPITAL AMBIENTAL","IGUALDAD DE OPORTUNIDADES EN UN MUNDO GLOBALIZADO","ATRACCIÓN DE INVERSIONES, COMERCIO EXTERIOR E IMAGEN PAÍS","INTEGRACIÓN ECONÓMICA REGIONAL", "SOSTENIBILIDAD DEL HÁBITAT GLOBAL"];
		var categorias=[ "PRESIDENCIA DE LA REPÚBLICA",
		               "MINISTERIO DEL INTERIOR",
		               "MINISTERIO DE RELACIONES EXTERIORES",
		               "MINISTERIO DE DEFENSA NACIONAL",
		               "MINISTERIO DE HACIENDA",
		               "MINISTERIO DE EDUCACION Y CULTURA"
		               ];	
			
		var chart = c3.generate({
			bindto: '#entidadesSegunEstrategia',
		    data: {
		        columns: columnas,
		        type: 'bar',
		        groups: [estrategias ]
		    },
		    grid: {
		        y: {
		            lines: [{value:0}]
		        }
		    },
		    axis: {
		        x: {
		            type: 'category',
		            categories: categorias
		        },
		        rotated: true
		    }
		});
		/*setTimeout(function () {
		    chart.groups([['data1', 'data2', 'data3']])
		}, 1000);
		setTimeout(function () {
		    chart.load({
		        columns: [['data4', 100, 50, 150, 200, 300, 100]]
		    });
		}, 1500);*/
		/*setTimeout(function () {
		    chart.groups([['data1', 'data2', 'data3', 'data4']])
		}, 2000);*/
});
