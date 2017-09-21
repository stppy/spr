package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
import java.sql.Date;

public class Meta {
	protected int id=0;
	protected double cantidad=0.0;
	protected String vencimiento;
	protected int indicador_id=0;
	protected int zona_geografica_id=0;
	protected int demografia_id=0;
	protected int borrado_int=0;
	protected boolean borrado;
	protected int nivel=0;
	protected int entidad=0;
	protected String productoConcat="";
	protected int objetivoId=0;
	protected int tipoObjetivoId=0;
	protected String avance;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public String getVencimiento() {
		return vencimiento;
	}
	public void setVencimiento(String vencimiento) {
		this.vencimiento = vencimiento;
	}
	public int getIndicador_id() {
		return indicador_id;
	}
	public void setIndicador_id(int indicador_id) {
		this.indicador_id = indicador_id;
	}
	public int getZona_geografica_id() {
		return zona_geografica_id;
	}
	public void setZona_geografica_id(int zona_geografica_id) {
		this.zona_geografica_id = zona_geografica_id;
	}
	public int getDemografia_id() {
		return demografia_id;
	}
	public void setDemografia_id(int demografia_id) {
		this.demografia_id = demografia_id;
	}
	public int getBorrado_int() {
		return borrado_int;
	}
	public void setBorrado_int(int borrado_int) {
		this.borrado_int = borrado_int;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
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
	public void changeBorrado(){
		this.borrado=!borrado;
	}
	public String getProductoConcat() {
		return productoConcat;
	}
	public void setProductoConcat(String productoConcat) {
		this.productoConcat = productoConcat;
	}
	public int getObjetivoId() {
		return objetivoId;
	}
	public void setObjetivoId(int objetivoId) {
		this.objetivoId = objetivoId;
	}
	public int getTipoObjetivoId() {
		return tipoObjetivoId;
	}
	public void setTipoObjetivoId(int tipoObjetivoId) {
		this.tipoObjetivoId = tipoObjetivoId;
	}
	public String getAvance() {
		return avance;
	}
	public void setAvance(String avance) {
		this.avance = avance;
	}
	
}
