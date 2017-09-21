
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for plan complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="plan">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codigoPlan" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidadResponsable" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="planNombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="planDescripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="planDetalle" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="planDesde" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *         &lt;element name="planHasta" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "plan", propOrder = {
    "codigoPlan",
    "entidadResponsable",
    "planNombre",
    "planDescripcion",
    "planDetalle",
    "planDesde",
    "planHasta"
})
public class Plan {

    protected Short codigoPlan;
    protected String entidadResponsable;
    protected String planNombre;
    protected String planDescripcion;
    protected String planDetalle;
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar planDesde;
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar planHasta;

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
     * Gets the value of the entidadResponsable property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEntidadResponsable() {
        return entidadResponsable;
    }

    /**
     * Sets the value of the entidadResponsable property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEntidadResponsable(String value) {
        this.entidadResponsable = value;
    }

    /**
     * Gets the value of the planNombre property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPlanNombre() {
        return planNombre;
    }

    /**
     * Sets the value of the planNombre property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPlanNombre(String value) {
        this.planNombre = value;
    }

    /**
     * Gets the value of the planDescripcion property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPlanDescripcion() {
        return planDescripcion;
    }

    /**
     * Sets the value of the planDescripcion property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPlanDescripcion(String value) {
        this.planDescripcion = value;
    }

    /**
     * Gets the value of the planDetalle property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPlanDetalle() {
        return planDetalle;
    }

    /**
     * Sets the value of the planDetalle property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPlanDetalle(String value) {
        this.planDetalle = value;
    }

    /**
     * Gets the value of the planDesde property.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getPlanDesde() {
        return planDesde;
    }

    /**
     * Sets the value of the planDesde property.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setPlanDesde(XMLGregorianCalendar value) {
        this.planDesde = value;
    }

    /**
     * Gets the value of the planHasta property.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getPlanHasta() {
        return planHasta;
    }

    /**
     * Sets the value of the planHasta property.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setPlanHasta(XMLGregorianCalendar value) {
        this.planHasta = value;
    }

}
