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
			
			var matrizPnd = $.ajax({
		    	url:'/ajaxSelects?accion=getMatrizPnd',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText; 

			matrizPnd = JSON.parse(matrizPnd);
			
			
			var optionDepartamentos='';
			
			for(var i = 0;i<departamentos.length; i++){
				optionDepartamentos+='<option value="'+departamentos[i].deptoPais+'">'+departamentos[i].abrevDepartamento+'</option>';
			}
			
			/*var optionUnidadResponsable='';
			var unidadesResponsables = $.ajax({
		    	url:'/ajaxSelects?accion=getUnidadesResponsables&anio=2015&nivel='+nivel+'&entidad='+entidad,
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
		
		var cuerpoMatriz="";
		cuerpoMatriz="<table>"+
					 "<tr class='success'><td></td><td>Igualdad de oportunidades</td><td>Gestión pública eficiente y transparente</td><td>Ordenamiento territorial</td><td>Sostenibilidad ambiental</td></tr>";
		for (var i = 0; i < 3; i++)
		{
			cuerpoMatriz+="<tr>"+
						  "<td>"+matrizPnd[i].ejeNombre+"</td>";
			for (var j = 0; j < 12; j=j+3)
			{
		      	cuerpoMatriz +="<td>"+matrizPnd[i+j].estrategiaNombre+"</td>";                
		   	}
			cuerpoMatriz+="</tr>";			
		}	
		cuerpoMatriz+="</table>";
		$("#matrizPnd").append(cuerpoMatriz);
		
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
       	 	<small><center>Sistema de Planificación de Resultados<br>
       	 	Ejercicio Fiscal 2016</center></small>
       	 	</br></br></br></br></br></br></br></br></br></br>
       	 	<div class="col-xs-12"></div>
		</div><!-- /.section -->
	</div><!-- /.wrapper -->
	
	<div style="page-break-after:always"></div>
	
	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice">
			<div class="row" id="hoja3-cuerpo-programajaja" style="padding:10px 4px 5px 4px" >
				<h3><center>INDICADOR DE RESULTADOS POR PROYECTO</center></h3>
	        	<div class="table-responsive">
				 	<table class="table" id="matrizPnd">
				  	</table>
				</div>		
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
