
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
 * <p>Java class for actualizarProyecto complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="actualizarProyecto">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="tipoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoSubprograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoProyecto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="changeUnrCodigo" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="changeNombreProyecto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeAbrevProyecto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeDescripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeCodigoDepto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="changeResultadoEsperado" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeDiagnostico" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="changeCodigoFuncional" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "actualizarProyecto", propOrder = {
    "anio",
    "nivel",
    "entidad",
    "tipoPrograma",
    "codigoPrograma",
    "codigoSubprograma",
    "codigoProyecto",
    "changeUnrCodigo",
    "changeNombreProyecto",
    "changeAbrevProyecto",
    "changeDescripcion",
    "changeCodigoDepto",
    "changeResultadoEsperado",
    "changeDiagnostico",
    "changeCodigoFuncional"
})
public class ActualizarProyecto {

    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Short tipoPrograma;
    protected Short codigoPrograma;
    protected Short codigoSubprograma;
    protected Short codigoProyecto;
    protected Short changeUnrCodigo;
    protected String changeNombreProyecto;
    protected String changeAbrevProyecto;
    protected String changeDescripcion;
    protected Short changeCodigoDepto;
    protected String changeResultadoEsperado;
    protected String changeDiagnostico;
    protected Short changeCodigoFuncional;

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
     * Gets the value of the codigoProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoProyecto() {
        return codigoProyecto;
    }

    /**
     * Sets the value of the codigoProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoProyecto(Short value) {
        this.codigoProyecto = value;
    }

    /**
     * Gets the value of the changeUnrCodigo property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getChangeUnrCodigo() {
        return changeUnrCodigo;
    }

    /**
     * Sets the value of the changeUnrCodigo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setChangeUnrCodigo(Short value) {
        this.changeUnrCodigo = value;
    }

    /**
     * Gets the value of the changeNombreProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeNombreProyecto() {
        return changeNombreProyecto;
    }

    /**
     * Sets the value of the changeNombreProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeNombreProyecto(String value) {
        this.changeNombreProyecto = value;
    }

    /**
     * Gets the value of the changeAbrevProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeAbrevProyecto() {
        return changeAbrevProyecto;
    }

    /**
     * Sets the value of the changeAbrevProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeAbrevProyecto(String value) {
        this.changeAbrevProyecto = value;
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
     * Gets the value of the changeResultadoEsperado property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChangeResultadoEsperado() {
        return changeResultadoEsperado;
    }

    /**
     * Sets the value of the changeResultadoEsperado property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChangeResultadoEsperado(String value) {
        this.changeResultadoEsperado = value;
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

    /**
     * Gets the value of the changeCodigoFuncional property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getChangeCodigoFuncional() {
        return changeCodigoFuncional;
    }

    /**
     * Sets the value of the changeCodigoFuncional property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setChangeCodigoFuncional(Short value) {
        this.changeCodigoFuncional = value;
    }

}
