package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class CatalogoDestinatario {

	 	protected int  id;
	 	protected String nombre;
	 	protected String descripcion;
	 	protected int  tipo_catalogo_destianatario_id;
	    protected boolean borrado;

		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		public String getDescripcion() {
			return descripcion;
		}
		public void setDescripcion(String descripcion) {
			this.descripcion = descripcion;
		}
		public int getTipo_catalogo_destianatario_id() {
			return tipo_catalogo_destianatario_id;
		}
		public void setTipo_catalogo_destianatario_id(int tipo_catalogo_destianatario_id) {
			this.tipo_catalogo_destianatario_id = tipo_catalogo_destianatario_id;
		}
		public boolean isBorrado() {
	        return borrado;
	    }
	    public void setBorrado(boolean borrado) {
	        this.borrado = borrado;
	    }
	    public void changeBorrado(){
	        this.borrado=!borrado;
	    }

}
