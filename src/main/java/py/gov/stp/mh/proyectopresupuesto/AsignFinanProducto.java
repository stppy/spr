
package py.gov.stp.mh.proyectopresupuesto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for asignFinanProducto complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="asignFinanProducto">
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
 *         &lt;element name="codigoObjetoGasto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoFuenteFinan" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoOrgFinanciador" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoPais" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoDepartamento" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoProducto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="observacion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="planificado1" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado1" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado2" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado2" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado3" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado3" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado4" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado4" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado5" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado5" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado6" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado6" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado7" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado7" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado8" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado8" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado9" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado9" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado10" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado10" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado11" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado11" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planificado12" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="ejecutado12" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "asignFinanProducto", propOrder = {
    "numeroFila",
    "codigoNivel",
    "codigoEntidad",
    "tipoPrograma",
    "codigoPrograma",
    "codigoSubprograma",
    "codigoProyecto",
    "codigoObjetoGasto",
    "codigoFuenteFinan",
    "codigoOrgFinanciador",
    "codigoPais",
    "codigoDepartamento",
    "codigoProducto",
    "observacion",
    "planificado1",
    "ejecutado1",
    "planificado2",
    "ejecutado2",
    "planificado3",
    "ejecutado3",
    "planificado4",
    "ejecutado4",
    "planificado5",
    "ejecutado5",
    "planificado6",
    "ejecutado6",
    "planificado7",
    "ejecutado7",
    "planificado8",
    "ejecutado8",
    "planificado9",
    "ejecutado9",
    "planificado10",
    "ejecutado10",
    "planificado11",
    "ejecutado11",
    "planificado12",
    "ejecutado12"
})
public class AsignFinanProducto {

    protected Integer numeroFila;
    protected Integer codigoNivel;
    protected Integer codigoEntidad;
    protected Integer tipoPrograma;
    protected Integer codigoPrograma;
    protected Integer codigoSubprograma;
    protected Integer codigoProyecto;
    protected Integer codigoObjetoGasto;
    protected Integer codigoFuenteFinan;
    protected Integer codigoOrgFinanciador;
    protected Integer codigoPais;
    protected Integer codigoDepartamento;
    protected Integer codigoProducto;
    protected String observacion;
    protected Double planificado1;
    protected Double ejecutado1;
    protected Double planificado2;
    protected Double ejecutado2;
    protected Double planificado3;
    protected Double ejecutado3;
    protected Double planificado4;
    protected Double ejecutado4;
    protected Double planificado5;
    protected Double ejecutado5;
    protected Double planificado6;
    protected Double ejecutado6;
    protected Double planificado7;
    protected Double ejecutado7;
    protected Double planificado8;
    protected Double ejecutado8;
    protected Double planificado9;
    protected Double ejecutado9;
    protected Double planificado10;
    protected Double ejecutado10;
    protected Double planificado11;
    protected Double ejecutado11;
    protected Double planificado12;
    protected Double ejecutado12;

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
     * Gets the value of the codigoObjetoGasto property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoObjetoGasto() {
        return codigoObjetoGasto;
    }

    /**
     * Sets the value of the codigoObjetoGasto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoObjetoGasto(Integer value) {
        this.codigoObjetoGasto = value;
    }

    /**
     * Gets the value of the codigoFuenteFinan property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoFuenteFinan() {
        return codigoFuenteFinan;
    }

    /**
     * Sets the value of the codigoFuenteFinan property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoFuenteFinan(Integer value) {
        this.codigoFuenteFinan = value;
    }

    /**
     * Gets the value of the codigoOrgFinanciador property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoOrgFinanciador() {
        return codigoOrgFinanciador;
    }

    /**
     * Sets the value of the codigoOrgFinanciador property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoOrgFinanciador(Integer value) {
        this.codigoOrgFinanciador = value;
    }

    /**
     * Gets the value of the codigoPais property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoPais() {
        return codigoPais;
    }

    /**
     * Sets the value of the codigoPais property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoPais(Integer value) {
        this.codigoPais = value;
    }

    /**
     * Gets the value of the codigoDepartamento property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoDepartamento() {
        return codigoDepartamento;
    }

    /**
     * Sets the value of the codigoDepartamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoDepartamento(Integer value) {
        this.codigoDepartamento = value;
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
     * Gets the value of the observacion property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getObservacion() {
        return observacion;
    }

    /**
     * Sets the value of the observacion property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setObservacion(String value) {
        this.observacion = value;
    }

    /**
     * Gets the value of the planificado1 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado1() {
        return planificado1;
    }

    /**
     * Sets the value of the planificado1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado1(Double value) {
        this.planificado1 = value;
    }

    /**
     * Gets the value of the ejecutado1 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado1() {
        return ejecutado1;
    }

    /**
     * Sets the value of the ejecutado1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado1(Double value) {
        this.ejecutado1 = value;
    }

    /**
     * Gets the value of the planificado2 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado2() {
        return planificado2;
    }

    /**
     * Sets the value of the planificado2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado2(Double value) {
        this.planificado2 = value;
    }

    /**
     * Gets the value of the ejecutado2 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado2() {
        return ejecutado2;
    }

    /**
     * Sets the value of the ejecutado2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado2(Double value) {
        this.ejecutado2 = value;
    }

    /**
     * Gets the value of the planificado3 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado3() {
        return planificado3;
    }

    /**
     * Sets the value of the planificado3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado3(Double value) {
        this.planificado3 = value;
    }

    /**
     * Gets the value of the ejecutado3 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado3() {
        return ejecutado3;
    }

    /**
     * Sets the value of the ejecutado3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado3(Double value) {
        this.ejecutado3 = value;
    }

    /**
     * Gets the value of the planificado4 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado4() {
        return planificado4;
    }

    /**
     * Sets the value of the planificado4 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado4(Double value) {
        this.planificado4 = value;
    }

    /**
     * Gets the value of the ejecutado4 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado4() {
        return ejecutado4;
    }

    /**
     * Sets the value of the ejecutado4 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado4(Double value) {
        this.ejecutado4 = value;
    }

    /**
     * Gets the value of the planificado5 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado5() {
        return planificado5;
    }

    /**
     * Sets the value of the planificado5 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado5(Double value) {
        this.planificado5 = value;
    }

    /**
     * Gets the value of the ejecutado5 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado5() {
        return ejecutado5;
    }

    /**
     * Sets the value of the ejecutado5 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado5(Double value) {
        this.ejecutado5 = value;
    }

    /**
     * Gets the value of the planificado6 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado6() {
        return planificado6;
    }

    /**
     * Sets the value of the planificado6 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado6(Double value) {
        this.planificado6 = value;
    }

    /**
     * Gets the value of the ejecutado6 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado6() {
        return ejecutado6;
    }

    /**
     * Sets the value of the ejecutado6 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado6(Double value) {
        this.ejecutado6 = value;
    }

    /**
     * Gets the value of the planificado7 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado7() {
        return planificado7;
    }

    /**
     * Sets the value of the planificado7 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado7(Double value) {
        this.planificado7 = value;
    }

    /**
     * Gets the value of the ejecutado7 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado7() {
        return ejecutado7;
    }

    /**
     * Sets the value of the ejecutado7 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado7(Double value) {
        this.ejecutado7 = value;
    }

    /**
     * Gets the value of the planificado8 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado8() {
        return planificado8;
    }

    /**
     * Sets the value of the planificado8 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado8(Double value) {
        this.planificado8 = value;
    }

    /**
     * Gets the value of the ejecutado8 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado8() {
        return ejecutado8;
    }

    /**
     * Sets the value of the ejecutado8 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado8(Double value) {
        this.ejecutado8 = value;
    }

    /**
     * Gets the value of the planificado9 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado9() {
        return planificado9;
    }

    /**
     * Sets the value of the planificado9 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado9(Double value) {
        this.planificado9 = value;
    }

    /**
     * Gets the value of the ejecutado9 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado9() {
        return ejecutado9;
    }

    /**
     * Sets the value of the ejecutado9 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado9(Double value) {
        this.ejecutado9 = value;
    }

    /**
     * Gets the value of the planificado10 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado10() {
        return planificado10;
    }

    /**
     * Sets the value of the planificado10 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado10(Double value) {
        this.planificado10 = value;
    }

    /**
     * Gets the value of the ejecutado10 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado10() {
        return ejecutado10;
    }

    /**
     * Sets the value of the ejecutado10 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado10(Double value) {
        this.ejecutado10 = value;
    }

    /**
     * Gets the value of the planificado11 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado11() {
        return planificado11;
    }

    /**
     * Sets the value of the planificado11 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado11(Double value) {
        this.planificado11 = value;
    }

    /**
     * Gets the value of the ejecutado11 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado11() {
        return ejecutado11;
    }

    /**
     * Sets the value of the ejecutado11 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado11(Double value) {
        this.ejecutado11 = value;
    }

    /**
     * Gets the value of the planificado12 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanificado12() {
        return planificado12;
    }

    /**
     * Sets the value of the planificado12 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanificado12(Double value) {
        this.planificado12 = value;
    }

    /**
     * Gets the value of the ejecutado12 property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getEjecutado12() {
        return ejecutado12;
    }

    /**
     * Sets the value of the ejecutado12 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setEjecutado12(Double value) {
        this.ejecutado12 = value;
    }

}
