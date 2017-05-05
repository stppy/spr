package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ObjetivoSugerido {
	protected int objetivoId;
	protected int tipoObjetivoId;
	protected int objetivoAnho;
	protected int objetivoVersion;
	protected int objetivoSugeridoId;
	protected int objetivoSugeridoTipoId;
	protected int objetivoSugeridoAnho;
	protected int objetivoSugeridoVersion;
	protected boolean borrado;
	
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
	public int getObjetivoAnho() {
		return objetivoAnho;
	}
	public void setObjetivoAnho(int objetivoAnho) {
		this.objetivoAnho = objetivoAnho;
	}
	public int getObjetivoVersion() {
		return objetivoVersion;
	}
	public void setObjetivoVersion(int objetivoVersion) {
		this.objetivoVersion = objetivoVersion;
	}
	public int getObjetivoSugeridoId() {
		return objetivoSugeridoId;
	}
	public void setObjetivoSugeridoId(int objetivoSugeridoId) {
		this.objetivoSugeridoId = objetivoSugeridoId;
	}
	public int getObjetivoSugeridoTipoId() {
		return objetivoSugeridoTipoId;
	}
	public void setObjetivoSugeridoTipoId(int objetivoSugeridoTipoId) {
		this.objetivoSugeridoTipoId = objetivoSugeridoTipoId;
	}
	public int getObjetivoSugeridoAnho() {
		return objetivoSugeridoAnho;
	}
	public void setObjetivoSugeridoAnho(int objetivoSugeridoAnho) {
		this.objetivoSugeridoAnho = objetivoSugeridoAnho;
	}
	public int getObjetivoSugeridoVersion() {
		return objetivoSugeridoVersion;
	}
	public void setObjetivoSugeridoVersion(int objetivoSugeridoVersion) {
		this.objetivoSugeridoVersion = objetivoSugeridoVersion;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public void changeBorrado(){
		this.borrado =! borrado;
	}

}
