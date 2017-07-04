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
	<!-- Bootstrap CSS -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
<script>
<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2") || attributes.get("role_id").toString().equals("3")){%>
 	$(document).ready(function(){
 		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
		usuarioRolCas="<%=attributes.get("role_id") %>";
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
	window.location = "http://spr.stp.gov.py/documentacion.jsp";
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
			<section class="content" id="enviarCorreo">
				<!-- Contenedor de constancias para el PA1 -->
				 <form action="EmailSendingServlet" method="post" enctype="multipart/form-data">
			        <table border="0" width="35%" align="center">
			            <caption><h2>Enviar e-mail nuevo</h2></caption>
			            <tr>
			                <td><label for="remitenteCorreo">Remitente:</label>
			                    <input type="text" id="remitenteCorreo" name="remitenteCorreo" size="50" class="form-control"/>
			                </td>
			            </tr>
			            <tr>
			                <td><label for="temaCorreo">Tema:</label>
			                    <input type="text" id="temaCorreo" name="temaCorreo" size="50" class="form-control"/>
			                </td>
			            </tr>
			            <tr>
			                <td><label for="textoCorreo">Contenido:</label>
			                    <textarea rows="10" cols="39" id="textoCorreo" name="textoCorreo" class="form-control"></textarea> 
			                </td>
			            </tr>			            
			            <tr>			            
			            	<td colspan="2">
			            		<!-- form method="post" enctype="multipart/form-data"--> 
								<label for="documentoCorreo">Adjuntar Documento</label><input type="file" id="documentoCorreo" name="documentoCorreo" size="50" />
								<!-- /form -->
			            		<input type="hidden" id="urlDocCorreo" value="" />
			            	</td>
			            </tr>
			            <tr>
			                <td colspan="2" align="center"><input type="submit" class="enviarCorreo" value="Enviar Correo"/></td>
			            </tr>
			            <tr>
			            	<td><span id="respuesta"></span></td>
			            </tr>
			        </table>         
    			</form>    			
			</section>
		</div><!-- fin content-wrapper -->
		
<script type="text/javascript">

$("body").on("click", ".enviarCorreo",function(event){
	event.stopPropagation();
	event.preventDefault(); 
	
	var docCorreoFile = document.getElementById("documentoCorreo").files[0];
    
	if (docCorreoFile != null){
	    var formdata = new FormData();
	    formdata.append('documento', docCorreoFile);
	    
	     $.ajax({
		         type: "POST",
		         url: "UploadServlet", /* contextPath + servletPath, */
		         data: formdata, /* + $('#custIdList').val(), */
		         async: false,
		         processData: false,  // tell jQuery not to process the data
		         contentType: false,   // tell jQuery not to set contentType
		         success: function(data){
		         	$("#urlDocCorreo").val(data);
		         }
		 });
	}

	var remitente = $("#remitenteCorreo").val();
	var tema = $("#temaCorreo").val();
	var texto = $("#textoCorreo").val();
	var urlDocumento; 
	if (docCorreoFile != undefined) urlDocumento = $("#urlDocCorreo").val();
		

	//Vaciar los inputs
	$("#remitenteCorreo").val("");
	$("#temaCorreo").val("");
	$("#textoCorreo").val("");
	$("#urlDocCorreo").val("");	
	$("#documentoCorreo").val("");

	
	/* var formdata = new FormData();
	formdata.append('remitente', remitente);
	formdata.append('tema', tema);
	formdata.append('texto', texto);
    formdata.append('documento', docCorreoFile); */
	
   /*  var objeto = new Object();
    
	objeto.remitente = remitente;
	objeto.tema = tema;
	objeto.texto = texto;
	objeto.nombreArchivoAdj = urlDocumento;	 */
	
	
  	//var info = JSON.stringify(objeto);
    $.ajax({
    	url: "EmailSendingServlet",
        type: 'POST',
        async: false,
        data: { remitente: remitente, tema: tema, texto : texto, nombreArchivoAdj: urlDocumento} ,
        success: function(data){
        	data = data.split(";");
        	$("#respuesta").css("color", data[1]);
        	$("#respuesta").html(data[0]);        	        	
        }
	 });
});

</script>
	
	
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
    <!-- AdminLTE for demo purposes -->
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
		usuarioRolCasSpr="<%=attributes.get("role_id") %>";
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
