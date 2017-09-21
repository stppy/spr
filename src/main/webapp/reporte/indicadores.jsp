<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>spr | STP</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
 <script src="../dist/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="//spr.stp.gov.py/dist/js/html5shiv.js"></script>
        <script src="//spr.stp.gov.py/dist/js/respond.min.js"></script>
    <![endif]-->
    <script src="../frames/main.js"></script>
	 <link href="../frames/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
div{
	border-top: 1px solid silver;
	}
</style>
</head>
<body onload="window.print();">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<script>
	$(document).ready(function(){
		var entidadCas = "";
		entidadCas = "<%= attributes.get("entidad") %>";
		var usuarios = $.ajax({
			url:'/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		var i=parseInt(0);
		var datosNiveles = $.ajax({
	        url:'/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	      datosNiveles = JSON.parse(datosNiveles);
	      datosNiveles=datosNiveles.niveles;
	      
	     var datosEntidad = $.ajax({
	          url:'/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	        datosEntidad = JSON.parse(datosEntidad);
	        datosEntidad=datosEntidad.entidades;
	        
	        var programas = $.ajax({
	        	url:'/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	        }).responseText;

			programas = JSON.parse(programas);
			programas = programas.programas;
	        
			var tiposPrograma = $.ajax({
		    	url:'/ajaxSelects?accion=getTiposPrograma',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText; 

			tiposPrograma = JSON.parse(tiposPrograma);
			tiposPrograma = tiposPrograma.tiposPrograma;
			
			var departamentos = $.ajax({
		    	url:'/ajaxSelects?accion=getDepartamentos',
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
			
			/*var optionUnidadResponsable='';
			var unidadesResponsables = $.ajax({
		    	url:'/ajaxSelects?accion=getUnidadesResponsables&anio=2017&nivel='+nivel+'&entidad='+entidad,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			unidadesResponsables = JSON.parse(unidadesResponsables);
			unidadesResponsables = unidadesResponsables.unidadesResponsables;
			for(var d = 0;d<unidadesResponsables.length; d++){
				optionUnidadResponsable+='<option value="'+unidadesResponsables[d].unrCodigo+'">'+unidadesResponsables[d].unrNombre+'</option>';
			}*/
						
		$("#tituloEntidad").children().append(usuarios[0].entidad);
		$("#hoja2-nombre-entidad").append(datosEntidad[0].nombreEntidad);
		$("#hoja2-abrev-entidad").append(datosEntidad[0].abrevEntidad);
		$("#hoja2-base-legal").append(datosEntidad[0].baseLegal);
		$("#hoja2-vision-entidad").append(datosEntidad[0].vision);
		$("#hoja2-mision-entidad").append(datosEntidad[0].mision);
		$("#hoja2-diagnostico").append(datosEntidad[0].diagnostico);
		$("#hoja2-objetivo-general").append(datosEntidad[0].objetivo);
		$("#hoja2-politica-institucional").append(datosEntidad[0].politica);
		$("#hoja3-nombre-entidad").append(datosEntidad[0].nombreEntidad);
		$("#hoja3-nivel-entidad").append(datosNiveles[0].nombreNivel);
	
		var subprogramaCuerpo='';
		for (var l = 1; l < 5; l++ )
		{
				var band=0;
				var programas = $.ajax({
	        	url:'/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	       		}).responseText;

				programas = JSON.parse(programas);
				programas = programas.programas;
				
			for(var m = 0; m < programas.length; m++)
			{
					var subprogramas = $.ajax({
		        	url:'/ajaxSelects?accion=getSubprogramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma,
		          	type:'get',
		          	dataType:'json',
		          	async:false       
			        }).responseText;

					subprogramas = JSON.parse(subprogramas); 
					subprogramas = subprogramas.subprogramas;
					subprogramaCuerpo='';
					for(var v=0; v < subprogramas.length; v++)
					{
							
	
								var proyectos = $.ajax({
						        	url:'/ajaxSelects?accion=getProyectos&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id,
						          	type:'get',
						          	dataType:'json', 
						          	async:false       
						        }).responseText; 
			
								proyectos = JSON.parse(proyectos);
								proyectos = proyectos.proyectos;
							
								for( var k=0; k<proyectos.length;k++)
								{	
									var objetivos = $.ajax({
								    	url:'/ajaxSelects?accion=getObjetivosEstrategicos&objetivo='+proyectos[k].objetivo_estrategico_id,
								      	type:'get',
								      	dataType:'json',
								      	async:false       
								    }).responseText;
								  	objetivos = JSON.parse(objetivos);
								  	objetivos = objetivos.objetivos;
								  	
									var estrategias = $.ajax({
								    	url:'/ajaxSelects?accion=getEstrategias&codigoPilar='+objetivos[0].estrategia_id,
								      	type:'get',
								      	dataType:'json',
								      	async:false       
								    }).responseText;
									estrategias = JSON.parse(estrategias);
								  	estrategias = estrategias.estrategias;
								  	
									var lineaTransversal = $.ajax({
								    	url:'/ajaxSelects?accion=getLineaTransversal&idLinea='+estrategias[0].lineaTransversal,
								      	type:'get',
								      	dataType:'json',
								      	async:false       
								    }).responseText;
									lineaTransversal = JSON.parse(lineaTransversal);
									lineaTransversal = lineaTransversal.lineaTransversal;
									
									var ejeEstrategico = $.ajax({
								    	url:'/ajaxSelects?accion=getEjeEstrategico&idEje='+estrategias[0].ejeEstrategico,
								      	type:'get',
								      	dataType:'json', 
								      	async:false
								    }).responseText;
									ejeEstrategico = JSON.parse(ejeEstrategico);
									ejeEstrategico = ejeEstrategico.ejeEstrategico;																				
											
						  	 		subprogramaCuerpo+='<div class="row">'+
													   		'<div class="col-md-12">';
														
																if(band==0)
																{
																	subprogramaCuerpo+='<h4>Tipo Presupuesto </4>'+l;	
																	band=1;
																}
											subprogramaCuerpo+='</div><!-- /.col -->'+  
														'</div><!-- /.row -->'+
						  	 							'<div class="row">'+
						 									'<div class="col-md-12">'+
																usuarios[0].nivel_id+'-'+usuarios[0].entidad_id+'-'+l+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+'-'+proyectos[k].codigoProyecto+'-'+proyectos[k].nombreProyecto+
															'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
														/*'<div class="row">'+
															'<div class="col-sm-12">'+
																'Nombre Proyecto: '+proyectos[k].nombreProyecto+
															'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+*/
								  	
						  	 							'<div class="row">'+
							  	 							'<div class="col-xs-3">'+
																'Estrategia: '+
															'</div><!-- /.col -->'+   
															'<div class="col-xs-9">'+ 
																estrategias[0].pilarNombre+
															'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
						  	 							'<div class="row">'+
							  	 							'<div class="col-xs-3">'+
				        										'Objetivo Estratégico PND: '+
					  										'</div><!-- /.col -->'+   
					  										'<div class="col-xs-9">'+ 
					  											objetivos[0].objetivoNombre+
					  										'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
														'<div class="row">'+
						  	 								'<div class="col-xs-3">'+
			        											'Linea Transversal: '+
				  											'</div><!-- /.col -->'+   
				  											'<div class="col-xs-9">'+ 
				  												lineaTransversal[0].nombre+
				  											'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
														'<div class="row">'+
					  	 									'<div class="col-xs-3">'+
																'Eje Estrategico: '+
															'</div><!-- /.col -->'+   
															'<div class="col-xs-9">'+ 
																ejeEstrategico[0].nombre+
															'</div><!-- /.col -->'+ 
														'</div></br><!-- /.row -->';
													
													resultados = $.ajax({
					          			            	url:'/ajaxSelects?accion=getResultados&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto,
					          			              	type:'get',
					          			              	dataType:'json',
					          			              	async:false       
					          			            }).responseText;  
				
					          			    		resultados = JSON.parse(resultados);
					          			    		resultados = resultados.resultados;						          						
					          			    		var indicadorResultado;
					          			    		var bandera=0;
					          			    		for(var n=0; n<resultados.length; n++)
					          						{
					          			    			if(bandera==0)
					          			    			{
					          			    		  		subprogramaCuerpo+='<div class="row">'+
										            						   		'<div class="col-xs-12">'+
										            									'<center>RESULTADOS ESPERADOS</center>'+
										            								'</div><!-- /.col -->'+       		       		
																				'</div></br><!-- /.row -->';
															bandera=1; 
					          			    			}
						          			    		subprogramaCuerpo+='<div class="row">'+
										            		'<div class="col-xs-3">'+
										            			'RESULTADO ESPERADO ';
										            	subprogramaCuerpo+=indicadorResultado=n+1+
										          			'</div><!-- /.col -->'+       		       		
															'<div class="col-xs-9">'+
										            			resultados[n].nombre+
										          			'</div><!-- /.col -->'+      		       		
														'</div></br><!-- /.row -->';
														
								          					  	var indicadores = $.ajax({
								          					    	url:'/ajaxSelects?accion=getIndicadoresPnd&objetivo='+resultados[n].id,
								          					      	type:'get',
								          					      	dataType:'json',
								          					      	async:false       
								          					    }).responseText;
								          	
								          					  	indicadores = JSON.parse(indicadores);
								          					  	indicadores = indicadores.indicadores;
								          						
								          						for(var h=0; h<indicadores.length; h++)
								          						{
								          							
								          							var unidadesMedida = $.ajax({
								          						    	url:'/ajaxSelects?accion=getUnidadesMedida',
								          						      	type:'get',
								          						      	dataType:'json',
								          						      	async:false       
								          						    }).responseText;
								          							unidadesMedida = JSON.parse(unidadesMedida);
								          							unidadesMedida = unidadesMedida.unidadesMedida;
								          							
								          							
								          							var metas = $.ajax({
								          						    	url:'/ajaxSelects?accion=getMetasPnd&indicador='+indicadores[h].id,
								          						      	type:'get',
								          						      	dataType:'json',
								          						      	async:false       
								          						    }).responseText;
								          						  
								          						  	metas = JSON.parse(metas);
								          						  	metas = metas.metas;
								          							
								          							subprogramaCuerpo+='<div class="row invoice-info">'+
														          			          		'<div class="col-xs-3">'+
														          			      				'INDICADOR:'+
														          			          		'</div><!-- /.col -->'+
														          			          		'<div class="col-xs-9">'+
														          			          			indicadores[h].nombre+
														          			          		'</div><!-- /.col -->'+
														          			         	'</div>'+
														          						'<div class="row invoice-info">'+
														          			          		'<div class="col-xs-3">'+
														          			      				'UNIDAD DE MEDIDA:'+
														          			          		'</div><!-- /.col -->'+
														          			          		'<div class="col-xs-9">';
														          			          			for (var s=0;s<unidadesMedida.length; s++)
														          			          			{
														          			          			if(unidadesMedida[s].codigoUnidadMedida == indicadores[h].unidad_medida_id)
														          			          				{
														          			          				subprogramaCuerpo+=unidadesMedida[s].nombre;
														          			          				}
														          			          			}
														          			          		subprogramaCuerpo+='</div><!-- /.col -->'+
														          			        	'</div>'+
														          						/*'<div class="row invoice-info">'+
														          			          		'<div class="col-sm-4 invoice-col">'+
														          			      				'FRECUENCIA DE MEDICION (meses):'+
														          			          		'</div><!-- /.col -->'+
														          			          		'<div class="col-sm-8 invoice-col">'+
														          			          			indicadores[h].frecuencia_meses+
														          			          		'</div><!-- /.col -->'+
														          			         	'</div>'+
														          						'<div class="row invoice-info">'+
														          			          		'<div class="col-sm-4 invoice-col">'+
														          			      				'METODOLOGIA DE CALCULO:'+
														          			          		'</div><!-- /.col -->'+
														          			          		'<div class="col-sm-8 invoice-col">'+
														          			          			indicadores[h].metodo_calculo_id+
														          			          		'</div><!-- /.col -->'+
														          			         	'</div>'+
														          						'<div class="row invoice-info">'+
														          			          		'<div class="col-sm-4 invoice-col">'+
														          			      				'FUENTE DE INFORMACION:'+
														          			          		'</div><!-- /.col -->'+
														          			          		'<div class="col-sm-8 invoice-col">'+
														          			          			indicadores[h].fuente_verificacion_id+
														          			          		'</div><!-- /.col -->'+
														          			         	'</div>'+*/
														          						'<div class="row invoice-info">'+
														          			          		'<div class="col-xs-3">'+
														          			      				'OBSERVACIONES:'+
														          			          		'</div><!-- /.col -->'+
														          			          		'<div class="col-xs-9">'+
														          			          			indicadores[h].observaciones+
														          			          		'</div><!-- /.col -->'+
														          			         	'</div>'+
														          			         	'</br>'+
														          			         	'<div class="row invoice-info">'+
														       		          				'<div class="col-xs-12">'+
														       		          					'<h5">EVOLUCIÓN DEL INDICADOR</h5>'+
												          		          					'</div><!-- /.col -->'+													          			         
														          			         	'</div>'+
														          			          	'<div class="row invoice-info">'+
														          		          			'<div class="col-xs-2">'+
														          		      					'2014'+
														          		          			'</div><!-- /.col -->'+
														          		          			'<div class="col-xs-2">'+
														          		      					'2015'+
														          		          			'</div><!-- /.col -->'+
														          		          			'<div class="col-xs-2">'+
														          		      					'2016'+
														          		          			'</div><!-- /.col -->'+
														          		          			'<div class="col-xs-2">'+
														          		      					'2017'+
														          		          			'</div><!-- /.col -->'+
														          		          			'<div class="col-xs-2">'+
														          		      					'2018'+
														          		          			'</div><!-- /.col -->'+
														          		          			/*'<div class="col-sm-2 invoice-col">'+
													          		      					'</div><!-- /.col -->'+*/
														          		         		'</div>'+
														          						'<div class="row invoice-info">';
														          		          			
														          		      				for(var g = 0; g < metas.length; g++)
														          		      				{
														          		      					if(metas[g].vencimiento == "2014-12-31")
														          		      					{
														          		      						subprogramaCuerpo+='<div class="col-xs-2">'+
														          		      											metas[g].cantidad+
														          		      											'</div><!-- /.col -->';
														          		      					}	
														       			          		          	
														          		      					if(metas[g].vencimiento == "2015-12-31")
														          		      					{
														          		      					subprogramaCuerpo+='<div class="col-xs-2">'+
														          		      										metas[g].cantidad+
														          		      										'</div><!-- /.col -->';
														          		      					} 
													          		      					
														          		      					if(metas[g].vencimiento == "2016-12-31")
														          		      					{
														          		      					subprogramaCuerpo+='<div class="col-xs-2">'+
														          		      										metas[g].cantidad+
														          		      										'</div><!-- /.col -->';
														          		      					}
													        
														          		      					if(metas[g].vencimiento == "2017-12-31")
														          		      					{
														          		      					subprogramaCuerpo+='<div class="col-xs-2">'+
														          		      										metas[g].cantidad+
														          		      										'</div><!-- /.col -->';
														          		      					}
													          		      					
														          		      					if(metas[g].vencimiento == "2018-12-31")
														          		      					{
														          		      					subprogramaCuerpo+='<div class="col-xs-2">'+
														          		      										metas[g].cantidad+
														          		      										'</div><!-- /.col -->';
														          		      					}
													          		      					}
													          		         							          	
														          		      			subprogramaCuerpo+='</div></br>';
														          		      		
								          						}
					          						}

					          						
								}
					
					}
					$("#hoja3-cuerpo-programajaja").append(subprogramaCuerpo); 
				}
			
		}
		});
 
</script>
			
			
					
  <!-- piwik -->
  <script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.spr.stp.gov.py"]);
  _paq.push(["setDomains", ["*.spr.stp.gov.py"]]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 4]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- /piwik -->


<style>
textarea { text-transform: uppercase; }
input { text-transform: uppercase; }
</style>

</script> 

          
	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice" >
        	<!-- title row -->
       		<div class="row">
          		<div class="col-xs-3" style="padding-top:19px">
              		<img src="http://webmail.stp.gov.py/intranet/prueba/logo_izquierda.png" />
          		</div>
         	 	<div class="col-xs-6">
         	 		<center>
	                	PRESIDENCIA DE LA REPÚBLICA <br>
	                	STP -POI<br> 
	                	2016 – 2018
                	</center>
                </div>
          		<div class="col-xs-3">
		  			<img src="http://webmail.stp.gov.py/intranet/prueba/logo_derecha.png" />
          		</div><!-- /.col -->
       	 	</div><!-- /.row -->
       	 	</br></br></br></br></br></br></br></br></br></br></br></br></br></br>
       	 	<h1 id="tituloEntidad"><center></center></h1></br>
       	 	<small><center>PLAN OPERATIVO INSTITUCIONAL PERIODO<br>
       	 	2016 – 2018</center></small>
       	 	</br></br></br></br></br></br></br></br></br></br></br></br></br>
       	 	<div class="col-xs-12"></div>
		</div><!-- /.section -->
	</div><!-- /.wrapper -->
	
	<div style="page-break-after:always"></div>
	
	<div class="row">
		<div class="col-xs-3" style="padding-top:19px">
     		<img src="http://webmail.stp.gov.py/intranet/prueba/logo_izquierda.png" />
 		</div>
  	 	<div class="col-xs-6">
  	 		<center>
          	PRESIDENCIA DE LA REPÚBLICA <br>
          	STP -POI<br> 
          	2016 – 2018
         	</center>

         </div>
   		<div class="col-xs-3">
			<img src="http://webmail.stp.gov.py/intranet/prueba/logo_derecha.png" />
   		</div><!-- /.col -->
	</div><!-- /.row -->


	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice">
			<center><h3>MEMORIA DE LA ENTIDAD</h3></center>
        	<div class="row invoice-info">
          		<div class="col-sm-12">
      				<h4>DENOMINACIÓN DE LA ENTIDAD</h4>
          		</div><!-- /.col -->
          	</div>
          	<div class="row invoice-info">
            	<div class="col-sm-4" >
            		<strong>Nombre: </strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8" id="hoja2-nombre-entidad">
          		</div><!-- /.col -->
          	</div>
          	<div class="row invoice-info">
            	<div class="col-sm-4" >
            		<strong>Abreviación: </strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8" id="hoja2-abrev-entidad">
          		</div><!-- /.col -->		
          	</div>
            	<hr>
			<div class="row invoice-info">
            	<div class="col-sm-12 ">
            	 <h4>BASE LEGAL DE CREACIÓN</h4>
          		</div><!-- /.col -->
			</div>
			<div class="row invoice-info" id="hoja2-base-legal">
            	<div class="col-sm-12 ">
          		</div><!-- /.col -->	
			</div>
           <hr>          	
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Visión Entidad:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-vision-entidad">
           		</div><!-- /.col -->
			</div><!-- /.row -->
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Misión Entidad:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-mision-entidad">
           		</div><!-- /.col -->
			</div><!-- /.row -->
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Diagnóstico General de la Institución:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-diagnostico">
          		</div><!-- /.col -->
          	</div>
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Descripción de los Objetivos Generales de la Institución:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-objetivo-general">
          		</div><!-- /.col -->
          	</div>
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Descripción de las Principales Políticas Institucionales:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-politica-institucional">
          		</div><!-- /.col -->
          	</div>
		</section>
	</wrapper>     	
 <div style="page-break-after:always"></div>      	


	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice">

		
			<div class="row" id="hoja3-cuerpo-programajaja" style="padding:10px 4px 5px 4px" >
        		     		
			</div><!-- /.row -->
													
						
					
												
			
		</section>
	</wrapper>     	
 <div style="page-break-after:always"></div>  

    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js" type="text/javascript"></script>
    <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
