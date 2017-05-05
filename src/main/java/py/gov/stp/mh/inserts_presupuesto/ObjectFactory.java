
package py.gov.stp.mh.inserts_presupuesto;

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
 * generated in the py.gov.stp.mh.inserts_presupuesto package. 
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

    private final static QName _InsertarProyectoCodigoSnip_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProyectoCodigoSnip");
    private final static QName _InsertarSubprograma_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarSubprograma");
    private final static QName _InsertarPrograma_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarPrograma");
    private final static QName _InsertarProducto_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProducto");
    private final static QName _InsertarProyecto_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProyecto");
    private final static QName _InsertarProyectoPlanEstrategicoResponse_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProyectoPlanEstrategicoResponse");
    private final static QName _InsertarSubprogramaResponse_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarSubprogramaResponse");
    private final static QName _InsertarProgramaResponse_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProgramaResponse");
    private final static QName _InsertarProyectoCodigoSnipResponse_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProyectoCodigoSnipResponse");
    private final static QName _InsertarProyectoResponse_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProyectoResponse");
    private final static QName _InsertarProyectoPlanEstrategico_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProyectoPlanEstrategico");
    private final static QName _WsException_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "WsException");
    private final static QName _InsertarProductoResponse_QNAME = new QName("http://inserts.service.siaf.hacienda.gov.py/", "insertarProductoResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: py.gov.stp.mh.inserts_presupuesto
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link InsertarProyectoPlanEstrategico }
     * 
     */
    public InsertarProyectoPlanEstrategico createInsertarProyectoPlanEstrategico() {
        return new InsertarProyectoPlanEstrategico();
    }

    /**
     * Create an instance of {@link InsertarProductoResponse }
     * 
     */
    public InsertarProductoResponse createInsertarProductoResponse() {
        return new InsertarProductoResponse();
    }

    /**
     * Create an instance of {@link WsException }
     * 
     */
    public WsException createWsException() {
        return new WsException();
    }

    /**
     * Create an instance of {@link InsertarProgramaResponse }
     * 
     */
    public InsertarProgramaResponse createInsertarProgramaResponse() {
        return new InsertarProgramaResponse();
    }

    /**
     * Create an instance of {@link InsertarProyectoResponse }
     * 
     */
    public InsertarProyectoResponse createInsertarProyectoResponse() {
        return new InsertarProyectoResponse();
    }

    /**
     * Create an instance of {@link InsertarProyectoCodigoSnipResponse }
     * 
     */
    public InsertarProyectoCodigoSnipResponse createInsertarProyectoCodigoSnipResponse() {
        return new InsertarProyectoCodigoSnipResponse();
    }

    /**
     * Create an instance of {@link InsertarPrograma }
     * 
     */
    public InsertarPrograma createInsertarPrograma() {
        return new InsertarPrograma();
    }

    /**
     * Create an instance of {@link InsertarSubprogramaResponse }
     * 
     */
    public InsertarSubprogramaResponse createInsertarSubprogramaResponse() {
        return new InsertarSubprogramaResponse();
    }

    /**
     * Create an instance of {@link InsertarProyectoPlanEstrategicoResponse }
     * 
     */
    public InsertarProyectoPlanEstrategicoResponse createInsertarProyectoPlanEstrategicoResponse() {
        return new InsertarProyectoPlanEstrategicoResponse();
    }

    /**
     * Create an instance of {@link InsertarProyecto }
     * 
     */
    public InsertarProyecto createInsertarProyecto() {
        return new InsertarProyecto();
    }

    /**
     * Create an instance of {@link InsertarProducto }
     * 
     */
    public InsertarProducto createInsertarProducto() {
        return new InsertarProducto();
    }

    /**
     * Create an instance of {@link InsertarProyectoCodigoSnip }
     * 
     */
    public InsertarProyectoCodigoSnip createInsertarProyectoCodigoSnip() {
        return new InsertarProyectoCodigoSnip();
    }

    /**
     * Create an instance of {@link InsertarSubprograma }
     * 
     */
    public InsertarSubprograma createInsertarSubprograma() {
        return new InsertarSubprograma();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProyectoCodigoSnip }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProyectoCodigoSnip")
    public JAXBElement<InsertarProyectoCodigoSnip> createInsertarProyectoCodigoSnip(InsertarProyectoCodigoSnip value) {
        return new JAXBElement<InsertarProyectoCodigoSnip>(_InsertarProyectoCodigoSnip_QNAME, InsertarProyectoCodigoSnip.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarSubprograma }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarSubprograma")
    public JAXBElement<InsertarSubprograma> createInsertarSubprograma(InsertarSubprograma value) {
        return new JAXBElement<InsertarSubprograma>(_InsertarSubprograma_QNAME, InsertarSubprograma.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarPrograma }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarPrograma")
    public JAXBElement<InsertarPrograma> createInsertarPrograma(InsertarPrograma value) {
        return new JAXBElement<InsertarPrograma>(_InsertarPrograma_QNAME, InsertarPrograma.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProducto }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProducto")
    public JAXBElement<InsertarProducto> createInsertarProducto(InsertarProducto value) {
        return new JAXBElement<InsertarProducto>(_InsertarProducto_QNAME, InsertarProducto.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProyecto }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProyecto")
    public JAXBElement<InsertarProyecto> createInsertarProyecto(InsertarProyecto value) {
        return new JAXBElement<InsertarProyecto>(_InsertarProyecto_QNAME, InsertarProyecto.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProyectoPlanEstrategicoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProyectoPlanEstrategicoResponse")
    public JAXBElement<InsertarProyectoPlanEstrategicoResponse> createInsertarProyectoPlanEstrategicoResponse(InsertarProyectoPlanEstrategicoResponse value) {
        return new JAXBElement<InsertarProyectoPlanEstrategicoResponse>(_InsertarProyectoPlanEstrategicoResponse_QNAME, InsertarProyectoPlanEstrategicoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarSubprogramaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarSubprogramaResponse")
    public JAXBElement<InsertarSubprogramaResponse> createInsertarSubprogramaResponse(InsertarSubprogramaResponse value) {
        return new JAXBElement<InsertarSubprogramaResponse>(_InsertarSubprogramaResponse_QNAME, InsertarSubprogramaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProgramaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProgramaResponse")
    public JAXBElement<InsertarProgramaResponse> createInsertarProgramaResponse(InsertarProgramaResponse value) {
        return new JAXBElement<InsertarProgramaResponse>(_InsertarProgramaResponse_QNAME, InsertarProgramaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProyectoCodigoSnipResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProyectoCodigoSnipResponse")
    public JAXBElement<InsertarProyectoCodigoSnipResponse> createInsertarProyectoCodigoSnipResponse(InsertarProyectoCodigoSnipResponse value) {
        return new JAXBElement<InsertarProyectoCodigoSnipResponse>(_InsertarProyectoCodigoSnipResponse_QNAME, InsertarProyectoCodigoSnipResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProyectoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProyectoResponse")
    public JAXBElement<InsertarProyectoResponse> createInsertarProyectoResponse(InsertarProyectoResponse value) {
        return new JAXBElement<InsertarProyectoResponse>(_InsertarProyectoResponse_QNAME, InsertarProyectoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProyectoPlanEstrategico }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProyectoPlanEstrategico")
    public JAXBElement<InsertarProyectoPlanEstrategico> createInsertarProyectoPlanEstrategico(InsertarProyectoPlanEstrategico value) {
        return new JAXBElement<InsertarProyectoPlanEstrategico>(_InsertarProyectoPlanEstrategico_QNAME, InsertarProyectoPlanEstrategico.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link WsException }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "WsException")
    public JAXBElement<WsException> createWsException(WsException value) {
        return new JAXBElement<WsException>(_WsException_QNAME, WsException.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InsertarProductoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://inserts.service.siaf.hacienda.gov.py/", name = "insertarProductoResponse")
    public JAXBElement<InsertarProductoResponse> createInsertarProductoResponse(InsertarProductoResponse value) {
        return new JAXBElement<InsertarProductoResponse>(_InsertarProductoResponse_QNAME, InsertarProductoResponse.class, null, value);
    }

}
