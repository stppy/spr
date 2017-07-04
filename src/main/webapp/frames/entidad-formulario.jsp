<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>				
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden" name="id" id="id" anho="id" value="id">
					<input type="hidden" name="anho" id="anho" anho="2017" value="2017">
					<input type="hidden" name="nivel"  id="nivel" anho="2017" value="">
					<input type="hidden" name="unidadResponsableId"  id="unidadResponsableId" anho="2017" value="">
					<input type="hidden" name="unidadJerarquicaId"  id="unidadJerarquicaId" anho="2017" value="">
					<input type="hidden" name="entidad"  id="entidad" anho="2017" value="">
					<input type="hidden" name="accion"  id="accion" name="accion" anho="2017" value="actEntidad">
					<div class="form-group">
						<label>Nivel</label>
						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="" value=""
									name="nivelId2" id="nivelId2">
							</div>
							<div class="col-md-6">
								<input type="label" class="form-control " placeholder="" value=""
									name="nivelDescrip" id="nivelDescrip" readonly>
							</div>
				
						</div>
					</div>
				
					<div class="form-group">
						<label>Entidad</label>
						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="" value=""
									name="entidadId2" id="entidadId2">
							</div>
							<div class="col-md-6">
								<input type="label" class="form-control " placeholder="" value=""
									name="entidadDescrip" id="entidadDescrip" readonly>
							</div>
				
						</div>
					</div>
				
					<div class="form-group">
						<label>Unidad Responsable</label>
						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="" value=""
									name="unidadResponsableId2" id="unidadResponsableId2">
							</div>
							<div class="col-md-6">
								<input type="label" class="form-control" placeholder="" value=""
									name="unidadResponsableDescrip" id="unidadResponsableDescrip"
									readonly>
							</div>
				
						</div>
					</div>
				
					<div class="form-group">
						<label>Unidad Jerárquica</label>
						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="" value=""
									name="unidadJerarquicaId2" id="unidadJerarquicaId2">
							</div>
							<div class="col-md-6">
								<input type="label" class="form-control" placeholder="" value=""
									name="unidadJerarquicaDescrip" id="unidadJerarquicaDescrip"
									readonly>
							</div>
				
						</div>
					</div>
				
				
					<!-- <div class="form-group">
                      <label>Descripción</label>
                      <textarea class="form-control" rows="3" placeholder="" name="descripcion" id="descripcion" ></textarea>
                    </div>
                     -->
                     
                    <div class="form-group">
                      <label>Abreviación</label>
                      <input type="text" class="form-control" placeholder="" name="abrev" id="abrev" >
                    </div>
                    
                      <div class="form-group">
                      <label>Base Legal de creación</label>
                      <textarea class="form-control" rows="3" placeholder="" name="baseLegal" id="baseLegal" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Misión</label>
                      <textarea class="form-control" rows="3" placeholder="" name="mision" id="mision" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Visión</label>
                      <textarea class="form-control" rows="3" placeholder="" name="vision" id="vision" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Diagnóstico General de la Institución</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico" id="diagnostico" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Objetivos Generales de la Institución</label>
                      <textarea class="form-control" rows="3" placeholder="" name="objetivo" id="objetivo" ></textarea>
                    </div>
                    
                     <div class="form-group">
                      <label>Principales políticas institucionales</label>
                      <textarea class="form-control" rows="3" placeholder="" name="politica" id="politica" ></textarea>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label>Sigla</label>
                      <input type="text" class="form-control" placeholder="" name="sigla" id="sigla" >
                    </div> --> 
                    
                  
                  <div class="box-footer">
                  	<div class="row">      
                  		<div class="col-md-3">
	                    	<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1")  || attributes.get("role_id").toString().equals("2")){%>
	                    	<button type="button" class="btn btn-primary" id="guardar-entidad">Guardar</button>                    	
	                    	<%}%>	                    	
                  		</div>
                  		<div class="col-md-6">
                  			<% if (attributes.get("role_id").toString().equals("2")){%>
	                  			<div id="contenedorSelectorEstadoPeticion">
	                  			</div>
                  			<%}%>	
                  		</div>                  		
                  		<div class="col-md-3">
	                  		<!-- <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalPresupuestoIngreso" id="botonPresupuestoIngreso">Presupuesto Ingreso</button> -->
	                    	<small id="fechaUltActInstitucion"></small>
                  		</div>            	            	
                  	</div>
                  </div>

				</form>
				
