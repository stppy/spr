
package py.gov.stp.mh.update_presupuesto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/

/**
 * <p>Java class for actualizarEntidad complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="actualizarEntidad">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="changeNombreEntidad" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeAbrevEntidad" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeSigla" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeRuc" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeBaseLegal" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeMision" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changePolitica" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
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
@XmlType(name = "actualizarEntidad", propOrder = {
    "anio",
    "nivel",
    "entidad",
    "changeNombreEntidad",
    "changeAbrevEntidad",
    "changeSigla",
    "changeRuc",
    "changeBaseLegal",
    "changeMision",
    "changePolitica",
    "changeObjetivo",
    "changeDiagnostico"
})
public class ActualizarEntidad {

    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected String changeNombreEntidad;
    protected String changeAbrevEntidad;
    protected String changeSigla;
    protected String changeRuc;
    protected String changeBaseLegal;
    protected String changeMision;
    protected String changePolitica;
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
     * Gets the value of the changeNombreEntidad property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeNombreEntidad() {
        return changeNombreEntidad;
    }

    /**
     * Sets the value of the changeNombreEntidad property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeNombreEntidad(String value) {
        this.changeNombreEntidad = value;
    }

    /**
     * Gets the value of the changeAbrevEntidad property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeAbrevEntidad() {
        return changeAbrevEntidad;
    }

    /**
     * Sets the value of the changeAbrevEntidad property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeAbrevEntidad(String value) {
        this.changeAbrevEntidad = value;
    }

    /**
     * Gets the value of the changeSigla property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeSigla() {
        return changeSigla;
    }

    /**
     * Sets the value of the changeSigla property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeSigla(String value) {
        this.changeSigla = value;
    }

    /**
     * Gets the value of the changeRuc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeRuc() {
        return changeRuc;
    }

    /**
     * Sets the value of the changeRuc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeRuc(String value) {
        this.changeRuc = value;
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
     * Gets the value of the changeMision property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeMision() {
        return changeMision;
    }

    /**
     * Sets the value of the changeMision property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeMision(String value) {
        this.changeMision = value;
    }

    /**
     * Gets the value of the changePolitica property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangePolitica() {
        return changePolitica;
    }

    /**
     * Sets the value of the changePolitica property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangePolitica(String value) {
        this.changePolitica = value;
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
