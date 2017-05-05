package py.gov.stp.mh.test;
import py.gov.stp.mh.clasificadores.*;
import java.util.Iterator;
import java.util.List;

import py.gov.stp.mh.clasificadores.*;

import py.gov.stp.mh.consultas.*;

import javax.management.ServiceNotFoundException;
import javax.xml.ws.*;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

public class Client{
	public static List <FuenteFinanciamiento> getFuentesDeFinanciamiento(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<FuenteFinanciamiento> fuentesDeFinanciamiento =  puertoClasificadores.fuentesDeFinanciamiento((short)anio);
		return fuentesDeFinanciamiento;
	}
	public static List <IngresoOrigen> getIngresosPorOrigen(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<IngresoOrigen> ingresoOrigen =  puertoClasificadores.ingresosPorOrigen((short)anio);
		return ingresoOrigen;
	}
	public static List <ObjetoGasto>          getObjetosDeGasto(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<ObjetoGasto> objetosDeGasto =  puertoClasificadores.objetosDeGatos((short)anio);
		return objetosDeGasto;
	}
	public static List <OrganismoFinanciador> getOrganismosFinanciadores(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<OrganismoFinanciador> organismosFinanciadores =  puertoClasificadores.organismosFinanciadores((short)anio);
		return organismosFinanciadores;
	}
	public static List <Departamento>         getDepartamentos(int pais, int anho){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Departamento> departamentos =  puertoClasificadores.departamentos((short)anho,(short)pais);
		return departamentos;
	}
	public static List <TipoPrograma>      getTiposPrograma(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<TipoPrograma> tiposDeProgramas =  puertoClasificadores.tiposDeProgramas((short)anio);
		return tiposDeProgramas;
	}
	public static List <Nivel>                getNiveles(int anho){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Nivel> niveles =  puertoClasificadores.niveles((short)anho);
		return niveles;
	}
	public static List <Entidades>            getEntidadesPorNivel(int nivel, int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List entidades =  puertoClasificadores.entidades((short)anio, (short)nivel);
		return entidades;
	}
	public static List <UnidadJerarquica>     getUnidadesJerarquicas(int anio, int nivel, int entidad){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<UnidadJerarquica> unidadesJerarquicas =  puertoClasificadores.unidadesJerarquicas((short)anio, (short)nivel, (short)entidad);
		return unidadesJerarquicas;
	}
	/*public static List <Producto>             getProductos(int anio, int nivel, int entidad, int tipoPresupuesto){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Producto> productos =  puertoClasificadores.productos((short)anio, (short)nivel, (short)entidad, (short)tipoPresupuesto);
		return productos;
	}	*/
	public static List <Programa>             getProgramas(int anio, int nivel, int entidad, int tipoPresupuesto){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Programa> programas =  puertoClasificadores.programas((short)anio, (short)nivel, (short)entidad, (short)tipoPresupuesto);
		return programas;
	}
	public static List <Subprograma>          getSubprogramas(int anio, int nivel, int entidad, int tipoPresupuesto, int programa){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Subprograma> subprogramas =  puertoClasificadores.subprogramas((short)anio, (short)nivel, (short)entidad, (short)tipoPresupuesto, (short)programa);
		return subprogramas;
	}
	public static List <Proyecto>             getProyectos(int anio, int nivel, int entidad, int tipoPresupuesto, int programa, int subprograma){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Proyecto> proyectos =  puertoClasificadores.proyectos((short)anio, (short)nivel, (short)entidad, (short)tipoPresupuesto, (short)programa,  (short)subprograma);
		return proyectos;
	}
	public static List <PrecioDNCP>          getCatalgoDncp(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<PrecioDNCP> preciosDNCP =  puertoClasificadores.catalogoDNCP((short)anio);
		return preciosDNCP;
	}
	public static List <Plan>          getPlanes(){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Plan> planes =  puertoClasificadores.planes();
		return planes;
	}
	public static List <CatalogoProductoMeta>          getCatalogosProductoMetas(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<CatalogoProductoMeta> catalogoProductosMeta =  puertoClasificadores.catalogoProductosMetas((short)anio);
		return catalogoProductosMeta;
	}
	public static List <PlanEje>          getEjesPorPlans(){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<PlanEje> ejesPorPlan =  puertoClasificadores.ejesPorPlan();
		return ejesPorPlan;
	}
	public static List <Funcional>          getFuncionales(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Funcional> funcionales =  puertoClasificadores.funcionales((short)anio);
		return funcionales;
	}
	public static List <Pilar>          getPilares(){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Pilar> pilares =  puertoClasificadores.pilares();
		return pilares;
	}
	public static List <ProyectoSNIP>          getProyectosSNIP(){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<ProyectoSNIP> proyectosSNIP =  puertoClasificadores.proyectosSNIP();
		return proyectosSNIP;
	}
	public static List <UnidadResponsable>          getUnidadesResponsables(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<UnidadResponsable> UnidadesResponsables =  puertoClasificadores.unidadesResponsables((short)anio);
		return UnidadesResponsables;
	}
	public static List <ProyectoSNIPAutorizado>          getProyectoSNIPPAutorizado(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<ProyectoSNIPAutorizado> proyectosSNIPPautorizado =  puertoClasificadores.proyectosSNIPAutorizados((short)anio);
		return proyectosSNIPPautorizado;
	}
	public static List <UnidadMedida>          getUnidadesDeMedida(){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<UnidadMedida> unidadesDeMedida =  puertoClasificadores.unidadesDeMedida();
		return unidadesDeMedida;
	}
	public static List <Producto>          todosLosProductosPorAnio(int anio, int version){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Producto> productosPorAnhio =  puertoClasificadores.todosLosProductosPorAnio((short)anio, (short)version);
		return productosPorAnhio;
	}
	public static List <Programa>          todosLosProgramasPorAnio(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Programa> programasPorAnio =  puertoClasificadores.todosLosProgramasPorAnio((short)anio);
		return programasPorAnio;
	}
	public static List <Subprograma>          todosLosSubprogramasPorAnio(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Subprograma> subprogramasPorAnio =  puertoClasificadores.todosLosSubprogramasPorAnio((short)anio);
		return subprogramasPorAnio;
	}
	public static List <Proyecto>          todosLosProyectosPorAnio(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Proyecto> proyectosPorAnio =  puertoClasificadores.todosLosProyectosPorAnio((short)anio);
		return proyectosPorAnio;
	}
	public static List <Entidad>          todasLasEntidadesPorAnio(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Entidad> entidadesPorAnio =  puertoClasificadores.todasLasEntidadesPorAnio((short)anio);
		return entidadesPorAnio;
	}
	
	public static List <Version> getVersionPorAnho(int anio){
		ClasificadoresService servicioClasificadores = new ClasificadoresService();
		Clasificadores puertoClasificadores = servicioClasificadores.getClasificadoresPort();
		List<Version> versiones =  puertoClasificadores.obtenerVersionesPorAnio((short)anio);
		return versiones;
	}
		
}