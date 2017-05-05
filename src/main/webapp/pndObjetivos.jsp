<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/frames/head.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!--<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>-->
	<!-- Bootstrap CSS -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>

 <style>
	
	.node {
		cursor: pointer;
	}

	.node circle {
	  fill: #fff;
	  stroke: steelblue;
	  stroke-width: 3px;
	}

	.node text {
	  font: 12px sans-serif;
	}

	.link {
	  fill: none;
	  stroke: #ccc;
	  stroke-width: 2px;
	}
	
    </style>

</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
<script>
<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2") || attributes.get("role_id_tablero").toString().equals("3")){%>
 	$(document).ready(function(){
 		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
		usuarioRolCas="<%=attributes.get("role_id_tablero") %>";
		var usuarios = $.ajax({
			url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		
	});
<%}else{%>
	window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%}%>
</script>
	<div class="wrapper">

		<header class="main-header">
			<%@ include file="/frames/mainheader.jsp"%>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
	      <aside class="main-sidebar">
	  			 <%@ include file="/frames/main-sidebar.jsp" %>
	      </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			 <section class="content-header">
	          <h1>
	            <small>
	            <!--  Titulo, donde antes estaba dashboard -->
	            </small>
	          </h1>
	        </section>

			<!-- Main content -->
			 <section class="content" id="contenedorDocumentos">
			 
			 	<div class="row">
				<div class="col-md-12">
					<div class="box" height="1000px">
						<div class="box-header with-border" height="1000px">
							<h3 class="box-title col-md-8" id="tituloPndEntidades">
								ENTIDAD: <span id="entidadSeleccionada"></span>
							</h3>
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
														<div class="box box-success box-solid" objeto="estrategia" cod="0">
															<div class="box-header with-border">
																<h3 class="box-title">Presupuesto y POI del Plan Nacional de Desarrollo </h3>
															</div><!-- /.box-header -->
															<div class="box-body">
																<div class="info-box bg-navy">
													                <span class="info-box-icon"><i class="fa fa-building"></i></span>
													                <div class="info-box-content">
													                	<span class="info-box-text">Entidades</span>
													            		<span class="info-box-number bj-entidades"></span>
													            	</div><!-- /.info-box-content -->
													        	</div><!-- /.info-box -->
														        	
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa  fa-chain "></i><strong> Objetivos</strong> </h3>
																	</div><!-- /.box-header -->
																	<div class="box-body" id="tablaObjetivos">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box objetivos -->
																
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa fa-truck"></i><strong> Productos</strong></h3>
																	</div><!-- /.box-header -->
																	<div class="box-body" id="tablaProductos">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box -->
																
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa fa-users"></i><strong> Destinatarios</strong></h3>
																	</div><!-- /.box-header -->
																	<div class="box-body" id="tablaDestinatarios">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box -->
																
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa">Gs.</i><strong> Presupuesto</strong></h3>
																	</div><!-- /.box-header -->
																	<div class="box-body" id="tablaPresupuesto">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box -->
															</div><!-- /.box-body -->
														</div><!--  /.box -->
													</div><!-- /.col -->
												</td>
											</tr>
										</table>
									
									</div>
									<table class="table table-striped table-bordered table-hover" id="tablaPresupuestoPndEstrategias" style="display:none"> <!-- tabla pnd por estrategias -->
										<tr>
												<td>
													<div class="col-md-12">
														<div class="box box-success box-solid" objeto="estrategia" cod="0">
															<div class="box-header with-border">
																<h3 class="box-title">Presupuesto y POI del Plan Nacional de Desarrollo </h3>
															</div><!-- /.box-header -->
															<div class="box-body">
																<div class="box box-default box-solid">
													               <div class="box-header with-border">
																		<h3 class="box-title"><i class="fa fa-building"></i><strong>Entidades</strong> </h3>
																	</div><!-- <!-- /.box-header --> -->
																	<div class="box-body" id="tablaEntidades">
																	</div><!-- /.box-body -->
													        	</div><!-- /.info-box -->
														        	
																<div class="info-box bg-navy" objeto="estrategia" cod="0">
																	<span class="info-box-icon"><i class="fa fa-chain"></i></span>
													                <div class="info-box-content">
													                	<span class="info-box-text">Objetivos</span>
													            		<span class="info-box-number bj-objetivos"></span>
													            	</div><!-- /.info-box-content -->
																</div><!--  /.box objetivos -->
																
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa fa-truck"></i><strong> Productos</strong></h3>
																	</div><!-- <!-- /.box-header --> -->
																	<div class="box-body" id="tablaProductos">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box -->
																
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa fa-users"></i><strong> Destinatarios</strong></h3>
																	</div><!-- /.box-header -->
																	<div class="box-body" id="tablaDestinatarios">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box -->
																
																<div class="box box-default box-solid" objeto="estrategia" cod="0">
																	<div class="box-header with-border">
																		<h3 class="box-title"><i class="fa">Gs.</i><strong> Presupuesto</strong></h3>
					<!-- /.box-header --></div><!-- /.box-header -->
																	<div class="box-body" id="tablaPresupuesto">
																		
																	</div><!-- /.box-body -->
																</div><!--  /.box -->
															</div><!-- /.box-body -->
														</div><!--  /.box -->
													</div><!-- /.col -->
												</td>
											</tr>
									</table>
								 		
								 		
								 		<%-- <div id="treeContainer" class="contenedorArbol" parametros="<%= request.getParameter("parametros")%>"></div> --%>

										
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			 	        <!-- load the d3.js library -->	
						<script src="http://d3js.org/d3.v3.min.js"></script>
							
						<script>
						/*var treeData = [
						  {
						    "name": "Top Level",
						    "parent": "null",
						    "children": [
						      {
						        "name": "Level 2: A",
						        "parent": "Top Level",
						        "children": [
						          {
						            "name": "Son of A",
						            "parent": "Level 2: A"
						          },
						          {
						            "name": "Daughter of A",
						            "parent": "Level 2: A"
						          }
						        ]
						      },
						      {
						        "name": "Level 2: B",
						        "parent": "Top Level"
						      }
						    ]
						  }
						];
						
						
						// ************** Generate the tree diagram	 *****************
						var margin = {top: 20, right: 120, bottom: 20, left: 120},
							width = 960 - margin.right - margin.left,
							height = 500 - margin.top - margin.bottom;
							
						var i = 0,
							duration = 750,
							root;
						
						var tree = d3.layout.tree()
							.size([height, width]);
						
						var diagonal = d3.svg.diagonal()
							.projection(function(d) { return [d.y, d.x]; });
						
						var svg = d3.select("body").append("svg")
							.attr("width", width + margin.right + margin.left)
							.attr("height", height + margin.top + margin.bottom)
						  .append("g")
							.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
						
						root = treeData[0];
						root.x0 = height / 2;
						root.y0 = 0;
						  
						update(root);
						
						d3.select(self.frameElement).style("height", "500px");
						
						function update(source) {
						
						  // Compute the new tree layout.
						  var nodes = tree.nodes(root).reverse(),
							  links = tree.links(nodes);
						
						  // Normalize for fixed-depth.
						  nodes.forEach(function(d) { d.y = d.depth * 180; });
						
						  // Update the nodes…
						  var node = svg.selectAll("g.node")
							  .data(nodes, function(d) { return d.id || (d.id = ++i); });
						
						  // Enter any new nodes at the parent's previous position.
						  var nodeEnter = node.enter().append("g")
							  .attr("class", "node")
							  .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
							  .on("click", click);
						
						  nodeEnter.append("circle")
							  .attr("r", 1e-6)
							  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });
						
						  nodeEnter.append("text")
							  .attr("x", function(d) { return d.children || d._children ? -13 : 13; })
							  .attr("dy", ".35em")
							  .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
							  .text(function(d) { return d.name; })
							  .style("fill-opacity", 1e-6);
						
						  // Transition nodes to their new position.
						  var nodeUpdate = node.transition()
							  .duration(duration)
							  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });
						
						  nodeUpdate.select("circle")
							  .attr("r", 10)
							  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });
						
						  nodeUpdate.select("text")
							  .style("fill-opacity", 1);
						
						  // Transition exiting nodes to the parent's new position.
						  var nodeExit = node.exit().transition()
							  .duration(duration)
							  .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
							  .remove();
						
						  nodeExit.select("circle")
							  .attr("r", 1e-6);
						
						  nodeExit.select("text")
							  .style("fill-opacity", 1e-6);
						
						  // Update the links…
						  var link = svg.selectAll("path.link")
							  .data(links, function(d) { return d.target.id; });
						
						  // Enter any new links at the parent's previous position.
						  link.enter().insert("path", "g")
							  .attr("class", "link")
							  .attr("d", function(d) {
								var o = {x: source.x0, y: source.y0};
								return diagonal({source: o, target: o});
							  });
						
						  // Transition links to their new position.
						  link.transition()
							  .duration(duration)
							  .attr("d", diagonal);
						
						  // Transition exiting nodes to the parent's new position.
						  link.exit().transition()
							  .duration(duration)
							  .attr("d", function(d) {
								var o = {x: source.x, y: source.y};
								return diagonal({source: o, target: o});
							  })
							  .remove();
						
						  // Stash the old positions for transition.
						  nodes.forEach(function(d) {
							d.x0 = d.x;
							d.y0 = d.y;
						  });
						}
						
						// Toggle children on click.
						function click(d) {
						  if (d.children) {
							d._children = d.children;
							d.children = null;
						  } else {
							d.children = d._children;
							d._children = null;
						  }
						  update(d);
						}
						*/
						</script>
			 
				<!--Contenedor de constancias para el PA1
					<div class="box box-primary">
						<div class="box-header with-border collapsed" data-toggle="collapse" data-target="#demo1">Cabecera del box con titulo y botones para expandir
							<h3 class="box-title ">Descargar Constancia PA 1</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn1 btn-box-tool btn collapsed" data-toggle="collapse"  data-target="#demo1">
									<i class="fa fa-plus" ></i>
								</button>
							</div>
						</div>/.fin-box-header
						<div id="demo1" class="box-body collapse" >
							<div class="list-group" >
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" download="Constancia_PA1_20160401" class="list-group-item glyphicon glyphicon-download-alt"> 01-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160404.pdf" download="Constancia_PA1_20160404" class="list-group-item glyphicon glyphicon-download-alt"> 04-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160405.pdf" download="Constancia_PA1_20160405" class="list-group-item glyphicon glyphicon-download-alt"> 05-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160406.pdf" download="Constancia_PA1_20160406" class="list-group-item glyphicon glyphicon-download-alt"> 06-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160407.pdf" download="Constancia_PA1_20160407" class="list-group-item glyphicon glyphicon-download-alt"> 07-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160408.pdf" download="Constancia_PA1_20160408" class="list-group-item glyphicon glyphicon-download-alt"> 08-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160411.pdf" download="Constancia_PA1_20160411" class="list-group-item glyphicon glyphicon-download-alt"> 11-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160414.pdf" download="Constancia_PA1_20160414" class="list-group-item glyphicon glyphicon-download-alt"> 14-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160415.pdf" download="Constancia_PA1_20160415" class="list-group-item glyphicon glyphicon-download-alt"> 15-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160502.pdf" download="Constancia_PA1_20160502" class="list-group-item glyphicon glyphicon-download-alt"> 02-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160520.pdf" download="Constancia_PA1_20160520" class="list-group-item glyphicon glyphicon-download-alt"> 20-MAYO-2016</a>
							</div>
						</div>/.fin-box-body
					</div>/.fin_box
					
					Contenedor de constancias para el PA2
					<div class="box box-primary">
						<div class="box-header with-border collapsed" data-toggle="collapse" data-target="#demo2">Cabecera del box con titulo y botones para expandir
							<h3 class="box-title" >Descargar Constancia PA 2</h3>
							<div class="box-tools pull-right"> 
								<button type="button" class="btn btn-box-tool btn2 collapsed" data-toggle="collapse"  data-target="#demo2">
									<i class="fa fa-plus" ></i>
								</button>	
							</div>
						</div>/.fin-box-header
						<div class="box-body collapse" id="demo2">
						  	<div class="list-group" >
							  	<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160411.pdf" download="Constancia_PA2_20160411" class="list-group-item glyphicon glyphicon-download-alt"> 11-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160415.pdf" download="Constancia_PA2_20160415" class="list-group-item glyphicon glyphicon-download-alt"> 15-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160421.pdf" download="Constancia_PA2_20160421" class="list-group-item glyphicon glyphicon-download-alt"> 21-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160422.pdf" download="Constancia_PA2_20160422" class="list-group-item glyphicon glyphicon-download-alt"> 22-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160426.pdf" download="Constancia_PA2_20160426" class="list-group-item glyphicon glyphicon-download-alt"> 26-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160429.pdf" download="Constancia_PA2_20160429" class="list-group-item glyphicon glyphicon-download-alt"> 29-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160511.pdf" download="Constancia_PA2_20160511" class="list-group-item glyphicon glyphicon-download-alt"> 11-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160516.pdf" download="Constancia_PA2_20160516" class="list-group-item glyphicon glyphicon-download-alt"> 16-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160518.pdf" download="Constancia_PA2_20160518" class="list-group-item glyphicon glyphicon-download-alt"> 18-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160520.pdf" download="Constancia_PA2_20160520" class="list-group-item glyphicon glyphicon-download-alt"> 20-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160525.pdf" download="Constancia_PA2_20160525" class="list-group-item glyphicon glyphicon-download-alt"> 25-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160526.pdf" download="Constancia_PA2_20160526" class="list-group-item glyphicon glyphicon-download-alt"> 26-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160613.pdf" download="Constancia_PA2_20160613" class="list-group-item glyphicon glyphicon-download-alt"> 13-JUNIO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA2_20160614.pdf" download="Constancia_PA2_20160614" class="list-group-item glyphicon glyphicon-download-alt"> 14-JUNIO-2016</a>
							</div>
						</div>
					</div>
					Contenedor de constancias para el PA3
					<div class="box box-primary">
						<div class="box-header with-border collapsed" data-toggle="collapse" data-target="#demo3">Cabecera del box con titulo y botones para expandir
							<h3 class="box-title">Descargar Constancia PA 3</h3>
							<div class="box-tools pull-right"> 
								<button type="button" class="btn btn-box-tool btn3 collapsed" data-toggle="collapse"  data-target="#demo3">
									<i class="fa fa-plus" ></i>
								</button>	
							</div>
						</div>/.fin-box-header
						<div class="box-body collapse" id="demo3">
							<div class="list-group" >
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160415.pdf" download="Constancia_PA3_20160415" class="list-group-item glyphicon glyphicon-download-alt"> 15-ABRIL-2016</a> 
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160418.pdf" download="Constancia_PA3_20160418" class="list-group-item glyphicon glyphicon-download-alt"> 18-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160419.pdf" download="Constancia_PA3_20160419" class="list-group-item glyphicon glyphicon-download-alt"> 19-ABRIL-2016</a>
                                <a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160421.pdf" download="Constancia_PA3_20160421" class="list-group-item glyphicon glyphicon-download-alt"> 21-ABRIL-2016</a>
							  	<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160422.pdf" download="Constancia_PA3_20160422" class="list-group-item glyphicon glyphicon-download-alt"> 22-ABRIL-2016</a>
							  	<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160503.pdf" download="Constancia_PA3_20160503" class="list-group-item glyphicon glyphicon-download-alt"> 03-MAYO-2016</a>
							  	<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160520.pdf" download="Constancia_PA3_20160520" class="list-group-item glyphicon glyphicon-download-alt"> 20-MAYO-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA3_20160523.pdf" download="Constancia_PA3_20160523" class="list-group-item glyphicon glyphicon-download-alt"> 23-MAYO-2016</a>
							</div>
						</div>
					</div>
					
				<script>/* Scrip para cambiar de icono el boton de collapse */
 				 $(document).ready(function(){
					$("#demo1").on("hide.bs.collapse", function(){
					   	$(".btn1").html('<i class="fa fa-plus""></i>');
					 });
					$("#demo1").on("show.bs.collapse", function(){
					   	$(".btn1").html('<i class="fa fa-minus""></i>');
					 });
				 	$("#demo2").on("hide.bs.collapse", function(){
						$(".btn2").html('<i class="fa fa-plus" "></i> ');
						});
					$("#demo2").on("show.bs.collapse", function(){
						$(".btn2").html('<i class="fa fa-minus""></i> ');
					});
					$("#demo3").on("hide.bs.collapse", function(){
						$(".btn3").html('<i class="fa fa-plus""></i> ');
						});
					$("#demo3").on("show.bs.collapse", function(){
						$(".btn3").html('<i class="fa fa-minus""></i> ');
					});
					
				}); 
				</script-->
			</section>
		</div><!-- fin content-wrapper -->
	
	
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

   
    </div><!-- fin wrapper -->

    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
<%--     <%@ include file="/frames/insLineaAccion.jsp" %>
 --%>    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
			<p>Favor Iniciar Sesion</p>
			<% } %> 

	<!-- Piwik -->
	<script type="text/javascript">
	  var _paq = _paq || [];
	  _paq.push(['trackPageView']);
	  _paq.push(['enableLinkTracking']);
	  (function() {
	    var u="//infra.stp.gov.py/monitoreoweb/";
	    _paq.push(['setTrackerUrl', u+'piwik.php']);
	    _paq.push(['setSiteId', 9]);
	    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
	    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
	  })();
	</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=9" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
 
	<script>
		var entidadCasSpr = "";
		entidadCasSpr ="<%=attributes.get("entidad") %>";
		usuarioRolCasSpr="<%=attributes.get("role_id_tablero") %>";
		var usuariosSpr = $.ajax({
			url:'/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuariosSpr = JSON.parse(usuariosSpr);
		usuariosSpr = usuariosSpr.usuarios;
	</script>
</body>
</html>
