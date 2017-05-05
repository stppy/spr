
package py.gov.stp.mh.consultas;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for productoFisico complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="productoFisico">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoNivel" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoEntidad" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="tipoPrograma" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoPrograma" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoSubprograma" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoProyecto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoProducto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="descripcionProducto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="unidadMedida" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="clase" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="meta1" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance1" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta2" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance2" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta3" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance3" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta4" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance4" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta5" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance5" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta6" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance6" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta7" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance7" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta8" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance8" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta9" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance9" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta10" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance10" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta11" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance11" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="meta12" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="avance12" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "productoFisico", propOrder = {
    "numeroFila",
    "codigoNivel",
    "codigoEntidad",
    "tipoPrograma",
    "codigoPrograma",
    "codigoSubprograma",
    "codigoProyecto",
    "codigoProducto",
    "descripcionProducto",
    "unidadMedida",
    "clase",
    "meta1",
    "avance1",
    "meta2",
    "avance2",
    "meta3",
    "avance3",
    "meta4",
    "avance4",
    "meta5",
    "avance5",
    "meta6",
    "avance6",
    "meta7",
    "avance7",
    "meta8",
    "avance8",
    "meta9",
    "avance9",
    "meta10",
    "avance10",
    "meta11",
    "avance11",
    "meta12",
    "avance12"
})
public class ProductoFisico {

    protected Integer numeroFila;
    protected Integer codigoNivel;
    protected Integer codigoEntidad;
    protected Integer tipoPrograma;
    protected Integer codigoPrograma;
    protected Integer codigoSubprograma;
    protected Integer codigoProyecto;
    protected Integer codigoProducto;
    protected String descripcionProducto;
    protected String unidadMedida;
    protected String clase;
    protected Double meta1;
    protected Double avance1;
    protected Double meta2;
    protected Double avance2;
    protected Double meta3;
    protected Double avance3;
    protected Double meta4;
    protected Double avance4;
    protected Double meta5;
    protected Double avance5;
    protected Double meta6;
    protected Double avance6;
    protected Double meta7;
    protected Double avance7;
    protected Double meta8;
    protected Double avance8;
    protected Double meta9;
    protected Double avance9;
    protected Double meta10;
    protected Double avance10;
    protected Double meta11;
    protected Double avance11;
    protected Double meta12;
    protected Double avance12;

    /**
     * Gets the value of the numeroFila property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNumeroFila() {
        return numeroFila;
    }

    /**
     * Sets the value of the numeroFila property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNumeroFila(Integer value) {
        this.numeroFila = value;
    }

    /**
     * Gets the value of the codigoNivel property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoNivel() {
        return codigoNivel;
    }

    /**
     * Sets the value of the codigoNivel property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoNivel(Integer value) {
        this.codigoNivel = value;
    }

    /**
     * Gets the value of the codigoEntidad property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoEntidad() {
        return codigoEntidad;
    }

    /**
     * Sets the value of the codigoEntidad property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoEntidad(Integer value) {
        this.codigoEntidad = value;
    }

    /**
     * Gets the value of the tipoPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getTipoPrograma() {
        return tipoPrograma;
    }

    /**
     * Sets the value of the tipoPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setTipoPrograma(Integer value) {
        this.tipoPrograma = value;
    }

    /**
     * Gets the value of the codigoPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoPrograma() {
        return codigoPrograma;
    }

    /**
     * Sets the value of the codigoPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoPrograma(Integer value) {
        this.codigoPrograma = value;
    }

    /**
     * Gets the value of the codigoSubprograma property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoSubprograma() {
        return codigoSubprograma;
    }

    /**
     * Sets the value of the codigoSubprograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoSubprograma(Integer value) {
        this.codigoSubprograma = value;
    }

    /**
     * Gets the value of the codigoProyecto property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoProyecto() {
        return codigoProyecto;
    }

    /**
     * Sets the value of the codigoProyecto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoProyecto(Integer value) {
        this.codigoProyecto = value;
    }

    /**
     * Gets the value of the codigoProducto property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoProducto() {
        return codigoProducto;
    }

    /**
     * Sets the value of the codigoProducto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoProducto(Integer value) {
        this.codigoProducto = value;
    }

    /**
     * Gets the value of the descripcionProducto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    /**
     * Sets the value of the descripcionProducto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionProducto(String value) {
        this.descripcionProducto = value;
    }

    /**
     * Gets the value of the unidadMedida property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnidadMedida() {
        return unidadMedida;
    }

    /**
     * Sets the value of the unidadMedida property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnidadMedida(String value) {
        this.unidadMedida = value;
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
     * Gets the value of the meta1 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta1() {
        return meta1;
    }

    /**
     * Sets the value of the meta1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta1(Double value) {
        this.meta1 = value;
    }

    /**
     * Gets the value of the avance1 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance1() {
        return avance1;
    }

    /**
     * Sets the value of the avance1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance1(Double value) {
        this.avance1 = value;
    }

    /**
     * Gets the value of the meta2 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta2() {
        return meta2;
    }

    /**
     * Sets the value of the meta2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta2(Double value) {
        this.meta2 = value;
    }

    /**
     * Gets the value of the avance2 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance2() {
        return avance2;
    }

    /**
     * Sets the value of the avance2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance2(Double value) {
        this.avance2 = value;
    }

    /**
     * Gets the value of the meta3 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta3() {
        return meta3;
    }

    /**
     * Sets the value of the meta3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta3(Double value) {
        this.meta3 = value;
    }

    /**
     * Gets the value of the avance3 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance3() {
        return avance3;
    }

    /**
     * Sets the value of the avance3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance3(Double value) {
        this.avance3 = value;
    }

    /**
     * Gets the value of the meta4 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta4() {
        return meta4;
    }

    /**
     * Sets the value of the meta4 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta4(Double value) {
        this.meta4 = value;
    }

    /**
     * Gets the value of the avance4 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance4() {
        return avance4;
    }

    /**
     * Sets the value of the avance4 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance4(Double value) {
        this.avance4 = value;
    }

    /**
     * Gets the value of the meta5 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta5() {
        return meta5;
    }

    /**
     * Sets the value of the meta5 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta5(Double value) {
        this.meta5 = value;
    }

    /**
     * Gets the value of the avance5 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance5() {
        return avance5;
    }

    /**
     * Sets the value of the avance5 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance5(Double value) {
        this.avance5 = value;
    }

    /**
     * Gets the value of the meta6 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta6() {
        return meta6;
    }

    /**
     * Sets the value of the meta6 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta6(Double value) {
        this.meta6 = value;
    }

    /**
     * Gets the value of the avance6 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance6() {
        return avance6;
    }

    /**
     * Sets the value of the avance6 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance6(Double value) {
        this.avance6 = value;
    }

    /**
     * Gets the value of the meta7 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta7() {
        return meta7;
    }

    /**
     * Sets the value of the meta7 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta7(Double value) {
        this.meta7 = value;
    }

    /**
     * Gets the value of the avance7 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance7() {
        return avance7;
    }

    /**
     * Sets the value of the avance7 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance7(Double value) {
        this.avance7 = value;
    }

    /**
     * Gets the value of the meta8 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta8() {
        return meta8;
    }

    /**
     * Sets the value of the meta8 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta8(Double value) {
        this.meta8 = value;
    }

    /**
     * Gets the value of the avance8 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance8() {
        return avance8;
    }

    /**
     * Sets the value of the avance8 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance8(Double value) {
        this.avance8 = value;
    }

    /**
     * Gets the value of the meta9 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta9() {
        return meta9;
    }

    /**
     * Sets the value of the meta9 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta9(Double value) {
        this.meta9 = value;
    }

    /**
     * Gets the value of the avance9 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance9() {
        return avance9;
    }

    /**
     * Sets the value of the avance9 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance9(Double value) {
        this.avance9 = value;
    }

    /**
     * Gets the value of the meta10 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta10() {
        return meta10;
    }

    /**
     * Sets the value of the meta10 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta10(Double value) {
        this.meta10 = value;
    }

    /**
     * Gets the value of the avance10 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance10() {
        return avance10;
    }

    /**
     * Sets the value of the avance10 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance10(Double value) {
        this.avance10 = value;
    }

    /**
     * Gets the value of the meta11 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta11() {
        return meta11;
    }

    /**
     * Sets the value of the meta11 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta11(Double value) {
        this.meta11 = value;
    }

    /**
     * Gets the value of the avance11 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance11() {
        return avance11;
    }

    /**
     * Sets the value of the avance11 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance11(Double value) {
        this.avance11 = value;
    }

    /**
     * Gets the value of the meta12 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getMeta12() {
        return meta12;
    }

    /**
     * Sets the value of the meta12 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setMeta12(Double value) {
        this.meta12 = value;
    }

    /**
     * Gets the value of the avance12 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAvance12() {
        return avance12;
    }

    /**
     * Sets the value of the avance12 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAvance12(Double value) {
        this.avance12 = value;
    }

}
