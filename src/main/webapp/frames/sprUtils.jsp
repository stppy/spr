<link href="dist/css/sprUtils.css" rel="stylesheet">


<div id="indicadorDeTransaccion" align="center" class="modal ui-loading" aria-hidden="true">
	<div class="ui-loading-container">
		<section class="ui-loading-content">
			<article>								
				<p align="center" style="font-size: 20px;" ><span>Estamos procesando su operación, por favor espere...</span></p>
			</article>
			<p><img src="../dist/img/loading_spinner.gif" alt="esperando..." style="width: 80px;"></p>
		</section>
	</div>
</div>

<div id="indicadorDeCarga" align="center" class="modal ui-loading" aria-hidden="true">
	<div class="ui-loading-container">
		<section class="ui-loading-content">
			<article>								
				<p align="center" style="font-size: 20px;" ><span>Estamos recuperando los datos, por favor espere...</span></p>
			</article>
			<p><img src="../dist/img/loading_spinner.gif" alt="esperando..." style="width: 80px;"></p>
		</section>
	</div>
</div>


<div id="modalMensajeExito" align="center" class="modal ui-loading" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body alert-success">
				<h3 class="text-center">REGISTRO GUARDADO EXITOSAMENTE</h3>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="consultaModalBorrarProductoPresupuesto" tabindex="-1" aria-labelledby="myLargeModalLabel" style="display: none;">
	<div class="modal-dialog modal-lg" style="width:90%">
		<div class="modal-content" >
			<div class="modal-header" id="agregarTituloModal"></div>
			<div class="modal-body" >
				<div  id="cuerpoModalBorrarObjetivo">
					<h3 class="text-center" id="mensajeBorradoObjetivo"></h3>
					<h3 class="text-center" id="mensajeRestaurarObjetivo"></h3>
				</div>
			</div>
			<div class="modal-footer" id="agregarBotonBorradoObjetivo"></div>
			<div class="modal-footer" id="agregarBotonRestaurarObjetivo"></div> 
		</div>
	</div>
</div>


<div class="container" style="display: none;">
	<a href="#myModal" role="button" class="btn" data-toggle="modal">Launch modal 1</a>
</div>

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal header</h3>
	</div>
	<div class="modal-body">
		<p>One modal body...</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<a href="#myModal2" role="button" class="btn" data-toggle="modal">Launch other modal</a>
	</div>
</div>

<div id="myModal2" class="modal hide fade" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal 2 header</h3>
	</div>
	<div class="modal-body">
		<p>Two modal body...</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
</div>


<div id="modalMensajeError" align="center" class="modal ui-loading" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body alert-danger">
				<div class="alert-danger">
					<h3 class="text-center">ERROR AL GUARDAR EL REGISTRO.</h3>
					<h3 class="text-center">FAVOR CONTACTAR A: </h3>
				</div>
			</div>
			<div class="modal-footer">
				<div class="box box-danger" height="1000px">
					<div class="box-header with-border" height="1000px"  align="left">
						<h3 class="box-title" id="tituloTipoPrograma">DGPR</h3>
					</div>
					<div class="box-body" align="left">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td>Nombre</td>
								<td>Sebastián Codas</td>
							</tr>
							<tr>
								<td>Correo Electrónico</td>
								<td>scs@stp.gov.py</td>
							</tr>
							<tr>
								<td>Teléfono Laboral</td>
								<td>+595 21 450422 #114</td>
							</tr>
		     				<tr>
		     					<td>Teléfono Móvil</td>
		     					<td>+595 982 511383 </td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
