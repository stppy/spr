package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
import java.sql.Timestamp;

public class ProductoPresupuestoDestinatario {
	
	public int id=0;
	public int nivel=0;
	public int entidad=0;
	public int programa=0;
	public int tipo_presupuesto=0;
	public int subprograma=0;
	public int proyecto=0;
	public int producto=0;
	public int catalogo_destinatario=0;
	public Integer departamento=99;
	public double cantidad=0;
	public String nombreCatalogo="";
	public String descripcion="";
	protected Timestamp fechaActualizacion;
	
	public boolean borrado;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
	}
	public int getTipo_presupuesto() {
		return tipo_presupuesto;
	}
	public void setTipo_presupuesto(int tipo_presupuesto) {
		this.tipo_presupuesto = tipo_presupuesto;
	}
	public int getSubprograma() {
		return subprograma;
	}
	public void setSubprograma(int subprograma) {
		this.subprograma = subprograma;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public int getProducto() {
		return producto;
	}
	public void setProducto(int producto) {
		this.producto = producto;
	}
	public int getCatalogo_destinatario() {
		return catalogo_destinatario;
	}
	public void setCatalogo_destinatario(int catalogo_destinatario) {
		this.catalogo_destinatario = catalogo_destinatario;
	}
	public Integer getDepartamento() {
		return departamento;
	}
	public void setDepartamento(Integer departamento) {
		this.departamento = departamento;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public int getEntidad() {
		return entidad;
	}
	public void setEntidad(int entidad) {
		this.entidad = entidad;
	}
	public String getNombreCatalogo() {
		return nombreCatalogo;
	}
	public void setNombreCatalogo(String nombreCatalogo) {
		this.nombreCatalogo = nombreCatalogo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
	public Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	

}
