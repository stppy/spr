
package py.gov.stp.mh.inserts_presupuesto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for insertarProyecto complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="insertarProyecto">
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
 *         &lt;element name="unrCodigo" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombreProyecto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abrevProyecto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="descripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codigoDepto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="resultadoEsperado" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="diagnostico" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codigoFuncional" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "insertarProyecto", propOrder = {
    "anio",
    "nivel",
    "entidad",
    "tipoPrograma",
    "codigoPrograma",
    "codigoSubprograma",
    "codigoProyecto",
    "unrCodigo",
    "nombreProyecto",
    "abrevProyecto",
    "descripcion",
    "codigoDepto",
    "resultadoEsperado",
    "diagnostico",
    "codigoFuncional"
})
public class InsertarProyecto {

    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Short tipoPrograma;
    protected Short codigoPrograma;
    protected Short codigoSubprograma;
    protected Short codigoProyecto;
    protected Short unrCodigo;
    protected String nombreProyecto;
    protected String abrevProyecto;
    protected String descripcion;
    protected Short codigoDepto;
    protected String resultadoEsperado;
    protected String diagnostico;
    protected Short codigoFuncional;

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
     * Gets the value of the nombreProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    /**
     * Sets the value of the nombreProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreProyecto(String value) {
        this.nombreProyecto = value;
    }

    /**
     * Gets the value of the abrevProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbrevProyecto() {
        return abrevProyecto;
    }

    /**
     * Sets the value of the abrevProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbrevProyecto(String value) {
        this.abrevProyecto = value;
    }

    /**
     * Gets the value of the descripcion property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Sets the value of the descripcion property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcion(String value) {
        this.descripcion = value;
    }

    /**
     * Gets the value of the codigoDepto property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoDepto() {
        return codigoDepto;
    }

    /**
     * Sets the value of the codigoDepto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoDepto(Short value) {
        this.codigoDepto = value;
    }

    /**
     * Gets the value of the resultadoEsperado property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getResultadoEsperado() {
        return resultadoEsperado;
    }

    /**
     * Sets the value of the resultadoEsperado property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setResultadoEsperado(String value) {
        this.resultadoEsperado = value;
    }

    /**
     * Gets the value of the diagnostico property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDiagnostico() {
        return diagnostico;
    }

    /**
     * Sets the value of the diagnostico property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDiagnostico(String value) {
        this.diagnostico = value;
    }

    /**
     * Gets the value of the codigoFuncional property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoFuncional() {
        return codigoFuncional;
    }

    /**
     * Sets the value of the codigoFuncional property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoFuncional(Short value) {
        this.codigoFuncional = value;
    }

}
