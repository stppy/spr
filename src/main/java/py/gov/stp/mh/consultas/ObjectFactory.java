
package py.gov.stp.mh.consultas;

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
 * generated in the py.gov.stp.mh.consultas package. 
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

    private final static QName _ObtenerPresupuestoDeGastosResponse_QNAME = new QName("localhost", "obtenerPresupuestoDeGastosResponse");
    private final static QName _ObtenerProductosFisicosResponse_QNAME = new QName("localhost", "obtenerProductosFisicosResponse");
    private final static QName _ObtenerProductosFisicos_QNAME = new QName("localhost", "obtenerProductosFisicos");
    private final static QName _ObtenerPresupuestoDeGastos_QNAME = new QName("localhost", "obtenerPresupuestoDeGastos");
    private final static QName _ObtenerDetalleFinancieroPorProducto_QNAME = new QName("localhost", "obtenerDetalleFinancieroPorProducto");
    private final static QName _ObtenerDetalleFinancieroPorProductoResponse_QNAME = new QName("localhost", "obtenerDetalleFinancieroPorProductoResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: py.gov.stp.mh.consultas
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ObtenerProductosFisicos }
     * 
     */
    public ObtenerProductosFisicos createObtenerProductosFisicos() {
        return new ObtenerProductosFisicos();
    }

    /**
     * Create an instance of {@link ObtenerProductosFisicosResponse }
     * 
     */
    public ObtenerProductosFisicosResponse createObtenerProductosFisicosResponse() {
        return new ObtenerProductosFisicosResponse();
    }

    /**
     * Create an instance of {@link ObtenerPresupuestoDeGastosResponse }
     * 
     */
    public ObtenerPresupuestoDeGastosResponse createObtenerPresupuestoDeGastosResponse() {
        return new ObtenerPresupuestoDeGastosResponse();
    }

    /**
     * Create an instance of {@link ObtenerDetalleFinancieroPorProductoResponse }
     * 
     */
    public ObtenerDetalleFinancieroPorProductoResponse createObtenerDetalleFinancieroPorProductoResponse() {
        return new ObtenerDetalleFinancieroPorProductoResponse();
    }

    /**
     * Create an instance of {@link ObtenerDetalleFinancieroPorProducto }
     * 
     */
    public ObtenerDetalleFinancieroPorProducto createObtenerDetalleFinancieroPorProducto() {
        return new ObtenerDetalleFinancieroPorProducto();
    }

    /**
     * Create an instance of {@link ObtenerPresupuestoDeGastos }
     * 
     */
    public ObtenerPresupuestoDeGastos createObtenerPresupuestoDeGastos() {
        return new ObtenerPresupuestoDeGastos();
    }

    /**
     * Create an instance of {@link ProductoFisico }
     * 
     */
    public ProductoFisico createProductoFisico() {
        return new ProductoFisico();
    }

    /**
     * Create an instance of {@link ProductoFinanciero }
     * 
     */
    public ProductoFinanciero createProductoFinanciero() {
        return new ProductoFinanciero();
    }

    /**
     * Create an instance of {@link PresupGastos }
     * 
     */
    public PresupGastos createPresupGastos() {
        return new PresupGastos();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerPresupuestoDeGastosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "obtenerPresupuestoDeGastosResponse")
    public JAXBElement<ObtenerPresupuestoDeGastosResponse> createObtenerPresupuestoDeGastosResponse(ObtenerPresupuestoDeGastosResponse value) {
        return new JAXBElement<ObtenerPresupuestoDeGastosResponse>(_ObtenerPresupuestoDeGastosResponse_QNAME, ObtenerPresupuestoDeGastosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProductosFisicosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "obtenerProductosFisicosResponse")
    public JAXBElement<ObtenerProductosFisicosResponse> createObtenerProductosFisicosResponse(ObtenerProductosFisicosResponse value) {
        return new JAXBElement<ObtenerProductosFisicosResponse>(_ObtenerProductosFisicosResponse_QNAME, ObtenerProductosFisicosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerProductosFisicos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "obtenerProductosFisicos")
    public JAXBElement<ObtenerProductosFisicos> createObtenerProductosFisicos(ObtenerProductosFisicos value) {
        return new JAXBElement<ObtenerProductosFisicos>(_ObtenerProductosFisicos_QNAME, ObtenerProductosFisicos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerPresupuestoDeGastos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "obtenerPresupuestoDeGastos")
    public JAXBElement<ObtenerPresupuestoDeGastos> createObtenerPresupuestoDeGastos(ObtenerPresupuestoDeGastos value) {
        return new JAXBElement<ObtenerPresupuestoDeGastos>(_ObtenerPresupuestoDeGastos_QNAME, ObtenerPresupuestoDeGastos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerDetalleFinancieroPorProducto }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "obtenerDetalleFinancieroPorProducto")
    public JAXBElement<ObtenerDetalleFinancieroPorProducto> createObtenerDetalleFinancieroPorProducto(ObtenerDetalleFinancieroPorProducto value) {
        return new JAXBElement<ObtenerDetalleFinancieroPorProducto>(_ObtenerDetalleFinancieroPorProducto_QNAME, ObtenerDetalleFinancieroPorProducto.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerDetalleFinancieroPorProductoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "obtenerDetalleFinancieroPorProductoResponse")
    public JAXBElement<ObtenerDetalleFinancieroPorProductoResponse> createObtenerDetalleFinancieroPorProductoResponse(ObtenerDetalleFinancieroPorProductoResponse value) {
        return new JAXBElement<ObtenerDetalleFinancieroPorProductoResponse>(_ObtenerDetalleFinancieroPorProductoResponse_QNAME, ObtenerDetalleFinancieroPorProductoResponse.class, null, value);
    }

}
