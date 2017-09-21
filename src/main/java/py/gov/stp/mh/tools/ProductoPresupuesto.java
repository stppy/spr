package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ProductoPresupuesto {
    protected Short id=0;
    protected Short numero_fila=0;
    protected Short anho=2017;
    protected Short producto_id=0;
    protected Short unidad_medida_id=0;
    protected Short proyecto_id=0;
    protected Short subprograma_id=0;
    protected Short programa_id=0;
    protected Short tipo_presupuesto_id=0;
    protected Short entidad_id=0;
    protected Short nivel_id=0;
    protected Short version=50;
    protected boolean borrado;
    protected String usuario_responsable="";
    protected boolean intermedio;
    
	public Short getId() {
		return id;
	}
	public void setId(Short id) {
		this.id = id;
	}
	public Short getNumero_fila() {
		return numero_fila;
	}
	public void setNumero_fila(Short numero_fila) {
		this.numero_fila = numero_fila;
	}
	
	public Short getAnho() {
		return anho;
	}
	public void setAnho(Short anho) {
		this.anho = anho;
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
	public Short getVersion() {
		return version;
	}
	public void setVersion(Short version) {
		this.version = version;
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
	 public String getUsuario_responsable() {
		return usuario_responsable;
	}
	public void setUsuario_responsable(String usuario_responsable) {
		this.usuario_responsable = usuario_responsable;
	}	
	public boolean isIntermedio() {
		return intermedio;
	}
	public void setIntermedio(boolean intermedio) {
		this.intermedio = intermedio;
	}
}
