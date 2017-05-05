
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for ingresoOrigen complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ingresoOrigen">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codOrigen" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nombreAbrev" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="imputable" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ingresoOrigen", propOrder = {
    "codOrigen",
    "nombre",
    "nombreAbrev",
    "imputable"
})
public class IngresoOrigen {

    protected Integer codOrigen;
    protected String nombre;
    protected String nombreAbrev;
    protected String imputable;

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
     * Gets the value of the nombre property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Sets the value of the nombre property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombre(String value) {
        this.nombre = value;
    }

    /**
     * Gets the value of the nombreAbrev property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreAbrev() {
        return nombreAbrev;
    }

    /**
     * Sets the value of the nombreAbrev property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreAbrev(String value) {
        this.nombreAbrev = value;
    }

    /**
     * Gets the value of the imputable property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getImputable() {
        return imputable;
    }

    /**
     * Sets the value of the imputable property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setImputable(String value) {
        this.imputable = value;
    }

}
