package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class ZonaGeografica {
	protected int id=0;
	protected String nombre="";
	protected String descripcion="";
	protected String abrev="";
	protected int tipo_zona_geografica_id=0;
	protected String cod_geo_unif="";

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	public int getTipo_zona_geografica_id() {
		return tipo_zona_geografica_id;
	}
	public void setTipo_zona_geografica_id(int tipo_zona_geografica_id) {
		this.tipo_zona_geografica_id = tipo_zona_geografica_id;
	}
	public String getCod_geo_unif() {
		return cod_geo_unif;
	}
	public void setCod_geo_unif(String cod_geo_unif) {
		this.cod_geo_unif = cod_geo_unif;
	}

}
