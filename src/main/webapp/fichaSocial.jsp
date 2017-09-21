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
				<h2>Ficha Social</h2>
	        </section>
	
	        <!-- Main content -->
				<div class="row">
					<div class="col-md-12">
						<div class="box" height="1000px">
							<form class="form-horizontal" role="form" id="formulario">
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">IDENTIFICACION GEOGRAFICA</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">

										<div class="form-group">
											<label>Ficha N.º</label>
											<input type= "text" class="form-control" placeholder="" name="fichaNro">
										</div>
										<div class="form-group">
											<label>Fecha de realización</label>
											<input type= "text" class="form-control" placeholder="" name="fechaRealización">
										</div>
										<div class="form-group">
											<label>Vivienda N.º</label>
											<input type= "text" class="form-control" placeholder="" name="viviendaNro">
										</div>
										<div class="form-group">
											<label>Hogar N.º</label>
											<input type= "text" class="form-control" placeholder="" name="hogarNro">
										</div>
										<div class="form-group">
											<label>Departamento</label>
											<input type= "text" class="form-control" placeholder="" name="departamento">
										</div>
										<div class="form-group">
											<label>Distrito</label>
											<input type= "text" class="form-control" placeholder="" name="distrito">
										</div>
										
										<div class="form-group">
											<label>Barrio (Localidad)</label>
											<input type= "text" class="form-control" placeholder="" name="barrio">
										</div>
										
										<div class="form-group">
											<label>Area</label>
											<select class= "form-control" name="area">
												<option>Urbana</option>
												<option>Rural</option>
											</select>
										</div>
										<div class="form-group">
											<label>Manzana</label>
											<input type= "text" class="form-control" placeholder="" name="manzana">
										</div>
										<div class="form-group">
											<label>Dirección</label>
											<input type= "text" class="form-control" placeholder="" name="direccion">
										</div>
										<div class="form-group">
											<label>Casa N.º</label>
											<input type= "text" class="form-control" placeholder="" name="casaNro">
										</div>
										<div class="form-group">
											<label>Edificio</label>
											<input type= "text" class="form-control" placeholder="" name="edificio">
										</div>
										<div class="form-group">
											<label>Piso N.º</label>
											<input type= "text" class="form-control" placeholder="" name="pisoNro">
										</div>
										<div class="form-group">
											<label>Telefono N.º</label>
											<input type= "text" class="form-control" placeholder="" name="telefonoNro">
										</div>
									</ul>
								</div>
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">EQUIPO DE TRABAJO</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Funcion Cencista</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Nombre</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Apellido</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Codigo</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Supervisor/a</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Critico/a</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Digitador/a</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>OBSERVACIONES</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
									</ul>
								</div>
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">RESULTADO DE LA ENTREVISTA</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Entrevista</label>
											<select class= "form-control" name="area">
												<option>Completa</option>
												<option>Incompleta</option>
												<option>Rechazo</option>
												<option>Personas ausentes</option>
											</select>
										</div>
										<div class="form-group">
											<label>OCUPACION DE LA VIVIENDA</label>
											<select class= "form-control" name="area">
												<option>Desocupada</option>
												<option>De verano</option>
												<option>En construcción</option>
												<option>Abandonada</option>
												<option>En alquiler o en venta</option>
												<option>Otro (especificar)</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
									</ul>
								</div>
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">POSICIONAMIENTO GEOREFERENCIADO</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>GPS N.º</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Orden</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Coord. X</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Coord. Y</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
									</ul>
								</div>
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">DATOS DE LA VIVIENDA</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Tipo de Vivienda</label>
											<select class= "form-control" name="area">
												<option>Casa</option>
												<option>Rancho</option>
												<option>Dpto o piso</option>
												<option>Pieza de inquilinato</option>
												<option>Vivienda improvisada</option>
												<option>Otro</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>

										<div class="form-group">
											<label>Condición de ocupación de la vivienda</label>
											<select class= "form-control" name="area">
												<option>Propia o en condominio</option>
												<option>Pagando en cuotas</option>
												<option>Alquilada</option>
												<option>Ocupada de hecho</option>
												<option>Cedida</option>
												<option>Otro</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Pieza o cuarto (Número de dormitorios)<small>(no incluya baño, cocina, cuartos o piezas destinadas exclusivamente al comercio o industria)</small></label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Material predominante en las paredes exteriores</label>
											<select class= "form-control" name="area">
												<option>Estaqueo</option>
												<option>Adobe</option>
												<option>Madera</option>
												<option>Ladrillo</option>
												<option>Bloque de cemento</option>
												<option>Tronco de palma</option>
												<option>Cartón, hule,madera de embalaje</option>
												<option>No tiene pared</option>
												<option>Otro</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Material predominante en el piso</label>
											<select class= "form-control" name="area">
												<option>Tierra</option>
												<option>Madera</option>
												<option>Ladrillo</option>
												<option>Lecherada</option>
												<option>Baldosa común</option>
												<option>Mosaico, cerámica, granito</option>
												<option>Parquet</option>
												<option>Alfombra</option>
												<option>Otro</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Material predominante en el techo</label>
											<select class= "form-control" name="area">
												<option>Teja</option>
												<option>Paja</option>
												<option>Fibrocemento (eternit)</option>
												<option>Chapa de Zing</option>
												<option>Tablilla de madera</option>
												<option>Hormigon armado, loza o bovedilla</option>
												<option>Tronco de palma</option>
												<option>Cartón, hule, madera de embalaje</option>
											</select>
										</div>
										<div class="form-group">
											<label>Tiene baño</label>
											<select class= "form-control" name="area">
												<option>si</option>
												<option>no</option>
											</select>
										</div>
										<div class="form-group">
											<label>¿Que tipo de desague tiene su baño?</label>
											<select class= "form-control" name="area">
												<option>Con arrastre de agua con red de alcantarillado sanitario</option>
												<option>Con arrastre de agua, con cámara séptica y pozo ciego (absorvente)</option>
												<option>Con arrastre de agua con pozo ciego (absorbente)</option>
												<option>Con arrastre de agua en la superficie de la tierra, hoyo abierto, zanja, arroyo</option>
												<option>Letrina ventilada de hoyo seco (común con tubo de ventilación)</option>
												<option>Letrina común de hoyo seco (con losa, techo, paredes y puertas)</option>
												<option>Letrina común sin techo o puerta</option>
												<option>Otro</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Cuál es la fuente principal de agua que beben los miembros de su hogar?</label>
											<select class= "form-control" name="area">
												<option>ESSAP (ex Corposana)</option>
												<option>Junta de Saneamiento o SENASA</option>
												<option>Red comunitaria</option>
												<option>Red o prestador privado</option>
												<option>Pozo artesiano</option>
												<option>Pozo excavado protegido (brocal y tapa)</option>
												<option>Pozo excavado sin protección (sin brocal y sin tapa)</option>
												<option>Manantial protegido</option>
												<option>Manantial sin protección</option>
												<option>Agua de lluvia o aljibe</option>
												<option>Agua embotellada (mineral)</option>
												<option>Aguatero</option>
												<option>Agua superficial (río, represa, lago, estanque, arroyo, canal, canales de riego)</option>
												<option>Otra fuente</option>
												<option>Pozo excavado protegido (brocal y tapa) con motor</option>
												<option>Pozo excavado sin protección (sin brocal y sin tapa) con motor</option>
											</select>
										</div>
										<div class="form-group">
											<label>¿El agua que beben los miembros de su hogar llega a través de…</label>
											<select class= "form-control" name="area">
												<option>Cañería fuera de la vivienda pero dentro del terreno?</option>
												<option>Cañeria dentro de la vivienda?</option>
												<option>Canilla pública?</option>
												<option>Pozo dentro del terreno?</option>
												<option>Vecino?</option>
												<option>Aguatero?</option>
												<option>Agua embotellada (mineral)?</option>
												<option>Otros medios?</option>
											</select>
											<label>Otros medios</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Para cocinar usa principalmente?</label>
											<select class= "form-control" name="area">
												<option>Leña?</option>
												<option>Gas?</option>
												<option>Carbón?</option>
												<option>Electricidad?</option>
												<option>Kerosene, alcohol?</option>
												<option>Otro?</option>
												<option>Ninguno, no cocina?</option>
												<option></option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Como elimina habitalmente la basura?</label>
											<select class= "form-control" name="area">
												<option>Quema</option>
												<option>Recolección pública</option>
												<option>Recolección privada</option>
												<option>Tira en el hoyo</option>
												<option>Tira en el patio, baldío, zanja o calle</option>
												<option>Tira en el vertedero municipal</option>
												<option>Tira en la chacra</option>
												<option>Tira en arroyo, río o laguna</option>
												<option>Otro</option>
											</select>
											<label>Otro</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Tiene linea fija?</label>
											<select class= "form-control" name="area">
												<option>si</option>
												<option>no</option>
											</select>
										</div>
										<div class="form-group">
											<label>¿El hogar cuenta con computadora?</label>
											<select class= "form-control" name="area">
												<option>si</option>
												<option>no</option>
											</select>
										</div>
										<div class="form-group">
											<label>¿Está conectada a internet?</label>
											<select class= "form-control" name="area">
												<option>si</option>
												<option>no</option>
											</select>
										</div>
										<div class="form-group">
											<label>Este hogar tiene…</label>
											<br><input type="checkbox" name="obej1" value="1">radio?
											<br><input type="checkbox" name="obej1" value="1">televisor?
											<br><input type="checkbox" name="obej1" value="1">heladera?
											<br><input type="checkbox" name="obej1" value="1">cocina?
											<br><input type="checkbox" name="obej1" value="1">maquina lavarropa?
											<br><input type="checkbox" name="obej1" value="1">video/DVD?
											<br><input type="checkbox" name="obej1" value="1">termocalefón?
											<br><input type="checkbox" name="obej1" value="1">acondicionador de aire?
											<br><input type="checkbox" name="obej1" value="1">antena parabólia?
											<br><input type="checkbox" name="obej1" value="1">TV cable?
											<br><input type="checkbox" name="obej1" value="1">horno microondas?
											<br><input type="checkbox" name="obej1" value="1">horno eléctrico?
											<br><input type="checkbox" name="obej1" value="1">automovil, camión o camionteta?
										</div>
									</ul>
								</div>

								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">SOCIODEMOGRAFICA</h3>
								</div>
						        <div class="box-body" >
									<div class="box-header with-border" height="1000px">
										<h4 class="box-title" id="tituloTipoPrograma">Para todas las personas</h4>
									</div>
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Nombre</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Que relación de parentezco tiene [NOMBRE]… con el/la Jefe/a del hogar?</label>
											<select class= "form-control" name="area">
												<option>Jefe/a</option>
												<option>Esposo/a compañeo/a</option>
												<option>Hijo/a</option>
												<option>Hijastro/a</option>
												<option>Nieto/a</option>
												<option>Yerno/Nuera</option>
											</select>
										</div>
										<div class="form-group">
											<label>¿Es miembro del hogar… [NOMBRE]…?</label>
											<select class= "form-control" name="area">
												<option>si</option>
												<option>no</option>
											</select>
										</div>
									</ul>
									<div class="box-header with-border" height="1000px">
										<h4 class="box-title" id="tituloTipoPrograma">Para todos los miembros</h4>
									</div>
									<ul  class="col-md-12">
										<div class="form-group">
											<label>¿Tiene [NOMBRE]… cédula de identidad policial?</label>
											<select class= "form-control" name="area">
												<option>paraguaya?</option>
												<option>extranjera?</option>
												<option>ambas?</option>
												<option>no tiene?</option>
											</select>
										</div>
										<div class="form-group">
											<label>Anote el número de cédula de identidad policial de [NOMBRE]…</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Se anotó [NOMBRE]… Su nacimiento en el Registro Civil?</label>
											<select class= "form-control" name="area">
												<option>si</option>
												<option>no</option>
											</select>
										</div>
										<div class="form-group">
											<label>¿En que fecha nació [NOBMRE]…?</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>¿Cuál es el estado civil o conyugal de [NOMBRE]…?</label>
											<select class= "form-control" name="area">
												<option>Casado</option>
												<option>Unido</option>
												<option>Separado</option>
												<option>Viudo</option>
												<option>Soltero</option>
												<option>Divorciado</option>
											</select>
										</div>
										<div class="form-group">
											<label>N.º de teléfono (línea baja o celular) <small>Si no tiene, anote 0</small></label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="box-footer">
											<button type="button" class="btn btn-warning" id="agregar-persona">Agregar Persona</button>
										</div>
									</ul>
								</div>
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">EDUCACION</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Nombre</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Unidad de Medida</label>
											<select class= "form-control" name="unidad_medida_id"></select>
										</div>
										<div class="form-group">
											<label>Frecuencia (Meses)</label>
											<input type="int" class="form-control" rows="3" placeholder="" name="frecuencia_meses">
										</div>
										<div class="form-group">
											<label>Fuente Verificación</label>
											<select class= "form-control" name="fuente_verificacion_id"></select>
										</div>
										<div class="form-group">
											<label>Observaciones</label>
											<input type= "text" class="form-control" placeholder="" name="observaciones">
										</div>
									</ul>
								</div>
								
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">SALUD</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Nombre</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Unidad de Medida</label>
											<select class= "form-control" name="unidad_medida_id"></select>
										</div>
										<div class="form-group">
											<label>Frecuencia (Meses)</label>
											<input type="int" class="form-control" rows="3" placeholder="" name="frecuencia_meses">
										</div>
										<div class="form-group">
											<label>Fuente Verificación</label>
											<select class= "form-control" name="fuente_verificacion_id"></select>
										</div>
										<div class="form-group">
											<label>Observaciones</label>
											<input type= "text" class="form-control" placeholder="" name="observaciones">
										</div>
									</ul>
								</div>
								
								<div class="box-header with-border" height="1000px">
									<h3 class="box-title" id="tituloTipoPrograma">EMPLEO</h3>
								</div>
						        <div class="box-body" >
									<ul  class="col-md-12">
										<div class="form-group">
											<label>Nombre</label>
											<input type= "text" class="form-control" placeholder="" name="nombre">
										</div>
										<div class="form-group">
											<label>Unidad de Medida</label>
											<select class= "form-control" name="unidad_medida_id"></select>
										</div>
										<div class="form-group">
											<label>Frecuencia (Meses)</label>
											<input type="int" class="form-control" rows="3" placeholder="" name="frecuencia_meses">
										</div>
										<div class="form-group">
											<label>Fuente Verificación</label>
											<select class= "form-control" name="fuente_verificacion_id"></select>
										</div>
										<div class="form-group">
											<label>Observaciones</label>
											<input type= "text" class="form-control" placeholder="" name="observaciones">
										</div>
			
										<div class="box-footer">
											<button type="submit" class="btn btn-warning" id="guardar-indicador">Agregar</button>
										</div>
									</ul>
								</div>
							</form>
						</div>
					</div><!-- /.row -->
				</div>
		</div><!-- /.content-wrapper -->

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
	<script type="text/javascript">
		$( "#agregar-persona").click(function(event){
		}
	</script>
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