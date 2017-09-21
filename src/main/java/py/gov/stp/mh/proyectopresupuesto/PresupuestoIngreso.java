
package py.gov.stp.mh.proyectopresupuesto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for presupuestoIngreso complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="presupuestoIngreso">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codOrigen" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codDetalle" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="fuenteFinanc" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="montoProgramado" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "presupuestoIngreso", propOrder = {
    "numeroFila",
    "anio",
    "nivel",
    "entidad",
    "codOrigen",
    "codDetalle",
    "fuenteFinanc",
    "montoProgramado"
})
public class PresupuestoIngreso {

    protected Short numeroFila;
    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Integer codOrigen;
    protected Integer codDetalle;
    protected Short fuenteFinanc;
    protected Double montoProgramado;

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
     * Gets the value of the codOrigen property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodOrigen() {
        return codOrigen;
    }

    /**
     * Sets the value of the codOrigen property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodOrigen(Integer value) {
        this.codOrigen = value;
    }

    /**
     * Gets the value of the codDetalle property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodDetalle() {
        return codDetalle;
    }

    /**
     * Sets the value of the codDetalle property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodDetalle(Integer value) {
        this.codDetalle = value;
    }

    /**
     * Gets the value of the fuenteFinanc property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getFuenteFinanc() {
        return fuenteFinanc;
    }

    /**
     * Sets the value of the fuenteFinanc property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setFuenteFinanc(Short value) {
        this.fuenteFinanc = value;
    }

    /**
     * Gets the value of the montoProgramado property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMontoProgramado() {
        return montoProgramado;
    }

    /**
     * Sets the value of the montoProgramado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMontoProgramado(Double value) {
        this.montoProgramado = value;
    }

}
