
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for planEje complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="planEje">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPlan" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="ejeCodigo" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="ejeNombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ejeDescripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "planEje", propOrder = {
    "numeroFila",
    "codigoPlan",
    "ejeCodigo",
    "ejeNombre",
    "ejeDescripcion"
})
public class PlanEje {

    protected Short numeroFila;
    protected Short codigoPlan;
    protected Short ejeCodigo;
    protected String ejeNombre;
    protected String ejeDescripcion;

    /**
     * Gets the value of the numeroFila property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getNumeroFila() {
        return numeroFila;
    }

    /**
     * Sets the value of the numeroFila property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setNumeroFila(Short value) {
        this.numeroFila = value;
    }

    /**
     * Gets the value of the codigoPlan property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoPlan() {
        return codigoPlan;
    }

    /**
     * Sets the value of the codigoPlan property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoPlan(Short value) {
        this.codigoPlan = value;
    }

    /**
     * Gets the value of the ejeCodigo property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getEjeCodigo() {
        return ejeCodigo;
    }

    /**
     * Sets the value of the ejeCodigo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setEjeCodigo(Short value) {
        this.ejeCodigo = value;
    }

    /**
     * Gets the value of the ejeNombre property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEjeNombre() {
        return ejeNombre;
    }

    /**
     * Sets the value of the ejeNombre property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEjeNombre(String value) {
        this.ejeNombre = value;
    }

    /**
     * Gets the value of the ejeDescripcion property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEjeDescripcion() {
        return ejeDescripcion;
    }

    /**
     * Sets the value of the ejeDescripcion property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEjeDescripcion(String value) {
        this.ejeDescripcion = value;
    }

}
