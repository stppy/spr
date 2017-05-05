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
	 	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../bootstrap/css/bootstrapslider.css" rel="stylesheet">
<style type="text/css">
div{
	border-top: 1px solid silver;
	}
</style>
</head>
<body>
       <div class="modal fade" id="cajaModal" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg">
		    <div class="modal-content" >
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel1">ENCUESTA</h4>
		      </div>
		      <div class="modal-body" >
		     		
				
              </div>
		      </div>
			  <div class="modal-footer"> 
				
			  </div>
		    </div> 
		 </div>
		</div>
		
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
		var caja;
		caja=	"<div class='table-responsive'>"+
				"<table class='table'>";

		
		for(var t=1;t<=3;t++)
		{
			var bandera = 0;					
			var presupuestoGasto = $.ajax({
				url:'/ajaxSelects?accion=getPresupuestoGastoPresi&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipo='+t,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			presupuestoGasto = JSON.parse(presupuestoGasto);
								
			if(bandera == 0)
			{
				caja+=	"<thead><th colspan='4'><h3>Tipo: "+t+"</3></th><thead>"+
						"<thead><th>Objeto</th><th>Departamento</th><th>Fuente</th><th>VerProgramado</th></thead>";
						
				bandera = 1;
			}

			for(var s=0;s<presupuestoGasto.length;s++)
			{
				caja+="<tr><td>"+presupuestoGasto[s].objeto+"</td><td>"+presupuestoGasto[s].departamento+"</td><td>"+presupuestoGasto[s].fuente+"</td><td>"+presupuestoGasto[s].verProgramado+"</td></tr>";
			}
			
		}
		caja+=	"</table>"+
				"</div>";
		$(".presupuestoGasto").html(caja);
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

<div class="container-fluid">
<div class="row">
	<div class="col-md-12 presupuestoGasto">
		
	</div><!-- /.col -->
</div><!-- /.row -->
</div>											
						
					
												
			
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