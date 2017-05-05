package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Entidad {
	
    protected Short id; //protected Short entidad;
    protected Short numeroFila;
    //protected String nombreEntidad;
    protected String descripcion;
    protected Short anho;
    protected Short nivel_id;
    protected String abrev;
    protected String sigla;
    protected String ruc;
    protected String base_legal;
    protected String mision;
    protected String vision;
    protected String diagnostico;
    protected String objetivo;
    protected String politica;
    protected String version;
	public Short getId() {
		return id;
	}
	public void setId(Short id) {
		this.id = id;
	}
	public Short getNumeroFila() {
		return numeroFila;
	}
	public void setNumeroFila(Short numeroFila) {
		this.numeroFila = numeroFila;
	}
	public Short getAnho() {
		return anho;
	}
	public void setAnho(Short anho) {
		this.anho = anho;
	}
	public Short getNivel_id() {
		return nivel_id;
	}
	public void setNivel_id(Short nivel_id) {
		this.nivel_id = nivel_id;
	}
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public String getBase_legal() {
		return base_legal;
	}
	public void setBase_legal(String base_legal) {
		this.base_legal = base_legal;
	}
	public String getMision() {
		return mision;
	}
	public void setMision(String mision) {
		this.mision = mision;
	}
	public String getVision() {
		return vision;
	}
	public void setVision(String vision) {
		this.vision = vision;
	}
	public String getDiagnostico() {
		return diagnostico;
	}
	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public String getPolitica() {
		return politica;
	}
	public void setPolitica(String politica) {
		this.politica = politica;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	
	
}
