package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ProductoPresupuestoFinanciero {
	protected int id;
	protected int nivel;
	protected int entidad;
	protected int tipoPresupuesto;
	protected int programa;
	protected int subPrograma;
	protected int proyecto;
	protected int producto;
	protected int objetoGastoId; 
	
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
	public int getEntidad() {
		return entidad;
	}
	public void setEntidad(int entidad) {
		this.entidad = entidad;
	}
	public int getTipoPresupuesto() {
		return tipoPresupuesto;
	}
	public void setTipoPresupuesto(int tipoPresupuesto) {
		this.tipoPresupuesto = tipoPresupuesto;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
	}
	public int getSubPrograma() {
		return subPrograma;
	}
	public void setSubPrograma(int subPrograma) {
		this.subPrograma = subPrograma;
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
	public int getObjetoGastoId() {
		return objetoGastoId;
	}
	public void setObjetoGastoId(int objetoGastoId) {
		this.objetoGastoId = objetoGastoId;
	}

}
