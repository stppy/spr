package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class PresupuestoIngreso {
	protected int id;
	protected int numeroFila;
	protected int anho;
	protected int version;
	protected int nivel;
	protected int entidad;
	protected int origen;
	protected int detalle;
	protected int fuente_financiamiento;
	protected double monto_presupuestado;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumeroFila() {
		return numeroFila;
	}
	public void setNumeroFila(int numeroFila) {
		this.numeroFila = numeroFila;
	}
	
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
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
	public int getOrigen() {
		return origen;
	}
	public void setOrigen(int origen) {
		this.origen = origen;
	}
	public int getDetalle() {
		return detalle;
	}
	public void setDetalle(int detalle) {
		this.detalle = detalle;
	}
	public int getFuente_financiamiento() {
		return fuente_financiamiento;
	}
	public void setFuente_financiamiento(int fuente_financiamiento) {
		this.fuente_financiamiento = fuente_financiamiento;
	}
	public double getMonto_presupuestado() {
		return monto_presupuestado;
	}
	public void setMonto_presupuestado(double monto_presupuestado) {
		this.monto_presupuestado = monto_presupuestado;
	}
	
    
}
