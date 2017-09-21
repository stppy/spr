
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for subprograma complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="subprograma">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="tipoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoSubprograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombreSubprograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abrevSubprograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="descripcionSubprograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="objetivo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codigoDepartamento" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "subprograma", propOrder = {
    "numeroFila",
    "anio",
    "nivel",
    "entidad",
    "tipoPrograma",
    "codigoPrograma",
    "codigoSubprograma",
    "nombreSubprograma",
    "abrevSubprograma",
    "descripcionSubprograma",
    "objetivo",
    "codigoDepartamento"
})
public class Subprograma {

    protected Short numeroFila;
    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Short tipoPrograma;
    protected Short codigoPrograma;
    protected Short codigoSubprograma;
    protected String nombreSubprograma;
    protected String abrevSubprograma;
    protected String descripcionSubprograma;
    protected String objetivo;
    protected Short codigoDepartamento;

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
     * Gets the value of the tipoPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getTipoPrograma() {
        return tipoPrograma;
    }

    /**
     * Sets the value of the tipoPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setTipoPrograma(Short value) {
        this.tipoPrograma = value;
    }

    /**
     * Gets the value of the codigoPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoPrograma() {
        return codigoPrograma;
    }

    /**
     * Sets the value of the codigoPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoPrograma(Short value) {
        this.codigoPrograma = value;
    }

    /**
     * Gets the value of the codigoSubprograma property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoSubprograma() {
        return codigoSubprograma;
    }

    /**
     * Sets the value of the codigoSubprograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoSubprograma(Short value) {
        this.codigoSubprograma = value;
    }

    /**
     * Gets the value of the nombreSubprograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreSubprograma() {
        return nombreSubprograma;
    }

    /**
     * Sets the value of the nombreSubprograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreSubprograma(String value) {
        this.nombreSubprograma = value;
    }

    /**
     * Gets the value of the abrevSubprograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbrevSubprograma() {
        return abrevSubprograma;
    }

    /**
     * Sets the value of the abrevSubprograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbrevSubprograma(String value) {
        this.abrevSubprograma = value;
    }

    /**
     * Gets the value of the descripcionSubprograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionSubprograma() {
        return descripcionSubprograma;
    }

    /**
     * Sets the value of the descripcionSubprograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionSubprograma(String value) {
        this.descripcionSubprograma = value;
    }

    /**
     * Gets the value of the objetivo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getObjetivo() {
        return objetivo;
    }

    /**
     * Sets the value of the objetivo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setObjetivo(String value) {
        this.objetivo = value;
    }

    /**
     * Gets the value of the codigoDepartamento property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoDepartamento() {
        return codigoDepartamento;
    }

    /**
     * Sets the value of the codigoDepartamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoDepartamento(Short value) {
        this.codigoDepartamento = value;
    }

}
