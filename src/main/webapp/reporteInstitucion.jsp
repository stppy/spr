<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
	  	<!--  ISO-8859-1 -->
	  	<%@ include file="/frames/head.jsp" %>
		<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
		<script src="plugins/iCheck/icheck.js" type="text/javascript"></script>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	</head>
	
	<body class="skin-blue sidebar-mini">
		<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
		<% Map attributes = user.getAttributes(); 
		if (user != null) { %>
			<%@ include file="/frames/perfil.jsp" %>
	
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
		</style>
	
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
				<section class="content-header">
		          	<h1>
						<small>
						<!--  Titulo, donde antes estaba dashboard -->
						</small>
					</h1> 
		        </section>
		        
		        <!-- Main content -->
				<section class="content" id="programacion">
					<form id="formularioGeneracionReporte" >
						<div class="row no-print">
							<div class="col-md-12">
								<div class="box box-info" height="1000px">
									<div class="box-header with-border" height="1000px">
										<h3 class="box-title" id="tituloTipoPrograma">Selección de Módulos</h3>
										<div class="box-tools pull-right" height="1000px">
						              		<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
										</div>
						            </div>
						            <div class="box-body" >
										<ul  class="col-md-12">
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<td><input class="flat-red" type="checkbox"  checked="checked" name="checkInstitucional" id="checkInstitucional" /></td>
													<td><p>PERFIL INSTITUCIONAL</p></td>
												</tr>
												<tr>
													<td><input class="flat-red" type="checkbox"  checked="checked" name="checkEstructura" id="checkEstructura" /></td>
													<td><p>FUNDAMENTACIÓN DE PROGRAMA, SUBPROGRAMA Y PROYECTOS</p></td>
												</tr>
												<tr>
													<td colspan="2"><p align="left"><b>PROGRAMACION DE PRODUCTOS</b></p></td>
												</tr>
												<tr>
													<td><input class="flat-red" type="checkbox"  checked="checked" name="checkCadena" id="checkCadena" /></td>
													<td><p>CADENA DE VALOR</p></td>
												</tr>
												<tr>
													<td><input type='checkbox'  checked="checked" name="checkProgramacionAgregada" id="checkProgramacionAgregada" /></td>
													<td><p>PROGRAMACIÓN FÍSICA DE PRODUCTOS <small>(Agregada)</small></p></td>
												</tr>
												<tr>
													<td><input type='checkbox'  checked="checked" name="checkProgramacion" id="checkProgramacion" /></td>
													<td><p>PROGRAMACIÓN FÍSICA DE PRODUCTOS <small>(Detallada)</small></p></td>
												</tr>
												<tr>
													<td><input type='checkbox'  checked="checked" name="checkDestinatarios" id="checkDestinatarios" /></td>
													<td><p>DESTINATARIOS DE PRODUCTOS</p></td>
												</tr>
												<tr>
													<td colspan="2"><p align="left"><b>ANEXOS</b></p></td>
												</tr>
												<tr>
													<td><input type='checkbox'  checked="checked" name="checkIndicadores" id="checkIndicadores" /></td>
													<td><p>ANEXO A - FICHA DE INDICADORES DE RESULTADO</p></td>
												</tr>
												<!-- <tr>
													<td><input type='checkbox'  checked="checked" name="checkPnd" id="checkPnd" /></td>
													<td><p>ANEXO B - PLAN NACIONAL DE DESARROLLO: Estrategias PND</p></td>
												</tr> -->
											</table>
										</ul>	
									</div>
								</div>
							</div>
						</div><!-- /.row -->
						
						<div class="row no-print">
							<div class="col-md-12">
								<div class="box box-info" height="1000px">
						        	<div class="box-header with-border" height="1000px">
						            	<h3 class="box-title" id="tituloTipoPrograma">Selección de Estructura</h3>
										<div class="box-tools pull-right" height="1000px">
											<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
										</div>
						            </div>
						            <div class="box-body" id="listaDeEstructura">
		
						            </div>
								</div>
							</div>
						</div><!-- /.row -->
					          
						<div class="row no-print">
							<div class="col-md-12">
								<div class="col-md-3">
									<button type="button" class="btn btn-box btn-primary" id="generarReporteSpinner" ><p align="center">GENERAR REPORTE</p></button>
									<input type="hidden" id="generarReporte" value="">									
								</div>
								<div class="col-md-6" align="center" id="spinGenerarReporte" style="display:none; margin: 0 auto;">
									<div class="box box-info">
										<div class="box-body">
											<span>Generando Reporte... Espere por favor.</span>
											<img src="dist/img/loading_spinner.gif" width="30px"></img>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
		<br>
					<div class="row">
						<div class="col-md-12">
							<div class="box box-info" height="1000px">
								<div class="box-header with-border no-print" height="1000px">
									<h3 class="box-title" id="reporte">Reporte</h3>
									<div class="box-tools pull-right" height="1000px">
										<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
									</div>
								</div>
								<div class="box-body" id="reporteCuerpo">
								</div>
								<div class="col-xs-12" id="anexos" style="display: none;">
									<%@include file="frames/pndReporte.jsp" %>
								</div>
								<div class="box-body no-print" style="display: none;" id="imprimirReporteInstButton">
									<button  class="btn btn-box btn-primary" id="imprimirReporteInst" ><p align="center">IMPRIMIR REPORTE</p></button>
								</div>
							</div>
						</div>
					</div>
				</section><!-- /.content -->
			</div><!-- /.content-wrapper -->
		
			<footer class="main-footer no-print">
				<div class="pull-right hidden-xs">
					<b>Version</b> 2.0
				</div>
				<strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
			</footer>
		      
			<script src="/frames/reporteInstitucion.js"></script>
		
			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-light">
			<!-- include file="/frames/control-sidebar.jsp"  -->
			</aside><!-- /.control-sidebar -->
		     	<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
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
	
	    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
	    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->
	
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