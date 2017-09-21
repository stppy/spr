
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for producto complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="producto">
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
 *         &lt;element name="codigoProyecto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoProducto" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="version" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoUnidadMedida" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="descripcion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="clase" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="metaEnero" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaFebrero" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaMarzo" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaAbril" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaMayo" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaJunio" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaJulio" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaAgosto" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaSetiembre" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaOctubre" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaNoviembre" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="metaDiciembre" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "producto", propOrder = {
    "numeroFila",
    "anio",
    "nivel",
    "entidad",
    "tipoPrograma",
    "codigoPrograma",
    "codigoSubprograma",
    "codigoProyecto",
    "codigoProducto",
    "version",
    "codigoUnidadMedida",
    "descripcion",
    "clase",
    "metaEnero",
    "metaFebrero",
    "metaMarzo",
    "metaAbril",
    "metaMayo",
    "metaJunio",
    "metaJulio",
    "metaAgosto",
    "metaSetiembre",
    "metaOctubre",
    "metaNoviembre",
    "metaDiciembre"
})
public class Producto {

    protected Short numeroFila;
    protected Short anio;
    protected Short nivel;
    protected Short entidad;
    protected Short tipoPrograma;
    protected Short codigoPrograma;
    protected Short codigoSubprograma;
    protected Short codigoProyecto;
    protected Short codigoProducto;
    protected Short version;
    protected Short codigoUnidadMedida;
    protected String descripcion;
    protected String clase;
    protected Double metaEnero;
    protected Double metaFebrero;
    protected Double metaMarzo;
    protected Double metaAbril;
    protected Double metaMayo;
    protected Double metaJunio;
    protected Double metaJulio;
    protected Double metaAgosto;
    protected Double metaSetiembre;
    protected Double metaOctubre;
    protected Double metaNoviembre;
    protected Double metaDiciembre;

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
     * Gets the value of the codigoProducto property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoProducto() {
        return codigoProducto;
    }

    /**
     * Sets the value of the codigoProducto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoProducto(Short value) {
        this.codigoProducto = value;
    }

    /**
     * Gets the value of the version property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getVersion() {
        return version;
    }

    /**
     * Sets the value of the version property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setVersion(Short value) {
        this.version = value;
    }

    /**
     * Gets the value of the codigoUnidadMedida property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoUnidadMedida() {
        return codigoUnidadMedida;
    }

    /**
     * Sets the value of the codigoUnidadMedida property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoUnidadMedida(Short value) {
        this.codigoUnidadMedida = value;
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

    /**
     * Gets the value of the metaEnero property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaEnero() {
        return metaEnero;
    }

    /**
     * Sets the value of the metaEnero property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaEnero(Double value) {
        this.metaEnero = value;
    }

    /**
     * Gets the value of the metaFebrero property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaFebrero() {
        return metaFebrero;
    }

    /**
     * Sets the value of the metaFebrero property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaFebrero(Double value) {
        this.metaFebrero = value;
    }

    /**
     * Gets the value of the metaMarzo property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaMarzo() {
        return metaMarzo;
    }

    /**
     * Sets the value of the metaMarzo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaMarzo(Double value) {
        this.metaMarzo = value;
    }

    /**
     * Gets the value of the metaAbril property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaAbril() {
        return metaAbril;
    }

    /**
     * Sets the value of the metaAbril property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaAbril(Double value) {
        this.metaAbril = value;
    }

    /**
     * Gets the value of the metaMayo property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaMayo() {
        return metaMayo;
    }

    /**
     * Sets the value of the metaMayo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaMayo(Double value) {
        this.metaMayo = value;
    }

    /**
     * Gets the value of the metaJunio property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaJunio() {
        return metaJunio;
    }

    /**
     * Sets the value of the metaJunio property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaJunio(Double value) {
        this.metaJunio = value;
    }

    /**
     * Gets the value of the metaJulio property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaJulio() {
        return metaJulio;
    }

    /**
     * Sets the value of the metaJulio property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaJulio(Double value) {
        this.metaJulio = value;
    }

    /**
     * Gets the value of the metaAgosto property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaAgosto() {
        return metaAgosto;
    }

    /**
     * Sets the value of the metaAgosto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaAgosto(Double value) {
        this.metaAgosto = value;
    }

    /**
     * Gets the value of the metaSetiembre property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaSetiembre() {
        return metaSetiembre;
    }

    /**
     * Sets the value of the metaSetiembre property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaSetiembre(Double value) {
        this.metaSetiembre = value;
    }

    /**
     * Gets the value of the metaOctubre property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaOctubre() {
        return metaOctubre;
    }

    /**
     * Sets the value of the metaOctubre property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaOctubre(Double value) {
        this.metaOctubre = value;
    }

    /**
     * Gets the value of the metaNoviembre property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaNoviembre() {
        return metaNoviembre;
    }

    /**
     * Sets the value of the metaNoviembre property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaNoviembre(Double value) {
        this.metaNoviembre = value;
    }

    /**
     * Gets the value of the metaDiciembre property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMetaDiciembre() {
        return metaDiciembre;
    }

    /**
     * Sets the value of the metaDiciembre property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMetaDiciembre(Double value) {
        this.metaDiciembre = value;
    }

}
