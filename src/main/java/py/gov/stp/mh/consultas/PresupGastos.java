
package py.gov.stp.mh.consultas;

import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for presupGastos complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="presupGastos">
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
 *         &lt;element name="codigoDpto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="codigoPais" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="aprobado" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="modificaciones" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vigente" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="planFinanciero" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="obligado" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="pagado" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="saldo" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "presupGastos", propOrder = {
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
    "codigoDpto",
    "codigoPais",
    "aprobado",
    "modificaciones",
    "vigente",
    "planFinanciero",
    "obligado",
    "pagado",
    "saldo"
})
public class PresupGastos {

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
    protected Integer codigoDpto;
    protected Integer codigoPais;
    protected Double aprobado;
    protected Double modificaciones;
    protected Double vigente;
    protected Double planFinanciero;
    protected Double obligado;
    protected Double pagado;
    protected Double saldo;
 

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
     * Gets the value of the codigoDpto property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCodigoDpto() {
        return codigoDpto;
    }

    /**
     * Sets the value of the codigoDpto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCodigoDpto(Integer value) {
        this.codigoDpto = value;
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
     * Gets the value of the aprobado property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAprobado() {
        return aprobado;
    }

    /**
     * Sets the value of the aprobado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAprobado(Double value) {
        this.aprobado = value;
    }

    /**
     * Gets the value of the modificaciones property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getModificaciones() {
        return modificaciones;
    }

    /**
     * Sets the value of the modificaciones property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setModificaciones(Double value) {
        this.modificaciones = value;
    }

    /**
     * Gets the value of the vigente property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVigente() {
        return vigente;
    }

    /**
     * Sets the value of the vigente property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVigente(Double value) {
        this.vigente = value;
    }

    /**
     * Gets the value of the planFinanciero property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPlanFinanciero() {
        return planFinanciero;
    }

    /**
     * Sets the value of the planFinanciero property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPlanFinanciero(Double value) {
        this.planFinanciero = value;
    }

    /**
     * Gets the value of the obligado property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getObligado() {
        return obligado;
    }

    /**
     * Sets the value of the obligado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setObligado(Double value) {
        this.obligado = value;
    }

    /**
     * Gets the value of the pagado property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPagado() {
        return pagado;
    }

    /**
     * Sets the value of the pagado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPagado(Double value) {
        this.pagado = value;
    }

    /**
     * Gets the value of the saldo property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getSaldo() {
        return saldo;
    }

    /**
     * Sets the value of the saldo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setSaldo(Double value) {
        this.saldo = value;
    }

}
