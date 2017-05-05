/**
 * @author Rafael Palau
 * @version 1
 * @since cloro
 */

-- ALTER TABLE programa ADD COLUMN version integer DEFAULT 3;
-- ALTER TABLE programa DROP CONSTRAINT uni_programa;
-- ALTER TABLE programa  ADD CONSTRAINT uni_programa UNIQUE(id, tipo_presupuesto_id, entidad_id, entidad_nivel_id, version);

-- ALTER TABLE subprograma ALTER COLUMN version SET DEFAULT 3;
-- ALTER TABLE subprograma DROP CONSTRAINT uni_subprograma;
-- ALTER TABLE subprograma  ADD CONSTRAINT uni_subprograma UNIQUE(id,programa_id, programa_tipo_presupuesto_id, programa_entidad_id, programa_entidad_nivel_id, version);  

 
-- ALTER TABLE proyecto ALTER COLUMN version SET DEFAULT 3;
-- ALTER TABLE proyecto DROP CONSTRAINT uni_proyecto;
-- ALTER TABLE proyecto ADD CONSTRAINT uni_proyecto UNIQUE(id, subprograma_id, subprograma_programa_id, subprograma_programa_tipo_presupuesto_id, subprograma_programa_entidad_id, subprograma_programa_entidad_nivel_id, unidad_responsable_id, funcional_id, version);

-- ALTER TABLE producto_presupusto ALTER COLUMN version SET DEFAULT 3;
-- ALTER TABLE producto_presupusto  DROP CONSTRAINT uni_producto_presupusto ;
-- ALTER TABLE producto_presupusto   ADD CONSTRAINT uni_producto_presupusto  UNIQUE(id, producto_id, producto_unidad_medida_id, proyecto_id, proyecto_subprograma_id, proyecto_subprograma_programa_id, proyecto_subprograma_programa_tipo_presupuesto_id, proyecto_subprograma_programa_entidad_id, proyecto_subprograma_programa_entidad_nivel_id,version);
