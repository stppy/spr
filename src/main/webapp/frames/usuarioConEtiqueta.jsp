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
				url:'http://spr.stp.gov.py/ajaxSelects?accion=getRol',
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
								cuerpoTabla += '<td></td></tr>';
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
									cuerpoTabla += '<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarUsuario" data-toggle="tooltip" data-placement="top" title="Editar Usuario" parametros="'+usuarios[q].id+'" ><span class="glyphicon glyphicon-pencil"></span></button></td></tr>';								
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
			'	                		<tr class="active"><th class="text-center" colspan="5">Agregar Nuevo Usuario</th></tr>'+
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
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioSelec = JSON.parse(usuarioSelec);
		usuarioSelec = usuarioSelec.usuarios;
		
		var etiquetas = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEtiqueta',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		etiquetas = JSON.parse(etiquetas);
		
		var usuarioEtiqueta = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUsuarioEtiqueta&usuario='+usuarioSelec[0].correo,
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioEtiqueta = JSON.parse(usuarioEtiqueta);
	    
	    
		var roles = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getRol',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		roles = JSON.parse(roles);
		
		var etiquetasUsuario = '';

		var etiquetasSeleccionada = [];
		if(usuarioEtiqueta != null){
			for(var i = 0; i < etiquetas.length; i++){
				for(var l = 0; l < usuarioEtiqueta.length; l++){
					if(usuarioEtiqueta[l].etiqueta_id == etiquetas[i].id && usuarioEtiqueta[l].borrado != true){
						etiquetasUsuario += '<td><input type="checkbox" class="cmbEditarEtiqueta" id='+usuarioEtiqueta[l].borrado+'-'+usuarioEtiqueta[l].id+'-'+usuarioId+'-e checked="true"><a> '+etiquetas[i].nombre+'</a></td> ';
						etiquetasSeleccionada.push(etiquetas[i].id);
					}else if(usuarioEtiqueta[l].etiqueta_id == etiquetas[i].id && usuarioEtiqueta[l].borrado != false){
						etiquetasUsuario += '<td><input type="checkbox" class="cmbEditarEtiqueta" id='+usuarioEtiqueta[l].borrado+'-'+usuarioEtiqueta[l].id+'-'+usuarioId+'-e ><a> '+etiquetas[i].nombre+'</a></td> ';
						etiquetasSeleccionada.push(etiquetas[i].id);
					}
				}
			}
		}//fin if
			
		for(var h = 0; h < etiquetas.length; h++){
			if (etiquetasSeleccionada.indexOf(etiquetas[h].id)<0){
				etiquetasUsuario += '<td><input type="checkbox" class="cmbEditarEtiqueta" id='+etiquetas[h].id+'-'+usuarioSelec[0].correo+'-'+usuarioId+'-n-'+usr_responsable+'><a> '+etiquetas[h].nombre+'</a></td> ';
				etiquetasSeleccionada.push(etiquetas[h].id);
			}
		}
		

		
		var cuerpoModalUsuario = "";

	    cuerpoModalUsuario =	'<div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg" style="width:90%">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" id="botonCloseUsuario" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">Editar Etiqueta Usuario</h4>'+   
		'			</div>'+
		'		    <div class="modal-body" id="cuerpoModal">'+


		
		'								<div id="mensajeBorradoUsuario"></div>'+
		'								<form role="form" id="formulario">'+
		'									<div class="table-responsive">'+
		'										<table class="table table-hover">'+
		'											<tbody>'+
		'												<tr><td><label for="etiquetaUsuario">Etiquetas</label></td>'+etiquetasUsuario+'</tr>'+

		'											</tbody>'+							           
		'										</table>'+
		'									</div>'+
		'								</form>'+
		


		
		'			</div>'+

		'		</div>'+ 
		'	</div>'+
		'</div>';  

		$("body").append(cuerpoModalUsuario);  	
		$("#modalEditarUsuario").modal('show');
				

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
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEtiqueta',
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
	

	    	
