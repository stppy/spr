package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for pilar complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="pilar">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPilar" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPlan" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="pilarNombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="pilarDescripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="lineaTransversal" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="ejeEstrategico" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "pilar", propOrder = {
    "numeroFila",
    "codigoPilar",
    "codigoPlan",
    "pilarNombre",
    "pilarDescripcion",
    "lineaTransversal",
    "ejeEstrategico"
})
public class Pilar {

    protected Short numeroFila;
    protected Short codigoPilar;
    protected Short codigoPlan;
    protected String pilarNombre;
    protected String pilarDescripcion;
    protected short lineaTransversal;
    protected short ejeEstrategico;

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
     * Gets the value of the codigoPilar property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoPilar() {
        return codigoPilar;
    }

    /**
     * Sets the value of the codigoPilar property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoPilar(Short value) {
        this.codigoPilar = value;
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
     * Gets the value of the pilarNombre property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPilarNombre() {
        return pilarNombre;
    }

    /**
     * Sets the value of the pilarNombre property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPilarNombre(String value) {
        this.pilarNombre = value;
    }

    /**
     * Gets the value of the pilarDescripcion property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPilarDescripcion() {
        return pilarDescripcion;
    }

    /**
     * Sets the value of the pilarDescripcion property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPilarDescripcion(String value) {
        this.pilarDescripcion = value;
    }

    /**
    * Gets the value of the lineaTransversal property.
    * 
    * @return
    * possible object is
    * {@link Short }
    * 
    */
    public Short getLineaTransversal() {
    return lineaTransversal;
    }
    
    /**
    * Sets the value of the lineaTransversal property.
    * 
    * @param value
    * allowed object is
    * {@link Short }
    * 
    */
    public void setLineaTransversal(Short value) {
    this.lineaTransversal = value;
    }
    
    /**
    * Gets the value of the ejeEstrategico property.
    * 
    * @return
    * possible object is
    * {@link Short }
    * 
    */
    public Short getEjeEstrategico() {
    return ejeEstrategico;
    }
    
    /**
    * Sets the value of the lineaTransversal property.
    * 
    * @param value
    * allowed object is
    * {@link Short }
    * 
    */
    public void setEjeEstrategico(Short value) {
    this.ejeEstrategico = value;
    }

}

