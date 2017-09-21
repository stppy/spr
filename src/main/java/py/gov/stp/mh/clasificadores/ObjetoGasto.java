
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for objetoGasto complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="objetoGasto">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codObjetoGasto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="descripcionObjetoGasto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abrevObjetoGasto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="esImputable" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "objetoGasto", propOrder = {
    "numeroFila",
    "anio",
    "codObjetoGasto",
    "nombre",
    "descripcionObjetoGasto",
    "abrevObjetoGasto",
    "esImputable"
})
public class ObjetoGasto {

    protected Short numeroFila;
    protected Short anio;
    protected Short codObjetoGasto;
    protected String descripcionObjetoGasto;
    protected String abrevObjetoGasto;
    protected String esImputable;
    protected String nombre;

    public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

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
     * Gets the value of the codObjetoGasto property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodObjetoGasto() {
        return codObjetoGasto;
    }

    /**
     * Sets the value of the codObjetoGasto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodObjetoGasto(Short value) {
        this.codObjetoGasto = value;
    }

    /**
     * Gets the value of the descripcionObjetoGasto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionObjetoGasto() {
        return descripcionObjetoGasto;
    }

    /**
     * Sets the value of the descripcionObjetoGasto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionObjetoGasto(String value) {
        this.descripcionObjetoGasto = value;
    }

    /**
     * Gets the value of the abrevObjetoGasto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbrevObjetoGasto() {
        return abrevObjetoGasto;
    }

    /**
     * Sets the value of the abrevObjetoGasto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbrevObjetoGasto(String value) {
        this.abrevObjetoGasto = value;
    }

    /**
     * Gets the value of the esImputable property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEsImputable() {
        return esImputable;
    }

    /**
     * Sets the value of the esImputable property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEsImputable(String value) {
        this.esImputable = value;
    }

}
