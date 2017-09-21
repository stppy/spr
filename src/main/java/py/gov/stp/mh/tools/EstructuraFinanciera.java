package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class EstructuraFinanciera {
	
	protected int id;
	protected int estructura;
	protected int mes;
	protected int producto;
	protected double planificado;
	protected double ejecutado;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEstructura() {
		return estructura;
	}
	public void setEstructura(int estructura) {
		this.estructura = estructura;
	}
	public int getMes() {
		return mes;
	}
	public void setMes(int mes) {
		this.mes = mes;
	}
	public int getProducto() {
		return producto;
	}
	public void setProducto(int producto) {
		this.producto = producto;
	}
	public double getPlanificado() {
		return planificado;
	}
	public void setPlanificado(double planificado) {
		this.planificado = planificado;
	}
	public double getEjecutado() {
		return ejecutado;
	}
	public void setEjecutado(double ejecutado) {
		this.ejecutado = ejecutado;
	}
	
}
