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
 	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

   	<script src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/1.2.10/jquery.floatThead.min.js"></script> -->	
        
	<!--<script src="frames/entidad.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>
	
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
		/* Example 1 custom styles */
		#ex1Slider .slider-selection {
   			background: #BABABA;
  		}

    	/* Example 3 custom styles */
		#RGB {
    		height: 20px;
    		background: rgb(128, 128, 128);
  		}
		#RC .slider-selection {
		    background: #FF8282;
		}
		#RC .slider-handle {
			background: red;
		}
		#GC .slider-selection {
			background: #428041;
		}
		#GC .slider-handle {
			background: green;
		}
		#BC .slider-selection {
			background: #8283FF;
		}
		#BC .slider-handle {
			border-bottom-color: blue;
		}
		#R, #G, #B {
			width: 300px;
		}
		
		
		#slider12a .slider-track-high, #slider12c .slider-track-high {
			background: #008d4c;
		}
		
		#slider12b .slider-track-low, #slider12c .slider-track-low {
			background: #d33724;
		}
		
		#slider12c .slider-selection {
			background: #db8b0b;
		}
    </style>
    
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>
<body class="skin-blue sidebar-mini sidebar-collapse">



			
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>
	
<script>
<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1")){%>
 	$(document).ready(function(){
 		
 		var rol_jsp=<%=attributes.get("role_id").toString() %>;
 		var rol_movil_jsp=<%=attributes.get("role_id_movil").toString() %>;
 		var rol_tablero_jsp=<%=attributes.get("role_id_tablero").toString() %>;
 		var usr_nivel_id=<%=attributes.get("nivel_id").toString() %>;
 		var usr_entidad_id=<%=attributes.get("entidad_id").toString() %>;
 		var usr_unr_id=<%=attributes.get("unr_id").toString() %>;
 		var usr_name='<%=user.getName()%>';
 		var usr_responsable='<%=attributes.get("usuario_responsable").toString() %>';
 		
		function renderUsuarios(){
			var tablaUsuarios = "";
			var cuerpoTabla = "";
			$("#cuerpoUsuario").html("");
			
			var url="";
			
			if (rol_jsp == 0){
				url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&mayorIgual='+rol_jsp;				
			} else if(usr_unr_id == 0){
				url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&mayorIgual='+rol_jsp+'&nivelId='+usr_nivel_id+'&entidadId='+usr_entidad_id;			
			} else {
				url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&mayorIgual='+rol_jsp+'&nivelId='+usr_nivel_id+'&entidadId='+usr_entidad_id+'&unidadResponsableId='+usr_unr_id;
			}
			
			var usuarios = $.ajax({
				url: url,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			usuarios = JSON.parse(usuarios);
			usuarios = usuarios.usuarios;
			
			var roles = $.ajax({
				url:'/ajaxSelects?accion=getRol',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			roles = JSON.parse(roles);
			
			var rolId;
			for(var q = 0; q < usuarios.length; q++){
				
				if (usr_name != usuarios[q].correo){//hace que el usuario logeado no aparezca en la lista.
													
					rolId = "";
					for(var r = 0; r < roles.length; r++){
						if(usuarios[q].rol_id == roles[r].id){
							rolId = roles[r].nombre;
						}
					}
					if(usuarios[q].borrado == true)
					{
						<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
							cuerpoTabla += '<tr><td><del>'+usuarios[q].entidad+'</del></td>';
							if(usuarios[q].url){
								cuerpoTabla += '<td><del><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></del></td><td><del>'+usuarios[q].correo+'</del></td><td><del>'+rolId+'</del></td>';
							}else{
								cuerpoTabla += '<td><del>'+usuarios[q].nombre+'</del></td><td><del>'+usuarios[q].correo+'</del></td><td><del>'+rolId+'</del></td>';
							}
							// Despliega el botón de restaurar si cumple las condiciones.
							if (rol_jsp < usuarios[q].rol_id || rol_jsp == 0 || usuarios[q].unr_id == 0){
								cuerpoTabla += '<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Restaurar Usuario" parametros="'+usuarios[q].id+'"><span class="fa fa-recycle"></span></button></td></tr>';
							} else {						
								cuerpoTabla += '<td></td></tr>';
							}
						<%}%>
					}else{
						<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
							cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td>';						
								if (usuarios[q].url) {
									cuerpoTabla += '<td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td>';
								} else {
									cuerpoTabla += '<td>'+ usuarios[q].nombre+'</td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td>';	
								}
								// Despliega el botón de editar y borrar si cumple las condiciones.
								if (rol_jsp < usuarios[q].rol_id || rol_jsp == 0 || usuarios[q].unr_id == 0 || usr_name == usuarios[q].correo){
									cuerpoTabla += '<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarUsuario" data-toggle="tooltip" data-placement="top" title="Editar Usuario" parametros="'+usuarios[q].id+'" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Borrar Usuario" parametros="'+usuarios[q].id+'"><span class="glyphicon glyphicon-trash"></span></button></td></tr>';								
								} else {						
									cuerpoTabla += '<td></td></tr>';
								}
						<%} if (attributes.get("role_id").toString().equals("3")){%>
							cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td>';
							if (usuarios[q].url) {
								cuerpoTabla += '<td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
							}else{
								cuerpoTabla += '<td>'+usuarios[q].nombre+'</td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
							}
						<%}%>
					}
				}
			}
			
			
			var tablaUsuarios ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesUsuarios">'+
			'	                	<thead>'+
			'	                		<tr class="active"><th class="text-center" colspan="4">Agregar Nuevo Usuario</th><th class="text-center"><button type="button" class="btn btn-default btn-sm agregarUsuario" data-toggle="tooltip" data-placement="top" title="Agregar Usuario"><span class="glyphicon glyphicon-user"></span></button></th></tr>'+
			'	                		<tr class="active"><th class="text-center">Entidad</th><th class="text-center">Nombre</th><th class="text-center">Correo</th><th class="text-center">Rol</th><th class="text-center">Administrar</th></tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaUsuariosPrecargados">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoUsuario').append(tablaUsuarios);
			$('#tablaUsuariosPrecargados').append(cuerpoTabla);
			$("#dataTablesUsuarios").DataTable();

		}
		
		renderUsuarios();
		
		$("body").on("click", ".agregarUsuario",function(event){
			
			if ( $("#modalUsuario").length )
			{
				$("#modalUsuario").remove();
			}
			if ( $("#modalBorrarUsuario").length )
			{
				$("#modalBorrarUsuario").remove();
			}
			if ( $("#modalEditarUsuario").length )
			{
				$("#modalEditarUsuario").remove();
			}
			
			var optionRoles = "";
			var optionRolesTablero = "";
			var optionRolesMovil = "";
			var etiquetasUsuario = "";
			
			var etiquetas = $.ajax({
				url:'/tablero/ajaxSelects2?action=getEtiqueta',
				type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			etiquetas = JSON.parse(etiquetas);
			
			var roles = $.ajax({
				url:'/ajaxSelects?accion=getRol',
				type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			roles = JSON.parse(roles);
			

			for(var r = 0; r < roles.length; r++){
				if(rol_jsp < roles[r].id || rol_jsp == 0){
					if(roles[r].id == 3){
						optionRoles += '<option value="'+roles[r].id+'" selected>'+roles[r].nombre+'</option>';
					}else{
						optionRoles += '<option value="'+roles[r].id+'" >'+roles[r].nombre+'</option>';
					}
				}
			}
			
			for(var p = 0; p < roles.length; p++){
				if(rol_tablero_jsp < roles[p].id || rol_tablero_jsp == 0){
					if(roles[p].id == 3){
						optionRolesTablero += '<option value="'+roles[p].id+'" selected>'+roles[p].nombre+'</option>';
					}else{
						optionRolesTablero += '<option value="'+roles[p].id+'" >'+roles[p].nombre+'</option>';
					}
				}
				
			}
			
			for(var q = 0; q < roles.length; q++){
				if(rol_movil_jsp < roles[q].id || rol_movil_jsp == 0){
					if(roles[q].id == 3){
						optionRolesMovil += '<option value="'+roles[q].id+'" selected>'+roles[q].nombre+'</option>';
					}else{
						optionRolesMovil += '<option value="'+roles[q].id+'" >'+roles[q].nombre+'</option>';
					}
				}
			}
			
			for(var l = 0; l < etiquetas.length; l++){
				etiquetasUsuario += '<input type="checkbox" class="cmbEtiqueta" id=cmbEtiqueta-'+etiquetas[l].id+'><a tipo="filtroPorEntidad" class="linkInstitucion" > '+etiquetas[l].nombre+'</a> ';
			}
			
			
			var cuerpoModalUsuario = "";

		    cuerpoModalUsuario =	'<div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" id="botonCloseUsuario" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Agregar Usuario</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="accionCuerpo" >'+
			
			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'	                  			<div class="box-tools pull-right">'+
			'		                  		</div>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<form role="form" id="formulario">'+
			'									<div class="table-responsive">'+
			'										<table class="table table-hover">'+
			'											<tbody>'+
			'												<tr><td><div class="form-group"><label for="nivelUsuario">Nivel</label><input type="text" class="form-control" id="nivelUsuario" list="listaNiveles" placeholder="Nivel" /></div></td><td><div class="form-group"><label for="entidadUsuario">Entidad</label><input type="text" class="form-control" id="entidadUsuario" list="listaEntidades" /></div></td></tr>'+
			'												<tr><td><div class="form-group"><label for="correoUsuario">Correo</label><input type="text" class="form-control" id="correoUsuario" value="" placeholder="Ingrese Correo del Usuario"></div></td><td><div class="form-group"><label for="contrasenaUsuario">Contraseña</label><input type="password" class="form-control" id="contrasenaUsuario" placeholder="Ingrese una Contraseña" value="" /></div></td></tr>'+
			'												<tr><td><div class="form-group"><label for="unidadResponsableUsuario">U. Responsable</label><select id="unidadResponsableUsuario" class="form-control"></select></div></td><td><div class="form-group"><label for="NombreUsuario">Nombre</label><input type="text" class="form-control" id="nombreUsuarioFormulario" placeholder="Ingrese Nombre del Usuario" /></div></td></tr>'+
			'												<tr><td><label for="documentoUsuario">Adjuntar Documento</label><input type="file" id="documentoUsuario" name="documentoUsuario" /><input type="hidden" id="urlDocUsuario" name="urlDocUsuario" value="" /></td><td><div class="form-group"><label for="rolIdUsuario">Rol Spr</label><select id="rolIdUsuario" class="form-control">'+optionRoles+'</select></div></td></tr>'+
			'												<tr><td><label for="rolTableroUsuario">Rol Tablero</label><select id="rolTableroUsuario" class="form-control">'+optionRolesTablero+'</select></td><td><div class="form-group"><label for="rolMovilUsuario">Rol Movil</label><select id="rolMovilUsuario" class="form-control">'+optionRolesMovil+'</select></div></td></tr>'+
			'												<tr><td><div class="checkbox"><label for="correoReal"><input type="checkbox" id="correoReal"> Correo Real</label></div></td></tr>'+
			'											</tbody>'+							           
			'										</table>'+
			'									</div>'+
			'								</form>'+
			'               			</div>'+//fin box-body
			'							<div class="modal-footer" id="agregarBotonUsuario">'+
			'								<button type="button" class="btn btn-success btn-sm guardarUsuario" id="botonGuardarUsuario">Guardar Usuario</button>'+
			'							</div>'+
			'                		</div>'+	
			'                	</div>'+
			'                </div>'+											

			'		    </div>'+
	
			'		</div>'+ 
			'	</div>'+
			'</div>'; 

			$("body").append(cuerpoModalUsuario);
			$("#modalUsuario").modal('show');
			
			function Combo(){

			    this.nivelFocus = function(){
				if ( $("#listaNiveles").length ) {
					$("#listaNiveles").remove();
					$('#nivelUsuario').val('');
					$("#listaEntidades").remove();
					$('#entidadUsuario').val('');
					$("#listaResponsable").remove();
					$('#unidadResponsableUsuario').val('');
				}
				
				var url="";
				
				if (rol_jsp == 0){
					url = 'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles';				
				} else {
					url = 'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles&nivel='+usr_nivel_id;
				}
				
			   	  var listaDatalist=document.getElementsByTagName('datalist');
			      var datosNiveles = $.ajax({
			          url: url,
			          type:'get',
			          dataType:'json',	
			          async:false       
			        }).responseText;   
			        datosNiveles = JSON.parse(datosNiveles);
			        
					
			        if(listaDatalist.length === 0 )
			        {
				        var datalistNiveles = document.createElement('datalist');
				        datalistNiveles.setAttribute('id','listaNiveles');
				        datalistNiveles.setAttribute('size','5'); 
				        var ubicacionDatalistNiveles = document.getElementById('formulario');
				        ubicacionDatalistNiveles.appendChild(datalistNiveles);
				
				        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
				        {    
				        	var option = document.createElement('option');
				          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
				          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
				          	datalistNiveles.appendChild(option);      
				      	} 
			        }
			    } 

			    this.entidadFocus = function(){ 
			    	
					if ( $("#listaEntidades").length ) {
						$("#listaEntidades").empty();
						$('#entidadUsuario').val('');
						$("#listaResponsable").empty();
						$('#unidadResponsableUsuario').val('');
					}
					
					var linkNivel = document.getElementById('nivelUsuario').value;
					
					var url="";
					
					if (rol_jsp == 0){
						url = 'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel;				
					} else {
						url = 'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel+'&entidadId='+usr_entidad_id;
					}
								    	
			    	var datosEntidades = $.ajax({
			         	url: url,
			          	type:'get',
			          	dataType:'json',
			          	async:false
			    	}).responseText;
			    	datosEntidades = JSON.parse(datosEntidades);
			    	
			        var datalistNiveles = document.createElement('datalist');
			        datalistNiveles.setAttribute('id','listaEntidades');
			        datalistNiveles.setAttribute('size','5'); 
			        var ubicacionDatalistNiveles = document.getElementById('formulario');
			        ubicacionDatalistNiveles.appendChild(datalistNiveles);
			
			        for(var i = 0; i < datosEntidades.entidades.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
			          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
			          	datalistNiveles.appendChild(option);      
			      	} 
			    	
			     } 
			    this.unidadResponsableFocus = function(){ 
			    	
					if ($("#listaResponsable").length ) {
						$("#listaResponsable").empty();
						$('#unidadResponsableUsuario').val('');
					}
			    	var linkNivel = document.getElementById('nivelUsuario').value;
			    	var linkEntidad = document.getElementById('entidadUsuario').value;

					var url="";
					
					if (rol_jsp == 0 || usr_unr_id == 0){
						url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesResponsables&nivel='+linkNivel+'&entidad='+linkEntidad;				
					} else {
						url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesResponsables&nivel='+linkNivel+'&entidad='+linkEntidad+'&unidadResponsable='+usr_unr_id;
					}
			    	
			    	var unidadResponsable = $.ajax({
			         	url: url,
			          	type:'get',
			          	dataType:'json',
			          	async:false
			    	}).responseText;
			    	unidadResponsable = JSON.parse(unidadResponsable);
			    	unidadResponsable = unidadResponsable.unidadesResponsables;
			    	
			      	$("#unidadResponsableUsuario").html(""); 
			      	var optionUnidadRes="";
					for(var r = 0; r < unidadResponsable.length; r++){
						if (!(unidadResponsable[r].unrCodigo == 0 && rol_jsp == 1)){// evita que un usuario con rol 1 y unr_id = 0 edite un usuario y le conceda unr_id = 0  
							optionUnidadRes += '<option value="'+unidadResponsable[r].unrCodigo+'" >'+unidadResponsable[r].unrNombre+'</option>';
						}							
					}
			    	$("#unidadResponsableUsuario").append(optionUnidadRes);
			     }  
			    
			}//fin combo
			
			  var eje1 = new Combo();
			  document.getElementById('nivelUsuario').addEventListener('focus',eje1.nivelFocus,false);
			  document.getElementById('entidadUsuario').addEventListener('focus',eje1.entidadFocus,false);
			  document.getElementById('unidadResponsableUsuario').addEventListener('focus',eje1.unidadResponsableFocus,false); 			

		});
		
	function getEtiquetaSeleccionadas(){						
		var etiquetaSelected=[];
		$(".cmbEtiqueta:checked").each(function(){
			var idEtiqueta=$(this).attr('id').split("-");
		    if (idEtiqueta[1]!='a'){
		    	etiquetaSelected.push(idEtiqueta[1]);	
		    }
		     
		})
		return etiquetaSelected;
	}
	
	$("body").on("click", ".guardarUsuario",function(event){
		
		var nivelId = $("#nivelUsuario").val();
		var entidadId = $("#entidadUsuario").val();
		var correo = $("#correoUsuario").val();
		var contrasena = $.md5($("#contrasenaUsuario").val());
		var unidadResponsable = $("#unidadResponsableUsuario").val();
		var nombre = $("#nombreUsuarioFormulario").val(); 
		var rolId = $("#rolIdUsuario").val();
		var rolTablero = $("#rolTableroUsuario").val();
		var rolMovil = $("#rolMovilUsuario").val();
		var correoReal= $("#correoReal").is(":checked");
		var etiquetaSeleccionada = [];
		etiquetaSeleccionada = getEtiquetaSeleccionadas();
		//Validación para la creación de usuarios.			
		if ((nivelId != usr_nivel_id || entidadId != usr_entidad_id || unidadResponsable != usr_unr_id) && usr_unr_id != 0 && rol_jsp != 0){
			$("#botonGuardarUsuario").remove();
        	$("#cuerpoModalUsuario").html("");
        	$("#cuerpoModalUsuario").html("<h3 class='text-center'> Error! Solo puede crear usuarios que sean de su Nivel, Entidad y Unidad Responsable. </h3>");
        	$("#botonCloseUsuario").attr('class','close agregarUsuario');
        	$("#agregarBotonUsuario").html("");
        	$("#agregarBotonUsuario").append('<button type="button" class="btn btn-danger btn-sm agregarUsuario" id="botonCerrarUsuario">Cerrar</button>');
		} else if ((nivelId != usr_nivel_id || entidadId != usr_entidad_id) && usr_unr_id == 0  && rol_jsp != 0){
			$("#botonGuardarUsuario").remove();
        	$("#cuerpoModalUsuario").html("");
        	$("#cuerpoModalUsuario").html("<h3 class='text-center'> Error! Solo puede crear usuarios que sean de su Nivel y Entidad. </h3>");
        	$("#botonCloseUsuario").attr('class','close agregarUsuario');
        	$("#agregarBotonUsuario").html("");
        	$("#agregarBotonUsuario").append('<button type="button" class="btn btn-danger btn-sm agregarUsuario" id="botonCerrarUsuario">Cerrar</button>');
		} else {
			var docUsuarioFile = document.getElementById("documentoUsuario").files[0];		    
			if (docUsuarioFile != null){
			    var formdata = new FormData();
			    formdata.append('documentoEvidencia', docUsuarioFile);
			    
			     $.ajax({
				         type: "POST",
				         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
				         data: formdata, /* + $('#custIdList').val(), */
				         async: false,
				         processData: false,  // tell jQuery not to process the data
				         contentType: false,   // tell jQuery not to set contentType
				         success: function(data){
				               $("#urlDocUsuario").val(data);
				         }
				});
			}
			var urlDocumento; 
				if (docUsuarioFile != undefined) urlDocumento = $("#urlDocUsuario").val();										
			
	    	var nombreEntidad = $.ajax({
	         	 url:'/ajaxSelects?accion=getEntidades&entidadId='+entidadId+'&nivel='+nivelId,
	          	type:'get',
	          	dataType:'json',
	          	async:false
	    	}).responseText;
	    	nombreEntidad = JSON.parse(nombreEntidad);

		  
			//var avanceId = $("#avanceIdEvidencia").val(); No utilizo esta variable xq ya viene en el parse pero lo ideal seria obtener del formulario
		
			//Vaciar los inputs
			$("#nivelUsuario").val("");
			$("#entidadUsuario").val("");
			$("#urlDocUsuario").val("");	
			$("#correoUsuario").val("");
			$("#rolIdUsuario").val("");
			$("#rolTableroUsuario").val("");
			$("#rolMovilUsuario").val("");
			$("#nombreUsuarioFormulario").val("");
			$("#unidadResponsableUsuario").val("");
			$("#contrasenaUsuario").val("");

			
			var objeto = new Object();
			
			objeto.nivel_id = nivelId;
			objeto.entidad_id = entidadId;
			objeto.correo = correo;
			objeto.passwd = contrasena;
			objeto.unidadResponsable = unidadResponsable;
			objeto.nombre = nombre;
			objeto.url = urlDocumento;
			objeto.rol_id = rolId;
			objeto.entidad = nombreEntidad.entidades[0].abrevEntidad;
			objeto.rolTablero = rolTablero;
			objeto.rolMovil = rolMovil;
			objeto.correoReal= correoReal;

			//objeto.unidadResponsable = usuarios[0].id // corresponde al id de la tabla usuario el cual es el responsable de crear nuevos usuarios

			//objeto.documentoEvidencia = documentoEvidencia;
			
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/ajaxInserts?accion=insUsuario",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		        		$("#botonGuardarUsuario").remove();
		            	$("#cuerpoModalUsuario").html("");
		            	$("#cuerpoModalUsuario").html("<h3 class='text-center'>GUARDADO EXITOSAMENTE!!</h3>");
		        		renderUsuarios();		        		
		        	}else{
		        		$("#botonGuardarUsuario").remove();
		            	$("#cuerpoModalUsuario").html("");
		            	$("#cuerpoModalUsuario").html("<h3 class='text-center'>ERROR!! al intentar guardar este usuario, probablemente ya existe un usuario con este Correo.</h3>");
		        	}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {
		        	
		        	}
			 });
		    
/* 			var objetoEtiqueta = new Object();
		    for(var t = 0; t < etiquetaSeleccionada.length; t++){
				
		    	objetoEtiqueta.usuarioCorreo = correo;
		    	objetoEtiqueta.etiquetaId = etiquetaSeleccionada[t];
		    	
			  	var info2 = JSON.stringify(objetoEtiqueta);
			    $.ajax({
			        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insEtiquetaUsuario",
			        type: 'POST',
			        dataType: 'json',
			        data: info2,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
			        	if(data.success == true)
			        	{
			            	$("#cuerpoModalUsuario").html("<h3 class='text-center'>ETIQUETA GUARDADO EXITOSAMENTE!!</h3>");
			        		renderUsuarios();		        		
			        	}else{

			            	$("#cuerpoModalUsuario").html("<h3 class='text-center'>ERROR!! al intentar guardar este usuario y etiqueta, probablemente ya existe un usuario con esta Etiqueta.</h3>");
			        	}
			        },
			        error: function(data,status,er) {
			        	
			        	}
				 });
		    } */
		    
		}		

	});
		
	$("body").on("click", ".consultaBorrarUsuario",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var usuarioId = idParsed[0];
	    
		if ( $("#modalUsuario").length )
		{
			$("#modalUsuario").remove();
		}
		if ( $("#modalBorrarUsuario").length )
		{
			$("#modalBorrarUsuario").remove();
		}
		if ( $("#modalEditarUsuario").length )
		{
			$("#modalEditarUsuario").remove();
		}	
		
		var usuarioSelec = $.ajax({
			url:'/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioSelec = JSON.parse(usuarioSelec);
		usuarioSelec = usuarioSelec.usuarios;
   		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarUsuario"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title" >Borrar - Restaurar Usuario</h4>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							'			<div id="mensajeBorradoUsuario"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoUsuario">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("body").append(contenido);
			
			if(usuarioSelec[0].borrado == true){
				$("#mensajeBorradoUsuario").html("");
				$("#mensajeBorradoUsuario").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER<strong> '+usuarioSelec[0].correo+'</strong></h3>');
				$("#agregarBotonBorradoUsuario").html("");
				$("#agregarBotonBorradoUsuario").append('<button type="button" class="btn btn-success btn-sm borrarUsuario" id="botonRestaurarUsuario" parametros='+usuarioId+'-r>Restaurar Usuario</button>');
			}else{
				$("#mensajeBorradoUsuario").html("");
				$("#mensajeBorradoUsuario").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR<strong> '+usuarioSelec[0].correo+'</strong></h3');
				$("#agregarBotonBorradoUsuario").html("");
				$("#agregarBotonBorradoUsuario").append('<button type="button" class="btn btn-danger btn-sm borrarUsuario" id="botonBorradoUsuario" parametros='+usuarioId+'-b>Borrar Usuario</button>');
			}
			
			$('#modalBorrarUsuario').modal('show');
	});
	
	$("body").on("click", ".borrarUsuario",function(event){	
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var usuarioId = idParsed[0];
	    var estado = idParsed[1];
	    
		var usuarioSelec = $.ajax({
			url:'/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioSelec = JSON.parse(usuarioSelec);
		usuarioSelec = usuarioSelec.usuarios;
	    
	    var objeto = new Object();
	    objeto.id = usuarioId;
	    objeto.borrado= usuarioSelec[0].borrado;

	    
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "http://spr.stp.gov.py/ajaxUpdate?accion=actBorradoUsuario",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	
	        	if(data.success == true){
	            	if(estado == "b"){
	            		$("#botonBorradoUsuario").remove();
		            	$("#mensajeBorradoUsuario").html("");
		            	$("#mensajeBorradoUsuario").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
		            	renderUsuarios();
		            }else{
		        		$("#botonRestaurarUsuario").remove();
		            	$("#mensajeBorradoUsuario").html("");
		            	$("#mensajeBorradoUsuario").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
		            	renderUsuarios();
		        	}
	        	}

	        },

	        error: function(data,status,er) {
	        	
	        	}
		 });
		
	});
	
	$("body").on("click", ".consultaEditarUsuario",function(event){
		
		if ( $("#modalUsuario").length )
		{
			$("#modalUsuario").remove();
		}
		if ( $("#modalBorrarUsuario").length )
		{
			$("#modalBorrarUsuario").remove();
		}
		if ( $("#modalEditarUsuario").length )
		{
			$("#modalEditarUsuario").remove();
		}
		if ( $("#modalEtiquetaUsuario").length )
		{
			$("#modalEtiquetaUsuario").remove();
		}	
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var usuarioId = idParsed[0];		
			
		var usuarioSelec = $.ajax({
			url:'/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioSelec = JSON.parse(usuarioSelec);
		usuarioSelec = usuarioSelec.usuarios;
		
		var etiquetas = $.ajax({
			url:'/tablero/ajaxSelects2?action=getEtiqueta',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		etiquetas = JSON.parse(etiquetas);
		
		var usuarioEtiqueta = $.ajax({
			url:'/tablero/ajaxSelects2?action=getUsuarioEtiqueta&usuario='+usuarioSelec[0].correo,
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioEtiqueta = JSON.parse(usuarioEtiqueta);
	    
	    
		var roles = $.ajax({
			url:'/ajaxSelects?accion=getRol',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		roles = JSON.parse(roles);
		
		var optionRoles = "";
		var optionRolesTablero = "";
		var optionRolesMovil = "";
		var etiquetasUsuario = '';

		for(var r = 0; r < roles.length; r++){
			if(rol_jsp < roles[r].id || rol_jsp == 0 || (usr_name == usuarioSelec[0].correo && rol_jsp == roles[r].id)){
				if(usuarioSelec[0].rol_id == roles[r].id){
					optionRoles += '<option value="'+roles[r].id+'" selected>'+roles[r].nombre+'</option>';
				}else{
					optionRoles += '<option value="'+roles[r].id+'" >'+roles[r].nombre+'</option>';
				}
			}
		}
		
		for(var p = 0; p < roles.length; p++){
			if(rol_tablero_jsp < roles[p].id || rol_tablero_jsp == 0 || (usr_name == usuarioSelec[0].correo && rol_tablero_jsp == roles[p].id)){
				if(usuarioSelec[0].rolTablero == roles[p].id){
					optionRolesTablero += '<option value="'+roles[p].id+'" selected>'+roles[p].nombre+'</option>';
				}else{
					optionRolesTablero += '<option value="'+roles[p].id+'" >'+roles[p].nombre+'</option>';
				}
			}
			
		}
		
		for(var q = 0; q < roles.length; q++){
			if(rol_movil_jsp < roles[q].id || rol_movil_jsp == 0 || (usr_name == usuarioSelec[0].correo && rol_movil_jsp == roles[q].id)){
				if(usuarioSelec[0].rolMovil == roles[q].id){
					optionRolesMovil += '<option value="'+roles[q].id+'" selected>'+roles[q].nombre+'</option>';
				}else{
					optionRolesMovil += '<option value="'+roles[q].id+'" >'+roles[q].nombre+'</option>';
				}
			}
		}
		var etiquetasSeleccionada = [];
		if(usuarioEtiqueta != null){
			for(var i = 0; i < etiquetas.length; i++){
				for(var l = 0; l < usuarioEtiqueta.length; l++){
					if(usuarioEtiqueta[l].etiqueta_id == etiquetas[i].id && usuarioEtiqueta[l].borrado != true){
						etiquetasUsuario += '<input type="checkbox" class="cmbEditarEtiqueta" id='+usuarioEtiqueta[l].borrado+'-'+usuarioEtiqueta[l].id+'-'+usuarioId+'-e checked="true"><a> '+etiquetas[i].nombre+'</a></br> ';
						etiquetasSeleccionada.push(etiquetas[i].id);
					}else if(usuarioEtiqueta[l].etiqueta_id == etiquetas[i].id && usuarioEtiqueta[l].borrado != false){
						etiquetasUsuario += '<input type="checkbox" class="cmbEditarEtiqueta" id='+usuarioEtiqueta[l].borrado+'-'+usuarioEtiqueta[l].id+'-'+usuarioId+'-e ><a> '+etiquetas[i].nombre+'</a></br> ';
						etiquetasSeleccionada.push(etiquetas[i].id);
					}
				}
			}
		}//fin if
			
		for(var h = 0; h < etiquetas.length; h++){
			if (etiquetasSeleccionada.indexOf(etiquetas[h].id)<0){
				etiquetasUsuario += '<input type="checkbox" class="cmbEditarEtiqueta" id='+etiquetas[h].id+'-'+usuarioSelec[0].correo+'-'+usuarioId+'-n-'+usr_responsable+'><a> '+etiquetas[h].nombre+'</a></br> ';
				etiquetasSeleccionada.push(etiquetas[h].id);
			}
		}
		
	
		//Empieza el codigo *****************************************************************************************************************************************
		/*var webServicesPermisoPorModulo = $.ajax({
			url:'/ajaxSelects?accion=getPermisosPorModulos&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesPermisoPorModulo = JSON.parse(webServicesPermisoPorModulo);
		
		var webServicesModulos = $.ajax({
			url:'/ajaxSelects?accion=getModulos',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesModulos = JSON.parse(webServicesModulos);
		
		var webServicesPermisoModulo = $.ajax({
			url:'/ajaxSelects?accion=getPermisoModulo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesPermisoModulo = JSON.parse(webServicesPermisoModulo);
		
		var optionRoles;
		var cuerpoTablaModulos;*/
		//termina el codigo*****************************************************************************************************************************************

		
		var cuerpoModalUsuario = "";

	    cuerpoModalUsuario =	'<div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg" style="width:90%">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" id="botonCloseUsuario" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">Editar Usuario</h4>'+   
		'			</div>'+
		'		    <div class="modal-body" id="cuerpoModal">'+

		'		      	<div class="row">'+ 
		'		      		<div class="col-md-12">'+
		'						<div class="box box-warning">'+
		'		                	<div class="box-header with-border">'+
		'		                  		<h3 class="box-title"></h3>'+
		'               			</div>'+//fin box-heder
		'               			<div class="box-body" id="cuerpoModalUsuario">'+
		
		'								<div id="mensajeBorradoUsuario"></div>'+
		'								<form role="form" id="formulario">'+
		'									<div class="table-responsive">'+
		'										<table class="table table-hover">'+
		'											<tbody>'+
		'												<tr><td><div class="form-group"><label for="nivelUsuario">Nivel</label><input type="text" class="form-control" id="nivelUsuario" list="listaNiveles" placeholder="Nivel" value="'+usuarioSelec[0].nivel_id+'" /></div></td><td><div class="form-group"><label for="entidadUsuario">Entidad</label><input type="text" class="form-control" id="entidadUsuario" list="listaEntidades" value="'+usuarioSelec[0].entidad_id+'"/></div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="correoUsuario">Correo</label><input type="text" class="form-control" id="correoUsuario" placeholder="Ingrese Correo del Usuario" value="'+usuarioSelec[0].correo+'"  ></div></td><td><div class="form-group"><label for="contrasenaUsuario">Contraseña</label><input type="password" class="form-control" id="contrasenaUsuario" placeholder="Ingrese una Contraseña" value="" /></div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="unidadResponsableUsuario">U. Responsable</label><select id="unidadResponsableUsuario" class="form-control"></select></div></td><td><div class="form-group"><label for="NombreUsuario">Nombre</label><input type="text" class="form-control" id="nombreUsuarioFormulario" placeholder="Ingrese Nombre del Usuario" value="'+usuarioSelec[0].nombre+'" /></div></td></tr>'+
		'												<tr><td><label for="documentoUsuario">Adjuntar Documento</label><input type="file" id="documentoUsuario" name="documentoUsuario" /><input type="hidden" id="urlDocUsuario" name="urlDocUsuario" value="" /></td><td><div class="form-group"><label for="rolIdUsuario">Rol Spr</label><select id="rolIdUsuario" class="form-control">'+optionRoles+'</select></div></td></tr>'+
		'												<tr><td><label for="rolTableroUsuario">Rol Tablero</label><select id="rolTableroUsuario" class="form-control">'+optionRolesTablero+'</select></td><td><div class="form-group"><label for="rolMovilUsuario">Rol Movil</label><select id="rolMovilUsuario" class="form-control">'+optionRolesMovil+'</select></div></td></tr>'+
		'												<tr><td><div class="checkbox"><label for="correoReal"><input type="checkbox" id="correoReal"> Correo Real</label></div></td></tr>'+
		'											</tbody>'+							           
		'										</table>'+
		'									</div>'+
		'								</form>'+
		
		'							</div>'+
		'						</div>'+
		'					</div>'+
		'				</div>'+
		//empieza el codigo del modulo*****************************************************************************************************************************************
		/*'				<div class="row">'+
		'					<div class="col-md-12">'+
		'						<div class="box box-default box-solid">'+
		'							<div class="box-header with-border">'+
		'						    	<h4 class="box-title" >Permiso por Modulo</h4>'+
		'						    </div>'+
		'							<div class="box-body">'+
																																		        														
		'								<div class="table-responsive">'+
		'									<table class="table">'+
		'										<thead>'+
		'											<tr class="active"><th>Nombre Modulo</th><th>Rol</th></tr>'+
		'										</thead>'+
		'										<tbody id="cuerpoModulo">'+
		'										</tbody>'+
		'									</table>'+
		'						      	</div>'+
								      							
		'							</div>'+
		'						</div>'+
		'					</div>'+
		'				</div>'+*/
		//termina el codigo del modulo*****************************************************************************************************************************************
		
		'			</div>'+
		'			<div class="modal-footer"  id="agregarBotonUsuario">'+
		'				<button type="button" class="btn btn-success btn-sm guardarCambiosUsuario" id="botonGuardarUsuario" parametros="'+usuarioSelec[0].id+'">Guardar Cambios</button>'+
		'			</div>'+
		'		</div>'+ 
		'	</div>'+
		'</div>';  

		$("body").append(cuerpoModalUsuario);		
		$("#correoReal").prop('checked', usuarioSelec[0].correoReal);
		
		//empieza el codigo del modulo *****************************************************************************************************************************************
		/*for(var l = 0; l < webServicesPermisoPorModulo.length; l++){
			
			cuerpoTablaModulos = "";
			
			for(var m = 0; m < webServicesModulos.length; m++){
				if(webServicesModulos[m].id == webServicesPermisoPorModulo[l].moduloId){
					cuerpoTablaModulos += "<tr><td>"+webServicesModulos[m].nombeModulo+"</td>";
				}
			}
			
			cuerpoTablaModulos += "<td><form role='form'><div class='form-group'><select class='form-control selectCombo'>";
			
			for(k = 0;k<webServicesPermisoModulo.length; k++){
				if(webServicesPermisoModulo[k].id == webServicesPermisoPorModulo[l].permisoModuloId){
					cuerpoTablaModulos += '<option value="'+webServicesPermisoPorModulo[l].id+'-'+webServicesPermisoPorModulo[l].moduloId+'-'+usuarioId+'-'+webServicesPermisoModulo[k].id+'" selected>'+webServicesPermisoModulo[k].nombre+'</option>';
				}else{
					cuerpoTablaModulos += '<option value="'+webServicesPermisoPorModulo[l].id+'-'+webServicesPermisoPorModulo[l].moduloId+'-'+usuarioId+'-'+webServicesPermisoModulo[k].id+'">'+webServicesPermisoModulo[k].nombre+'</option>';
				}
			}
			cuerpoTablaModulos += "</form></div></td></tr>";

			
			$("#cuerpoModulo").append(cuerpoTablaModulos);
		}*/
		//termina el codigo del modulo *****************************************************************************************************************************************
		
		
    	var nivelId = usuarioSelec[0].nivel_id;
    	var entidadId = usuarioSelec[0].entidad_id;

    	var unidadResponsable = $.ajax({
         	url:'/ajaxSelects?accion=getUnidadesResponsables&nivel='+nivelId+'&entidad='+entidadId,
          	type:'get',
          	dataType:'json',
          	async:false
    	}).responseText;
    	unidadResponsable = JSON.parse(unidadResponsable);
    	unidadResponsable = unidadResponsable.unidadesResponsables;

      	var optionUnidadRes="";
		for(var r = 0; r < unidadResponsable.length; r++){
			if(unidadResponsable[r].unrCodigo == usuarioSelec[0].unidadResponsable){
				optionUnidadRes += '<option value="'+unidadResponsable[r].unrCodigo+'" selected >'+unidadResponsable[r].unrNombre+'</option>';
			}else{
				optionUnidadRes += '<option value="'+unidadResponsable[r].unrCodigo+'" >'+unidadResponsable[r].unrNombre+'</option>';
			}
		}
    	$("#unidadResponsableUsuario").append(optionUnidadRes);    	
		$("#modalEditarUsuario").modal('show');
		
		function Combo(){

		    this.nivelFocus = function(){
			//if( $("#listaNiveles").length ) {
				$("#listaNiveles").remove();
				$('#nivelUsuario').val('');
				$("#listaEntidades").remove();
				$('#entidadUsuario').val('');
				$("#listaResponsable").remove();
				$('#unidadResponsableUsuario').val('');
			//}
			
		   	  var listaDatalist=document.getElementsByTagName('datalist');
		   	  
			  var url="";
			
			  if (rol_jsp == 0){
				  url = 'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles';				
			  } else {
				  url = 'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles&nivel='+usr_nivel_id;
			  }
		   	  
		      var datosNiveles = $.ajax({
		          url: url,
		          type:'get',
		          dataType:'json',	
		          async:false       
		        }).responseText;   
		        datosNiveles = JSON.parse(datosNiveles);
		        
				
		        if(listaDatalist.length === 0 )
		        {
			        var datalistNiveles = document.createElement('datalist');
			        datalistNiveles.setAttribute('id','listaNiveles');
			        datalistNiveles.setAttribute('size','5'); 
			        var ubicacionDatalistNiveles = document.getElementById('formulario');
			        ubicacionDatalistNiveles.appendChild(datalistNiveles);
			
			        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
			          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
			          	datalistNiveles.appendChild(option);      
			      	} 
		        }
		    } 

		    this.entidadFocus = function(){ 
		    	
				if ( $("#listaEntidades").length ) {
					$("#listaEntidades").remove();
					$('#entidadUsuario').val('');
					$("#listaResponsable").remove();
					$('#unidadResponsableUsuario').val('');
				}
		    	var linkNivel = document.getElementById('nivelUsuario').value;
		    	
		    	var url="";
				
				if (rol_jsp == 0){
					url = 'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel;				
				} else {
					url = 'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel+'&entidadId='+usr_entidad_id;
				}
		    	
		    	var datosEntidades = $.ajax({
		         	url: url,
		          	type:'get',
		          	dataType:'json',
		          	async:false
		    	}).responseText;
		    	datosEntidades = JSON.parse(datosEntidades);
		    	
		        var datalistNiveles = document.createElement('datalist');
		        datalistNiveles.setAttribute('id','listaEntidades');
		        datalistNiveles.setAttribute('size','5'); 
		        var ubicacionDatalistNiveles = document.getElementById('formulario');
		        ubicacionDatalistNiveles.appendChild(datalistNiveles);
		
		        for(var i = 0; i < datosEntidades.entidades.length ; i++) 
		        {    
		        	var option = document.createElement('option');
		          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
		          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
		          	datalistNiveles.appendChild(option);      
		      	} 
		    	
		     } 
		    this.unidadResponsableFocus = function(){ 
		    	
				if ($("#listaResponsable").length ) {
					$("#listaResponsable").remove();
					$('#unidadResponsableUsuario').val('');
				}
		    	var linkNivel = document.getElementById('nivelUsuario').value;
		    	var linkEntidad = document.getElementById('entidadUsuario').value;

		    	var url="";
				
				if (rol_jsp == 0 || usr_unr_id == 0){
					url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesResponsables&nivel='+linkNivel+'&entidad='+linkEntidad;				
				} else {
					url = 'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesResponsables&nivel='+linkNivel+'&entidad='+linkEntidad+'&unidadResponsable='+usr_unr_id;
				}
		    	
		    	var unidadResponsable = $.ajax({
		         	url: url,
		          	type:'get',
		          	dataType:'json',
		          	async:false
		    	}).responseText;
		    	unidadResponsable = JSON.parse(unidadResponsable);
		    	unidadResponsable = unidadResponsable.unidadesResponsables;		    				      		    	
		    	
		      	$("#unidadResponsableUsuario").html(""); 
		      	var optionUnidadRes="";
				for(var r = 0; r < unidadResponsable.length; r++){
					if (!(unidadResponsable[r].unrCodigo == 0 && rol_jsp == 1)){// evita que un usuario con rol 1 y unr_id = 0 cree un usuario con unr_id = 0
						optionUnidadRes += '<option value="'+unidadResponsable[r].unrCodigo+'" >'+unidadResponsable[r].unrNombre+'</option>';
					}
				}
		    	$("#unidadResponsableUsuario").append(optionUnidadRes);
		     }  
		    
		}//fin combo
		
		  var eje1 = new Combo();
		  document.getElementById('nivelUsuario').addEventListener('focus',eje1.nivelFocus,false);
		  document.getElementById('entidadUsuario').addEventListener('focus',eje1.entidadFocus,false);
		  document.getElementById('unidadResponsableUsuario').addEventListener('focus',eje1.unidadResponsableFocus,false); 			

		    $(".selectCombo").change(function() {
				var parametros = $(this).val();
				var idParsed = parametros.split("-"); 
				var id = idParsed[0];
				var moduloId = idParsed[1];
				var usuarioId = idParsed[2];
				var permisoModuloId = idParsed[3];
				
				var objeto = new Object();
				objeto.id = id;
				objeto.moduloId = moduloId;
				objeto.usuarioId = usuarioId;
				objeto.permisoModuloId = permisoModuloId;
		 
				var info = JSON.stringify(objeto);
				$.ajax({
				    url: "ajaxUpdate?accion=actPermisoPorModulo",
				    type: 'POST',
				    dataType: 'json',
				    data: info,
				    contentType: 'application/json',
				    mimeType: 'application/json',
				    success: function (data) {
				    	
				    	if(data.success == true)
				    	{
				    		alert("CAMBIO EXITOSO");
				    	}
				
				    },
				
				    error: function(data,status,er) {
				    	
				    }
				 });
		    });
	});
	
	$("body").on("click", ".cmbEditarEtiqueta",function(event){
		var idEtiqueta=$(this).attr('id').split("-");

		var nombreEtiqueta = "";
		
		if ( $("#modalEditarUsuario").length )
		{
			$("#modalEditarUsuario").remove();
		}	
				
		if(idEtiqueta[3] == "n" ){
			var etiqueta = idEtiqueta[0];
			var correo = idEtiqueta[1];
			var usuarioId = idEtiqueta[2];
			var usuarioResponsable = idEtiqueta[4];

			
			var etiquetas = $.ajax({
				url:'/tablero/ajaxSelects2?action=getEtiqueta',
				type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			etiquetas = JSON.parse(etiquetas);
			
			for(var l = 0; l < etiquetas.length; l++){
				if(etiquetas[l].id == etiqueta){
					nombreEtiqueta = etiquetas[l].nombre;
				}
			}
			
			var objeto = new Object();
				
			objeto.usuarioCorreo = correo;
			objeto.etiquetaId = etiqueta;
			objeto.usuarioResponsable = usuarioResponsable;
	    	
			var cuerpoModalEtiquetaUsuario = "";

		    cuerpoModalEtiquetaUsuario =	'<div class="modal fade" id="modalEtiquetaUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close consultaEditarUsuario" data-dismiss="modal" parametros="'+usuarioId+'"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Editar Usuario</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="cuerpoModal">'+

			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<div id="mensajeBorradoUsuario"><center><h1>Ud agrego la etiqueta '+nombreEtiqueta+' a este usuario exitosamente!! </h1></center></div>'+
			
			'							</div>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+

			
			'			</div>'+
			'			<div class="modal-footer"  id="agregarBotonUsuario">'+
			'				<button type="button" class="btn btn-success btn-sm consultaEditarUsuario" parametros="'+usuarioId+'">Volver</button>'+
			'			</div>'+
			'		</div>'+ 
			'	</div>'+
			'</div>';  

			$("body").append(cuerpoModalEtiquetaUsuario);
			$("#modalEtiquetaUsuario").modal('show');
			
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insEtiquetaUsuario",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		            	//$("#cuerpoModalUsuario").html("<h3 class='text-center'>ETIQUETA GUARDADO EXITOSAMENTE!!</h3>");
		        		//renderUsuarios();		        		
		        	}else{

		            	//$("#cuerpoModalUsuario").html("<h3 class='text-center'>ERROR!! al intentar guardar este usuario y etiqueta, probablemente ya existe un usuario con esta Etiqueta.</h3>");
		        	}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {
		        	
		        	}
			 });

		}else{
			var estado = idEtiqueta[0];
			var etiquetaUsuarioId = idEtiqueta[1];
			var usuarioId = idEtiqueta[2];
						
		    var objeto = new Object();
		    objeto.id = etiquetaUsuarioId;
		    objeto.borrado= estado;
		    
			var cuerpoModalEtiquetaUsuario = "";

		    cuerpoModalEtiquetaUsuario =	'<div class="modal fade" id="modalEtiquetaUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close consultaEditarUsuario" data-dismiss="modal" parametros="'+usuarioId+'"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Editar Usuario</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="cuerpoModal">'+

			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<div id="mensajeBorradoUsuario"><center><h1>Ud a modificado el estado de la etiqueta '+nombreEtiqueta+' exitosamente!!</h1></center></div>'+
			
			'							</div>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+

			
			'			</div>'+
			'			<div class="modal-footer"  id="agregarBotonUsuario">'+
			'				<button type="button" class="btn btn-success btn-sm consultaEditarUsuario" parametros="'+usuarioId+'">Volver</button>'+
			'			</div>'+
			'		</div>'+ 
			'	</div>'+
			'</div>';  

			$("body").append(cuerpoModalEtiquetaUsuario);
			$("#modalEtiquetaUsuario").modal('show');


		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxUpdate2?accion=borradoEtiquetaUsuario",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	
		        	if(data.success == true){
/* 		            	if(estado == "b"){
			        		$("#botonBorradoAvanceCualitativo").remove();
			            	$("#mensajeBorradoAvanceCualitativo").html("");
			            	$("#mensajeBorradoAvanceCualitativo").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
			            }else{
			        		$("#botonRestaurarAvanceCualitativo").remove();
			            	$("#mensajeBorradoAvanceCualitativo").html("");
			            	$("#mensajeBorradoAvanceCualitativo").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
			        	} */
			        	//alert("EXITOSO!!");
		        	}

		        },

		        error: function(data,status,er) {
		        	
		        	}
			 });

		}

	});
	
	$("body").on("click", ".guardarCambiosUsuario",function(event){					
		
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var usuarioId = idParsed[0];
		var nivelId = $("#nivelUsuario").val();
		var entidadId = $("#entidadUsuario").val();
		var correo = $("#correoUsuario").val();
		var contrasena = null;
		if ($("#contrasenaUsuario").val()!="") contrasena = $.md5($("#contrasenaUsuario").val());
		var unidadResponsable = $("#unidadResponsableUsuario").val();
		var nombre = $("#nombreUsuarioFormulario").val(); 
		var rolId = $("#rolIdUsuario").val();
		var rolTablero = $("#rolTableroUsuario").val();
		var rolMovil = $("#rolMovilUsuario").val();
		var correoReal= $("#correoReal").is(":checked");
		
		//Validación para la edición de usuarios.
			if ((nivelId != usr_nivel_id || entidadId != usr_entidad_id || unidadResponsable != usr_unr_id) && usr_unr_id != 0 && rol_jsp != 0){
				$("#botonGuardarUsuario").remove();
            	$("#accionCuerpo").html("");
            	$("#accionCuerpo").html("<h3 class='text-center'> Error! Solo puede crear usuarios que sean de su Nivel, Entidad y Unidad Responsable. </h3>");
            	$("#botonCloseUsuario").attr('class','close consultaEditarUsuario');
            	$("#agregarBotonUsuario").html("");
            	$("#agregarBotonUsuario").append('<button type="button" class="btn btn-danger btn-sm consultaEditarUsuario" id="botonCerrarUsuario">Cerrar</button>');
			} else if ((nivelId != usr_nivel_id || entidadId != usr_entidad_id) && usr_unr_id == 0 && rol_jsp != 0){
				$("#botonGuardarUsuario").remove();
            	$("#accionCuerpo").html("");
            	$("#accionCuerpo").html("<h3 class='text-center'> Error! Solo puede editar usuarios en su Nivel y Entidad. </h3>");
            	$("#botonCloseUsuario").attr('class','close consultaEditarUsuario');
            	$("#agregarBotonUsuario").html("");
            	$("#agregarBotonUsuario").append('<button type="button" class="btn btn-danger btn-sm consultaEditarUsuario" id="botonCerrarUsuario">Cerrar</button>');
			} else {		
				var docUsuarioFile = document.getElementById("documentoUsuario").files[0];	    
				if (docUsuarioFile != null){
				    var formdata = new FormData();
				    formdata.append('documentoEvidencia', docUsuarioFile);
				    
				     $.ajax({
					         type: "POST",
					         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
					         data: formdata, /* + $('#custIdList').val(), */
					         async: false,
					         processData: false,  // tell jQuery not to process the data
					         contentType: false,   // tell jQuery not to set contentType
					         success: function(data){
					               $("#urlDocUsuario").val(data);
					           }
					     });
				}
				var urlDocumento; 
					if (docUsuarioFile != undefined) urlDocumento = $("#urlDocUsuario").val();					
				
				
				var usuarioSelec = $.ajax({
					url:'/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				usuarioSelec = JSON.parse(usuarioSelec);
				usuarioSelec = usuarioSelec.usuarios;
				
		    	var nombreEntidad = $.ajax({
		        	 url:'/ajaxSelects?accion=getEntidades&entidadId='+entidadId+'&nivel='+nivelId,
		         	type:'get',
		         	dataType:'json',
		         	async:false
		   		}).responseText;
		   		nombreEntidad = JSON.parse(nombreEntidad);
				
			    var objeto = new Object();
			    objeto.id = usuarioId;
			    objeto.nivel_id = nivelId;
			    objeto.entidad_id = entidadId; 
			    objeto.correo = correo;  
			    objeto.passwd = contrasena;  
			    objeto.unidadResponsable = unidadResponsable;  
			    objeto.nombre = nombre;  
			    objeto.rol_id = rolId; 
			    objeto.url = urlDocumento;
				objeto.entidad = nombreEntidad.entidades[0].abrevEntidad;
				objeto.rolTablero = rolTablero;
				objeto.rolMovil = rolMovil;
				objeto.correoReal=correoReal;		
			    
			  	var info = JSON.stringify(objeto);
			    $.ajax({
			        url: "http://spr.stp.gov.py/ajaxUpdate?accion=actUsuario",
			        type: 'POST',
			        dataType: 'json',
			        data: info,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
			        	
			        	if(data.success == true){
			            		$("#botonGuardarUsuario").remove();
				            	$("#cuerpoModal").html("");
				            	$("#cuerpoModal").html("<h3 class='text-center'>ACTUALIZADO EXITOSAMENTE!!</h3>");
				            	renderUsuarios();
			        	}
		
			        }, 
		
			        error: function(data,status,er) {
			        	
			        	}
				 });
			}		
	});
	    	
/*	$("body").on("click", ".cerrarActualizar",function(event){

		renderUsuarios();
	});*/
		
	});
<%}else{%>
	window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%}%>
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
        <section class="content-header">
          <h1>
            <small>
            <!--  Titulo, donde antes estaba dashboard -->
            </small>
          </h1>
         
        </section>

        <!-- Main content -->
        <section class="content">
	          <!-- Info row de buscador de productos -->
	          
			<div class="row">
            	<div class="col-md-12">
              		<div class="box box-default">
	            		<div class="box-header with-border">
	              			<h2 class="box-title text-center">Administrar Usuarios</h2>
	              			<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
	            		</div><!-- /.header -->
	                	<div class="box-body" id="cuerpoUsuario">

		                </div><!-- /.box-body -->
	              </div><!-- /.box -->
	            </div><!-- /.col -->
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
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    
    
    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->
    
    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
     
        <%  } else { %>
				est<p>Favor Iniciar Sesion</p>
			<%} %>
	

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
<!-- End Piwik Code  -->

<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
</body>
</html>
