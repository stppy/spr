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
          <!-- <h1>
            <small>
             Titulo, donde antes estaba dashboard
            </small>
          </h1> -->
         
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
	          <!-- Info row de buscador de productos -->
	          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Requerimientos 	
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		<td rowspan="2" style="vertical-align: middle;">
	  						Conectividad
	  					</td> 
	  					<td>
	  						Preferente
	  					</td>
	  					<td>
	  						Red Metropolitana
	  					</td>
	  				</tr>
	  				<tr>
	            		
	  					<td>
	  						Opcional
	  					</td>
	  					<td>
	  						Internet
	  					</td>
	  				</tr>
	  				</table>
	  				  <table class="table table-striped table-bordered table-hover">
	  				<tr>
	            		<td>
	  						Usuarios
	  					</td>
	  					<td>
	  						A solicitud del área de planificación o su equivalente, por correo electrónico a la Dirección General de Gestión por Resultados (dggpr@stp.gov.py). Debe remitirse cédula de identidad, nombre y apellido, y correo electrónico institucional.
	  					</td>
	  				</tr>
	  			</table> 
	            </div>
			   </div>
			</div>
          </div><!-- /.row -->
	         <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Base Legal
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            
	          <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		<td>
	  						<a href="http://www.presidencia.gov.py/archivos/documentos/DECRETO6715_2_4b51q1zt.pdf">Decreto 6.715/2017 de la Presidencia de la República del Paraguay</a>
	  					</td>
	  					
	  					<td>
							Por el cual se modifica el decreto Nº 4.774/2016, que reglamenta la Ley Nº 5.554, del 5 de enero de 2016, «Que aprueba el Presupuesto General de la Nación para el Ejercicio Fiscal 2016», vigente para el Ejercicio Fiscal 2017. 	  						
	  					</td>
	  				</tr>
			
	  			</table>
	  			
	            </div>
			   </div>
			</div>
			
			<div class="col-md-12">
				<div class="box" height="1000px">
					<div class="box-header with-border" height="1000px">
				        	<h3 class="box-title" id="tituloPlazo">Plazos legales según Decreto 6.715/2017</h3>
						<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-bordered table-hover">
							<tbody>
								<tr>
									<td><span style="font-weight:bold;">Ajuste del Plan Operativo Institucional</span><br></td>
									<td>hasta el 15 de marzo de 2017.</td>
								</tr>
								<tr>
									<td><span style="font-weight:bold;">Carga del Plan de Acción del área social</span><br></td>
									<td>hasta el 31 de marzo de 2017.</td>
								</tr>
								<tr>
									<td><span style="font-weight:bold;">Carga de avances del Plan Operativo Institucional y del Plan de Acción del área social</span><br></td>
									<td>hasta el día 8 de cada mes.</td>
								</tr>			
								<tr>
									<td><span style="font-weight:bold;">Carga de informe cualitativo del Plan de Acción del área social</span><br></td>
									<td>hasta el día 8 luego de terminar cada trimestre.</td>
								</tr>			
							</tbody>
						</table>
					</div>
				</div>
			</div>
     
     <!--  <div class="row">-->
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Condiciones de Uso
	              </h3> 
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            
	          <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		
	  					
	  					<td>
	  						
	  						
	  						Condiciones de Uso del Sistema de Planificación por Resultados:</br>
							<p align="justify"> 
							<OL>
							<LI>La cuenta de usuario es asignada para su uso exclusivo en los sistemas de información administrados por la DGTIC . Cualquier otro método de acceso (utilitarios SQL, ODBC, etc.) está prohibido, salvo que sea explicitamente autorizado.
							<LI>Queda prohibida la copia o divulgación por cualquier medio de la información accedida durante la utilización del usuario asignado, salvo que exista una autorización explícita de la DGTIC.
							<LI>Todo permiso que no esté explícitamente asignado al usuario, está prohibido.
							<LI>El usuario debe notificar a la DGTIC inexactitudes en la información contenida en los sistemas, así como violaciones a la seguridad que sean detectadas mediante la cuenta de correo soporte@stp.gov.py
							<LI>La DGTIC se reserva el derecho de revocar cualquier acceso sin previo aviso, en caso de que se detecte que la seguridad de la cuenta ha sido vulnerada.
							<LI>El Usuario está obligado a solicitar la baja de su cuenta de usuario, cuando ya no vaya a utilizar en sus funciones.
							<LI>La cuenta de usuario es personal, y la contraseña no debe ser compartida con otra/s persona/s.
							<LI>Las operaciones realizadas en la base de datos con la cuenta de usuario solicitada son de exclusiva responsabilidad del usuario.
							El solo ingreso a los sistemas administrados por la DGTIC, implica la aceptación de los presentes condiciones de Uso.
							<LI>Todos los datos proveidos al sistema serán considerados datos abiertos.
							</OL>
							</p>
	  					</td>
	  				</tr>
			
	  			</table>
	  			
	            </div>
			   </div>
			<!--</div>-->
        
          
          </div><!-- /.row -->
			<div class="col-md-12">
				<div class="box" height="1000px">
					<div class="box-header with-border" height="1000px">
						<h3 class="box-title" id="tituloTipoPrograma">
							Datos de Contacto
						</h3>
					</div>
					<div class="box-header with-border" height="1000px">
						<h3 class="box-title" id="tituloTipoPrograma">
							Dirección General de Gestión por Resultados - DGGPR 
						</h3>
					</div>
					<div class="box-body" >
						<table class="table table-striped table-bordered table-hover">							
							<tr>
								<td>Nombre</td>
								<td>Sebastian Codas</td>
							</tr>
							<tr>
								<td>Correo Electrónico</td>
								<td>dggpr@stp.gov.py</td>
							</tr>
							<tr>
								<td>Telef. Laboral</td>
								<td>+595 21 450422</td>
							</tr>
							<tr>
								<td>Telef. Movil</td>
								<td>+595 985 321761</td>
							</tr>
						</table> 
					</div>
					<div class="box-header with-border" height="1000px">
						<h3 class="box-title" id="tituloTipoPrograma">
							Dirección General de Tecnologías de la Información y Comunicación - DGTIC
						</h3>
					</div>
					<div class="box-body">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td>Nombre</td>
								<td>Rafael Palau</td>
							</tr>
							<tr>
								<td>Correo Electrónico</td>
								<td>dgtic@stp.gov.py</td>
							</tr>
							<tr>
								<td>Telef. Laboral</td>
								<td>+595 21 450422 #177</td>
							</tr>
							<tr>
								<td>Telef. Movil</td>
								<td>+595 981 813973 </td>
							</tr>
						</table> 
					</div>
				</div>
			</div><!-- /.row -->
          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Instructivo
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/X_1kAwTXuxk?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=1.mp4" type="video/mp4"> 
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/0Y7MuXrJkwshzrh/download" target="_blank" download="1"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Perfil Institucional
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/udT_3x46j94?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=2.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/1vx9WtGIpitt5QR/download" target="_blank" download="2"> aqui </a>
  									
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->

					  <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Estructura Programática
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/i7AGa8h5IYI?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=3.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/z8SnkGnIegwTGat/download" target="_blank" download="3"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Programación de Productos
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/Djb9Uob11rs?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=4.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/1mncsJzNCu5SijF/download" target="_blank" download="4"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->	
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Productos Finales o Intermedios y Etiquetas
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/Fdh7fsPAaAw?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=5.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/Nznk4qmvT8C1TvN/download" target="_blank" download="5"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Vinculación de Cadena de Valor
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/nf_EnbIjM9I?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=7.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/AMTzJiDAQSjV1eQ/download" target="_blank" download="6"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Programación Física de Producto
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/xcIZwt4NH-0?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=8.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/APlLlXBMd841KV6/download" target="_blank" download="7"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Programación Física de Producto
				              </h3>
				              <div class="box-tools pull-right" height="1000px">
				              	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<!-- <td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> --> 
								<td>
									<iframe width="640" height="360" src="https://www.youtube.com/embed/UW78X2FZQUY?list=PLAlP9jz1Zqe8pLGcHrc3eNb9M2YjYM6BM" frameborder="0" allowfullscreen></iframe>
									<!-- <video width="960"  height="540" controls>
  										<source src="https://nube.stp.gov.py/index.php/s/Q2d5hnzpAV7jiWC/download?path=%2F&files=9.mp4" type="video/mp4">
  									</video> -->
  									<br>Si no puede ver este video, haga click <a href="https://nube.stp.gov.py/index.php/s/Hao8mphigRiHG9u/download" target="_blank" download="8"> aqui </a>
  								</td>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
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
		 <%@ include file="/frames/control-sidebar.jsp"  %>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
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
