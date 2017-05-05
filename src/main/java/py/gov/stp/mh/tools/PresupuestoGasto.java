package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class PresupuestoGasto {
	protected int id;
	protected int estructura;
	protected int objeto_gasto;
	protected int fuente_financiamiento;
	protected int organismo_financiador;
	protected int pais;
	protected int depto;
	protected double ver_programado;
	protected String ver_justificado;

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
	public int getObjeto_gasto() {
		return objeto_gasto;
	}
	public void setObjeto_gasto(int objeto_gasto) {
		this.objeto_gasto = objeto_gasto;
	}
	public int getFuente_financiamiento() {
		return fuente_financiamiento;
	}
	public void setFuente_financiamiento(int fuente_financiamiento) {
		this.fuente_financiamiento = fuente_financiamiento;
	}
	public int getOrganismo_financiador() {
		return organismo_financiador;
	}
	public void setOrganismo_financiador(int organismo_financiador) {
		this.organismo_financiador = organismo_financiador;
	}
	public int getPais() {
		return pais;
	}
	public void setPais(int pais) {
		this.pais = pais;
	}
	public int getDepto() {
		return depto;
	}
	public void setDepto(int depto) {
		this.depto = depto;
	}
	public double getVer_programado() {
		return ver_programado;
	}
	public void setVer_programado(double ver_programado) {
		this.ver_programado = ver_programado;
	}
	public String getVer_justificado() {
		return ver_justificado;
	}
	public void setVer_justificado(String ver_justificado) {
		this.ver_justificado = ver_justificado;
	}
	
}
