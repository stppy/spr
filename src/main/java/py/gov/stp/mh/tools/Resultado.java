package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class Resultado extends Objetivo{

	protected int  		proyecto=0;
	protected int		subprograma=0;
	protected int		programa=0;
	protected int		tipo_presupuesto=0;
	protected int		entidad=0;
	protected int		nivel=0;
	protected int		funcional=0;
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public int getSubprograma() {
		return subprograma;
	}
	public void setSubprograma(int subprograma) {
		this.subprograma = subprograma;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
	}
	public int getTipo_presupuesto() {
		return tipo_presupuesto;
	}
	public void setTipo_presupuesto(int tipo_presupuesto) {
		this.tipo_presupuesto = tipo_presupuesto;
	}
	public int getEntidad() {
		return entidad;
	}
	public void setEntidad(int entidad) {
		this.entidad = entidad;
	}
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public int getFuncional() {
		return funcional;
	}
	public void setFuncional(int funcional) {
		this.funcional = funcional;
	}
	
	
}
