
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for subprogramas complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="subprogramas">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="tipo" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="programa" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "subprogramas", propOrder = {
    "anio",
    "nivel",
    "entidad",
    "tipo",
    "programa"
})
public class Subprogramas {

    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Short tipo;
    protected Short programa;

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
     * Gets the value of the tipo property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getTipo() {
        return tipo;
    }

    /**
     * Sets the value of the tipo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setTipo(Short value) {
        this.tipo = value;
    }

    /**
     * Gets the value of the programa property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getPrograma() {
        return programa;
    }

    /**
     * Sets the value of the programa property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setPrograma(Short value) {
        this.programa = value;
    }

}
