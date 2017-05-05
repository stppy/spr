package py.gov.stp.mh.tools;

import java.sql.Timestamp;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ProductoPresupuestoMeta {
	 	protected int id=0;
	 	protected Short mes=0;
	 	protected double cantidad=0.0;
	 	protected int catalogo_destianatario_id =1;
	 	protected Short departamento=99;
	 	protected Short producto_presupusto_id=0;
	 	protected Short producto_id=0;
	 	protected Short unidad_medida_id=0;
	 	protected Short proyecto_id=0;
	    protected Short subprograma_id=0;
	    protected Short programa_id=0;
	    protected Short tipo_presupuesto_id=0;
	    protected Short entidad_id=0;
	    protected Short nivel_id=0;
	    protected Short anho=2017;
	    protected Timestamp fechaActualizacion;
	    protected boolean borrado;
	    
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public Short getMes() {
			return mes;
		}
		public void setMes(Short mes) {
			this.mes = mes;
		}
		public double getCantidad() {
			return cantidad;
		}
		public void setCantidad(double cantidad) {
			this.cantidad = cantidad;
		}
		public int getCatalogo_destianatario_id() {
			return catalogo_destianatario_id;
		}
		public void setCatalogo_destianatario_id(int catalogo_destianatario_id) {
			this.catalogo_destianatario_id = catalogo_destianatario_id;
		}
		public Short getDepartamento() {
			return departamento;
		}
		public void setDepartamento(Short departamento) {
			this.departamento = departamento;
		}
		public Short getProducto_presupusto_id() {
			return producto_presupusto_id;
		}
		public void setProducto_presupusto_id(Short producto_presupusto_id) {
			this.producto_presupusto_id = producto_presupusto_id;
		}
		public Short getProducto_id() {
			return producto_id;
		}
		public void setProducto_id(Short producto_id) {
			this.producto_id = producto_id;
		}
		public Short getUnidad_medida_id() {
			return unidad_medida_id;
		}
		public void setUnidad_medida_id(Short unidad_medida_id) {
			this.unidad_medida_id = unidad_medida_id;
		}
		public Short getProyecto_id() {
			return proyecto_id;
		}
		public void setProyecto_id(Short proyecto_id) {
			this.proyecto_id = proyecto_id;
		}
		public Short getSubprograma_id() {
			return subprograma_id;
		}
		public void setSubprograma_id(Short subprograma_id) {
			this.subprograma_id = subprograma_id;
		}
		public Short getPrograma_id() {
			return programa_id;
		}
		public void setPrograma_id(Short programa_id) {
			this.programa_id = programa_id;
		}
		public Short getTipo_presupuesto_id() {
			return tipo_presupuesto_id;
		}
		public void setTipo_presupuesto_id(Short tipo_presupuesto_id) {
			this.tipo_presupuesto_id = tipo_presupuesto_id;
		}
		public Short getEntidad_id() {
			return entidad_id;
		}
		public void setEntidad_id(Short entidad_id) {
			this.entidad_id = entidad_id;
		}
		public Short getNivel_id() {
			return nivel_id;
		}
		public void setNivel_id(Short nivel_id) {
			this.nivel_id = nivel_id;
		}
		public Short getAnho() {
			return anho;
		}
		public void setAnho(Short anho) {
			this.anho = anho;
		}
		public Timestamp getFechaActualizacion() {
			return fechaActualizacion;
		}
		public void setFechaActualizacion(Timestamp fechaActualizacion) {
			this.fechaActualizacion = fechaActualizacion;
		}
		public boolean isBorrado() {
			return borrado;
		}
		public void setBorrado(boolean borrado) {
			this.borrado = borrado;
		}
		public void changeBorrado(){
			this.borrado=!borrado;
		}

}
