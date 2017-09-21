<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="plugins/c3/c3.min.css" rel="stylesheet" type="text/css">
	<!-- MAPA-->
	<link rel="stylesheet" href="plugins/mapa/leaflet.css" />
	
	<style type="text/css">
		.modal {
			visibility: hidden;
			display: block;
		}
		
		.modal[aria-hidden='false'] {
			visibility: visible;
			display: block;
		}
		/* .info {
			padding: 6px 8px;
			font: 14px/16px Arial, Helvetica, sans-serif;
			background: white;
			background: rgba(255, 255, 255, 0.8);
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
			border-radius: 5px;
		}
 */		
		.legend {
			line-height: 18px;
			color: #555;
		}
		
		.legend i {
			width: 18px;
			height: 18px;
			float: left;
			margin-right: 8px;
			opacity: 0.7;
		}
		
		 .legend p {
			margin-top:0;
		 	margin-bottom:0;
		 }
</style>
	<script type="text/javascript" src="frames/pndEstructura.js"></script>
</head>
<body class="skin-blue sidebar-mini sidebar-collapse">
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
textarea { text-transform: uppercase; };
span.badge{
	min-width: 25px;
};

 .estrategiaTabla {
	padding-bottom: 5px !important;
	padding-left: 10px !important;
}	

.btn-app.col-md-5.modalF1C1{
	width: 45%;
}

.btn-app.col-md-10.modalF1C1{
	width: 96%;
	

}
.info-box-number {
    display: block;
    font-weight: bold;
    font-size: 34px;
}
.legend {
	line-height: 18px;
	color: #555;
}

.legend i {
	width: 18px;
	height: 18px;
	float: left;
	margin-right: 8px;
	opacity: 0.7;
}

.legend p {
	margin-top:0;
 	margin-bottom:0;
 }
</style>
    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="/frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
  			 <%@ include file="/frames/main-sidebar.jsp" %>
      </aside>
	  <%@ include file="/frames/sprUtils.jsp" %>
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
	          <!-- Info row de buscador de productos -->
	          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
							<div class="row">
								<div class="col-md-8">
									<h3 class="box-title col-md-7" id="tituloTipoPrograma">
										Tablero de Control del Plan Nacional de Desarrollo (PND)
										Paraguay 2030</h3>
								</div>
								<div class="nav-tabs-custom col-md-4">
									<ul class="nav nav-tabs pull-right">
										<li><button class="btn btn-box-tool"data-widget="collapse"><i class="fa fa-minus"></i></button></li>
										<li class="active"><a href="#tab_41-1" data-toggle="tab" title="Tablero PND"><i class="fa fa-dashboard"></i></a></li>
										<li><a href="#tab_42-2" data-toggle="tab" title="Tablas PND"><i class="fa fa-table "></i></a></li>
										<li><a href="#tab_42-3" data-toggle="tab" title="Graficos PND"><i class="fa fa-pie-chart "></i></a></li>
										<li><a href="#tab_42-4" data-toggle="tab" title="Graficos Presupuesto"><i class="fa fa-bar-chart-o"></i></a></li>
									</ul>
								</div>
							</div><!-- fin row de pestañas y titulo -->
							<div class="container">
								<div class="row">
									<div class="row">
										<div class="col-md-4">
											<select class="form-control" id="selectorDeNivel">
												<option value='0' selected>Nivel</option>
											</select> 
										</div>
										<div class="col-md-4">
											<select class="form-control" id="selectorDeEntidad">
												<option value='0-0' selected>Entidad</option>
											</select> 
										</div>
										<div class="col-md-4">
											<select class="form-control" id="selectorDeTipoPresupuesto">
												<option value='' selected>Tipo de Programa</option>
											</select> 
										</div>
										<div class="col-md-12">
											<select class="form-control" id="selectorDePrograma">
												<option value='' selected>Programa</option>
											</select> 
										</div>
										<div class="col-md-12">
											<select class="form-control" id="selectorDeSubPrograma">
												<option value='' selected>Sub Programa</option>
											</select> 
										</div>
										<div class="col-md-12">
											<select class="form-control" id="selectorDeProyecto">
												<option value='' selected>Proyecto</option>
											</select> 
										</div>
										<div class="col-md-12">
											<select class="form-control" id="selectorDeProducto">
												<option value='' selected>Producto</option>
											</select>
										</div>
									</div>
								</div><!-- fin row de selectores -->
							</div><!-- fin container de selectores -->
						</div>
	            <div class="box-body" >
 						<div class="tab-content">
 							<div class="tab-pane active" id="tab_41-1">
 								<div class="col-md-2"></div>
 								<div class="col-md-8">
	 								 <table class="table table-striped table-bordered table-hover" id="tablaPresupuestoPnd">
					
						  				<tr>
						  					<td>
						  					
						  					 <div class="col-md-12">
									          <div class="box box-default box-solid" objeto="estrategia" cod="0">
									            <div class="box-header bg-teal with-border">
									              <h3 class="box-title">Proyecto de Presupuesto 2017  <small id="verEstrategias" style="color:#fff"><a>Ver ejes</a></small> </h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
									            	<div class="col-md-6 col-sm-6 col-xs-12 modalF1C1"  parametros="0-0-0-Entidades-0">
										              <div class="info-box bg-teal">
										                <span class="info-box-icon"><i class="fa fa-building"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entidades</span>
										                  <span class="info-box-number bj-entidades"></span>
										                  <div class="progress">
										                    <div class="progress-bar entidades-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description entidades-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="0-0-0-Reultados-0">
										              <div class="info-box bg-teal">
										                <span class="info-box-icon"><i class="fa fa-chain"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Objetivos PND</span>
										                  <span class="info-box-number bj-resultados"></span>
										                  <div class="progress">
										                    <div class="progress-bar resultados-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description resultados-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										             <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="0-0-0-Productos-0">
										              <div class="info-box bg-teal">
										                <span class="info-box-icon"><i class="fa fa-truck"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Tipos de producto</span>
										                  <span class="info-box-number bj-productos"></span>
										                  <div class="progress">
										                    <div class="progress-bar productos-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description productos-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="0-0-0-Destinatarios-0">
										              <div class="info-box bg-teal">
										                <span class="info-box-icon"><i class="fa fa-users"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entregas de Productos</span>
										                  <span class="info-box-number bj-destinatarios"></span>
										                  <div class="progress">
										                    <div class="progress-bar destinatarios-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description destinatarios-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-12 col-sm-12 col-xs-12 modalF1C1" parametros="0-0-0-Presupuesto-0">
										              <div class="info-box bg-teal">
										                <span class="info-box-icon"><i class="fa">₲</i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Asignación Financiera</span>
										                  <span class="info-box-number bj-presupuesto"></span>
										                  <div class="progress">
										                    <div class="progress-bar presupuesto-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description presupuesto-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
									            	
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
						  					</td> 
						  				</tr>
				  				</table>
				  			</div>
 							<div class="col-md-2"></div>

 								 <table class="table table-striped table-bordered table-hover" id="tablaPresupuestoPndEstrategias" style="display:none"> <!-- tabla pnd por estrategias -->
					            	<tr>
					            		<th><h3 class="box-title">Proyecto de Presupuesto 2017  <small id="verPndTotal" style="color:#fff"><a>Ver totales</a></small> </h3></th>
					  					<th colspan="4" class="desagregacionLineas"> <h3>Líneas Transversales <small id="ocultarLineas" style="color:#fff"><a>Ocultar estrategias</a></small></h3></th>   
					  				</tr>
					  				<tr>
					            		<th><h3>Ejes Estratégicos <small id="verPorLineas" style="color:#fff"><a>Ver estrategias</a></small> </h3></th>
					  					<th class="desagregacionLineas">Entidades</th>
					  					<th class="desagregacionLineas">Objetivos</th> 
					  					<th class="desagregacionLineas">Tipo de Producto</th> 
					  					<th class="desagregacionLineas">Entregas de Productos</th> 
					  					<th class="desagregacionLineas">Presupuesto</th>  
					  				</tr>
					  				<tr>
					            		<th class="totalesPorEje">
					            		
					            		 <div class="col-md-12">
								          <div class="box box-success box-solid" objeto="eje" cod="1">
								            <div class="box-header with-border bg-green-active color-palette">
								            <h3>Eje 1: Reducción de pobreza y desarrollo social <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje1.png" style="width: 50px;"><h3>
								            </div><!-- /.box-header -->
								            <div class="box-body " >
								            	
			              						<div class="col-md-6 col-sm-6 col-xs-12 modalF1C1"  parametros="1-0-0-Entidades-0">
										              <div class="info-box bg-green">
										                <span class="info-box-icon"><i class="fa fa-building"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entidades</span>
										                  <span class="info-box-number bj-entidades"></span>
										                  <div class="progress">
										                    <div class="progress-bar entidades-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description entidades-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="1-0-0-Reultados-0">
										              <div class="info-box bg-green">
										                <span class="info-box-icon"><i class="fa fa-chain"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Objetivos PND</span>
										                  <span class="info-box-number bj-resultados"></span>
										                  <div class="progress">
										                    <div class="progress-bar resultados-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description resultados-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										             <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="1-0-0-Productos-0">
										              <div class="info-box bg-green">
										                <span class="info-box-icon"><i class="fa fa-truck"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Tipos de producto</span>
										                  <span class="info-box-number bj-productos"></span>
										                  <div class="progress">
										                    <div class="progress-bar productos-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description productos-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="1-0-0-Destinatarios-0">
										              <div class="info-box bg-green">
										                <span class="info-box-icon"><i class="fa fa-users"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entregas de Productos</span>
										                  <span class="info-box-number bj-destinatarios"></span>
										                  <div class="progress">
										                    <div class="progress-bar destinatarios-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description destinatarios-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-12 col-sm-12 col-xs-12 modalF1C1" parametros="1-0-0-Presupuesto-0">
										              <div class="info-box bg-green">
										                <span class="info-box-icon"><i class="fa">₲</i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Asignación Financiera</span>
										                  <span class="info-box-number bj-presupuesto"></span>
										                  <div class="progress">
										                    <div class="progress-bar presupuesto-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description presupuesto-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
			              						
								            </div><!-- /.box-body -->
								          </div> <!-- /.box -->
								        </div><!-- /.col -->
					            		
					            		</th>
					            		
					            		
					            		
					  					<td class="desagregacionLineas">
					  					
					  					 <div class="col-md-12">
								          <div class="box box-success box-solid" objeto="estrategia" cod="1">
								            <div class="box-header with-border">
								              <h3 class="box-title">Desarrollo social equitativo <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje1.png" style="width: 30px;"></h3>
								            </div><!-- /.box-header -->
								            <div class="box-body">
								            	<a class=" btn-app col-md-5 modalF1C1" parametros="1-1-1-Entidades-0" style="font-size:14px;">
			                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
			                						<i class="fa fa-building"></i><strong>Entidades</strong> 
			              						</a>
			              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-1-1-Reultados-0" style="font-size:14px;">
			                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
			                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
			              						</a>
			              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-1-1-Productos-0" style="font-size:14px;">
			                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
			                						<i class="fa fa-truck"></i><strong>Productos</strong>
			              						</a>
			              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-1-1-Destinatarios-0" style="font-size:14px;">
			                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
			                						<i class="fa fa-users"></i><strong>Destinatarios</strong>
			              						</a>
			              						<a class=" btn-app col-md-10 modalF1C1" parametros="1-1-1-Presupuesto-0" style="font-size:14px;">
			                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
			                						<i class="fa">₲</i><strong>Presupuesto</strong>
			              						</a>
								            </div><!-- /.box-body -->
								          </div> <!-- /.box -->
								        </div><!-- /.col -->
								        
			
					  					</td> 
					  					<td class="desagregacionLineas">
						  					<div class="col-md-12">
									          <div class="box box-success box-solid" objeto="estrategia" cod="2">
									            <div class="box-header with-border">
									              <h3 class="box-title">Servicios sociales de calidad <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje1.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
							  						<a class=" btn-app col-md-5 modalF1C1" parametros="1-2-2-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-2-2-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-2-2-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-2-2-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong>
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="1-2-2-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">₲</i><strong>Presupuesto</strong>
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-success box-solid" objeto="estrategia" cod="3">
									            <div class="box-header with-border">
									              <h3 class="box-title">Desarrollo local participativo <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje1.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="1-3-3-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-3-3-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-3-3-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-3-3-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong>
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="1-3-3-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">₲</i><strong>Presupuesto</strong>
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-success box-solid" objeto="estrategia" cod="4">
									            <div class="box-header with-border">
									              <h3 class="box-title">Hábitat adecuado y sostenible <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje1.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="1-4-4-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-4-4-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-4-4-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="1-4-4-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong>
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="1-4-4-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">₲</i><strong>Presupuesto</strong>
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td>  
					  				</tr>
					  				<tr>
					            		<th class="totalesPorEje">
					            			<div class="col-md-12">
								          <div class="box box-warning box-solid" objeto="eje" cod="2">
								            <div class="box-header with-border bg-orange-active color-palette">
								            <h3>Eje 2: Crecimiento económico inclusivo <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje2-blanco.png" style="width: 50px;"><h3>
								            </div><!-- /.box-header -->
								            <div class="box-body " >
								            		<div class="col-md-6 col-sm-6 col-xs-12 modalF1C1"  parametros="2-0-0-Entidades-0">
										              <div class="info-box bg-orange">
										                <span class="info-box-icon"><i class="fa fa-building"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entidades</span>
										                  <span class="info-box-number bj-entidades"></span>
										                  <div class="progress">
										                    <div class="progress-bar entidades-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description entidades-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="2-0-0-Reultados-0">
										              <div class="info-box bg-orange">
										                <span class="info-box-icon"><i class="fa fa-chain"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Objetivos PND</span>
										                  <span class="info-box-number bj-resultados"></span>
										                  <div class="progress">
										                    <div class="progress-bar resultados-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description resultados-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										             <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="2-0-0-Productos-0">
										              <div class="info-box bg-orange">
										                <span class="info-box-icon"><i class="fa fa-truck"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Tipos de producto</span>
										                  <span class="info-box-number bj-productos"></span>
										                  <div class="progress">
										                    <div class="progress-bar productos-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description productos-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="2-0-0-Destinatarios-0">
										              <div class="info-box bg-orange">
										                <span class="info-box-icon"><i class="fa fa-users"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entregas de Productos</span>
										                  <span class="info-box-number bj-destinatarios"></span>
										                  <div class="progress">
										                    <div class="progress-bar destinatarios-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description destinatarios-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-12 col-sm-12 col-xs-12 modalF1C1" parametros="2-0-0-Presupuesto-0">
										              <div class="info-box bg-orange">
										                <span class="info-box-icon"><i class="fa ">₲</i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Asignación Financiera</span>
										                  <span class="info-box-number bj-presupuesto"></span>
										                  <div class="progress">
										                    <div class="progress-bar presupuesto-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description presupuesto-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
								          
								            </div><!-- /.box-body -->
								          </div> <!-- /.box -->
								        </div><!-- /.col -->
					            		
					            		</th>
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-warning box-solid" objeto="estrategia" cod="5">
									            <div class="box-header with-border">
									              <h3 class="box-title">Empleo y seguridad social <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje2-blanco.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="2-1-5-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-1-5-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-1-5-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-1-5-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong>
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="2-1-5-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong>
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-warning box-solid" objeto="estrategia" cod="6">
									            <div class="box-header with-border">
									              <h3 class="box-title">Competitividad e innovación <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje2-blanco.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="2-2-6-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-2-6-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-2-6-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-2-6-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong> 
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="2-2-6-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong> 
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-warning box-solid" objeto="estrategia" cod="7">
									            <div class="box-header with-border">
									              <h3 class="box-title">Regionalización y diversificación productiva <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje2-blanco.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="2-3-7-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-3-7-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-3-7-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-3-7-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong> 
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="2-3-7-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong> 
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-warning box-solid" objeto="estrategia" cod="8">
									            <div class="box-header with-border">
									              <h3 class="box-title">Valorización del capital ambiental <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje2-blanco.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="2-4-8-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-4-8-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-4-8-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="2-4-8-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong> 
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="2-4-8-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong> 
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td>  
					  				</tr>
					  				<tr>
					            		<th class="totalesPorEje">
					            			<div class="col-md-12">
								          <div class="box box-primary box-solid" objeto="eje" cod="3">
								            <div class="box-header with-border bg-light-blue-active color-palette">
								            <h3>Eje 3: Inserción de Paraguay en el mundo <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje3.png" style="width: 50px;"><h3>
								            </div><!-- /.box-header -->
								            <div class="box-body " >
								            	<div class="col-md-6 col-sm-6 col-xs-12 modalF1C1"  parametros="3-0-0-Entidades-0">
										              <div class="info-box bg-blue">
										                <span class="info-box-icon"><i class="fa fa-building"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entidades</span>
										                  <span class="info-box-number bj-entidades"></span>
										                  <div class="progress">
										                    <div class="progress-bar entidades-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description entidades-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="3-0-0-Reultados-0">
										              <div class="info-box bg-blue">
										                <span class="info-box-icon"><i class="fa fa-chain"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Objetivos PND</span>
										                  <span class="info-box-number bj-resultados"></span>
										                  <div class="progress">
										                    <div class="progress-bar resultados-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description resultados-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										             <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="3-0-0-Productos-0">
										              <div class="info-box bg-blue">
										                <span class="info-box-icon"><i class="fa fa-truck"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Tipos de producto</span>
										                  <span class="info-box-number bj-productos"></span>
										                  <div class="progress">
										                    <div class="progress-bar productos-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description productos-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-6 col-sm-6 col-xs-12 modalF1C1" parametros="3-0-0-Destinatarios-0">
										              <div class="info-box bg-blue">
										                <span class="info-box-icon"><i class="fa fa-users"></i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Entregas de Productos</span>
										                  <span class="info-box-number bj-destinatarios"></span>
										                  <div class="progress">
										                    <div class="progress-bar destinatarios-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description destinatarios-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
										            <div class="col-md-12 col-sm-12 col-xs-12 modalF1C1" parametros="3-0-0-Presupuesto-0">
										              <div class="info-box bg-blue">
										                <span class="info-box-icon"><i class="fa">₲</i></span>
										                <div class="info-box-content">
										                  <span class="info-box-text">Asignación Financiera</span>
										                  <span class="info-box-number bj-presupuesto"></span>
										                  <div class="progress">
										                    <div class="progress-bar presupuesto-ratio" style="width: 0%"></div>
										                  </div>
										                  <span class="progress-description presupuesto-progreso"></span>
										                </div><!-- /.info-box-content -->
										              </div><!-- /.info-box -->
										            </div>
								            
								       
								            </div><!-- /.box-body -->
								          </div> <!-- /.box -->
								        </div><!-- /.col -->
					            		</th>
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-primary box-solid" objeto="estrategia" cod="9">
									            <div class="box-header with-border">
									              <h3 class="box-title">Igualdad de oportunidades en un mundo globalizado <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje3.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="3-1-9-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-1-9-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-1-9-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-1-9-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong> 
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="3-1-9-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong> 
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-primary box-solid" objeto="estrategia" cod="10">
									            <div class="box-header with-border">
									              <h3 class="box-title">Atracción de inversiones, comercio exterior e imagen país <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje3.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="3-2-10-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-2-10-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-2-10-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-2-10-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong> 
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="3-2-10-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong> 
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-primary box-solid" objeto="estrategia" cod="11">
									            <div class="box-header with-border">
									              <h3 class="box-title">Integración económica regional <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje3.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="3-3-11-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-3-11-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-3-11-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-3-11-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong>  
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="3-3-11-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong>  
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td> 
					  					<td class="desagregacionLineas">
					  						<div class="col-md-12">
									          <div class="box box-primary box-solid" objeto="estrategia" cod="12">
									            <div class="box-header with-border">
									              <h3 class="box-title">Sostenibilidad del hábitat global <img class="pull-right" src="http://spr.stp.gov.py/dist/img/eje3.png" style="width: 30px;"></h3>
									            </div><!-- /.box-header -->
									            <div class="box-body">
						  							<a class=" btn-app col-md-5 modalF1C1" parametros="3-4-12-Entidades-0" style="font-size:14px;">
				                						<span class="badge bg-maroon bj-entidades" style="font-size:13px;">0</span>
				                						<i class="fa fa-building"></i><strong>Entidades</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-4-12-Reultados-0" style="font-size:14px;">
				                						<span class="badge bg-purple bj-resultados" style="font-size:13px;">0</span>
				                						<i class="fa  fa-chain "></i><strong>Objetivos</strong>  
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-4-12-Productos-0" style="font-size:14px;">
				                						<span class="badge bg-olive bj-productos" style="font-size:13px;">0</span>
				                						<i class="fa fa-truck"></i><strong>Productos</strong> 
				              						</a>
				              						<a class=" btn-app col-md-5 modalF1C1" parametros="3-4-12-Destinatarios-0" style="font-size:14px;">
				                						<span class="badge bg-light-blue bj-destinatarios" style="font-size:13px;">0</span>
				                						<i class="fa fa-users"></i><strong>Destinatarios</strong> 
				              						</a>
				              						<a class=" btn-app col-md-10 modalF1C1" parametros="3-4-12-Presupuesto-0" style="font-size:14px;">
				                						<span class="badge bg-light-green bj-presupuesto" style="font-size:13px;">0</span>
				                						<i class="fa">Gs.</i><strong>Presupuesto</strong> 
				              						</a>
									            </div><!-- /.box-body -->
									          </div> <!-- /.box -->
									        </div><!-- /.col -->
					  					</td>  
					  				</tr>
				  				</table> <!-- fin tabla PND por estrategias -->
 							</div>

 						</div>
					</div> <!-- fin contenedor de tabs -->
	            </div><!-- /.box -->
			   </div><!-- /.col -->
			</div><!-- /.row -->
         
          
    </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
	
		<script src="frames/reportePND.js"></script>

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-light">
		<!-- include file="/frames/control-sidebar.jsp"  -->
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
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
    <!-- <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script> -->
	<script src="plugins/Chart.min.js" type="text/javascript"></script>
	<!-- C3 -->
	<script src="plugins/c3/c3.min.js" type="text/javascript"></script>
	<script src="plugins/c3/d3.v3.min.js" type="text/javascript"></script>
	<!-- Leaflet -->
	
	<script src='dist/leaflet-image.js'></script>
	
	<script src="plugins/mapa/leaflet.js"></script>
	<script type="text/javascript" src="plugins/mapa/leaflet.ajax.js"></script>
	<script src="plugins/mapa/spin.js"></script>
	<script src="plugins/mapa/leaflet.spin.js"></script>
	<script src="plugins/mapa/deptos2012.geojson" type="text/javascript"></script>	
	
	
				
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
