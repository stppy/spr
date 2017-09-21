
package py.gov.stp.mh.clasificadores;

import java.sql.Timestamp;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for programa complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="programa">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="anio" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nivel" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="entidad" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="tipoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPrograma" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombrePrograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abrevPrograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="descripcionPrograma" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="objetivo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="diagnostico" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="baseLegal" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codigoDepartamento" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="borrado" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "programa", propOrder = {
    "numeroFila",
    "anio",
    "nivel",
    "entidad",
    "tipoPrograma",
    "codigoPrograma",
    "nombrePrograma",
    "abrevPrograma",
    "descripcionPrograma",
    "objetivo",
    "diagnostico",
    "baseLegal",
    "resultado",
    "codigoDepartamento",
    "borrado",
    "fechaActualizacion"
})
public class Programa {

    protected Short numeroFila=0;
    protected Short anio=2017;
    protected Short nivel;
    protected Short entidad;
    protected Short tipoPrograma;
    protected Short codigoPrograma;
    protected String nombrePrograma;
    protected String abrevPrograma;
    protected String descripcionPrograma="";
    protected String objetivo;
    protected String diagnostico;
    protected String baseLegal;
    protected String resultado="";
    protected Short codigoDepartamento;
    protected boolean borrado=false;
    protected Timestamp fechaActualizacion;
    
    
    /**
     * Gets the value of the borrado property.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public boolean isBorrado() {
		return borrado;
	}

    /**
     * Sets the value of the borrado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	/**
     * Sets the value of the borrado property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
	public void changeBorrado(){
		this.borrado=!borrado;
	}
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
     * Gets the value of the nombrePrograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombrePrograma() {
        return nombrePrograma;
    }

    /**
     * Sets the value of the nombrePrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombrePrograma(String value) {
        this.nombrePrograma = value;
    }

    /**
     * Gets the value of the abrevPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbrevPrograma() {
        return abrevPrograma;
    }

    /**
     * Sets the value of the abrevPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbrevPrograma(String value) {
        this.abrevPrograma = value;
    }

    /**
     * Gets the value of the descripcionPrograma property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionPrograma() {
        return descripcionPrograma;
    }

    /**
     * Sets the value of the descripcionPrograma property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionPrograma(String value) {
        this.descripcionPrograma = value;
    }

    /**
     * Gets the value of the objetivo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getObjetivo() {
        return objetivo;
    }

    /**
     * Sets the value of the objetivo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setObjetivo(String value) {
        this.objetivo = value;
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
     * Gets the value of the baseLegal property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBaseLegal() {
        return baseLegal;
    }

    /**
     * Sets the value of the baseLegal property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBaseLegal(String value) {
        this.baseLegal = value;
    }

    /**
     * Gets the value of the resultado property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getResultado() {
        return resultado;
    }

    /**
     * Sets the value of the resultado property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setResultado(String value) {
        this.resultado = value;
    }

    /**
     * Gets the value of the codigoDepartamento property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoDepartamento() {
        return codigoDepartamento;
    }

    /**
     * Sets the value of the codigoDepartamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoDepartamento(Short value) {
        this.codigoDepartamento = value;
    }
   
    /**
     * Gets the value of the fechaActualizacion property.
     * 
     * @return
     *     possible object is
     *     {@link DateTime }
     *     
     */
	public Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	 
    /**
     * Sets the value of the fechaActualizacion property.
     * 
     * @param value
     *     allowed object is
     *     {@link DateTime }
     *     
     */
	public void setFechaActualizacion(Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
    
}
