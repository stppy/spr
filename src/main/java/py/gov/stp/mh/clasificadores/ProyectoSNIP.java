
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for proyectoSNIP complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="proyectoSNIP">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codigoSnip" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombreProyecto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="estado" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "proyectoSNIP", propOrder = {
    "codigoSnip",
    "nombreProyecto",
    "estado"
})
public class ProyectoSNIP {

    protected Short codigoSnip;
    protected String nombreProyecto;
    protected Short estado;

    /**
     * Gets the value of the codigoSnip property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoSnip() {
        return codigoSnip;
    }

    /**
     * Sets the value of the codigoSnip property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoSnip(Short value) {
        this.codigoSnip = value;
    }

    /**
     * Gets the value of the nombreProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    /**
     * Sets the value of the nombreProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreProyecto(String value) {
        this.nombreProyecto = value;
    }

    /**
     * Gets the value of the estado property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getEstado() {
        return estado;
    }

    /**
     * Sets the value of the estado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setEstado(Short value) {
        this.estado = value;
    }

}
