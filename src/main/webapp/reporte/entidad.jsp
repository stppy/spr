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
		$("#hoja2-nombre-entidad").append('<p class="text-justify">'+datosEntidad[0].nombreEntidad+'</p>');
		$("#hoja2-abrev-entidad").append('<p class="text-justify">'+datosEntidad[0].abrevEntidad+'</p>');
		$("#hoja2-base-legal").append('<p class="text-justify">'+datosEntidad[0].baseLegal+'</p>'); 
		$("#hoja2-vision-entidad").append('<p class="text-justify">'+datosEntidad[0].vision+'</p>');
		$("#hoja2-mision-entidad").append('<p class="text-justify">'+datosEntidad[0].mision+'</p>');
		$("#hoja2-diagnostico").append('<p class="text-justify">'+datosEntidad[0].diagnostico+'</p>');
		$("#hoja2-objetivo-general").append('<p class="text-justify">'+datosEntidad[0].objetivo+'</p>');
		$("#hoja2-politica-institucional").append('<p class="text-justify">'+datosEntidad[0].politica+'</p>');
		$("#hoja3-nombre-entidad").append('<p class="text-justify">'+datosEntidad[0].nombreEntidad+'</p>');
		$("#hoja3-nivel-entidad").append('<p class="text-justify">'+datosNiveles[0].nombreNivel+'</p>');
	
		var programasCuerpo ='';
		var subprogramaCuerpo='';
		var tituloEntidadProgramaCero='';
		for (var l = 1; l <= 5; l++ )
		{
				var programas = $.ajax({
	        	url:'/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	       		}).responseText;

				programas = JSON.parse(programas);
				programas = programas.programas;
				var bandera = 0;

			for(var m = 0; m < programas.length; m++)
			{
				programasCuerpo='';
				if(bandera == 0)
				{

				programasCuerpo+='<h2><center>FUNDAMENTACIÓN DE LOS PROGRAMAS / SUBPROGRAMAS / PROYECTOS</center></h2>'+
		        	'<div class="row ">'+
		          		'<div class="col-xs-12 ">'+
		      				'<h3>Entidad: '+datosEntidad[0].nivel+' '+datosEntidad[0].nombreEntidad+'</h3>'+ 
		          		'</div><!-- /.col -->'+
		            '</div> '+           
					'<div class="row invoice-info">'+
		            	'<div class="col-xs-12 ">'+
		            		'<h3>Tipo Presupuesto: '+tiposPrograma[l-1].numeroFila+' '+tiposPrograma[l-1].nombreTipoPrograma+'</h3>'+
		          		'</div><!-- /.col -->'+
					'</div></br><!-- /.row -->';
				bandera=1;
				}
					programasCuerpo+='<div class="row">'+
		            	'<div class="col-xs-12" style="border:3px solid silver;">'+
		            		'<h4>PROGRAMA: '+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+programas[m].nombrePrograma+'</h4>'+
		          		'</div><!-- /.col -->'+        		
					'</div><!-- /.row -->'+				
					'<div class="row ">'+
		            	'<div class="col-xs-3">'+
		            		'Diagnostico:'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-9">'+
		            		'<p class="text-justify">'+programas[m].diagnostico+'</p>'+

		          		'</div><!-- /.col --> '+        		
					'</div><!-- /.row -->'+			
					'<div class="row">'+
		            	'<div class="col-xs-3">'+
		            		'Objetivo:'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-9">'+
		            		'<p class="text-justify">'+programas[m].objetivo+'</p>'+

		          		'</div><!-- /.col -->'+         		
					'</div><!-- /.row -->'+			
					'<div class="row">'+
		            	'<div class="col-xs-3">'+
		            		'Base Legal:'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-9">'+
		            		programas[m].baseLegal+
		          		'</div><!-- /.col -->'+         		
					'</div><!-- /.row -->'+			
					'<div class="row ">'+
		            	'<div class="col-xs-3">'+
		            		'Departamento:'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-9">';
		          		//'<select  id="departamento-programa-reporte-'+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'" disabled="">';
		            		//programas[m].codigoDepartamento+
             				//optionDepartamentos+
             				for(var ol=0; ol<departamentos.length; ol++)
             				{
             					if(departamentos[ol].deptoPais == programas[m].codigoDepartamento)
             					{
             						programasCuerpo+=departamentos[ol].abrevDepartamento;
             					} 

             				}
                        //'</select>'+		            	
		          		programasCuerpo+='</div><!-- /.col -->'+         		
					'</div></br><!-- /.row -->';
					

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
		          		if(subprogramas[v].id != 0)
		          		{ 
								          			subprogramaCuerpo+='<div class="row">'+
								            		'<div class="col-xs-12">'+
								            			'<h5><strong>SUBPROGRAMA: '+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+'-'+subprogramas[v].nombre+'</strong></h5>'+
								          			'</div><!-- /.col -->'+
								          		    '</div><!-- /.row -->'+
								          			'<div class="row ">'+
								               		'<div class="col-xs-3">'+
								            			'Diagnostico:'+
								          			'</div><!-- /.col -->'+
								            		'<div class="col-xs-9">'+
								            			'<p class="text-justify">'+subprogramas[v].descripcion+'</p>'+
								          			'</div><!-- /.col --> '+        		
												'</div><!-- /.row -->'+													
											'<div class="row">'+
								            	'<div class="col-xs-3">'+
								            		'Objetivo:'+
								          		'</div><!-- /.col -->'+
								            	'<div class="col-xs-9">'+
								            		'<p class="text-justify">'+subprogramas[v].objetivo+'</p>'+
								          		'</div><!-- /.col -->'+         		
											'</div><!-- /.row -->'+			
											'<div class="row">'+
								            	'<div class="col-xs-3">'+
								            		'Base Legal:'+
								          		'</div><!-- /.col -->'+
								            	'<div class="col-xs-9">'+
								            		''+subprogramas[v].baseLegal+
								          		'</div><!-- /.col -->'+         		
											'</div><!-- /.row -->'+			
											'<div class="row ">'+
												'<div class="col-xs-3">'+
						            				'Departamento:'+
						          				'</div><!-- /.col -->'+
							            		'<div class="col-xs-9">';
	          		
					    				for(var p=0;p<departamentos.length; p++)
					    				{
					    					if(departamentos[p].deptoPais == subprogramas[v].codigo_departamento)
					    					{
					    						subprogramaCuerpo+=departamentos[p].abrevDepartamento;
					    					}
					    				}	
				                    	subprogramaCuerpo+='</div></div>';           	
		          		}
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
								  	
								  	
            						var unidadesResponsables = $.ajax({
            					    	url:'/ajaxSelects?accion=getUnidadesResponsables&anio=2017&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
            					      	type:'get',
            					      	dataType:'json',
            					      	async:false       
            					    }).responseText;
            						unidadesResponsables = JSON.parse(unidadesResponsables);
            						unidadesResponsables = unidadesResponsables.unidadesResponsables;
            						
            						var funcionales = $.ajax({
            					    	url:'/ajaxSelects?accion=getFuncionales&anio=2017',
            					      	type:'get',
            					      	dataType:'json',
            					      	async:false       
            					    }).responseText;
            						funcionales = JSON.parse(funcionales);
            						funcionales = funcionales.funcionales;
            						
            						var snip = $.ajax({
            					    	url:'/ajaxSelects?accion=getSnip&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
            					      	type:'get',
            					      	dataType:'json',
            					      	async:false       
            					    }).responseText;
            						snip = JSON.parse(snip);
            						snip = snip.snip;
            						
								  	
									
														if(proyectos[k].codigoProyecto != 0)
														{
															subprogramaCuerpo+='<div class="row ">'+ 
						            						'<div class="col-xs-12">'+
																'<h5><strong>PROYECTO: '+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+'-'+proyectos[k].codigoProyecto+'-'+proyectos[k].nombreProyecto+'</strong></h5>'+                         
					          								'</div><!-- /.col -->'+
															'</div><!-- /.row -->'+
															'<div class="row ">'+
										            		'<div class="col-xs-3">'+
										            			'Diagnostico:'+
										          			'</div><!-- /.col -->'+
										            		'<div class="col-xs-9">'+
										            			'<p class="text-justify">'+proyectos[k].diagnostico+'</p>'+
									          				'</div><!-- /.col -->'+ 
										          		'</div><!-- /.row -->'+
														'<div class="row ">'+
									            			'<div class="col-xs-3">'+
									            				'Objetivo:'+
									          				'</div><!-- /.col -->'+
									            			'<div class="col-xs-9">'+
									            				'<p class="text-justify">'+proyectos[k].descripcionProyecto+'</p>'+
								          					'</div><!-- /.col -->'+
									          			'</div><!-- /.row -->'+	 	
														'<div class="row ">'+
								            				'<div class="col-xs-3">'+
								            					'Base Legal:'+
								          					'</div><!-- /.col -->'+
								            				'<div class="col-xs-9">'+
							          						'</div><!-- /.col -->'+
								          				'</div><!-- /.row -->';
														}
														subprogramaCuerpo+='<div class="row ">'+
							            					'<div class="col-xs-3">'+
							            						'Objetivo PND: '+
							          						'</div><!-- /.col -->'+
							            					'<div class="col-xs-9">';
							            					for (var t=0;t<objetivos.length; t++)
						            						{
						            							if (objetivos[t].objetivo_id == proyectos[k].objetivo_estrategico_id)
						            								{
						            								subprogramaCuerpo+='<p class="text-justify">'+objetivos[t].objetivoNombre+'</p>';						            								
						            								}
						            							
						            						}
							            				
							            						//proyectos[k].objetivo_estrategico_id+
						          							subprogramaCuerpo+='</div><!-- /.col -->'+
							          					'</div><!-- /.row -->'+	 	
														'<div class="row ">'+
						            						'<div class="col-xs-3">'+
						            							'Unidad Responsable: '+
						          							'</div><!-- /.col -->'+
						            						'<div class="col-xs-9">';
						            						for (var w=0; w<unidadesResponsables.length; w++)
						            						{
						            							if (unidadesResponsables[w].unrCodigo == proyectos[k].codigoUnidadResponsable)
						            								{
						            								subprogramaCuerpo+=unidadesResponsables[w].unrNombre;
						            								}
						            						}
						            						
					          								subprogramaCuerpo+='</div><!-- /.col -->'+
									          			'</div><!-- /.row -->'+	
														'<div class="row ">'+
								            				'<div class="col-xs-3">'+
								            					'Clasificacion Funcional: '+
								          					'</div><!-- /.col -->'+
								            				'<div class="col-xs-9">';
								            				for (var oo=0; oo<funcionales.length; oo++)
								            				{
								            					if (funcionales[oo].codigoFuncional == proyectos[k].codigoFuncional)
								            						{
								            						subprogramaCuerpo+=funcionales[oo].nombre;
								            						}
								            				}
							          						subprogramaCuerpo+='</div><!-- /.col -->'+
								          				'</div><!-- /.row -->'+	
														'<div class="row ">'+
							            					'<div class="col-xs-3">'+
							            						'COD. SNIP: '+
							          						'</div><!-- /.col -->'+
							            					'<div class="col-xs-9">';
							            					
							            					for(var f=0; f<snip.length; f++)
							            					{
							            						if (snip[f].codigoSnip == proyectos[k].codigoSnip)
							            						{
							            							subprogramaCuerpo+=snip[f].nombreProyecto;
							            						}	
							            					}
							            					
						          							subprogramaCuerpo+='</div><!-- /.col -->'+
							          					'</div><!-- /.row -->'+
							          					'<div class="row ">'+
						            						'<div class="col-xs-3">'+
						            							'Departamento: '+
						          							'</div><!-- /.col -->'+
						            						'<div class="col-xs-9">';
						            						for(var q=0;q<departamentos.length; q++)
						            	    				{
						            	    					if(departamentos[q].deptoPais == proyectos[k].codigoDepartamento)
						            	    					{
						            	    						subprogramaCuerpo+=departamentos[q].abrevDepartamento;
						            	    					}
						            	    				}
						            						subprogramaCuerpo+='</div><!-- /.col -->'+
						          						'</div><!-- /.row -->'+
						          						'</br>';
						          						
						          						//agregar indicadores a proyectos
												resultados = $.ajax({
				          			            	url:'/ajaxSelects?accion=getResultados&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto,
				          			              	type:'get',
				          			              	dataType:'json',
				          			              	async:false       
				          			            }).responseText;  
			
				          			    		resultados = JSON.parse(resultados);
				          			    		resultados = resultados.resultados;						          						
				          						for(var n=0; n<resultados.length; n++)
				          						{
				          					
					          			    		subprogramaCuerpo+='<div class="row invoice-info">'+
									            		'<div class="col-sm-12 invoice-col">'+
									            			'<strong>RESULTADOS ESPERADOS</strong>'+
									          			'</div><!-- /.col -->'+       		       		
													'</div></br><!-- /.row -->'+	
				
													'<div class="row">'+
									            		'<div class="col-md-3">'+
									            			'Resultado Esperado:'+
									          			'</div><!-- /.col -->'+
									            		'<div class="col-md-9">'+
									            		'<p class="text-justify">'+resultados[n].nombre+'</p>'+
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
							          							
							          							subprogramaCuerpo+='<div class="row">'+
													          			          		'<div class="col-md-3">'+
													          			      				'INDICADOR:'+
													          			          		'</div><!-- /.col -->'+
													          			          		'<div class="col-md-9">'+
													          			          			'<p class="text-justify">'+indicadores[h].nombre+'</p>'+
													          			          		'</div><!-- /.col -->'+
													          			         	'</div>'+
													          						'<div class="row invoice-info">'+
													          			          		'<div class="col-sm-3 invoice-col">'+
													          			      				'UNIDAD DE MEDIDA:'+
													          			          		'</div><!-- /.col -->'+
													          			          		'<div class="col-sm-9 invoice-col">';
													          			          			for (var s=0;s<unidadesMedida.length; s++)
													          			          			{
													          			          			if(unidadesMedida[s].codigoUnidadMedida == indicadores[h].unidad_medida_id)
													          			          				{
													          			          				subprogramaCuerpo+=unidadesMedida[s].nombre;
													          			          				}
													          			          			}
													          			          		subprogramaCuerpo+='</div><!-- /.col -->'+
													          			        	'</div>'+
													          						'<div class="row invoice-info">'+
													          			          		'<div class="col-sm-3 invoice-col">'+
													          			      				'FRECUENCIA DE MEDICION (meses):'+
													          			          		'</div><!-- /.col -->'+
													          			          		'<div class="col-sm-9 invoice-col">'+
													          			          			indicadores[h].frecuencia_meses+
													          			          		'</div><!-- /.col -->'+
													          			         	'</div>';
													          			      		if(indicadores[h].metodo_calculo_id != "")
											          			          			{
													          			      			subprogramaCuerpo+='<div class="row invoice-info">'+
																		          			          	   		'<div class="col-sm-3 invoice-col">'+
																		          			      					'METODOLOGIA DE CALCULO:'+
																		          			          			'</div><!-- /.col -->'+
																		          			          			'<div class="col-sm-9 invoice-col">'+
													          			          									indicadores[h].metodo_calculo_id+
													          			          								'</div>'+
													          			         							'</div>';
													          			         	}
													          			      		if(indicadores[h].fuente_verificacion_id != 1)
											          			          			{
													          			      		subprogramaCuerpo+='<div class="row invoice-info">'+
																	          			          	   		'<div class="col-sm-3 invoice-col">'+
																	          			      					'FUENTE DE INFORMACION:'+
																	          			          			'</div><!-- /.col -->'+
																	          			          			'<div class="col-sm-9 invoice-col">'+
																	          			          				indicadores[h].fuente_verificacion_id+
																	          			          	   		'</div><!-- /.col -->'+
																	          			         		'</div>';
											          			          			}
													          			      		if(indicadores[h].observaciones != 0)
											          			          			{
													          						subprogramaCuerpo+='<div class="row invoice-info">'+
																	          			          	   		'<div class="col-sm-3 invoice-col">'+
																	          			      					'OBSERVACIONES:'+
																	          			          			'</div><!-- /.col -->'+
																	          			          			'<div class="col-sm-9 invoice-col">'+
																	          			          				indicadores[h].observaciones+
													          			          							'</div><!-- /.col -->'+
													          			         						'</div>';
											          			          			}
													          			         	subprogramaCuerpo+='</br></br>'+
													          			         	'<div class="row invoice-info">'+
													          			         		'<table class="table table-striped">'+
													       		          				'<tr><td colspan="5">'+
													       		          					'<h5><center><strong>EVOLUCIÓN DEL INDICADOR</strong></center></h5>'+
											          		          					'</td></tr>'+													          			         
													          			         	
													          			          		'<tr><td>2014</td><td>2015</td><td>2016</td><td>2017</td><td>2018</td></tr>'+
												          		      					'<tr>';
													          		          			
													          		      				for(var g = 0; g < metas.length; g++)
													          		      				{
													          		      					if(metas[g].vencimiento == "2014-12-31")
													          		      					{
													          		      						subprogramaCuerpo+='<td>'+
													          		      											metas[g].cantidad+
													          		      											'</td>';
													          		      					}	
													       			          		          	
													          		      					if(metas[g].vencimiento == "2015-12-31")
													          		      					{
													          		      					subprogramaCuerpo+='<td>'+
													          		      										metas[g].cantidad+
													          		      										'</td>';
													          		      					} 
												          		      					
													          		      					if(metas[g].vencimiento == "2016-12-31")
													          		      					{
													          		      					subprogramaCuerpo+='<td>'+
													          		      										metas[g].cantidad+
													          		      										'</td>';
													          		      					}
												        
													          		      					if(metas[g].vencimiento == "2017-12-31")
													          		      					{
													          		      					subprogramaCuerpo+='<td>'+
													          		      										metas[g].cantidad+
													          		      										'</td>';
													          		      					}
												          		      					
													          		      					if(metas[g].vencimiento == "2018-12-31")
													          		      					{
													          		      					subprogramaCuerpo+='<td>'+
													          		      										metas[g].cantidad+
													          		      										'</td>';
													          		      					}
												          		      					}
												          		         							          	
													          		      			subprogramaCuerpo+='</tr></table></div>';
													          		      		
							          						}
				          						}
						          						
						          						
				          						var datosProductos = $.ajax({
						          		              url:'/ajaxSelects?accion=getProductosPresupuesto&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto,
						          		              type:'get',
						          		              dataType:'json',
						          		              async:false       
						          		            }).responseText;
						          		            datosProductos = JSON.parse(datosProductos);
						          		            datosProductos = datosProductos.producto;
						          		            
						          			      var productos = $.ajax({
						          			    	url:'/ajaxSelects?accion=getProductos',
						          			      	type:'get',
						          			      	dataType:'json',
						          			      	async:false       
						          			    }).responseText;
						          		    	productos = JSON.parse(productos);
						          		    	productos = productos.productos;
						          		    	
			          							var unidadesMedida = $.ajax({
			          						    	url:'/ajaxSelects?accion=getUnidadesMedida',
			          						      	type:'get',
			          						      	dataType:'json',
			          						      	async:false       
			          						    }).responseText;
			          							unidadesMedida = JSON.parse(unidadesMedida);
			          							unidadesMedida = unidadesMedida.unidadesMedida;
			          							
			          							if (datosProductos.length>=0){
			          							
						          		        for(var c = 0; c < datosProductos.length; c++)
						          		        {
						          		        	var porDepto=0;
						          		        	var max=0;
						          		        	var porMes=0;
						          		        
						          		        	if (c== 0)
						          		        	{
						          		        		subprogramaCuerpo+='<div class="row">'+
		                  						   		'<div class="col-md-12">'+
		                  						   	    '<h5><center><strong>PRODUCTOS</strong></center></h5>'+
		                  						   	    '</div>'+
		                  						      	'</div>';
		                  						   	    
						          		        	}
						          		        	
						          		        subprogramaCuerpo+='<div class="row">'+
						                  						   		'<div class="col-md-12">'+
						                  						   			'PRODUCTOS :'+subprogramas[v].id+'-'+proyectos[k].codigoProyecto+'-'+datosProductos[c].producto_id;
							          		        
						          		        	for(var y = 0; y < productos.length; y++)
							          		        {
							          		        	if(productos[y].codigoCatalogo == datosProductos[c].producto_id)
							          		        	{
							          		        		subprogramaCuerpo+='-'+productos[y].nombreCatalogo+'-';
							          		        	
							          		        
							          		        
									          		        for(var d = 0; d < unidadesMedida.length; d++)
									          		        {
									          		        	if(unidadesMedida[d].codigoUnidadMedida == datosProductos[c].unidad_medida_id)
									          		        	{
									          		        		subprogramaCuerpo+=unidadesMedida[d].nombre;
									          		        	}
									          		        }
									          		        subprogramaCuerpo+='-TIPO: '+productos[y].clase;
									          		        	if(productos[y].clase == "N")
									          		            {
										          		      		porDepto = $.ajax({
								          						    	url:'/ajaxSelects?accion=getSumaDepto&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto+'&producto='+datosProductos[c].producto_id+'&anio=2017',
								          						      	type:'get',
								          						      	dataType:'json',
								          						      	async:false       
								          						    }).responseText;
										          		      		porDepto = JSON.parse(porDepto);
										          		      		porDepto = porDepto.sumaDeptoN;
										          		      		
											          		      	porMes = $.ajax({
								          						    	url:'/ajaxSelects?accion=getSumaMes&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto+'&producto='+datosProductos[c].producto_id+'&anio=2017',
								          						      	type:'get',
								          						      	dataType:'json',
								          						      	async:false       
								          						    }).responseText;
										          		      		porMes = JSON.parse(porMes);
										          		      		porMes = porMes.sumaMes;
										          		      		
										          		      		if(porMes.length > 0){
										          		  
												          		      	mayorVec = new Array(12);
											          		      		mayorVec[0] = porMes[0].suma;
											          		       		mayorVec[1] = porMes[1].suma;
											          		      		mayorVec[2] = porMes[2].suma;
											          		       		mayorVec[3] = porMes[3].suma;	
											          		      		mayorVec[4] = porMes[4].suma;
											          		       		mayorVec[5] = porMes[5].suma;
											          		      		mayorVec[6] = porMes[6].suma;
											          		       		mayorVec[7] = porMes[7].suma;	
											          		      		mayorVec[8] = porMes[8].suma;
											          		       		mayorVec[9] = porMes[9].suma;
											          		      		mayorVec[10] = porMes[10].suma;
											          		       		mayorVec[11] = porMes[11].suma;
										          		        		
											          		       		for (var rec = 0; rec < mayorVec.length; rec++)
											          		       		{
											          		       			max += porMes[rec].suma;
											          		       		}
										          		       		
										          		      		}//fin if
	
									          		        		
									          		            } 
									         		        	if(productos[y].clase == "C")
									          		            {
										          		      		porDepto = $.ajax({
								          						    	url:'/ajaxSelects?accion=getDeptoMayor&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto+'&producto='+datosProductos[c].producto_id+'&anio=2017',
								          						      	type:'get',
								          						      	dataType:'json',
								          						      	async:false       
								          						    }).responseText;
										          		      		porDepto = JSON.parse(porDepto);
										          		      		porDepto = porDepto.deptoMayor;
											          		      	porMes = $.ajax({
								          						    	url:'/ajaxSelects?accion=getSumaMes&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto+'&producto='+datosProductos[c].producto_id+'&anio=2017',
								          						      	type:'get',
								          						      	dataType:'json',
								          						      	async:false       
								          						    }).responseText;
										          		      		porMes = JSON.parse(porMes);
										          		      		porMes = porMes.sumaMes;
										          		      		
											          		      	var mayorVec = new Array(12);
										          		      		mayorVec[0] = porMes[0].suma;
										          		       		mayorVec[1] = porMes[1].suma;
										          		      		mayorVec[2] = porMes[2].suma;
										          		       		mayorVec[3] = porMes[3].suma;	
										          		      		mayorVec[4] = porMes[4].suma;
										          		       		mayorVec[5] = porMes[5].suma;
										          		      		mayorVec[6] = porMes[6].suma;
										          		       		mayorVec[7] = porMes[7].suma;	
										          		      		mayorVec[8] = porMes[8].suma;
										          		       		mayorVec[9] = porMes[9].suma;
										          		      		mayorVec[10] = porMes[10].suma;
										          		       		mayorVec[11] = porMes[11].suma;
										          		       		
										          		       	 max=Math.max.apply(null, mayorVec);
																			          		       		
									          		     
									          		        		
									          		            }
							          		             }
							          		          }
							          		     			 subprogramaCuerpo+='</div><!-- /.col -->'+
						          									'</div><!-- /row -->';
						          									
						          								    var metaProducto = $.ajax({
						          								        url:'/ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id+'&proyecto='+proyectos[k].codigoProyecto+'&producto='+datosProductos[c].producto_id,
						          								        type:'get',
						          								        dataType:'json',
						          								        async:false       
						          								    }).responseText;
						          								    metaProducto = JSON.parse(metaProducto);
						          								    metaProducto=metaProducto.productoPresupuestoMeta;
			
										          		      		if(porDepto.length > 0 && metaProducto.length > 0){
						          								    
							          									subprogramaCuerpo+='<div class="row">'+
							          							 			'<div class="col-md-12">'+
							          							 			'<table class="table table-striped">'+
							          							              '<thead>'+
							          							              	'<tr> '+
							          							              		'<th colspan="13">AÑO 2016</th>'+
							          							              	'</tr>'+
							          							                '<tr>'+
							          							                  '<th>DEPTO/MES:</th>'+
							          							                  '<th>01</th>'+
							          							                  '<th>02</th>'+
							          							                  '<th>03</th>'+
							          							                  '<th>04</th>'+
							          							                  '<th>05</th>'+
							          							                  '<th>06</th>'+
							          							                  '<th>07</th>'+
							          							                  '<th>08</th>'+
							          							                  '<th>09</th>'+
							          							                  '<th>10</th>'+
							          							                  '<th>11</th>'+
							          							                  '<th>12</th>'+
							          							                  '<th>Total</th>'+
							          							                '</tr>'+
							          							              '</thead>'+
							          							              '<tbody>'+
							          							                '<tr>'+
							          							                  '<td>Asunción:</td>'+
							          							                  '<td>'+metaProducto[0].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[20].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[40].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[60].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[80].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[100].cantidad+'</td>'+
							          								              '<td>'+metaProducto[120].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[140].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[160].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[180].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[200].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[220].cantidad+'</td>'+
							          							                  '<td>'+porDepto[0].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Concepción:</td>'+
							          							                  '<td>'+metaProducto[1].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[21].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[41].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[61].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[81].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[101].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[121].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[141].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[161].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[181].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[201].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[221].cantidad+'</td>'+
							          							                  '<td>'+porDepto[1].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>San Pedro:</td>'+
							          							                  '<td>'+metaProducto[2].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[22].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[42].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[62].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[82].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[102].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[122].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[142].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[162].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[182].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[202].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[222].cantidad+'</td>'+
							          							                  '<td>'+porDepto[2].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Cordillera:</td>'+
							          							                  '<td>'+metaProducto[3].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[23].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[43].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[63].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[83].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[103].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[123].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[143].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[163].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[183].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[203].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[223].cantidad+'</td>'+
							          							                  '<td>'+porDepto[3].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Guaira:</td>'+
							          							                  '<td>'+metaProducto[4].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[24].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[44].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[64].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[84].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[104].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[124].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[144].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[164].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[184].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[204].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[224].cantidad+'</td>'+
							          							                  '<td>'+porDepto[4].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Caaguazú:</td>'+
							          							                  '<td>'+metaProducto[5].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[25].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[45].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[65].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[85].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[105].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[125].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[145].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[165].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[185].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[205].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[225].cantidad+'</td>'+
							          							                  '<td>'+porDepto[5].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Caazapá:</td>'+
							          							                  '<td>'+metaProducto[6].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[26].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[46].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[66].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[86].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[106].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[126].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[146].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[166].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[186].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[206].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[226].cantidad+'</td>'+
							          							                  '<td>'+porDepto[6].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Itapua:</td>'+
							          							                  '<td>'+metaProducto[7].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[27].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[47].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[67].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[87].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[107].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[127].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[147].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[167].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[187].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[207].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[227].cantidad+'</td>'+
							          							                  '<td>'+porDepto[7].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Misiones:</td>'+
							          							                  '<td>'+metaProducto[8].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[28].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[48].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[68].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[88].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[108].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[128].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[148].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[168].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[188].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[208].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[228].cantidad+'</td>'+
							          							                  '<td>'+porDepto[8].suma+'</td>'+
							          							                '</tr> '+
							          							                '<tr>'+
							          							                  '<td>Paraguari:</td>'+
							          							                  '<td>'+metaProducto[9].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[29].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[49].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[69].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[89].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[109].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[129].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[149].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[169].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[189].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[209].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[229].cantidad+'</td>'+
							          							                  '<td>'+porDepto[9].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Alto Parana:</td>'+
							          							                  '<td>'+metaProducto[10].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[30].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[50].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[70].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[90].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[110].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[130].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[150].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[170].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[190].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[210].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[230].cantidad+'</td>'+
							          							                  '<td>'+porDepto[10].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Central:</td>'+
							          							                  '<td>'+metaProducto[11].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[31].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[51].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[71].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[91].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[111].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[131].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[151].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[171].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[191].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[211].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[231].cantidad+'</td>'+
							          							                  '<td>'+porDepto[11].suma+'</td>'+
							          							                '</tr>  '+
							          							                '<tr>'+
							          							                  '<td>Ñeembucú:</td>'+
							          							                  '<td>'+metaProducto[12].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[32].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[52].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[72].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[92].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[112].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[132].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[152].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[172].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[192].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[212].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[232].cantidad+'</td>'+
							          							                  '<td>'+porDepto[12].suma+'</td>'+
							          							                '</tr>  '+
							          							                '<tr>'+
							          							                  '<td>Amambay:</td>'+
							          							                  '<td>'+metaProducto[13].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[33].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[53].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[73].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[93].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[113].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[133].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[153].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[173].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[193].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[213].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[233].cantidad+'</td>'+
							          							                  '<td>'+porDepto[13].suma+'</td>'+
							          							                '</tr>  '+
							          							                '<tr>'+
							          							                  '<td>Canindeyu:</td>'+
							          							                  '<td>'+metaProducto[14].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[34].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[54].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[74].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[94].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[114].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[134].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[154].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[174].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[194].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[214].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[234].cantidad+'</td>'+
							          							                  '<td>'+porDepto[14].suma+'</td>'+
							          							                '</tr>  '+
							          							                '<tr>'+
							          							                  '<td>Pte. Hayes:</td>'+
							          							                  '<td>'+metaProducto[15].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[35].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[55].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[75].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[95].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[115].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[135].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[155].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[175].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[195].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[215].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[235].cantidad+'</td>'+
							          							                  '<td>'+porDepto[15].suma+'</td>'+
							          							                '</tr> '+
							          							                '<tr>'+
							          							                  '<td>Boqueron:</td>'+
							          							                  '<td>'+metaProducto[16].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[36].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[56].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[76].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[96].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[116].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[136].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[156].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[176].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[196].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[216].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[236].cantidad+'</td>'+
							          							                  '<td>'+porDepto[16].suma+'</td>'+
							          							                '</tr>  '+
							          							                '<tr>'+
							          							                  '<td>Alto Paraguay:</td>'+
							          							                  '<td>'+metaProducto[17].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[37].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[57].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[77].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[97].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[117].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[137].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[157].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[177].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[197].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[217].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[237].cantidad+'</td>'+
							          							                  '<td>'+porDepto[17].suma+'</td>'+
							          							                '</tr>'+
							          							                '<tr>'+
							          							                  '<td>Aux. Trasp.:</td>'+
							          							                  '<td>'+metaProducto[18].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[38].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[58].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[78].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[98].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[118].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[138].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[158].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[178].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[198].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[218].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[238].cantidad+'</td>'+
							          							                  '<td>'+porDepto[18].suma+'</td>'+
							          							                '</tr>  '+
							          							                '<tr>'+
							          							                  '<td>Alc. Nacional:</td>'+
							          							                  '<td>'+metaProducto[19].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[39].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[59].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[79].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[99].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[119].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[139].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[159].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[179].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[199].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[219].cantidad+'</td>'+
							          							                  '<td>'+metaProducto[239].cantidad+'</td>'+
							          							                  '<td>'+porDepto[19].suma+'</td>'+
							          							               ' </tr>'+
							          							             '<tr>'+
							          							               '<td>Total Mes:</td>'+
							          							               '<td>'+porMes[0].suma+'</td>'+
							          							               '<td>'+porMes[1].suma+'</td>'+
							          							               '<td>'+porMes[2].suma+'</td>'+
							          							               '<td>'+porMes[3].suma+'</td>'+
							          							               '<td>'+porMes[4].suma+'</td>'+
							          							               '<td>'+porMes[5].suma+'</td>'+
							          							               '<td>'+porMes[6].suma+'</td>'+
							          							               '<td>'+porMes[7].suma+'</td>'+
							          							               '<td>'+porMes[8].suma+'</td>'+
							          							               '<td>'+porMes[9].suma+'</td>'+
							          							               '<td>'+porMes[10].suma+'</td>'+
							          							               '<td>'+porMes[11].suma+'</td>'+
							          							               '<td>'+max+'</td>'+
							          							               '</tr>'+
							          							               '</body>'+
								       							            '</table>'+
							          							           '</div>'+
							          							          '</div>'+
							          							          '</br>'+
							          							          
							          									'<div class="row">'+
						          											'<div class="col-md-12">'+
						          												'<table class="table table-striped" style="border:1px solid silver">'+
						          													'<tr><td><center><strong>2017:</strong></center></td><td><center><strong>2018:</strong></center></td></tr>'+
						          													'<tr><td><center>'+metaProducto[240].cantidad+'</center></td><td><center>'+metaProducto[241].cantidad+'</center></td></tr>'+
									          		      						'</table>'+
						          											'</div><!-- /.col -->'+
									          		      				'</div></br>';   	
										          		      		}
								          		      				porDepto =  "";
								          		      				porMes = "";
								          		      				max=0;

						          		        }// fin datosProducto
			          							}
						          		        
								}
					}

					$("#hoja3-cuerpo-programajaja").append(programasCuerpo);
					$("#hoja3-cuerpo-programajaja").append(subprogramaCuerpo);
					//$('#departamento-programa-reporte-'+tiposPrograma[l-1].numeroFila+'-'+programas[m].codigoPrograma+' option[value="'+programas[m].codigoDepartamento+'"]').attr("selected", "selected");


					}

				}

		
		
		/*$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		$("#nombreUsuario").append("entidad: "+usuarios[0].entidad);;
		$("#nombreUsuario").append("entidad_id: "+usuarios[0].entidad_id);
		$("#nombreUsuario").append("nivel_id: "+usuarios[0].nivel_id);*/

	        
	     
	    	//datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[0].entidad==usuarios[0].entidad_id

		
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
       	 	</br></br></br></br></br></br></br></br>
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
			<h3><center><strong>MEMORIA DE LA ENTIDAD</strong></center></h3>
        	<div class="row invoice-info">
          		<div class="col-sm-12">
      				<h4><strong>DENOMINACIÓN DE LA ENTIDAD</strong></h4>
          		</div><!-- /.col -->
          	</div>
          	<div class="row invoice-info">
            	<div class="col-sm-3" >
            		<strong>Nombre: </strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9" id="hoja2-nombre-entidad">
          		</div><!-- /.col -->
          	</div>
          	<div class="row invoice-info">
            	<div class="col-sm-3" >
            		<strong>Abreviación: </strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9" id="hoja2-abrev-entidad">
          		</div><!-- /.col -->		
          	</div>
            	<hr>
			<div class="row invoice-info">
            	<div class="col-md-12 ">
            	 <h4><strong>BASE LEGAL DE CREACIÓN</strong></h4>

          		</div><!-- /.col -->
			</div>
			<div class="row" >
            	<div class="col-md-12" id="hoja2-base-legal">
          		</div><!-- /.col -->	
			</div>
           <hr>          	
			<div class="row invoice-info">
            	<div class="col-sm-3 ">
            		<strong>Visión Entidad:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9 " id="hoja2-vision-entidad">
           		</div><!-- /.col -->
			</div><!-- /.row -->
			<div class="row invoice-info">
            	<div class="col-sm-3 ">
            		<strong>Misión Entidad:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9 " id="hoja2-mision-entidad">
           		</div><!-- /.col -->
			</div><!-- /.row -->
			<div class="row invoice-info">
            	<div class="col-sm-3 ">
            		<strong>Diagnóstico General de la Institución:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9 " id="hoja2-diagnostico">
          		</div><!-- /.col -->
          	</div>
			<div class="row invoice-info">
            	<div class="col-sm-3 ">
            		<strong>Descripción de los Objetivos Generales de la Institución:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9 " id="hoja2-objetivo-general">
          		</div><!-- /.col -->
          	</div>
			<div class="row invoice-info">
            	<div class="col-sm-3 ">
            		<strong>Descripción de las Principales Políticas Institucionales:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-9 " id="hoja2-politica-institucional">
          		</div><!-- /.col -->
          	</div>
		</section>
	</wrapper>     	
 <div style="page-break-after:always"></div>      	


	<div class="wrapper" style="padding:30px 10px 0px 30px">
		<section class="invoice">

		
			<div class="row" id="hoja3-cuerpo-programajaja" style="padding:10px 18px 5px 4px" >
        		     		
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
</html>
