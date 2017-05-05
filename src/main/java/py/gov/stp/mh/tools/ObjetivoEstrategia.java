package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ObjetivoEstrategia {
	int id=0;
	int estrategia_id=0;
	int estrategia_eje_estrategico_id=0;
	int estrategia_linea_transversal_id=0;
	int objetivo_id=0;
	int objetivo_tipo_objetivo_id=0;
	int es_principal=0;
	String objetivoNombre="";
	
	
	public String getObjetivoNombre() {
		return objetivoNombre;
	}
	public void setObjetivoNombre(String objetivoNombre) {
		this.objetivoNombre = objetivoNombre;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEstrategia_id() {
		return estrategia_id;
	}
	public void setEstrategia_id(int estrategia_id) {
		this.estrategia_id = estrategia_id;
	}
	public int getEstrategia_eje_estrategico_id() {
		return estrategia_eje_estrategico_id;
	}
	public void setEstrategia_eje_estrategico_id(int estrategia_eje_estrategico_id) {
		this.estrategia_eje_estrategico_id = estrategia_eje_estrategico_id;
	}
	public int getEstrategia_linea_transversal_id() {
		return estrategia_linea_transversal_id;
	}
	public void setEstrategia_linea_transversal_id(
			int estrategia_linea_transversal_id) {
		this.estrategia_linea_transversal_id = estrategia_linea_transversal_id;
	}
	public int getObjetivo_id() {
		return objetivo_id;
	}
	public void setObjetivo_id(int objetivo_id) {
		this.objetivo_id = objetivo_id;
	}
	public int getObjetivo_tipo_objetivo_id() {
		return objetivo_tipo_objetivo_id;
	}
	public void setObjetivo_tipo_objetivo_id(int objetivo_tipo_objetivo_id) {
		this.objetivo_tipo_objetivo_id = objetivo_tipo_objetivo_id;
	}
	public int getEs_principal() {
		return es_principal;
	}
	public void setEs_principal(int es_principal) {
		this.es_principal = es_principal;
	}
	
	
}
