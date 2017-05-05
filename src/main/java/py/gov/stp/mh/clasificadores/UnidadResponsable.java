
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for unidadResponsable complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="unidadResponsable">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="unrCodigo" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="ujeCodigo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="unrNombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="unrAbrev" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "unidadResponsable", propOrder = {
    "numeroFila",
    "nivel",
    "entidad",
    "unrCodigo",
    "ujeCodigo",
    "unrNombre",
    "unrAbrev"
})
public class UnidadResponsable {

    protected Short numeroFila;
    protected Short nivel;
    protected Short entidad;
    protected Short unrCodigo;
    protected Integer ujeCodigo;
    protected String unrNombre;
    protected String unrAbrev;

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
     * Gets the value of the nivel property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getNivel() {
        return nivel;
    }

    /**
     * Sets the value of the nivel property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setNivel(Short value) {
        this.nivel = value;
    }

    /**
     * Gets the value of the entidad property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getEntidad() {
        return entidad;
    }

    /**
     * Sets the value of the entidad property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setEntidad(Short value) {
        this.entidad = value;
    }

    /**
     * Gets the value of the unrCodigo property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getUnrCodigo() {
        return unrCodigo;
    }

    /**
     * Sets the value of the unrCodigo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setUnrCodigo(Short value) {
        this.unrCodigo = value;
    }

    /**
     * Gets the value of the ujeCodigo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getUjeCodigo() {
        return ujeCodigo;
    }

    /**
     * Sets the value of the ujeCodigo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setUjeCodigo(Integer value) {
        this.ujeCodigo = value;
    }

    /**
     * Gets the value of the unrNombre property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnrNombre() {
        return unrNombre;
    }

    /**
     * Sets the value of the unrNombre property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnrNombre(String value) {
        this.unrNombre = value;
    }

    /**
     * Gets the value of the unrAbrev property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnrAbrev() {
        return unrAbrev;
    }

    /**
     * Sets the value of the unrAbrev property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnrAbrev(String value) {
        this.unrAbrev = value;
    }

}
