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
  <!--  ISO-8859-1 -->
  <%@ include file="/frames/head.jsp" %>
  <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
  <script src="frames/entidad.js" type="text/javascript"></script>
</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>

	<script>
	$(document).ready(function(){
		var agregarReportePresupuestoIngreso="";
		agregarReportePresupuestoIngreso='<div class="modal fade" id="myModalPresupuestoIngreso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
		  '<div class="modal-dialog modal-lg">'+
		    '<div class="modal-content">'+
		      '<div class="modal-header">'+
		        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		        '<h3 class="modal-title" id="myModalLabel"></h3>'+
		      '</div>'+
		      '<div class="modal-body">'+
		      
		      
		      '</div>'+
		      '<div class="modal-footer">'+

		      '</div>'+
		    '</div>'+
		  '</div>'+ 
		'</div>';
						
		$('#programacion').find(".box-body").append(agregarReportePresupuestoIngreso);
		
	      var datosEntidadDescripcion = $.ajax({
		        url:'/ajaxSelects?accion=getEntidades&entidadId='+usuarios[0].entidad_id+'&nivel='+usuarios[0].nivel_id,
		        type:'get',
		        dataType:'json',
		        async:false       
		      }).responseText;
	      datosEntidadDescripcion = JSON.parse(datosEntidadDescripcion);
	      datosEntidadDescripcion=datosEntidadDescripcion.entidades;
	      
	      var datosUnidadResponsable = $.ajax({
		        url:'/ajaxSelects?accion=getUnidadesResponsables&unidadResponsable='+usuarios[0].unidadResponsable+'&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
		        type:'get',
		        dataType:'json',
		        async:false       
		      }).responseText;
	      datosUnidadResponsable = JSON.parse(datosUnidadResponsable);
	      datosUnidadResponsable=datosUnidadResponsable.unidadesResponsables;
	      
	     var datosInstitucion = $.ajax({
	          url:'/ajaxSelects?accion=getInstitucion&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&unidadResponsable='+usuarios[0].unidadResponsable,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	     datosInstitucion = JSON.parse(datosInstitucion);
	     datosInstitucion=datosInstitucion.instituciones;
	        
	        var usuarios_nivel=usuarios[0].nivel_id;
	        var usuarios_entidad=usuarios[0].entidad_id;
	        var usuarios_unidadResponsable=usuarios[0].unidadResponsable;
	        	        
	        var datosUnidadJerarquica = $.ajax({
		        url:'/ajaxSelects?accion=getUnidadesJerarquicas&unidadJerarquica='+datosInstitucion[0].unidadJerarquicaId+'&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
		        type:'get',
		        dataType:'json',
		        async:false       
		      }).responseText;
	        datosUnidadJerarquica = JSON.parse(datosUnidadJerarquica);
	        datosUnidadJerarquica=datosUnidadJerarquica.unidadesJerarquicas;  
	        
	  /*   for (i=0;i<datosEntidad.length;i++){
	    	 if (datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[i].entidad==usuarios[0].entidad_id)
	    		 break;
	     }
	        */
	        var fechaUlt = new Date(datosInstitucion[0].fechaActualizacion);
	        
		$("#nivelId2").attr("value",usuarios[0].nivel_id);
	    $("#nivelId2").attr("disabled","");
	    $("#entidadId2").attr("value",usuarios[0].entidad_id);
	    $("#entidadId2").attr("disabled","");
	    
	    $("#unidadResponsableId2").attr("value",datosInstitucion[0].unidadResponsableId);
	    $("#unidadResponsableId2").attr("disabled","");
	    $("#unidadJerarquicaId2").attr("value",datosInstitucion[0].unidadJerarquicaId);
	    $("#unidadJerarquicaId2").attr("disabled","");
	    
	    $("#nivel").attr("value",usuarios[0].nivel_id);
	    $("#entidad").attr("value",usuarios[0].entidad_id);
	    $("#unidadResponsableId").attr("value",datosInstitucion[0].unidadResponsableId);
	    $("#unidadJerarquicaId").attr("value",datosInstitucion[0].unidadJerarquicaId);
	    $("#descripcion").html(datosInstitucion[0].descripcion);
		$("#abrev").attr("value",datosInstitucion[0].abrev);
		$("#sigla").attr("value",datosInstitucion[0].sigla);
		$("#ruc").html(datosInstitucion[0].ruc);
		$("#baseLegal").html(datosInstitucion[0].baseLegal);
		$("#mision").html(datosInstitucion[0].mision);
		$("#vision").html(datosInstitucion[0].vision);
		$("#politica").html(datosInstitucion[0].politica);
		$("#objetivo").html(datosInstitucion[0].objetivo);
		$("#diagnostico").html(datosInstitucion[0].diagnostico);
		$("#id").attr("value",datosInstitucion[0].id);
		$("#fechaUltActInstitucion").html("  Ultima Actualización: "+ fechaUlt.getDate()+"/"+(fechaUlt.getMonth()+1)+"/"+fechaUlt.getFullYear()+" "+fechaUlt.getHours()+":"+fechaUlt.getMinutes()+":"+fechaUlt.getSeconds());
		
		$("#nivelDescrip").attr("value",datosNiveles[0].nombreNivel);
		$("#entidadDescrip").attr("value",datosEntidadDescripcion[0].nombreEntidad);
		if(datosUnidadResponsable.length>0){
			$("#unidadResponsableDescrip").attr("value",datosUnidadResponsable[0].unrNombre);	
		}else{
			$("#unidadResponsableDescrip").attr("value","0");
		}
		if(datosUnidadJerarquica.length>0){
			$("#unidadJerarquicaDescrip").attr("value",datosUnidadJerarquica[0].unJerNombre);
		}else{
			$("#unidadJerarquicaDescrip").attr("value","0");
		}

		<% if (attributes.get("role_id").toString().equals("3")){%>
		<%-- <% if (attributes.get("role_id").toString().equals("2") || attributes.get("role_id").toString().equals("3")){%> --%>
			$("#abrev").attr("disabled","");
			$("#baseLegal").attr("disabled","");
			$("#mision").attr("disabled","");
			$("#vision").attr("disabled","");
			$("#diagnostico").attr("disabled","");
			$("#objetivo").attr("disabled","");
			$("#politica").attr("disabled","");
		<%}%>
		
		$("body").on("click", "#listarEntidades",function(event){
			window.location.replace("./entidad.jsp");
		});
		$("body").on("click", "#listarProgramacion",function(event){
			window.location.replace("./programacion.jsp");
		});
		$("body").on("click", "#listarProductos",function(event){
			window.location.replace("./producto.jsp");
		});
		$("body").on("click", "#listarProgramas",function(event){
			window.location.replace("./pnd.jsp");
		});
		     
		
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
<script>
var entidad;
var entidades;

</script>
    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="/frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
  			 <%@ include file="/frames/main-sidebar.jsp" %>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
			<h2> Perfil Institucional <small> (FG-01 del SIPP)</small></h2>
		</div>
        <section class="content-header">
          <h1>
            <small>
            <!--  Titulo, donde antes estaba dashboard -->
            </small>
          </h1>
          <ol class="breadcrumb">
            <li id="f1c2"><i class="fa fa-dashboard"></i> </li>
            <li id="f2c2" ></li>
            <li id="f3c2" ></li>
            <li id="f4c2" ></li>
            <li id="f5c2"></li>
            <li id="f6c2" class="active"></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
          <!-- Info row de buscador de productos -->
         <div class="row">
          <div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Institución
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
			<%@ include file="/frames/entidad-formulario.jsp" %>
			</ul>
		</div>
	</div>
</div>
          </div><!-- /.row -->

          
          
               
          
    </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
      </footer>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-light">
			<%@ include file="/frames/control-sidebar.jsp"%>
		</aside><!-- /.control-sidebar -->
		<div class='control-sidebar-bg'></div>
	</div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>

    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
    <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
