
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for catalogoProductoMeta complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="catalogoProductoMeta">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codigoCatalogo" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombreCatalogo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codUnidadMedida" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="clase" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "catalogoProductoMeta", propOrder = {
    "codigoCatalogo",
    "nombreCatalogo",
    "codUnidadMedida",
    "clase"
})
public class CatalogoProductoMeta {

    protected Short codigoCatalogo;
    protected String nombreCatalogo;
    protected Short codUnidadMedida;
    protected String clase;

    /**
     * Gets the value of the codigoCatalogo property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoCatalogo() {
        return codigoCatalogo;
    }

    /**
     * Sets the value of the codigoCatalogo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoCatalogo(Short value) {
        this.codigoCatalogo = value;
    }

    /**
     * Gets the value of the nombreCatalogo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreCatalogo() {
        return nombreCatalogo;
    }

    /**
     * Sets the value of the nombreCatalogo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreCatalogo(String value) {
        this.nombreCatalogo = value;
    }

    /**
     * Gets the value of the codUnidadMedida property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodUnidadMedida() {
        return codUnidadMedida;
    }

    /**
     * Sets the value of the codUnidadMedida property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodUnidadMedida(Short value) {
        this.codUnidadMedida = value;
    }

    /**
     * Gets the value of the clase property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getClase() {
        return clase;
    }

    /**
     * Sets the value of the clase property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setClase(String value) {
        this.clase = value;
    }

}
