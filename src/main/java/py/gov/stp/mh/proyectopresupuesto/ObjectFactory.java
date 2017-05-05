
package py.gov.stp.mh.proyectopresupuesto;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the py.gov.stp.mh.proyectopresupuesto package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _ObtenerProyectoPresupuestoDeIngresosResponse_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_PresupuestoDeIngresosResponse");
    private final static QName _ObtenerProyectoPresupuestoDeGastos_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_PresupuestoDeGastos");
    private final static QName _ObtenerProyectoPresupuestoDeGastosResponse_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_PresupuestoDeGastosResponse");
    private final static QName _ObtenerProyectoFundamentacionDeGastosResponse_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_FundamentacionDeGastosResponse");
    private final static QName _ObtenerProyectoPresupuestoDeIngresos_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_PresupuestoDeIngresos");
    private final static QName _ObtenerProyectoAsignacionFinancieraProductosResponse_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_AsignacionFinancieraProductosResponse");
    private final static QName _ObtenerProyectoFundamentacionDeGastos_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_FundamentacionDeGastos");
    private final static QName _ObtenerProyectoAsignacionFinancieraProductos_QNAME = new QName("http://queries.service.siaf.hacienda.gov.py/", "obtenerProyecto_AsignacionFinancieraProductos");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: py.gov.stp.mh.proyectopresupuesto
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ObtenerProyectoPresupuestoDeIngresosResponse }
     * 
     */
    public ObtenerProyectoPresupuestoDeIngresosResponse createObtenerProyectoPresupuestoDeIngresosResponse() {
        return new ObtenerProyectoPresupuestoDeIngresosResponse();
    }

    /**
     * Create an instance of {@link ObtenerProyectoFundamentacionDeGastos }
     * 
     */
    public ObtenerProyectoFundamentacionDeGastos createObtenerProyectoFundamentacionDeGastos() {
        return new ObtenerProyectoFundamentacionDeGastos();
    }

    /**
     * Create an instance of {@link ObtenerProyectoAsignacionFinancieraProductosResponse }
     * 
     */
    public ObtenerProyectoAsignacionFinancieraProductosResponse createObtenerProyectoAsignacionFinancieraProductosResponse() {
        return new ObtenerProyectoAsignacionFinancieraProductosResponse();
    }

    /**
     * Create an instance of {@link ObtenerProyectoAsignacionFinancieraProductos }
     * 
     */
    public ObtenerProyectoAsignacionFinancieraProductos createObtenerProyectoAsignacionFinancieraProductos() {
        return new ObtenerProyectoAsignacionFinancieraProductos();
    }

    /**
     * Create an instance of {@link ObtenerProyectoPresupuestoDeGastos }
     * 
     */
    public ObtenerProyectoPresupuestoDeGastos createObtenerProyectoPresupuestoDeGastos() {
        return new ObtenerProyectoPresupuestoDeGastos();
    }

    /**
     * Create an instance of {@link ObtenerProyectoPresupuestoDeIngresos }
     * 
     */
    public ObtenerProyectoPresupuestoDeIngresos createObtenerProyectoPresupuestoDeIngresos() {
        return new ObtenerProyectoPresupuestoDeIngresos();
    }

    /**
     * Create an instance of {@link ObtenerProyectoFundamentacionDeGastosResponse }
     * 
     */
    public ObtenerProyectoFundamentacionDeGastosResponse createObtenerProyectoFundamentacionDeGastosResponse() {
        return new ObtenerProyectoFundamentacionDeGastosResponse();
    }

    /**
     * Create an instance of {@link ObtenerProyectoPresupuestoDeGastosResponse }
     * 
     */
    public ObtenerProyectoPresupuestoDeGastosResponse createObtenerProyectoPresupuestoDeGastosResponse() {
        return new ObtenerProyectoPresupuestoDeGastosResponse();
    }

    /**
     * Create an instance of {@link PresupuestoGasto }
     * 
     */
    public PresupuestoGasto createPresupuestoGasto() {
        return new PresupuestoGasto();
    }

    /**
     * Create an instance of {@link PresupuestoIngreso }
     * 
     */
    public PresupuestoIngreso createPresupuestoIngreso() {
        return new PresupuestoIngreso();
    }

    /**
     * Create an instance of {@link FundamentacionGasto }
     * 
     */
    public FundamentacionGasto createFundamentacionGasto() {
        return new FundamentacionGasto();
    }

    /**
     * Create an instance of {@link AsignFinanProducto }
     * 
     */
    public AsignFinanProducto createAsignFinanProducto() {
        return new AsignFinanProducto();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoPresupuestoDeIngresosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_PresupuestoDeIngresosResponse")
    public JAXBElement<ObtenerProyectoPresupuestoDeIngresosResponse> createObtenerProyectoPresupuestoDeIngresosResponse(ObtenerProyectoPresupuestoDeIngresosResponse value) {
        return new JAXBElement<ObtenerProyectoPresupuestoDeIngresosResponse>(_ObtenerProyectoPresupuestoDeIngresosResponse_QNAME, ObtenerProyectoPresupuestoDeIngresosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoPresupuestoDeGastos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_PresupuestoDeGastos")
    public JAXBElement<ObtenerProyectoPresupuestoDeGastos> createObtenerProyectoPresupuestoDeGastos(ObtenerProyectoPresupuestoDeGastos value) {
        return new JAXBElement<ObtenerProyectoPresupuestoDeGastos>(_ObtenerProyectoPresupuestoDeGastos_QNAME, ObtenerProyectoPresupuestoDeGastos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoPresupuestoDeGastosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_PresupuestoDeGastosResponse")
    public JAXBElement<ObtenerProyectoPresupuestoDeGastosResponse> createObtenerProyectoPresupuestoDeGastosResponse(ObtenerProyectoPresupuestoDeGastosResponse value) {
        return new JAXBElement<ObtenerProyectoPresupuestoDeGastosResponse>(_ObtenerProyectoPresupuestoDeGastosResponse_QNAME, ObtenerProyectoPresupuestoDeGastosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoFundamentacionDeGastosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_FundamentacionDeGastosResponse")
    public JAXBElement<ObtenerProyectoFundamentacionDeGastosResponse> createObtenerProyectoFundamentacionDeGastosResponse(ObtenerProyectoFundamentacionDeGastosResponse value) {
        return new JAXBElement<ObtenerProyectoFundamentacionDeGastosResponse>(_ObtenerProyectoFundamentacionDeGastosResponse_QNAME, ObtenerProyectoFundamentacionDeGastosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoPresupuestoDeIngresos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_PresupuestoDeIngresos")
    public JAXBElement<ObtenerProyectoPresupuestoDeIngresos> createObtenerProyectoPresupuestoDeIngresos(ObtenerProyectoPresupuestoDeIngresos value) {
        return new JAXBElement<ObtenerProyectoPresupuestoDeIngresos>(_ObtenerProyectoPresupuestoDeIngresos_QNAME, ObtenerProyectoPresupuestoDeIngresos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoAsignacionFinancieraProductosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_AsignacionFinancieraProductosResponse")
    public JAXBElement<ObtenerProyectoAsignacionFinancieraProductosResponse> createObtenerProyectoAsignacionFinancieraProductosResponse(ObtenerProyectoAsignacionFinancieraProductosResponse value) {
        return new JAXBElement<ObtenerProyectoAsignacionFinancieraProductosResponse>(_ObtenerProyectoAsignacionFinancieraProductosResponse_QNAME, ObtenerProyectoAsignacionFinancieraProductosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoFundamentacionDeGastos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_FundamentacionDeGastos")
    public JAXBElement<ObtenerProyectoFundamentacionDeGastos> createObtenerProyectoFundamentacionDeGastos(ObtenerProyectoFundamentacionDeGastos value) {
        return new JAXBElement<ObtenerProyectoFundamentacionDeGastos>(_ObtenerProyectoFundamentacionDeGastos_QNAME, ObtenerProyectoFundamentacionDeGastos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProyectoAsignacionFinancieraProductos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://queries.service.siaf.hacienda.gov.py/", name = "obtenerProyecto_AsignacionFinancieraProductos")
    public JAXBElement<ObtenerProyectoAsignacionFinancieraProductos> createObtenerProyectoAsignacionFinancieraProductos(ObtenerProyectoAsignacionFinancieraProductos value) {
        return new JAXBElement<ObtenerProyectoAsignacionFinancieraProductos>(_ObtenerProyectoAsignacionFinancieraProductos_QNAME, ObtenerProyectoAsignacionFinancieraProductos.class, null, value);
    }

}
