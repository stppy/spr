
package py.gov.stp.mh.clasificadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
@author		DGTIC-STP
@email      dgtic@stp.gov.py
*/

/**
 * <p>Java class for departamento complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="departamento">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroFila" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="codigoPais" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="deptoPais" type="{http://www.w3.org/2001/XMLSchema}short" minOccurs="0"/>
 *         &lt;element name="nombreDepartamento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abrevDepartamento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "departamento", propOrder = {
    "numeroFila",
    "codigoPais",
    "deptoPais",
    "nombreDepartamento",
    "abrevDepartamento"
})
public class Departamento {

    protected Short numeroFila;
    protected Short codigoPais;
    protected Short deptoPais;
    protected String nombreDepartamento;
    protected String abrevDepartamento;

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
     * Gets the value of the codigoPais property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getCodigoPais() {
        return codigoPais;
    }

    /**
     * Sets the value of the codigoPais property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setCodigoPais(Short value) {
        this.codigoPais = value;
    }

    /**
     * Gets the value of the deptoPais property.
     * 
     * @return
     *     possible object is
     *     {@link Short }
     *     
     */
    public Short getDeptoPais() {
        return deptoPais;
    }

    /**
     * Sets the value of the deptoPais property.
     * 
     * @param value
     *     allowed object is
     *     {@link Short }
     *     
     */
    public void setDeptoPais(Short value) {
        this.deptoPais = value;
    }

    /**
     * Gets the value of the nombreDepartamento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    /**
     * Sets the value of the nombreDepartamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreDepartamento(String value) {
        this.nombreDepartamento = value;
    }

    /**
     * Gets the value of the abrevDepartamento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbrevDepartamento() {
        return abrevDepartamento;
    }

    /**
     * Sets the value of the abrevDepartamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbrevDepartamento(String value) {
        this.abrevDepartamento = value;
    }

}
