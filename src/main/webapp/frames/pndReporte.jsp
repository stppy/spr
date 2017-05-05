	<div style="page-break-before: always"></div>
	<script type="text/javascript">
		
	</script>
	<h2 align="center">Anexo A: Plan Nacional de Desarrollo</h2>
	<h4 align="center"><strong>Estrategias PND</strong></h4>
	<div class=" box-body estrategiasPND">
	</div>

	<script>
	$(document).ready(function(){
		var estrategias = $.ajax({
			url:'/ajaxSelects?accion=getEstrategias',
	    	type:'get',
	        dataType:'json',
	        async:false       
	    }).responseText;
		estrategias = JSON.parse(estrategias);
		estrategias = estrategias.estrategias;
		
		var objetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getObjetivosEstrategicos',//&estrategia='+estrategias[i].codigoPilar
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
	  	objetivos = JSON.parse(objetivos);
	  	objetivos = objetivos.objetivos;
		
	  	var indicadores = $.ajax({
	      	url:'/ajaxSelects?accion=getIndicadoresPnd', //&objetivo='+objetivos[j].objetivo_id
	        	type:'get',
	        	dataType:'json',
	        	async:false       
	      }).responseText;
	    indicadores = JSON.parse(indicadores);
		indicadores = indicadores.indicadores;
		
		var metas = $.ajax({
	      	url:'/ajaxSelects?accion=getMetasPnd', //&indicador='+indicadores[k].id
	        	type:'get',
	        	dataType:'json',
	        	async:false       
	      }).responseText;
		metas = JSON.parse(metas);
		metas = metas.metas;
		      	
		var i =0; 
		for(i = 0;i<estrategias.length; i++){
			var j=0;		
			$("div.estrategiasPND").append('<div class="box-header">'+
		           	'<h3 class="box-title tituloEstrategiaPnd" id="" estrategia="'+estrategias[i].codigoPilar+'">'+estrategias[i].pilarNombre+'</h3>'+
		            '<div class="box-body listaObjetivosReporte" id="estrategia-contenedor-'+estrategias[i].codigoPilar+'" estrategia="'+estrategias[i].codigoPilar+'" style="display:block;" >'+
		            '<ul style="line-height: 10px;">');
			for(j = 0;j<objetivos.length; j++){
				var k=0;
				if(objetivos[j].estrategia_id == estrategias[i].codigoPilar){
					$("div.estrategiasPND").append('<li objetivo="'+objetivos[j].objetivo_id+'">'+objetivos[j].objetivoNombre+'<ul>');
					for(k = 0;k<indicadores.length; k++){
						var l=0;
						if(indicadores[k].objetivo_id == objetivos[j].objetivo_id){
							$("div.estrategiasPND").append('<li indicador="'+indicadores[j].id+'">'+indicadores[j].nombre+'<ul>');
							/* for(l = 0;l<metas.length; l++){
								$("div.estrategiasPND").append('<li meta="'+metas[l].id+'">'+metas[j].nombre+'</li>');
							} */
							$("div.estrategiasPND").append('</ul></li>');
						}
					}
					$("div.estrategiasPND").append('</ul></li>');
				}
				$("div.estrategiasPND").append('</ul>');
			}
			$("div.estrategiasPND").append('</div></div>');
		}	
	});
	</script>  	  	