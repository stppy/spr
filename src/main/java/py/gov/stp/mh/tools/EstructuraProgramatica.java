package py.gov.stp.mh.tools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import py.gov.stp.mh.clasificadores.PrecioDNCP;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class EstructuraProgramatica {
	protected int anho;
	protected int id;
	protected int nivel;
	protected int entidad;
	protected int tipo;
	protected int programa;
	protected int subprograma;
	protected int proyecto;
	protected int nfprograma;
	protected int nfsubprograma;
	protected int nfproyecto;
	protected int departamento;
	protected int unidad_responsable;
	protected int funcional;
	protected String diagnostico;
	protected String resultado_esperado;
	protected String objetivo;
	protected String base_legal;
	protected String nombre;
	protected String abrev;
	protected String descripcion;

	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
	}
	public int getSubprograma() {
		return subprograma;
	}
	public void setSubprograma(int subprograma) {
		this.subprograma = subprograma;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public int getNfprograma() {
		return nfprograma;
	}
	public void setNfprograma(int nfprograma) {
		this.nfprograma = nfprograma;
	}
	public int getNfsubprograma() {
		return nfsubprograma;
	}
	public void setNfsubprograma(int nfsubprograma) {
		this.nfsubprograma = nfsubprograma;
	}
	public int getNfproyecto() {
		return nfproyecto;
	}
	public void setNfproyecto(int nfproyecto) {
		this.nfproyecto = nfproyecto;
	}
	public int getDepartamento() {
		return departamento;
	}
	public void setDepartamento(int departamento) {
		this.departamento = departamento;
	}
	public int getUnidad_responsable() {
		return unidad_responsable;
	}
	public void setUnidad_responsable(int unidad_responsable) {
		this.unidad_responsable = unidad_responsable;
	}
	public int getFuncional() {
		return funcional;
	}
	public void setFuncional(int funcional) {
		this.funcional = funcional;
	}
	public String getDiagnostico() {
		return diagnostico;
	}
	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}
	public String getResultado_esperado() {
		return resultado_esperado;
	}
	public void setResultado_esperado(String resultado_esperado) {
		this.resultado_esperado = resultado_esperado;
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public String getBase_legal() {
		return base_legal;
	}
	public void setBase_legal(String base_legal) {
		this.base_legal = base_legal;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
