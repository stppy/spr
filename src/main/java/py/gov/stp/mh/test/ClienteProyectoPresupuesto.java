package py.gov.stp.mh.test;

import java.util.List;

import py.gov.stp.mh.proyectopresupuesto.*;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

public class ClienteProyectoPresupuesto {
	
	public static List <AsignFinanProducto> 		obtenerProyectoAsignacionFinancieraProductos(int anho, int nivel, int entidad, int version ) {
		ProyectoPresupuestoService servicioProyectoPresupuesto = new ProyectoPresupuestoService();
		ProyectoPresupuesto puertoProyectoPresupuesto = servicioProyectoPresupuesto.getProyectoPresupuestoPort();
		List<AsignFinanProducto> asignacionFinanciera =  puertoProyectoPresupuesto.obtenerProyectoAsignacionFinancieraProductos(anho,nivel,entidad,version);
		return asignacionFinanciera;
	}
	public static List <PresupuestoGasto> 		obtenerProyectoPresupuestoDeGastos(int anho, int nivel, int entidad, int version ) {
		ProyectoPresupuestoService servicioProyectoPresupuesto = new ProyectoPresupuestoService();
		ProyectoPresupuesto puertoProyectoPresupuesto = servicioProyectoPresupuesto.getProyectoPresupuestoPort();
		List<PresupuestoGasto> presupuestoGasto =  puertoProyectoPresupuesto.obtenerProyectoPresupuestoDeGastos(anho,nivel,entidad,version);
		return presupuestoGasto;
	}
	public static List <FundamentacionGasto> 		obtenerProyectoFundamentacionDeGastos(int anho, int nivel, int entidad, int version ) {
		ProyectoPresupuestoService servicioProyectoPresupuesto = new ProyectoPresupuestoService();
		ProyectoPresupuesto puertoProyectoPresupuesto = servicioProyectoPresupuesto.getProyectoPresupuestoPort();
		List<FundamentacionGasto> fundamentacionGasto =  puertoProyectoPresupuesto.obtenerProyectoFundamentacionDeGastos(anho,nivel,entidad,version);
		return fundamentacionGasto;
	}
	public static List <PresupuestoIngreso> 		obtenerProyectoPresupuestoDeIngresos(int anho, int nivel, int entidad, int version ) {
		ProyectoPresupuestoService servicioProyectoPresupuesto = new ProyectoPresupuestoService();
		ProyectoPresupuesto puertoProyectoPresupuesto = servicioProyectoPresupuesto.getProyectoPresupuestoPort();
		List<PresupuestoIngreso> presupuestoIngreso =  puertoProyectoPresupuesto.obtenerProyectoPresupuestoDeIngresos(anho,nivel,entidad,version);
		return presupuestoIngreso;
	}

}
