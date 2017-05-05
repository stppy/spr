package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ProductoPresupuestoDestinatarios {
	protected int id=0;
 	protected int nivel =0;
 	protected int entidad=0;
 	protected int tipo_presupuesto=0;
 	protected int programa=0;
 	protected int subprograma=0;
    protected int proyecto=0;
    protected int producto=0;
    protected int[] catalogo_destinatario;
    protected int departamento=0;
    protected Double[][] cantidades;
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
	public int getTipo_presupuesto() {
		return tipo_presupuesto;
	}
	public void setTipo_presupuesto(int tipo_presupuesto) {
		this.tipo_presupuesto = tipo_presupuesto;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
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
	
	public int[] getCatalogo_destinatario() {
		return catalogo_destinatario;
	}
	public void setCatalogo_destinatario(int[] catalogo_destinatario) {
		this.catalogo_destinatario = catalogo_destinatario;
	}
	public int getDepartamento() {
		return departamento;
	}
	public void setDepartamento(int departamento) {
		this.departamento = departamento;
	}
	public Double[][] getCantidades() {
		return cantidades;
	}
	public void setCantidades(Double[][] cantidades) {
		this.cantidades = cantidades;
	}
	
    
    
}
