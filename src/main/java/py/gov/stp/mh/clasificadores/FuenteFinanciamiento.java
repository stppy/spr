
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for fuenteFinanciamiento complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="fuenteFinanciamiento">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codFuenteFinanciamiento" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombreFuenteFinanciamiento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abrevFuenteFinanciamiento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="siglaFuenteFinanciamiento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "fuenteFinanciamiento", propOrder = {
    "numeroFila",
    "anio",
    "codFuenteFinanciamiento",
    "nombreFuenteFinanciamiento",
    "abrevFuenteFinanciamiento",
    "siglaFuenteFinanciamiento"
})
public class FuenteFinanciamiento {

    protected Short numeroFila;
    protected Short anio;
    protected Short codFuenteFinanciamiento;
    protected String nombreFuenteFinanciamiento;
    protected String abrevFuenteFinanciamiento;
    protected String siglaFuenteFinanciamiento;

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
     * Gets the value of the anio property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getAnio() {
        return anio;
    }

    /**
     * Sets the value of the anio property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setAnio(Short value) {
        this.anio = value;
    }

    /**
     * Gets the value of the codFuenteFinanciamiento property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodFuenteFinanciamiento() {
        return codFuenteFinanciamiento;
    }

    /**
     * Sets the value of the codFuenteFinanciamiento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodFuenteFinanciamiento(Short value) {
        this.codFuenteFinanciamiento = value;
    }

    /**
     * Gets the value of the nombreFuenteFinanciamiento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreFuenteFinanciamiento() {
        return nombreFuenteFinanciamiento;
    }

    /**
     * Sets the value of the nombreFuenteFinanciamiento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreFuenteFinanciamiento(String value) {
        this.nombreFuenteFinanciamiento = value;
    }

    /**
     * Gets the value of the abrevFuenteFinanciamiento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbrevFuenteFinanciamiento() {
        return abrevFuenteFinanciamiento;
    }

    /**
     * Sets the value of the abrevFuenteFinanciamiento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbrevFuenteFinanciamiento(String value) {
        this.abrevFuenteFinanciamiento = value;
    }

    /**
     * Gets the value of the siglaFuenteFinanciamiento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSiglaFuenteFinanciamiento() {
        return siglaFuenteFinanciamiento;
    }

    /**
     * Sets the value of the siglaFuenteFinanciamiento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSiglaFuenteFinanciamiento(String value) {
        this.siglaFuenteFinanciamiento = value;
    }

}
