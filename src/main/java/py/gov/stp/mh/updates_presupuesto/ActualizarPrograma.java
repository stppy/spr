
package py.gov.stp.mh.updates_presupuesto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/

/**
 * <p>Java class for actualizarPrograma complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="actualizarPrograma">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="tipoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="changeNombrePrograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeAbrevPrograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeDescripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeBaseLegal" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeResultado" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeCodigoDepto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="changeObjetivo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeDiagnostico" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "actualizarPrograma", propOrder = {
    "anio",
    "nivel",
    "entidad",
    "tipoPrograma",
    "codigoPrograma",
    "changeNombrePrograma",
    "changeAbrevPrograma",
    "changeDescripcion",
    "changeBaseLegal",
    "changeResultado",
    "changeCodigoDepto",
    "changeObjetivo",
    "changeDiagnostico"
})
public class ActualizarPrograma {

    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Short tipoPrograma;
    protected Short codigoPrograma;
    protected String changeNombrePrograma;
    protected String changeAbrevPrograma;
    protected String changeDescripcion;
    protected String changeBaseLegal;
    protected String changeResultado;
    protected Short changeCodigoDepto;
    protected String changeObjetivo;
    protected String changeDiagnostico;

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
     * Gets the value of the changeNombrePrograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeNombrePrograma() {
        return changeNombrePrograma;
    }

    /**
     * Sets the value of the changeNombrePrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeNombrePrograma(String value) {
        this.changeNombrePrograma = value;
    }

    /**
     * Gets the value of the changeAbrevPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeAbrevPrograma() {
        return changeAbrevPrograma;
    }

    /**
     * Sets the value of the changeAbrevPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeAbrevPrograma(String value) {
        this.changeAbrevPrograma = value;
    }

    /**
     * Gets the value of the changeDescripcion property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeDescripcion() {
        return changeDescripcion;
    }

    /**
     * Sets the value of the changeDescripcion property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeDescripcion(String value) {
        this.changeDescripcion = value;
    }

    /**
     * Gets the value of the changeBaseLegal property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeBaseLegal() {
        return changeBaseLegal;
    }

    /**
     * Sets the value of the changeBaseLegal property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeBaseLegal(String value) {
        this.changeBaseLegal = value;
    }

    /**
     * Gets the value of the changeResultado property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeResultado() {
        return changeResultado;
    }

    /**
     * Sets the value of the changeResultado property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeResultado(String value) {
        this.changeResultado = value;
    }

    /**
     * Gets the value of the changeCodigoDepto property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getChangeCodigoDepto() {
        return changeCodigoDepto;
    }

    /**
     * Sets the value of the changeCodigoDepto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setChangeCodigoDepto(Short value) {
        this.changeCodigoDepto = value;
    }

    /**
     * Gets the value of the changeObjetivo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeObjetivo() {
        return changeObjetivo;
    }

    /**
     * Sets the value of the changeObjetivo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeObjetivo(String value) {
        this.changeObjetivo = value;
    }

    /**
     * Gets the value of the changeDiagnostico property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeDiagnostico() {
        return changeDiagnostico;
    }

    /**
     * Sets the value of the changeDiagnostico property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeDiagnostico(String value) {
        this.changeDiagnostico = value;
    }

}
