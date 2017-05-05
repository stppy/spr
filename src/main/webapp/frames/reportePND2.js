$( document ).ready(function() {
	var anho = 2017;
	var version = 2;

	var entidad=0; var nivel=0; var tipoPrograma=0; var programa=0; var subprograma=0; var proyecto=-1; var producto=0; var unidad_responsable=0; 


	/**********selector de niveles***********/
	var datosNiveles = $.ajax({
		url:'/ajaxSelects?accion=getNiveles'+'&borrado=false',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	datosNiveles = JSON.parse(datosNiveles);
	datosNiveles = datosNiveles.niveles;

	var optionPNDnivel="<option value='0' selected>Nivel</option>";

	for(var a = 0; a < datosNiveles.length; a++){
		if (datosNiveles[a].nivel != 1){
			optionPNDnivel+='<option value="'+datosNiveles[a].nivel+'" >'+datosNiveles[a].nivel+' - '+datosNiveles[a].nombreNivel+'</option>';
		}
	}
	$("#selectorDeNivel").html(optionPNDnivel);
	
	//-------------change de nivel-------------//
	$("body").on("change", "#selectorDeNivel",function(event){
		var parametros = $("#selectorDeNivel option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    var optionPNDentidad="";
	    
	    //limpieza de los selectores dependientes, variables y la matriz
	    $("#selectorDeEntidad").html("<option value='' selected >Entidad</option>");
	    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");    	
    	entidad=0; tipoPrograma=0; programa=0; subprograma=0; proyecto=-1; producto=0;
    	vaciarMatriz();
	    
	    if (parametros != "0"){
		
		    /**********selector de entidades***********/
			var pndNivelEntidad = $.ajax({
				url:'/ajaxSelects?accion=getPNDne&nivel='+nivel, //no requiere parametro de borrado pues la vista ya filtra los borrados.
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			pndNivelEntidad = JSON.parse(pndNivelEntidad);
			
			if (pndNivelEntidad != null){
				var optionPNDentidad="<option value='0-0' selected >Entidad</option>";
				for(var e = 0; e < pndNivelEntidad.length; e++){
					optionPNDentidad+='<option value="'+pndNivelEntidad[e].nivel_id+'-'+pndNivelEntidad[e].entidad_id+'" >'+pndNivelEntidad[e].entidad_id+' - '+pndNivelEntidad[e].entidad_sigla+'</option>';
				}
				$("#selectorDeEntidad").html(optionPNDentidad);
			}else{
				var optionPNDentidad="<option value=''>No posee entidades</option>";
				$("#selectorDeEntidad").html(optionPNDentidad);
			}
	    } else {	    	
	    	//Obtiene los totales a nivel pais si se deselecciona un nivel.
	    	nivel=0;
	    	obtenerTotales("0-0", "0", "0");
	    	
			vaciarMatriz();
	    }
			    
	});
	
	
	
	//-------------change de entidad-------------//
	$("body").on("change", "#selectorDeEntidad",function(event){
		var parametros = $("#selectorDeEntidad option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    var optionPNDtipoPrograma = "";
	    
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeTipoPresupuesto").html("<option value='' selected >Tipo de Programa</option>");	    		    	
    	$("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	tipoPrograma=0; programa=0; subprograma=0; proyecto=-1; producto=0; 
	    
	    if (parametros != "0-0"){
	    	obtenerTotales(parametros, nivel, entidad);
			
			//falta actualizar el modal
			vaciarMatriz();		
		
			/**********selector de tipo programa***********/
		    var tiposPrograma = $.ajax({
		    	url:'/ajaxSelects?accion=getTiposPrograma'+'&borrado=false',
		    	type:'get',
		    	dataType:'json',
		    	async:false       
		    }).responseText;
		    tiposPrograma = JSON.parse(tiposPrograma);
		    tiposPrograma = tiposPrograma.tiposPrograma;
		    
		    if (tiposPrograma != null){
		    	var optionPNDtipoPrograma='<option value="'+nivel+'-'+entidad+'" selected >Tipo de Programa</option>';
		    	for(var o = 0; o < tiposPrograma.length; o++){
		    		optionPNDtipoPrograma+='<option value="'+nivel+'-'+entidad+'-'+tiposPrograma[o].numeroFila+'" >'+tiposPrograma[o].numeroFila+' - '+tiposPrograma[o].nombreTipoPrograma+'</option>';
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
	
    //-------------change de tipo programa-------------//
	$("body").on("change", "#selectorDeTipoPresupuesto",function(event){
		var parametros = $("#selectorDeTipoPresupuesto option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    tipoPrograma = idParsed[2];
	    var optionPNDprograma ="";
	    
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDePrograma").html("<option value='' selected>Programa</option>");
    	$("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	programa=0; subprograma=0; proyecto=-1; producto=0; 
	    
	    if (tipoPrograma != undefined){
		    obtenerTotales(parametros, nivel, entidad, tipoPrograma);
			
			//falta actualizar el modal
			vaciarMatriz();
			
			/**********selector de programa***********/
			var datosProgramas = $.ajax({
		    	url:'/ajaxSelects?accion=getProgramasPND&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&borrado=false',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
		    datosProgramas = JSON.parse(datosProgramas);
		    datosProgramas = datosProgramas.programas;
	    		
	    	if (datosProgramas != null){
		    	var optionPNDprograma='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'" selected >Programa</option>';
		    	for(var u = 0; u < datosProgramas.length; u++){
		    		optionPNDprograma+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+datosProgramas[u].codigoPrograma+'" >'+datosProgramas[u].codigoPrograma+' - '+datosProgramas[u].nombrePrograma+'</option>';
		    	}
		    	$("#selectorDePrograma").html(optionPNDprograma);
		    }else{
		    	var optionPNDprograma="<option value=''>No posee programas</option>";
		    	$("#selectorDePrograma").html(optionPNDprograma);
		    }
		} else {		
			tipoPrograma=0;
	    	obtenerTotales(parametros, nivel, entidad);
			
			vaciarMatriz();
		}
	    
	});
	
	
    
    //-------------change de programa-------------//
	$("body").on("change", "#selectorDePrograma",function(event){
		var parametros = $("#selectorDePrograma option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    tipoPrograma = idParsed[2];
	    programa = idParsed[3];
	    var optionPNDsubprograma="";
	    
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeSubPrograma").html("<option value='' selected>Sub Programa</option>");
      	$("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	subprograma=0; proyecto=-1; producto=0; 
	    
	    if (programa != undefined){
	    
		    obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa);
			
			//falta actualizar el modal
			vaciarMatriz();
			
			/**********selector de sub programa***********/
			var datosSubProgramas = $.ajax({
		    	url:'/ajaxSelects?accion=getSubprogramasPND&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&borrado=false',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
	
		    datosSubProgramas = JSON.parse(datosSubProgramas);
		    datosSubProgramas = datosSubProgramas.subprogramas;
	    
	    	if (datosSubProgramas != null){
		    	var optionPNDsubprograma='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'" selected >Sub Programa</option>';
		    	for(var u = 0; u < datosSubProgramas.length; u++){
		    		optionPNDsubprograma+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+datosSubProgramas[u].id+'" >'+datosSubProgramas[u].id+' - '+datosSubProgramas[u].nombre+'</option>';
		    	}
		    	$("#selectorDeSubPrograma").html(optionPNDsubprograma);
		    }else{
		    	var optionPNDsubprograma="<option value=''>No posee sub programas</option>";
		    	$("#selectorDeSubPrograma").html(optionPNDsubprograma);
		    }
		} else {			
			programa=0;
	    	obtenerTotales(parametros, nivel, entidad, tipoPrograma);
			
			vaciarMatriz();
		}
	});
	
	
    
    //-------------change de sub programa-------------//
    $("body").on("change", "#selectorDeSubPrograma",function(event){
		var parametros = $("#selectorDeSubPrograma option:selected").val();
	    var idParsed = parametros.split("-");  
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    tipoPrograma = idParsed[2];
	    programa = idParsed[3];
	    subprograma = idParsed[4];
	    var optionPNDproyecto="";
	    
	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeProyecto").html("<option value='' selected >Proyecto</option>");
    	$("#selectorDeProducto").html("<option value='' selected >Producto</option>");
    	proyecto=-1; producto=0; 
	    
	    if (subprograma != undefined){
	    	obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa, subprograma);
			
			//falta actualizar el modal
			vaciarMatriz();
				
			/**********selector de proyecto***********/
			var proyectos = $.ajax({
		    	url:'/ajaxSelects?accion=getProyectosPND&borrado=false&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
	
			proyectos = JSON.parse(proyectos);
			proyectos = proyectos.proyectos;
	
		    if (proyectos != null){
		    	var optionPNDproyecto='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'" selected >Proyecto</option>';
		    	for(var u = 0; u < proyectos.length; u++){
		    		optionPNDproyecto+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyectos[u].codigoProyecto+'" >'+proyectos[u].codigoProyecto+' - '+proyectos[u].nombreProyecto+'</option>';
		    	}
		    	$("#selectorDeProyecto").html(optionPNDproyecto);
		    }else{
		    	var optionPNDproyecto="<option value=''>No posee proyectos</option>";
		    	$("#selectorDeProyecto").html(optionPNDproyecto);
		    }
		} else {				      		    	
			subprograma=0;
			obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa);
			
			vaciarMatriz();
		}
	});
    
   
    
    //-------------change de proyecto-------------//
    $("body").on("change", "#selectorDeProyecto",function(event){
		var parametros = $("#selectorDeProyecto option:selected").val();
	    var idParsed = parametros.split("-"); 
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    tipoPrograma = idParsed[2];
	    programa = idParsed[3];
	    subprograma = idParsed[4];
	    proyecto = idParsed[5];
	    var optionPNDproductos ="";
	    

	    //limpieza de los selectores dependientes y la matriz
	    $("#selectorDeProducto").html("<option value='' selected >Producto</option>");
	    producto=0;
	    
	    if (proyecto != undefined){
	    	obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa, subprograma, proyecto);
			
			//falta actualizar el modal
			vaciarMatriz();
				
			/**********selector de producto***********/
			var datosProductos = $.ajax({
		      url:'/ajaxSelects?accion=getProductosPresupuestoPND&borrado=false'+'&anho='+anho+'&nivel='+nivel+'&entidad='+entidad+'&tipoPrograma='+tipoPrograma+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto,
		      type:'get',
		      dataType:'json',
		      async:false       
		    }).responseText;
		    datosProductos = JSON.parse(datosProductos);
		    datosProductos = datosProductos.producto;
	    
		    if (datosProductos != null){
		    	var optionPNDproductos='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'" selected >Producto</option>';
		    	
		    	for(var u = 0; u < datosProductos.length; u++){		    		
		    		var producto = $.ajax({
		  		      url:'/ajaxSelects?accion=getProductos&producto='+datosProductos[u].producto_id,
		  		      type:'get',
		  		      dataType:'json',
		  		      async:false       
		  		    }).responseText;
		  		    producto = JSON.parse(producto);
		  		    producto = producto.productos;
		  		    
		    		optionPNDproductos+='<option value="'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+datosProductos[u].producto_id+'" >'+datosProductos[u].producto_id+' - '+producto[0].nombreCatalogo+'</option>';

		    	}
		    	$("#selectorDeProducto").html(optionPNDproductos);
		    }else{
		    	var optionPNDproductos="<option value=''>No posee productos</option>";
		    	$("#selectorDeProducto").html(optionPNDproductos);
		    }
		} else {				    		    	
			proyecto=-1;
			obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa, subprograma);
			
			vaciarMatriz();
		}
    });
    
    
    
    //-------------change de producto-------------//
    $("body").on("change", "#selectorDeProducto",function(event){
		var parametros = $("#selectorDeProducto option:selected").val();
	    var idParsed = parametros.split("-");  
	    nivel = idParsed[0];
	    entidad = idParsed[1];
	    tipoPrograma = idParsed[2];
	    programa = idParsed[3];
	    subprograma = idParsed[4];
	    proyecto = idParsed[5];
	    producto = idParsed[6];
	    

	    if (producto != undefined){
	    	obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto);
	    	
			//falta actualizar el modal
			vaciarMatriz();
	    } else {
	    	producto=0;
			obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa, subprograma, proyecto);
			
			vaciarMatriz();
		}
    });
    
	$("body").on("change", "#optionDestinatario",function(event){
		var catalogo=$(this).find('option:selected').val();
		getTotalesDestinatario(eje, linea, estrategia, catalogo, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);	
		layerMapa="mapaDestinatarios";
		deptoDest.eachLayer(function(l){deptoDest.resetStyle(l);});
	});
	
	$("body").on("change", "#optionMes",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var eje = idParsed[0];
	    var linea = idParsed[1];
	    var estrategia= idParsed[2];
		var mesPND = $("#optionMes option:selected").val();
				
		MetasPND(eje,linea,estrategia, mesPND,  nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
		layerMapa="mapaMetas";
		deptoMeta.eachLayer(function(l){deptoMeta.resetStyle(l);});
	});
	
	function obtenerTotales(parametros, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto){
		
		var url1 = 'http://spr.stp.gov.py/ajaxSelects?accion=getTotalesPnd&nivelId='+nivel+'&entidadId='+entidad;
		
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
		
		actualizarTotalPND(totalesPorNivelEntidad, parametros);
		
		var url2 = 'http://spr.stp.gov.py/ajaxSelects?accion=getTotalesPorEje&nivelId='+nivel+'&entidadId='+entidad;
		
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
		
		actualizarTotalesPorEjes(totalesPorEjePorNivelEntidad, parametros);			

		var url3 = 'http://spr.stp.gov.py/ajaxSelects?accion=getEntidadesPorEstrategia&nivelId='+nivel+'&entidadId='+entidad;
		
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
		
		cantEntidades=cantEntidades.sort(compareEstrategia);
		
		actualizarTotalesPorEstrategia(totalesPorNivelEntidad, cantEntidades, parametros);
		
		
		//falta arreglar modal
		vaciarMatriz();
	}
	
	function actualizarTotalPND(totalesPorNivelEntidad, parametros){
		$(" [objeto=estrategia][cod=0]").find(".bj-entidades").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].entidades)));
		if(parametros!='0-0') $(" [objeto=estrategia][cod=0]").find(".bj-entidades").html($("#selectorDeEntidad option:selected").text());
		$(" [objeto=estrategia][cod=0]").find(".bj-resultados").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].objetivos)));
		$(" [objeto=estrategia][cod=0]").find(".bj-productos").html(numeroConComa(parseFloat(totalesPorNivelEntidad[0].productos)));
		$(" [objeto=estrategia][cod=0]").find(".bj-destinatarios").html(numeroConComa(parseInt(totalesPorNivelEntidad[0].destinatarios)));
		$(" [objeto=estrategia][cod=0]").find(".bj-presupuesto").html(numeroConComa(parseInt(totalesPorNivelEntidad[0].presupuesto/1000000))+" MM");
		
	}
	
	function actualizarTotalesPorEjes(totalesPorEje, parametros){
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
		
		for (var i=0; i<totalesPorEje.length; i++){
			totalDestinatarios+=parseFloat(totalesPorEje[i].destinatarios);
			totalPresupuesto+=parseFloat(totalesPorEje[i].presupuesto);
			totalEntidades+=parseFloat(totalesPorEje[i].entidades);
			totalObjetivos+=parseFloat(totalesPorEje[i].objetivos);
			totalProductos+=parseFloat(totalesPorEje[i].productos);
		}
		
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
		
		for (var i=0; i<ejes.length; i++){
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").removeClass("collapsed-box");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html(ejes[i].entidades+"   <small>"+parseInt((ejes[i].entidades/totalEntidades)*100)+"%</small>");
			if(parametros!='0-0') $(" [objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-entidades").html($("#selectorDeEntidad option:selected").text());
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-resultados").html(ejes[i].objetivos+"   <small>"+parseInt((ejes[i].objetivos/totalObjetivos)*100)+"%</small>");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-productos").html(ejes[i].productos+"   <small>"+parseInt((ejes[i].productos/totalProductos)*100)+"%</small>");
			if (totalDestinatarios != 0){
				$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-destinatarios").html(numeroConComa(parseInt(ejes[i].destinatarios))+"   <small>"+parseInt(((ejes[i].destinatarios)/totalDestinatarios)*100)+"%</small>");
			}else{
				$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-destinatarios").html(numeroConComa(parseInt(ejes[i].destinatarios))+"   <small>"+parseInt(totalDestinatarios)+"%</small>");
			}
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".bj-presupuesto").html(numeroConComa(parseInt(ejes[i].presupuesto/1000000))+" MM    <small>"+parseInt(((ejes[i].presupuesto)/totalPresupuesto)*100)+"%</small>");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".destinatarios-ratio").attr("style","width:"+parseInt(((ejes[i].destinatarios)/totalDestinatarios)*100)+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".productos-ratio").attr("style","width:"+parseInt(((ejes[i].productos)/totalProductos)*100)+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".resultados-ratio").attr("style","width:"+parseInt(((ejes[i].objetivos)/totalObjetivos)*100)+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".entidades-ratio").attr("style","width:"+parseInt(((ejes[i].entidades)/totalEntidades)*100)+"%");
			$("[objeto=eje][cod="+ejes[i].eje_estrategico_id+"]").find(".presupuesto-ratio").attr("style","width:"+parseInt(((ejes[i].presupuesto)/totalPresupuesto)*100)+"%");
		}
	}
	
	function actualizarTotalesPorEstrategia(totalesPorNivelEntidad, cantEntidades, parametros){

		var totalDestinatarios=parseFloat(0);
		var totalPresupuesto=parseFloat(0);
		var totalEntidades=parseFloat(0);
		var totalObjetivos=parseFloat(0);
		var totalProductos=parseFloat(0);
	 	for (var i=0; i<cantEntidades.length; i++){
	 		totalDestinatarios+=cantEntidades[i].destinatarios;
	 		totalPresupuesto+=parseFloat(cantEntidades[i].presupuesto);
	 		totalEntidades+=parseFloat(cantEntidades[i].entidades);
	 		totalObjetivos+=parseFloat(cantEntidades[i].objetivos);
	 		totalProductos+=parseFloat(cantEntidades[i].productos);
	 	}

		for (var i=1; i<=12; i++){
			$("[objeto=estrategia][cod="+i+"]").addClass("collapsed-box");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-entidades").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-resultados").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-productos").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-destinatarios").html("0");
			$("[objeto=estrategia][cod="+i+"]").find(".bj-presupuesto").html("0");
		}
		
		for (var i=0; i<cantEntidades.length; i++){
			$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").removeClass("collapsed-box");
			fraccionPresupuesto=numeroConComa(parseFloat((cantEntidades[i].presupuesto)/totalPresupuesto)*100);
			$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-entidades").html(cantEntidades[i].entidades);
		   	//if(parametros!='0-0') $(" [objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-entidades").html($("#selectorDeEntidad option:selected").text());
			$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-resultados").html(cantEntidades[i].objetivos);
			$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-productos").html(cantEntidades[i].productos);
			if (totalDestinatarios != 0){
				$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-destinatarios").html(numeroConComa((parseFloat(cantEntidades[i].destinatarios)/totalDestinatarios)*100)+"%");
			}else{
				$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-destinatarios").html(numeroConComa(parseFloat(cantEntidades[i].destinatarios))+"%");
			}
			$("[objeto=estrategia][cod="+cantEntidades[i].estrategia_id+"]").find(".bj-presupuesto").html(fraccionPresupuesto+"%: "+numeroConComa(parseFloat(cantEntidades[i].presupuesto)));
		}
	}
	
	var deptoDest, mapDest, catalogo_destinatario=0, promedioDestinatario=[], eje, linea, estrategia, rango, q;
	var mapMeta, layerMapa;
	var deptoMeta, deptoAsig;

	
	//$("#indicadorDeCarga").attr("aria-hidden","false");
	var mapa_destinatario
	var pndMetasDeptojson
	var pndAsignacionjson
	var pndMetasDepto
	var pndAsignacion
	
	function obtenerTotalesMapa(nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto){
		//llamadas que alimentan a los mapas
		var condicion="";
		
		if (entidad != null )condicion += '&entidad='+entidad;
		if (nivel != null )condicion += '&nivel='+nivel;
		if (tipoPrograma != null) condicion += '&tipoPrograma='+tipoPrograma;
		if (programa != null) condicion += '&programa='+programa;
		if (subprograma != null)condicion += '&subprograma='+subprograma;
		if (proyecto != null) condicion += '&proyecto='+proyecto;
		if (producto != null) condicion += '&producto='+producto;
		
		
		mapa_destinatario = $.ajax({
			url:'/ajaxSelects?accion=getMapaDestinatarioPND'+condicion,
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
	}
	var catalogo_dest = $.ajax({
		url:'/ajaxSelects?accion=getCatalogoDestinatario',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	catalogo_dest = JSON.parse(catalogo_dest);
	catalogo_dest=catalogo_dest.catalogo_destinatario;
	var optioncatalogo_dest="";
	
	var datosMeses = $.ajax({
		url:'/ajaxSelects?accion=getMeses',
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
		url:'/ajaxSelects?accion=getEntidadesPorEstrategia&anho='+anho+'&version='+version,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	cantEntidades = JSON.parse(cantEntidades);
	
	var totalesPresupuesto = $.ajax({
		url:'/ajaxSelects?accion=getTotalesPnd&anho='+anho+'&version='+version,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	totalesPresupuesto = JSON.parse(totalesPresupuesto);
	
	var totalesPorEje = $.ajax({
		url:'/ajaxSelects?accion=getTotalesPorEje&anho='+anho+'&version='+version,
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
	var porcentajeAsignacion = new Array(18);
	var totalAsigPais = 0;
	var totalMetaPais = 0;
	var acumTotalAsig = 0;
	var acumTotalMeta = 0;
	
	function AsignacionPND(eje, linea, estrategia, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable){
	
		if(eje == 0 && linea == 0 && estrategia == 0){
			for(w=0;w<=17;w++){
				for (y=0;y<pndMetasDepto.length;y++){
					if(pndMetasDepto[y].departamento_id == w){					
						for (x=0;x<pndAsignacion.length;x++){
							if(pndAsignacion[x].prod_concat == pndMetasDepto[y].prod_concat){				
								TotalMetaFinanciera += pndAsignacion[x].total_asignacion
								TotalMetaFisica += pndMetasDepto[y].total_metas
							}
							/*if(pndAsignacion[x].anho == 2017 && pndMetasDepto[y].anho == 2017){
								acumTotalAsig += pndAsignacion[x].total_asignacion
								acumTotalMeta += pndMetasDepto[y].total_metas
							}*/
						}
					}
				}
				cantAsigXDepto[w]=TotalMetaFinanciera;
				TotalMetaFinanciera = 0;
				cantMetaXDepto[w]=TotalMetaFisica;
				TotalMetaFisica = 0;
				/*totalAsigPais = acumTotalAsig;
				acumTotalAsig = 0 ;
				totalMetaPais = acumTotalMeta;
				acumTotalMeta = 0 ;*/
				costoUnitarioSupuesto[w] = cantAsigXDepto[w] / cantMetaXDepto[w];
				porcentajeAsignacion[w] = costoUnitarioSupuesto[w] * cantMetaXDepto[w];
			}
		}else{
			if(eje!="0" && linea!="0" && estrategia!="0"){
				for(w=0;w<=17;w++){
					for (y=0;y<pndMetasDepto.length;y++){
						if(pndMetasDepto[y].departamento_id == w){			
							for (x=0;x<pndAsignacion.length;x++){
								if(pndAsignacion[x].eje_estrategico_id == eje && pndAsignacion[x].linea_transversal_id == linea && pndAsignacion[x].estrategia_id == estrategia && pndAsignacion[x].prod_concat == pndMetasDepto[y].prod_concat){
									TotalMetaFinanciera += pndAsignacion[x].total_asignacion
									TotalMetaFisica += pndMetasDepto[y].total_metas
								}
							}
						}
					}
					cantAsigXDepto[w]=TotalMetaFinanciera;
					TotalMetaFinanciera = 0;
					cantMetaXDepto[w]=TotalMetaFisica;
					TotalMetaFisica = 0;
					costoUnitarioSupuesto[w] = cantAsigXDepto[w] / cantMetaXDepto[w];
					porcentajeAsignacion[w] = costoUnitarioSupuesto[w] * cantMetaXDepto[w];
				}
			}else{
				if(eje!="0"){
					for(w=0;w<=17;w++){
						for (y=0;y<pndMetasDepto.length;y++){
							if(pndMetasDepto[y].departamento_id == w){
								for (x=0;x<pndAsignacion.length;x++){
									if(pndAsignacion[x].eje_estrategico_id == eje && pndAsignacion[x].prod_concat == pndMetasDepto[y].prod_concat){		
										TotalMetaFinanciera += pndAsignacion[x].total_asignacion
										TotalMetaFisica += pndMetasDepto[y].total_metas
									}
								}
							}
						}
						cantAsigXDepto[w]=TotalMetaFinanciera;
						TotalMetaFinanciera = 0;
						cantMetaXDepto[w]=TotalMetaFisica;
						TotalMetaFisica = 0;
						costoUnitarioSupuesto[w] = cantAsigXDepto[w] / cantMetaXDepto[w];
						porcentajeAsignacion[w] = costoUnitarioSupuesto[w] * cantMetaXDepto[w];
					}
				}
			}
		}
		
		asig=d3.scale.quantile().domain(porcentajeAsignacion).range([0,10,20,30,40,50,60,70,80,90,100]);
	}
	
	var acum = 0;
	var cantMetasXDepto = new Array(18);
	var porcentajeMetas = new Array(18);
	var totalMetaPais = 0;
	var acumTotal = 0;
	
	function MetasPND(eje, linea, estrategia, mesPND, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable){
	
			if(eje == 0 && linea == 0 && estrategia == 0 && mesPND == 0){
				for(w=0;w<=17;w++){
					for (x=0;x<pndMetasDepto.length;x++){
						if(pndMetasDepto[x].departamento_id == w){					
							acum += pndMetasDepto[x].total_metas
						}
						if(pndMetasDepto[x].departamento_id != 88 && pndMetasDepto[x].departamento_id != 99){
							acumTotal += pndMetasDepto[x].total_metas
						}
					}
					cantMetasXDepto[w]=acum;
					acum = 0;
					totalMetaPais = acumTotal;
					acumTotal = 0 ;
					porcentajeMetas[w] = cantMetasXDepto[w] * 100 / totalMetaPais;
				}
			}else{
				if(eje!="0" && linea!="0" && estrategia!="0"){
					for(m=0; m<=12; m++){
						if(mesPND == m){
							for(w=0;w<=17;w++){
								for (x=0;x<pndMetasDepto.length;x++){
									if(pndMetasDepto[x].departamento_id == w && pndMetasDepto[x].eje_estrategico_id == eje && pndMetasDepto[x].linea_transversal_id == linea && pndMetasDepto[x].estrategia_id == estrategia && mesPND == 0 && pndMetasDepto[x].departamento_id != 88 && pndMetasDepto[x].departamento_id != 99){
										acum += pndMetasDepto[x].total_metas
									}else{
										if(pndMetasDepto[x].departamento_id == w && pndMetasDepto[x].eje_estrategico_id == eje && pndMetasDepto[x].linea_transversal_id == linea && pndMetasDepto[x].estrategia_id == estrategia && pndMetasDepto[x].mes == m && pndMetasDepto[x].departamento_id != 88 && pndMetasDepto[x].departamento_id != 99){
											acum += pndMetasDepto[x].total_metas
										}
									}
									if(pndMetasDepto[x].departamento_id != 88 && pndMetasDepto[x].departamento_id != 99){
										acumTotal += pndMetasDepto[x].total_metas
									}
								}
								cantMetasXDepto[w]=acum;
								acum = 0;
								totalMetaPais = acumTotal;
								acumTotal = 0 ;
								porcentajeMetas[w] = cantMetasXDepto[w] * 100 / totalMetaPais;
							}
						}
					}
				}else{
					if(eje!="0"){
						for(m=0; m<=12; m++){
							if(mesPND == m){
								for(w=0;w<=17;w++){
									for (x=0;x<pndMetasDepto.length;x++){
										if(pndMetasDepto[x].departamento_id == w && pndMetasDepto[x].eje_estrategico_id == eje && mesPND == 0){		
											acum += pndMetasDepto[x].total_metas
										}else{
											if(pndMetasDepto[x].departamento_id == w && pndMetasDepto[x].eje_estrategico_id == eje && pndMetasDepto[x].mes == m ){		
												acum += pndMetasDepto[x].total_metas
											}
										}
										if(pndMetasDepto[x].departamento_id != 88 && pndMetasDepto[x].departamento_id != 99){
											acumTotal += pndMetasDepto[x].total_metas
										}
									}
									cantMetasXDepto[w]=acum;
									acum = 0;
									totalMetaPais = acumTotal;
									porcentajeMetas[w] = cantMetasXDepto[w] * 100 / totalMetaPais;
									acumTotal = 0 ;
								}
							}
								
						}
					}else{
						if(mesPND!="0"){
							for(m=0; m<=12; m++){
								if(mesPND == m){
									for(w=0;w<=17;w++){
										for (x=0;x<pndMetasDepto.length;x++){
											if(pndMetasDepto[x].departamento_id == w && pndMetasDepto[x].mes == m){		
												acum += pndMetasDepto[x].total_metas
											}
											if(pndMetasDepto[x].departamento_id != 88 && pndMetasDepto[x].departamento_id != 99){
												acumTotal += pndMetasDepto[x].total_metas
											}
										}
										cantMetasXDepto[w]=acum;
										acum = 0;
										totalMetaPais = acumTotal;
										porcentajeMetas[w] = cantMetasXDepto[w] * 100 / totalMetaPais;
										acumTotal = 0 ;
									}
								}
							}
						}
					}
				}
			}
			q=d3.scale.quantile().domain(porcentajeMetas).range([0,10,20,30,40,50,60,70,80,90,100]);
	}
	
	function getTotalesDestinatario(eje, linea, estrategia, catalogo_destinatario, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable){
		var porcentaje=0; porcentajeDestinatario=[];		
		for(depto=0;depto<=17;depto++){
			porcentaje=getPorcentajeDestinatario(eje, linea, estrategia, depto, catalogo_destinatario, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
			porcentajeDestinatario.push(porcentaje);		
		}
		rango=d3.scale.quantile().domain(porcentajeDestinatario).range([0,10,20,30,40,50,60,70,80,90,100]);	
	}
	
	function getPorcentajeDestinatario(eje, linea, estrategia, dpto, catalogo_destinatario, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable){
		
		var acum=0, cont=0, promedio=0;	total=0, porcentaje=0;
		
		for(i=0;i<mapa_destinatario.length;i++){			
			if(eje==0 && linea==0 && estrategia==0 && catalogo_destinatario==0){
				if(mapa_destinatario[i].departamento==dpto){
					acum=acum+mapa_destinatario[i].cant_destinatarios;
					//cont=cont+1;	
				}
				total=total+mapa_destinatario[i].cant_destinatarios;
			}else{
				if(eje==0 && linea==0 && estrategia==0 && catalogo_destinatario!=0){
					if(mapa_destinatario[i].departamento==dpto && mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
						acum=acum+mapa_destinatario[i].cant_destinatarios;
						//cont=cont+1;	
					}
					if(mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
						total=total+mapa_destinatario[i].cant_destinatarios;
					}				
				}else{
					if(eje!=0 && linea==0 && estrategia==0 && catalogo_destinatario==0){
						if(mapa_destinatario[i].departamento==dpto && mapa_destinatario[i].eje_estrategico==eje){
								acum=acum+mapa_destinatario[i].cant_destinatarios;
								//cont=cont+1;
						}
						if(mapa_destinatario[i].eje_estrategico==eje){
							total=total+mapa_destinatario[i].cant_destinatarios;
						}					
					}else{
						if(eje!=0 && linea==0 && estrategia==0 && catalogo_destinatario!=0){
							if(mapa_destinatario[i].departamento==dpto && mapa_destinatario[i].eje_estrategico==eje 
									&& mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
								acum=acum+mapa_destinatario[i].cant_destinatarios;
								//cont=cont+1;
							}
							if(mapa_destinatario[i].eje_estrategico==eje && mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
								total=total+mapa_destinatario[i].cant_destinatarios;
							}						
						}else{
							if(eje!=0 && linea!=0 && estrategia!=0 && catalogo_destinatario==0){
								if(mapa_destinatario[i].departamento==dpto && mapa_destinatario[i].eje_estrategico==eje 
										&& mapa_destinatario[i].linea_transversal==linea && mapa_destinatario[i].estrategia==estrategia){
									acum=acum+mapa_destinatario[i].cant_destinatarios;
									//cont=cont+1;
								}
								if(mapa_destinatario[i].eje_estrategico==eje && mapa_destinatario[i].linea_transversal==linea 
										&& mapa_destinatario[i].estrategia==estrategia){
									total=total+mapa_destinatario[i].cant_destinatarios;
								}							
							}else{
								if(eje!=0 && linea!=0 && estrategia!=0 && catalogo_destinatario!=0){
									if(mapa_destinatario[i].departamento==dpto && mapa_destinatario[i].eje_estrategico==eje 
											&& mapa_destinatario[i].linea_transversal==linea && mapa_destinatario[i].estrategia==estrategia
											&& mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
										acum=acum+mapa_destinatario[i].cant_destinatarios;
										//cont=cont+1;
									}
									if(mapa_destinatario[i].eje_estrategico==eje && mapa_destinatario[i].linea_transversal==linea && mapa_destinatario[i].estrategia==estrategia
											&& mapa_destinatario[i].catalogo_destinatario==catalogo_destinatario){
										total=total+mapa_destinatario[i].cant_destinatarios;
									}
									
								}
							}
						}
					}
				}
			}		
			//total=total+mapa_destinatario[i].cant_destinatarios;		
		}
		//promedio=acum/cont;
		porcentaje=(acum*100)/total;	
		return porcentaje;
		
	}
	
	$("#indicadorDeCarga").attr("aria-hidden","true", nivel, entidad);
	
	function mapaPrevio (eje, linea, estrategia, mesPND, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable){
			
		getTotalesDestinatario(eje, linea, estrategia, 0, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
		MetasPND(eje, linea, estrategia, mesPND, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
		AsignacionPND(eje, linea, estrategia, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable)
		
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
		
		function getPromedio(depto){		
				return parseInt(porcentajeDestinatario[depto]);		
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
						fillColor: getColor(rango(getPromedio(feature.properties.dpto))),
				        weight: 2,
				        color: 'white',
				        dashArray: '2',
				        fillOpacity: 0.6
				    };
				}else{
					if(layerMapa=="mapaMetas"){
						return {
							fillColor: getColor(q(verifDptoExistsMetas(parseInt(feature.properties.dpto)))),
					        weight: 2,
					        color: 'white',
					        dashArray: '2',
					        fillOpacity: 0.6
					    };
					}else{
						if(layerMapa=="mapaAsignacion"){
							return {
								fillColor: getColor(asig(verifDptoExistsAsig(parseInt(feature.properties.dpto)))), //cambiar la variable q por otro
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
		
		//Se crean los tres mapas		
		mapDest = L.map('mapaDestinatarios',{
			maxZoom: 10,
			minZoom: 5,
			center: true
		}).setView([-23.2, -60], 5);
		
		layerMapa="mapaDestinatarios";
		deptoDest = new L.geoJson(deptoGeojson,{style:style, onEachFeature: onEachFeature});
		deptoDest.addTo(mapDest);
		
		mapMeta = L.map('mapaMetas',{
			maxZoom: 10,
			minZoom: 5,
			center: true
		}).setView([-23.2, -60], 5);
		
		layerMapa="mapaMetas";
		deptoMeta = new L.geoJson(deptoGeojson,{style:style, onEachFeature: onEachFeature});	
		deptoMeta.addTo(mapMeta);
		
		mapAsig = L.map('mapaAsignacion',{
			maxZoom: 10,
			minZoom: 5,
			center: true
		}).setView([-23.2, -60], 5);
		
		layerMapa="mapaAsignacion";
		deptoAsig = new L.geoJson(deptoGeojson,{style:style,onEachFeature: onEachFeature});
		deptoAsig.addTo(mapAsig);
		
		mapAsig.invalidateSize(); 
		mapDest.invalidateSize();
		mapMeta.invalidateSize();
		
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
		       	 porcentajeDestinatario[props.dpto].toFixed(2) + '%' : 'Apunte sobre el mapa.');
		};
		infoDest.addTo(mapDest);
		
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
		       	 porcentajeMetas[props.dpto].toFixed(2) + '%' : 'Apunte sobre el mapa.');
		};
		
		infoMeta.addTo(mapMeta);
		
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
		       	 '<b>' + props.dpto_desc + '</b><br />' +
		       	numeroConComa(porcentajeAsignacion[props.dpto]) + ' Gs.' : 'Apunte sobre el mapa.');
		};
		
		infoAsig.addTo(mapAsig);
		
		//leyenda del mapa  
		var legend = L.control({position: 'bottomleft'});
		
		//creación de la leyenda
		legend.onAdd = function (map) {
	
		    this._div = L.DomUtil.create('div', 'info legend');// crea un div con la class "info legend"
		    
		    var div = L.DomUtil.create('div', 'info legend'),
	        grades = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
	        labels = [];
		    
		    this._div.innerHTML = '<h5>Rango: </h5>'
	
		    //bucle de creacion de porcentaje y generacion de una etiqueta con un cuadrado de color para cada intervalo
		    	for (var i = 0; i < grades.length-1; i++) {
					if(i==0){
						this._div.innerHTML +=
				        	'<p><i style="background:' + getColor(grades[i] + 1) + '"></i>MIN</p>';
					}else{
						if(i!=9){
							this._div.innerHTML +=
					            '<p><i style="background:' + getColor(grades[i]+1) + '"></i></p><br>';
						}else{					
							this._div.innerHTML +=
					        	'<p><i style="background:' + getColor(grades[i]+1) + '"></i>MAX</p>';
							}				
					}	
				}
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
		
		legend.addTo(mapDest);
		legend.addTo(mapMeta);
		legend.addTo(mapAsig);
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
				var myDoughnutChart = new Chart(ctx, {
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
				});
				
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
		 		totalPresupuesto+=parseFloat(cantEntidades[i].presupuesto);
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
				   $( this ).find(".bj-presupuesto").html(fraccionPresupuesto+"%: "+numeroConComa(parseFloat(cantEntidades[i].presupuesto)));
				   
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
					totalPresupuesto+=parseFloat(totalesPorEje[i].presupuesto);
					totalEntidades+=parseFloat(totalesPorEje[i].entidades);
			 		totalObjetivos+=parseFloat(totalesPorEje[i].objetivos);
			 		totalProductos+=parseFloat(totalesPorEje[i].productos);
				}
				
			   for (var i=0; i<totalesPorEje.length; i++){
				   if ($( this ).attr("cod")==totalesPorEje[i].eje_estrategico_id){
					   $( this ).find(".bj-entidades").html(totalesPorEje[i].entidades+"   <small>"+parseInt((totalesPorEje[i].entidades/totalEntidades)*100)+"%</small>");
					   $( this ).find(".bj-resultados").html(totalesPorEje[i].objetivos+"   <small>"+parseInt((totalesPorEje[i].objetivos/totalObjetivos)*100)+"%</small>");
					   $( this ).find(".bj-productos").html(totalesPorEje[i].productos+"   <small>"+parseInt((totalesPorEje[i].productos/totalProductos)*100)+"%</small>");
					   $( this ).find(".bj-destinatarios").html(numeroConComa(parseInt(totalesPorEje[i].destinatarios))+"   <small>"+parseInt(((totalesPorEje[i].destinatarios)/totalDestinatarios)*100)+"%</small>");
					  // $( this ).find(".bj-presupuesto").html(numeroConComa(parseFloat(totalesPorEje[i].presupuesto)));
					     $( this ).find(".bj-presupuesto").html(numeroConComa(parseInt(totalesPorEje[i].presupuesto/1000000))+" MM    <small>"+parseInt(((totalesPorEje[i].presupuesto)/totalPresupuesto)*100)+"%</small>");
					   
					     $( this ).find(".destinatarios-ratio").attr("style","width:"+parseInt(((totalesPorEje[i].destinatarios)/totalDestinatarios)*100)+"%");
					     $( this ).find(".productos-ratio").attr("style","width:"+parseInt(((totalesPorEje[i].productos)/totalProductos)*100)+"%");
					     $( this ).find(".resultados-ratio").attr("style","width:"+parseInt(((totalesPorEje[i].objetivos)/totalObjetivos)*100)+"%");
						 $( this ).find(".entidades-ratio").attr("style","width:"+parseInt(((totalesPorEje[i].entidades)/totalEntidades)*100)+"%");
						 $( this ).find(".presupuesto-ratio").attr("style","width:"+parseInt(((totalesPorEje[i].presupuesto)/totalPresupuesto)*100)+"%");
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
	    var pndContenido
		function renderModalEstrategiasPND(eje, linea, estrategia, objeto, mesPND, nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto){
			
			if (f[eje][linea] == "99"){
	
			if ( $("#modalC1F1Entidades").length )
			{
				$("#modalC1F1Entidades").remove();
			}		
			var clase="";
			var estrategiaNombre="";
			var ejeNombre="";
			var lineaNombre="";
			var condicion="";
			
			if (nivel != 0 )condicion += '&nivel='+nivel;
			if (entidad != 0 )condicion += '&entidad='+entidad;
			if (tipoPrograma != null) condicion += '&tipoPrograma='+tipoPrograma;
			if (programa != null) condicion += '&programa='+programa;
			if (subprograma != null)condicion += '&subprograma='+subprograma;
			if (proyecto != null) condicion += '&proyecto='+proyecto;
			if (producto != null) condicion += '&producto='+producto;
			
			if (eje==1){clase="bg-green"; ejeNombre="Reducción de pobreza y desarrollo social";}
			if (eje==2){clase="bg-orange"; ejeNombre="Crecimiento económico inclusivo";}
			if (eje==3){clase="bg-primary";ejeNombre="Eje 3: Inserción de Paraguay en el mundo";}
			var cuerpoModalC1F1Entidades = "";
			
			var cuerpoTablaObjetivos = "";
			var cabeceraBoxInfo = "";
			var contenedorCabeceraConcat = "";
			
			pndContenido = $.ajax({
		    	url:'/ajaxSelects?accion=getPnd&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			pndContenido = JSON.parse(pndContenido);
			
			var pndProductosContenido = $.ajax({
		    	url:'/ajaxSelects?accion=getPndProductos&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			pndProductosContenido = JSON.parse(pndProductosContenido);
			
			var totalesEntidad = $.ajax({
		    	url:'/ajaxSelects?accion=getContadoresPNDporEntidad&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,

		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			totalesEntidad = JSON.parse(totalesEntidad);
			
			var totalesObjetivos = $.ajax({
		    	url:'/ajaxSelects?accion=getContadoresPNDporObjetivos&estrategia='+estrategia+'&eje='+eje+'&linea='+linea+condicion,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			totalesObjetivos = JSON.parse(totalesObjetivos);
			
			
			obtenerTotalesMapa(nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto);
			
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
				lineaNombre="TODOS";
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
				if(objetivos.indexOf(pndContenido[i].objetivo_estrategico_nombre)<0){
					objetivos.push(pndContenido[i].objetivo_estrategico_nombre);
				}
			}
			var resultados=[];
			for (var i=0; i<pndContenido.length;i++){
				if(resultados.indexOf(pndContenido[i].resultado_esperado_nombre)<0){
					resultados.push(pndContenido[i].resultado_esperado_nombre);
				}
			} 
			
			var productosConcat=[];
			var productos=[];
			for (var i=0; i<pndProductosContenido.length;i++){
				if(productosConcat.indexOf(pndProductosContenido[i].prod_concat)<0){
					productosConcat.push(pndProductosContenido[i].prod_concat);
					var objeto=new Object();
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
									productos[j].presupuesto=pndProductosContenido[i].presupuesto;
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
			
			var destinatariosCategoriaNombre=[];
			var destinatariosCategoriaCantidad=[];
			var destinatariosCategoriaTipo=[];
			var destinatariosConcat=[];
			var productoDestinatarios=[];
			for (var i=0; i<pndContenido.length;i++){
				if(destinatariosCategoriaNombre.indexOf(pndContenido[i].nombre_catalogo_destinatario)<0){
					destinatariosCategoriaNombre.push(pndContenido[i].nombre_catalogo_destinatario);
					destinatariosCategoriaCantidad.push(parseFloat(pndContenido[i].cant_destinatarios));
					destinatariosCategoriaTipo.push(pndContenido[i].tipo_nombre_catalogo_destinatario);
					destinatariosConcat.push(pndContenido[i].prod_concat);
					productoDestinatarios.push(pndContenido[i].producto_nombre)
				}else{
					for (var j=0; j<destinatariosCategoriaNombre.length;j++){
						if (destinatariosCategoriaNombre[j]==pndContenido[i].nombre_catalogo_destinatario){
							destinatariosCategoriaCantidad[j]+=parseFloat(pndContenido[i].cant_destinatarios);
						}
					}
				}
			}
			
		
			function renderEntidades(siglas){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableEntidades">'+
							'		<thead><th>Cód.</th><th>Nombre Entidad</th><th>Objetivos PND</th><th>Resultados</th><th>Productos</th><th>Destinatarios</th><th>Gs. 2017</th></thead>'+
							'		<tbody>';
				for (var i=0; i<siglas.length;i++){
					text+='<tr><td>'+siglas[i].ne_concat+'</td><td><a href="../pndEntidades.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+' " target="_blank">'+siglas[i].entidad_nombre+'</a></td><td>'+numeroConComa(siglas[i].objetivos)+'</td><td>'+numeroConComa(siglas[i].productos)+'</td><td>'+numeroConComa(siglas[i].resultados)+'</td><td>'+numeroConComa(siglas[i].destinatarios)+'</td><td class="text-right">'+numeroConComa(siglas[i].presupuesto)+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			
			function renderObjetivos(objetivos){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableResultados">'+
							'		<thead><th>Objetivos PND</th><th>Entidades</th><th>Resultados</th><th>Productos</th><th>Destinatarios</th><th style="display:none">Gs. 2017</th><th >Presupuesto</th></thead>'+
							'		<tbody>';
				objetivos=objetivos.sort(comparePresupuesto);
				for (var i=0; i<objetivos.length;i++){
					var presupuesto = objetivos[i].presupuesto.toString(); 
					 presupuesto=presupuesto.split(".");
					 presupuesto=parseFloat(presupuesto);
					text+='<tr><td><a href="../pndObjetivos.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+' " target="_blank">'+objetivos[i].objetivo_estrategico_nombre+'</a></td><td>'+numeroConComa(objetivos[i].entidades)+'</td><td>'+numeroConComa(objetivos[i].resultados)+'</td><td>'+numeroConComa(objetivos[i].productos)+'</td><td>'+numeroConComa(objetivos[i].destinatarios)+'</td><td class="text-right">'+numeroConComa(presupuesto)+'</td><td style="display:none">'+presupuesto+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			function renderProductos(productos){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableProductos">'+
							'		<thead><th>Cód.</th><th>Nombre</th><th>Clase</th><th>Unidad de Medida</th><th>Cantidad 2017</th><th>Cantidad 2018</th><th>Cantidad 2019</th><th>Costo 2017 (Gs.)</th></thead>'+
							'		<tbody>';
				
				var idParsed = "";
				for (var i=0; i<productos.length;i++){
					text+='<tr><td>'+productos[i].concat+'</td><td><a href="../pndProductos.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+'" target="_blank" >'+productos[i].nombre+'</a></td><td>'+productos[i].clase+'</td><td>'+productos[i].unidad_medida+'</td><td>'+numeroConComa(productos[i].cantidad2017)+'</td><td>'+numeroConComa(productos[i].cantidad2018)+'</td><td>'+numeroConComa(productos[i].cantidad2019)+'</td><td class="text-right">'+numeroConComa(productos[i].presupuesto)+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			function renderDestinatarios(destinatariosCategoriaNombre,destinatariosCategoriaCantidad){
				var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableDestinatarios">'+
							'		<thead><th>Nombre de Productos</th><th>Tipo de Destinatarios</th><th>Grupo de Destinatarios</th><th>Cód.</th><th>Cantidad</th></thead>'+
							'		<tbody>';
				for (var i=0; i<destinatariosCategoriaNombre.length;i++){
					if(destinatariosCategoriaNombre[i]){
						text+='<tr><td>'+productoDestinatarios[i]+'</td><td>'+destinatariosCategoriaTipo[i]+'</td><td>'+destinatariosCategoriaNombre[i]+'</td><td>'+destinatariosConcat[i]+'</td><td>'+numeroConComa(destinatariosCategoriaCantidad[i])+'</td></tr>';
					}
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';
				return text;
			}
			
			function renderDepartamentos(){
				/*var text= 	'<div class="table-responsive">'+
							'	<table class="table table-striped table-bordered table-hover" id="dataTableDepartamentos">'+
							'		<thead><th>Grupo de Destinatarios</th><th>Tipo de Destinatarios</th>, <th>Cantidad</th></thead>'+
							'		<tbody>';
				for (var i=0; i<destinatariosCategoriaNombre.length;i++){
					text+='<tr><td></td><td><a href="../pndDestinatarios.jsp" target="_blank" >'+destinatariosCategoriaNombre[i]+'</a></td><td>'+numeroConComa(destinatariosCategoriaCantidad[i])+'</td></tr>';
				}
				text+=		'		</tbody>'+
							'	</table>'+
							'</div>';*/
				var optionMeses;
				
				optioncatalogo_dest+='<option value="0" >TODOS</option>';
				for(i = 0;i<catalogo_dest.length; i++){
					optioncatalogo_dest+='<option value="'+catalogo_dest[i].id+'" >'+catalogo_dest[i].nombre+'</option>';
				}
				
				for(var u = 0; u < datosMeses.length; u++){
					optionMeses+='<option value="'+datosMeses[u].id+'">'+datosMeses[u].nombre+'</option>';
				}
				
				var text=	'<div class="table-responsive">'+
	            			'    <div class="row">'+
	            			'        <div class="col-md-4">'+
	            			'            <div class="box box-default">'+
	            			'                <div class="box-header with-border">'+
	            			'                    <i class="fa fa-users"></i>'+
	            			'                    <h3 class="box-title">Destinatarios</h3>'+            			
	            			'                </div>'+//fin-box-header
	            			'                <div class="box-body id="bodyDestinatario">'+
	            			'                    <div id="mapaDestinatarios" style="width: 600x; height: 400px"></div>'+
	            			'                </div>'+//fin-box-body
	            			'                <div class="box-footer">'+
	            			'						<form role="form">'+
							'	            			<div class="form-group">'+
							'	            				<label for="sel1">Seleccione el tipo de destinatario:</label>'+
							'						<select name="catalogo_destinatario" id="optionDestinatario" class="form-control">'+optioncatalogo_dest+'</select>'+						
							'	            		    </div>'+
							'	            		  </form>'+
	            			'                </div>'+//fin-box-footer
	            			'            </div>'+//fin-box
	            			'        </div>'+
	            			'        <div class="col-md-4">'+
	            			'            <div class="box box-default">'+
	            			'                <div class="box-header with-border">'+
	            			'                   <i class="fa fa-flag-checkered"></i>'+
	            			'                   <h3 class="box-title">Metas  '+
	            			
	            			
	            			'					</h3>'+
	            			'                </div>'+//fin-box-header
	            			'                <div class="box-body">'+
	            			'                    <div id="mapaMetas" style="width: 600x; height: 400px"></div>'+
	            			'                </div>'+//fin-box-body
	
	            			'                <div class="box-footer" id="slider">'+
	            			'						<form role="form">'+
							'	            			<div class="form-group">'+
							'	            				<label for="sel1">Selecciona el mes:</label>'+
							'	            					<select class="form-control" id="optionMes" parametros="'+eje+'-'+linea+'-'+estrategia+'" title="Mes">'+
							'										<option value="0"><i>TODOS</i></option>'+optionMeses+
							'		            		        </select>'+
							'	            		    </div>'+
							'	            		  </form>'+
	            			'                </div>'+//fin-box-footer
	            			'            </div>'+//fin-box
	            			'        </div>'+
	            			'        <div class="col-md-4">'+
	            			'            <div class="box box-default">'+
	            			'                <div class="box-header with-border">'+
	            			'                    <i class="fa fa-money"></i>'+
	            			'                    <h3 class="box-title">Asignación Financiera</h3>'+
	            			'                </div>'+//fin-box-header
	            			'                <div class="box-body">'+
	            			'                    <div id="mapaAsignacion" style="width: 600x; height: 400px"></div>'+
	            			'                </div>'+//fin-box-body
	            			'            </div>'+//fin-box
	            			'        </div>'+
	            			'</div>';
				return text;
			}
	        var entregas =parseFloat(0);
	        var monto =parseFloat(0);
	        
	        for(var e = 0;e<productos.length; e++){
				monto+=parseFloat(productos[e].presupuesto);
			}
	        for(var e = 0;e<destinatariosCategoriaCantidad.length; e++){
				entregas+=parseFloat(destinatariosCategoriaCantidad[e]);
			}
	        
	        
	        
	        entregas=numeroConComa(entregas);
	        monto=numeroConComa(monto);
	        
			cuerpoModalC1F1Entidades =	'<div class="modal fade" id="modalC1F1Entidades" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'		<div class="modal-dialog modal-lg" style="width:90%">'+
									'			<div class="modal-content" >'+
									'				<div class="modal-header '+clase+'">'+
									'		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
									'					<h5 class="modal-title" id="concatCabecera"></h5>'+  
									'		        	<h4 class="modal-title"><strong>Estrategia:</strong>'+estrategiaNombre+'</h4>'+   
									'					<h5 class="modal-title"><strong>Eje Estrategico: </strong>'+ejeNombre+', <strong>Linea Transversal: </strong>'+lineaNombre+'</h5>'+
									'				</div>'+
									'			    <div class="modal-body" id="modalNivelGlobal">'+
							     	'					<div class="nav-tabs-custom">'+
					                '						<ul class="nav nav-tabs pull-right">'+
					              	'							<li><a href="#tab_1-1" data-toggle="tab"  title="Entidades"><i class="fa fa-building"></i></a></li>'+
					                '							<li><a href="#tab_4-2" data-toggle="tab" title="Destinatarios"><i class="fa fa-users"></i></a></li>'+
					                '							<li><a href="#tab_2-2" data-toggle="tab" title="Objetivos"><i class="fa  fa-chain "></i></a></li>'+
					                '							<li><a href="#tab_3-2" data-toggle="tab" title="Productos"><i class="fa fa-truck"></i></a></li>'+
					                '							<li><a href="#tab_6-2" data-toggle="tab" title="Estructura"><i class="fa fa-sitemap"></i></a></li>'+
					                '							<li style="position: relative; top: 10px;"><small><i class="fa fa-arrow-right"></i></small></li>'+
					                '							<li><a href="#tab_5-2" data-toggle="tab" title="Departamentos"><i class="fa fa-map-marker"></i></a></li>'+
					                '						</ul>'+
					                '						<div class="tab-content">'+
					                '							<div class="tab-pane" id="tab_1-1">'+renderEntidades(totalesEntidad)+'</div>'+
					                '							<div class="tab-pane" id="tab_2-2"><p>'+renderObjetivos(totalesObjetivos)+'</p></div>'+
					                '							<div class="tab-pane" id="tab_3-2">'+renderProductos(productos)+'</div>'+
					                '							<div class="tab-pane" id="tab_4-2">'+renderDestinatarios(destinatariosCategoriaNombre,destinatariosCategoriaCantidad)+'</div>'+
					                '							<div class="tab-pane" id="tab_6-2">'+renderEstructura(entregas, monto, resultados, productos, clase)+'</div>'+
					                '							<div class="tab-pane" id="tab_5-2">'+renderDepartamentos()+'</div>'+
					                '						</div>'+
					              	'					</div>'+
									'				</div>'+
									'			</div>'+ 
									'		</div>'+
									'	</div>'; //programa producto resultado entrega cosoto
	
			$("body").append(cuerpoModalC1F1Entidades);
			$("#modalC1F1Entidades").modal('show');
			
			
			//cuerpo de la tabla de objetivos por 
			cuerpoTablaObjetivos ='	<div class="box-body">'+
            '							<div><p>'+renderObjetivos(totalesObjetivos)+'</p></div>'+
			'						</div>';
			$("#tablaObjetivos").append(cuerpoTablaObjetivos);
			
			
			//cabecera del box contenedor de todo
			cabeceraBoxInfo ='	<div class="box-header '+clase+'">'+
			'		        		<h4 class="modal-title"><strong>Estrategia:</strong>'+estrategiaNombre+'</h4>'+   
			'						<h5 class="modal-title"><strong>Eje Estrategico: </strong>'+ejeNombre+', <strong>Linea Transversal: </strong>'+lineaNombre+'</h5>'+
			'					</div>';
			$("#cabeceraTitulo").append(cabeceraBoxInfo);
			
			var nivelNombre = $("#selectorDeNivel option:selected").text();
			var entidadNombre = $("#selectorDeEntidad option:selected").text();
			var tipoProgramaNombre = $("#selectorDeTipoPresupuesto option:selected").text();
			var programaNombre = $("#selectorDePrograma option:selected").text();
			var subProgramaNombre = $("#selectorDeSubPrograma option:selected").text();
			var proyectoNombre = $("#selectorDeProyecto option:selected").text();
			var productoNombre = $("#selectorDeProducto option:selected").text();
			
			
			//cabecera modal concat
			if (nivel != 0 && entidad != 0 && tipoPrograma != undefined && programa != undefined && subprograma != undefined && proyecto != undefined && producto != undefined){
				var contenedorCabeceraConcat = "";
				contenedorCabeceraConcat =+nivel+' > '+entidad+' > '+tipoPrograma+' > '+programa+' > '+subprograma+' > '+proyecto+' > <strong>'+productoNombre+'</strong><br><hr>';
				$("#concatCabecera").append(contenedorCabeceraConcat);
			}else {
				if (nivel != 0 && entidad != 0 && tipoPrograma != undefined && programa != undefined && subprograma != undefined && proyecto != undefined){
					var contenedorCabeceraConcat = "";
					contenedorCabeceraConcat =+nivel+' > '+entidad+' > '+tipoPrograma+' > '+programa+' > '+subprograma+' > <strong>'+proyectoNombre+'</strong><br><hr>';
					$("#concatCabecera").append(contenedorCabeceraConcat);
				}else {
					if (nivel != 0 && entidad != 0 && tipoPrograma != undefined && programa != undefined && subprograma != undefined){
						var contenedorCabeceraConcat = "";
						contenedorCabeceraConcat =+nivel+' > '+entidad+' > '+tipoPrograma+' > '+programa+' > <strong>'+subProgramaNombre+'</strong><br><hr>';
						$("#concatCabecera").append(contenedorCabeceraConcat);
					}else{
						if (nivel != 0 && entidad != 0 && tipoPrograma != undefined && programa != undefined){
							var contenedorCabeceraConcat = "";
							contenedorCabeceraConcat =+nivel+' > '+entidad+' > '+tipoPrograma+' > <strong>'+programaNombre+'</strong><br><hr>';
							$("#concatCabecera").append(contenedorCabeceraConcat);
						}else{
							if (nivel != 0 && entidad != 0 && tipoPrograma != undefined){
								var contenedorCabeceraConcat = "";
								contenedorCabeceraConcat =+nivel+' > '+entidad+' > <strong>'+tipoProgramaNombre+'</strong><br><hr>';
								$("#concatCabecera").append(contenedorCabeceraConcat);
							}else{
								if (nivel != 0 && entidad != 0){
									var contenedorCabeceraConcat = "";
									contenedorCabeceraConcat =+nivel+ ' > <strong>'+entidadNombre+'</strong><br><hr>';
									$("#concatCabecera").append(contenedorCabeceraConcat);
								}else{
									if (nivel != 0){
										contenedorCabeceraConcat ='<strong>'+nivelNombre+'</strong><br><hr>';
										$("#concatCabecera").append(contenedorCabeceraConcat);
									}
								}
							}
						}
					}
				}
			}
			
			
			
			
			$("#dataTableEntidades").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				}
			} );
			$("#dataTableResultados").DataTable( {
		        dom: 'Bfrtip',
		        "order": [[ 6, "desc" ]],
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				}
			} );
			$("#dataTableProductos").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
				}
			} );
			$("#dataTableDestinatarios").DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ],
				"search": {
		            "regex": true
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
				$("#dataTableEntidades").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					}
				} );
				$("#dataTableResultados").DataTable( {
			        dom: 'Bfrtip',
			        "order": [[ 6, "desc" ]],
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					}
				} );
				$("#dataTableProductos").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					}
				} );
				$("#dataTableDestinatarios").DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
					"search": {
			            "regex": true
					}
				} );
			}
	
		}
		
		
		$("body").on("change", ".sizeSelector",function(event){
			$(this).closest(".contenedorCharts").attr("class", "col-md-"+$(this).val()+" contenedorCharts");
			
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
	   	    
		    //obtenerTotalesMapa(nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto);
		    
		    if(entidad != 0 &&  nivel != 0 &&  tipoPrograma != 0 &&  programa != 0 &&  subprograma != 0 &&  proyecto != -1 &&  producto != 0){
				renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(tipoPrograma), parseInt(programa), parseInt(subprograma), parseInt(proyecto), parseInt(producto));    
		    }else
		    	if(entidad != 0 &&  nivel != 0 &&  tipoPrograma != 0 &&  programa != 0 &&  subprograma != 0 &&  proyecto != -1 ){
					renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(tipoPrograma), parseInt(programa), parseInt(subprograma), parseInt(proyecto));    
			    }else
			    	if(entidad != 0 &&  nivel != 0 &&  tipoPrograma != 0 &&  programa != 0 &&  subprograma != 0){
						renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(tipoPrograma), parseInt(programa), parseInt(subprograma));    
				    }else
				    	if(entidad != 0 &&  nivel != 0 &&  tipoPrograma != 0 &&  programa != 0){
							renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(tipoPrograma), parseInt(programa));    
					    }else
					    	if(entidad != 0 &&  nivel != 0 &&  tipoPrograma != 0){
								renderModalEstrategiasPND(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(objeto), parseInt(mesPND), parseInt(nivel), parseInt(entidad), parseInt(tipoPrograma));    
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
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Entidades]").click();
					
				}
				if($(this).children().hasClass("bj-resultados")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Objetivos]").click();
					
				}
				if($(this).children().hasClass("bj-productos")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Productos]").click();
					
				}
				if($(this).children().hasClass("bj-destinatarios")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Destinatarios]").click();			
				}
			}else{
				if($(this).children().children().children().hasClass("bj-entidades")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);			
					$("[title=Entidades]").click();
					
				}
				if($(this).children().children().children().hasClass("bj-resultados")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Objetivos]").click();
					
				}
				if($(this).children().children().children().hasClass("bj-productos")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Productos]").click();
					
				}
				if($(this).children().children().children().hasClass("bj-destinatarios")){
					$("[title=Departamentos]").click(); 
					mapaPrevio(parseInt(eje), parseInt(linea), parseInt(estrategia), parseInt(mesPND), nivel, entidad, tipoPrograma, programa, subprograma, proyecto, producto, unidad_responsable);
					$("[title=Destinatarios]").click();			
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
