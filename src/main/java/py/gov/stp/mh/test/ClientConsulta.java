package py.gov.stp.mh.test;
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

public class ClientConsulta {
	public static List <ProductoFisico> 		getProductosFisicos(int anio, int nivel, int entidad, int tipo, int programa, int subprograma, int proyecto){
		StpServiceService servicioStp = new StpServiceService();
		StpService puertoStpService = servicioStp.getStpServicePort();
		List<ProductoFisico> productosFisicos =  puertoStpService.obtenerProductosFisicos(anio,nivel,entidad,tipo,programa,subprograma,proyecto);
		return productosFisicos;
	}
	public static List <ProductoFinanciero> 	getProductosFinancieros(int anio, int nivel, int entidad, int tipo, int programa, int subprograma, int proyecto, int producto){
		StpServiceService servicioStp = new StpServiceService();
		StpService puertoStpService = servicioStp.getStpServicePort();
		List<ProductoFinanciero> productosFinancieros =  puertoStpService.obtenerDetalleFinancieroPorProducto(anio,nivel,entidad,tipo,programa,subprograma,proyecto,producto);
		return productosFinancieros;
	}
	public static List <PresupGastos> 	        getPresupuestoDeGastos(int anio, int nivel, int entidad, int tipo, int programa, int subprograma, int proyecto){
		StpServiceService servicioStp = new StpServiceService();
		StpService puertoStpService = servicioStp.getStpServicePort();
		List<PresupGastos> presupuestosDeGastos =  puertoStpService.obtenerPresupuestoDeGastos(anio,nivel,entidad,tipo,programa,subprograma,proyecto);
		return presupuestosDeGastos;
	}
	
	
}
