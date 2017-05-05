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
/* 	tree style */
	  .node {
	    cursor: pointer;
	  }
	
	  .overlay{
	      background-color:#EEE;
	  }
	   
	  .node circle {
	    fill: #fff;
	    stroke: steelblue;
	    stroke-width: 1.5px;
	  }
	   
	  .node text {
	    font-size:10px; 
	    font-family:sans-serif;
	  }
	   
	  .link {
	    fill: none;
	    stroke: #ccc;
	    stroke-width: 1.5px;
	  }
	
	  .templink {
	    fill: none;
	    stroke: red;
	    stroke-width: 3px;
	  }
	
	  .ghostCircle.show{
	      display:block;
	  }
	
	  .ghostCircle, .activeDrag .ghostCircle{
	       display: none;
	  }
</style>
	<div class="wrapper">

		<header class="main-header">
			<%@ include file="/frames/mainheader.jsp"%>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<%@ include file="/frames/main-sidebar.jsp"%>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<small> <!--  Titulo, donde antes estaba dashboard -->
					</small>
				</h1>

			</section>

			<!-- Main content -->
			<section class="content" id="programacion">
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
																	</div><!-- <!-- /.box-header --> -->
																	<div class="box-body" id="tablaObjetivos">
																		
																	</div><!-- /.box-body -->
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
			</section><!-- /.content -->
		</div><!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.0
			</div>
			<strong>Copyright &copy; 2015 <a
				href="http://www.stp.gov.py">STP</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-light">
			<!-- include file="/frames/control-sidebar.jsp"  -->
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class='control-sidebar-bg'></div>

	</div>
	<!-- ./wrapper -->

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

   <script src="plugins/c3/d3.v3.min.js" type="text/javascript"></script>
	
	
	<script>
		
		var pndProductosContenido = $.ajax({
	    	url:'/ajaxSelects?accion=getPndProductos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		pndProductosContenido = JSON.parse(pndProductosContenido);
		
		var totalesEntidad = $.ajax({
	    	url:'/ajaxSelects?accion=getContadoresPNDporEntidad',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		totalesEntidad = JSON.parse(totalesEntidad);
		
		var totalesObjetivos = $.ajax({
	    	url:'/ajaxSelects?accion=getContadoresPNDporObjetivos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		totalesObjetivos = JSON.parse(totalesObjetivos);
		
		
		$("body").on("click", ".contenedorArbol",function(event){
			var parametros = $(this).attr("parametros");
			var idParsed = parametros.split("-"); 
			var eje = idParsed[0];
			var linea = idParsed[1];
			var estrategia= idParsed[2];
			var nivel= idParsed[3];
			var entidad = idParsed[4];
		
		});
		
		var acum = 0;
		var ROOT;
		var parent;
		var children;
		
		function addChild (eje, linea, estrategia, nivel, entidad){
			if (eje != 0 && linea != 0 && estrategia != 0 && nivel != 0 && entidad != 0){
				
		    }else{
		    	if (eje != 0 && linea != 0 && estrategia != 0){
		    	}else{
		    		if (eje != 0){
		    		}else{
		    			if (nivel != 0 && entidad != 0){
		    			}else{
		    			}
		    		}
		    	}
		    }
		}
		
		function generateJSON (){
			/*var data = {
				    organisms:[
				        {name: 'Hemiptera.Miridae.Kanakamiris'},
				        {name: 'Hemiptera.Miridae.Neophloeobia.incisa'},
				        {name: 'Lepidoptera.Nymphalidae.Ephinephile.rawnsleyi'},
				        {name: 'a.af1.af1g1.af1g1s1'},
				        {name: 'a.af1.af1g1.af1g1s2'},
				        {name: 'a.af1.af1g1.af1g1s3'},
				        {name: 'a.af1.af1g2.af1g2s1'},
				        {name: 'a.af1.af1g2.af1g2s2'},
				        {name: 'a.af2.af2g1.af2g1s1'},
				        {name: 'a.af2.af2g1.af2g2s1'},
				        {name: 'a.af3.af3g1.af3g1s1'}        
				    ]
				};*/

			var organisms = data.organisms.map(function(v) {
		        return v.name.split(".");
		    });

			function addToHeirarchy(val, level, heirarchy) {
			    if (val[level]) {
			        if (!heirarchy.hasOwnProperty(val[level]))
			            heirarchy[val[level]] = {};
			        addToHeirarchy(val, level + 1, heirarchy[val[level]]);
			    }
			}

			var working = {}; 

			for (var i = 0; i < organisms.length; i++)
			    addToHeirarchy(organisms[i], 0, working);

			console.dir(working);

			function remapHeirarchy(item) {
			    var children = [];
			    for (var k in item) {
			        children.push({
			            "name" : k,
			            "children" : remapHeirarchy(item[k])
			        });
			    }
			    return children;
			}

			var heirarchy = {
			    "name" : "ROOT",
			    "children" : remapHeirarchy(working)
			};

			console.dir(heirarchy);
			document.write(JSON.stringify(heirarchy));
		}
			
			var treeData = [{
				  "name": "ROOT",
				  "children": [
				    {
				      "name": "Hemiptera",
				      "children": [
				        {
				          "name": "Miridae",
				          "children": [
				            {
				              "name": "Kanakamiris",
				              "children": []
				            },
				            {
				              "name": "Neophloeobia",
				              "children": [
				                {
				                  "name": "incisa",
				                  "children": []
				                }
				              ]
				            }
				          ]
				        }
				      ]
				    },
				    {
				      "name": "Lepidoptera",
				      "children": [
				        {
				          "name": "Nymphalidae",
				          "children": [
				            {
				              "name": "Ephinephile",
				              "children": [
				                {
				                  "name": "rawnsleyi",
				                  "children": []
				                }
				              ]
				            }
				          ]
				        }
				      ]
				    },
				    {
				      "name": "a",
				      "children": [
				        {
				          "name": "af1",
				          "children": [
				            {
				              "name": "af1g1",
				              "children": [
				                {
				                  "name": "af1g1s1",
				                  "children": []
				                },
				                {
				                  "name": "af1g1s2",
				                  "children": []
				                },
				                {
				                  "name": "af1g1s3",
				                  "children": []
				                }
				              ]
				            },
				            {
				              "name": "af1g2",
				              "children": [
				                {
				                  "name": "af1g2s1",
				                  "children": []
				                },
				                {
				                  "name": "af1g2s2",
				                  "children": []
				                }
				              ]
				            }
				          ]
				        },
				        {
				          "name": "af2",
				          "children": [
				            {
				              "name": "af2g1",
				              "children": [
				                {
				                  "name": "af2g1s1",
				                  "children": []
				                },
				                {
				                  "name": "af2g2s1",
				                  "children": []
				                }
				              ]
				            }
				          ]
				        },
				        {
				          "name": "af3",
				          "children": [
				            {
				              "name": "af3g1",
				              "children": [
				                {
				                  "name": "af3g1s1",
				                  "children": []
				                }
				              ]
				            }
				          ]
				        }
				      ]
				    }
				  ]
				}];
			
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
			
			var svg = d3.select("#treeContainer").append("svg")
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
			
			function collapse(d) {
			    if (d.children) {
			        d._children = d.children;
			        d._children.forEach(collapse);
			        d.children = null;
			    }
			}

			root.children.forEach(collapse);
			update(root);
			
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
		</script>	
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
