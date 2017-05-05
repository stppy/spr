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
		
		if ( $("#modalEditarModulo").length )
		{
			$("#modalEditarModulo").remove();
		}
		if ( $("#modalPermisoModulos").length )
		{
			$("#modalPermisoModulos").remove();
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
				
		var webServicesPermisoPorModulo = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getPermisosPorModulos&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesPermisoPorModulo = JSON.parse(webServicesPermisoPorModulo);
		
		var webServicesModulos = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getModulos',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesModulos = JSON.parse(webServicesModulos);
		
		var webServicesPermisoModulo = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getPermisoModulo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesPermisoModulo = JSON.parse(webServicesPermisoModulo);
		
		var moduloSeleccionado = [];
		var cuerpoTablaModulos = "";
						
		for(var m = 0; m < webServicesModulos.length; m++){

			moduloSeleccionado = [];
			
			cuerpoTablaModulos += "<tr><td><div class='form-group'>"+webServicesModulos[m].nombeModulo+"</td><td>";
			
			for(var k = 0; k < webServicesPermisoModulo.length; k++){

				for(var l = 0; l < webServicesPermisoPorModulo.length; l++){
					
					if(webServicesPermisoModulo[k].id == webServicesPermisoPorModulo[l].permisoModuloId && webServicesPermisoPorModulo[l].moduloId == webServicesModulos[m].id ){
						cuerpoTablaModulos += '<input type="radio" value="e-'+webServicesPermisoPorModulo[l].moduloId+'-'+usuarioId+'-'+webServicesPermisoModulo[k].id+'" name="modulo'+m+'" checked class="permisoModulos">'+webServicesPermisoModulo[k].nombre+' ';
						moduloSeleccionado.push(webServicesPermisoModulo[k].id);
					}
					
				}
			}
				
			for(var f= 0; f < webServicesPermisoModulo.length; f++){
				if(moduloSeleccionado.length == 0){
					cuerpoTablaModulos += '<input type="radio" value="n-'+webServicesModulos[m].id+'-'+usuarioId+'-'+webServicesPermisoModulo[f].id+'" name="modulo'+m+'" class="permisoModulos" >'+webServicesPermisoModulo[f].nombre+' ';
				}else if (moduloSeleccionado.indexOf(webServicesPermisoModulo[f].id)<0){
					cuerpoTablaModulos += '<input type="radio" value="e-'+webServicesModulos[m].id+'-'+usuarioId+'-'+webServicesPermisoModulo[f].id+'" name="modulo'+m+'" class="permisoModulos">'+webServicesPermisoModulo[f].nombre+' ';
					//moduloSeleccionado.push(webServicesPermisoModulo[f].id);
				}
			}

			cuerpoTablaModulos += "</div></td></tr>";

		}
	
		var cuerpoModalUsuarioModulo = "";

	    cuerpoModalUsuarioModulo =	'<div class="modal fade" id="modalEditarModulo" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg" style="width:90%">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" id="botonCloseUsuario" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">Editar Usuario Modulo</h4>'+   
		'			</div>'+
		'		    <div class="modal-body" id="cuerpoModal">'+


		'								<form role="form">'+
		'									<div class="table-responsive">'+
		'										<table class="table table-hover">'+
		'											<thead>'+
		'												<tr><th><label for="moduloUsuario">Modulo</label></th><th>Permiso</th></tr>'+
		'											</thead>'+			
		'											<tbody id="cuerpoUsuarioModulo">'+
		'											</tbody>'+									           
		'										</table>'+
		'									</div>'+
		'								</form>'+
			
		'			</div>'+

		'		</div>'+ 
		'	</div>'+
		'</div>';  

		$("body").append(cuerpoModalUsuarioModulo);  
		$("#cuerpoUsuarioModulo").append(cuerpoTablaModulos);	
		$("#modalEditarModulo").modal('show');
				

	});
	
	$("body").on("click", ".permisoModulos",function(event){
	
		var idPermisoModulos=$(this).val().split("-");
		
		if ( $("#modalEditarModulo").length )
		{
			$("#modalEditarModulo").remove();
		}
		
		var estado = idPermisoModulos[0];
		var moduloId = idPermisoModulos[1];
		var usuarioId = idPermisoModulos[2];
		var permisoModulo = idPermisoModulos[3];
		
		var cuerpoModalPermisoModulos = "";

	    cuerpoModalPermisoModulos =	'<div class="modal fade" id="modalPermisoModulos" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
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
		'               			<div class="box-body">'+
		
		'								<div id="mensajePermisoModulos"></div>'+
		
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
				
		if(estado == "n" ){
				    
			$("body").append(cuerpoModalPermisoModulos);
						
			var objeto = new Object();
				
			objeto.modulosId = moduloId;
			objeto.usuarioId = usuarioId;
			objeto.permisosModulosId = permisoModulo;
			
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/ajaxInserts?accion=insPermisoPorModulos",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		            	$("#mensajePermisoModulos").html("<center></center><h3 class='text-center'>GUARDADO EXITOSAMENTE!!</h3></center>");
						$("#modalPermisoModulos").modal('show');
		        	}else{
		            	$("#mensajePermisoModulos").html("<center></center><h3 class='text-center'>ERROR AL INTENTAR GUARDAR ESTE REGISTRO!!</h3></center>");
		            	$("#modalPermisoModulos").modal('show');
		        	}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {
		        	
		        	}
			 });

		}else{
			
			var objeto = new Object();
				
			objeto.modulosId = moduloId;
			objeto.usuarioId = usuarioId;
			objeto.permisosModulosId = permisoModulo;
		    
			$("body").append(cuerpoModalPermisoModulos);

		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/ajaxUpdate?accion=actPermisoPorModulo",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	
		        	if(data.success == true)
		        	{
		            	$("#mensajePermisoModulos").html("<center></center><h3 class='text-center'>Ud edito este registro exitosamente!!</h3></center>");
						$("#modalPermisoModulos").modal('show');
		        	}else{
		            	$("#mensajePermisoModulos").html("<center></center><h3 class='text-center'>ERROR AL INTENTAR EDITAR ESTE REGISTRO!!</h3></center>");
		            	$("#modalPermisoModulos").modal('show');
		        	}

		        },

		        error: function(data,status,er) {
		        	
		        	}
			 });

		}

	});