
package py.gov.stp.mh.update_presupuesto;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/

/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the py.gov.stp.mh.update_presupuesto package. 
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

    private final static QName _ActualizarProgramaResponse_QNAME = new QName("localhost", "actualizarProgramaResponse");
    private final static QName _ActualizarSubprogramaResponse_QNAME = new QName("localhost", "actualizarSubprogramaResponse");
    private final static QName _WsException_QNAME = new QName("localhost", "WsException");
    private final static QName _ActualizarProyecto_QNAME = new QName("localhost", "actualizarProyecto");
    private final static QName _ActualizarSubprograma_QNAME = new QName("localhost", "actualizarSubprograma");
    private final static QName _ActualizarEntidad_QNAME = new QName("localhost", "actualizarEntidad");
    private final static QName _ActualizarPrograma_QNAME = new QName("localhost", "actualizarPrograma");
    private final static QName _ActualizarProyectoResponse_QNAME = new QName("localhost", "actualizarProyectoResponse");
    private final static QName _ActualizarEntidadResponse_QNAME = new QName("localhost", "actualizarEntidadResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: py.gov.stp.mh.update_presupuesto
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ActualizarProyectoResponse }
     * 
     */
    public ActualizarProyectoResponse createActualizarProyectoResponse() {
        return new ActualizarProyectoResponse();
    }

    /**
     * Create an instance of {@link ActualizarPrograma }
     * 
     */
    public ActualizarPrograma createActualizarPrograma() {
        return new ActualizarPrograma();
    }

    /**
     * Create an instance of {@link ActualizarEntidad }
     * 
     */
    public ActualizarEntidad createActualizarEntidad() {
        return new ActualizarEntidad();
    }

    /**
     * Create an instance of {@link ActualizarSubprograma }
     * 
     */
    public ActualizarSubprograma createActualizarSubprograma() {
        return new ActualizarSubprograma();
    }

    /**
     * Create an instance of {@link ActualizarProyecto }
     * 
     */
    public ActualizarProyecto createActualizarProyecto() {
        return new ActualizarProyecto();
    }

    /**
     * Create an instance of {@link WsException }
     * 
     */
    public WsException createWsException() {
        return new WsException();
    }

    /**
     * Create an instance of {@link ActualizarSubprogramaResponse }
     * 
     */
    public ActualizarSubprogramaResponse createActualizarSubprogramaResponse() {
        return new ActualizarSubprogramaResponse();
    }

    /**
     * Create an instance of {@link ActualizarProgramaResponse }
     * 
     */
    public ActualizarProgramaResponse createActualizarProgramaResponse() {
        return new ActualizarProgramaResponse();
    }

    /**
     * Create an instance of {@link ActualizarEntidadResponse }
     * 
     */
    public ActualizarEntidadResponse createActualizarEntidadResponse() {
        return new ActualizarEntidadResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarProgramaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarProgramaResponse")
    public JAXBElement<ActualizarProgramaResponse> createActualizarProgramaResponse(ActualizarProgramaResponse value) {
        return new JAXBElement<ActualizarProgramaResponse>(_ActualizarProgramaResponse_QNAME, ActualizarProgramaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarSubprogramaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarSubprogramaResponse")
    public JAXBElement<ActualizarSubprogramaResponse> createActualizarSubprogramaResponse(ActualizarSubprogramaResponse value) {
        return new JAXBElement<ActualizarSubprogramaResponse>(_ActualizarSubprogramaResponse_QNAME, ActualizarSubprogramaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link WsException }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "WsException")
    public JAXBElement<WsException> createWsException(WsException value) {
        return new JAXBElement<WsException>(_WsException_QNAME, WsException.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarProyecto }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarProyecto")
    public JAXBElement<ActualizarProyecto> createActualizarProyecto(ActualizarProyecto value) {
        return new JAXBElement<ActualizarProyecto>(_ActualizarProyecto_QNAME, ActualizarProyecto.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarSubprograma }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarSubprograma")
    public JAXBElement<ActualizarSubprograma> createActualizarSubprograma(ActualizarSubprograma value) {
        return new JAXBElement<ActualizarSubprograma>(_ActualizarSubprograma_QNAME, ActualizarSubprograma.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarEntidad }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarEntidad")
    public JAXBElement<ActualizarEntidad> createActualizarEntidad(ActualizarEntidad value) {
        return new JAXBElement<ActualizarEntidad>(_ActualizarEntidad_QNAME, ActualizarEntidad.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarPrograma }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarPrograma")
    public JAXBElement<ActualizarPrograma> createActualizarPrograma(ActualizarPrograma value) {
        return new JAXBElement<ActualizarPrograma>(_ActualizarPrograma_QNAME, ActualizarPrograma.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarProyectoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarProyectoResponse")
    public JAXBElement<ActualizarProyectoResponse> createActualizarProyectoResponse(ActualizarProyectoResponse value) {
        return new JAXBElement<ActualizarProyectoResponse>(_ActualizarProyectoResponse_QNAME, ActualizarProyectoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarEntidadResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "localhost", name = "actualizarEntidadResponse")
    public JAXBElement<ActualizarEntidadResponse> createActualizarEntidadResponse(ActualizarEntidadResponse value) {
        return new JAXBElement<ActualizarEntidadResponse>(_ActualizarEntidadResponse_QNAME, ActualizarEntidadResponse.class, null, value);
    }

}
