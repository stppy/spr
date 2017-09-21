CREATE OR REPLACE VIEW pivot_indicadores AS 
 SELECT nivel.id AS nivel_id,
	nivel.nombre AS nivel_nombre,
	nivel.abrev AS nivel_abrev,
	ent.id AS entidad_id, 
	ent.nombre AS entidad_nombre,
	ent.sigla AS entidad_sigla,
	ur.id AS unr_id,
	ur.nombre AS unr_nombre,
	ohi.objetivo_id AS objetivo_id,
	obj.nombre AS objetivo_nombre,
	obj.tipo_objetivo_id AS objetivo_tipo,
	tobj.nombre AS objetivo_tipo_nombre,
	ind.id AS indicador_id,
	ind.nombre AS indicador_nombre,
	ind.descripcion AS indicador_descripcion,
	ind.tipo_indicador_id AS indicador_tipo,                                                        
	ind.metodo_calculo_id AS indicador_metodo_calculo,
	ind.frecuencia_meses AS indicador_frecuencia_meses,
	ind.fecha_disponibilidad_informacion AS indicador_fecha_disponibilidad,
	ind.cobertura_geografica_alcance AS indicador_cobertura_geografica_id,
	cga.nombre AS indicador_cobertura_geografica_nombre,
	ind.nivel_despliegue_geografico AS indicador_despliegue_geografico_id,
	ndg.nombre AS indicador_despliegue_geografico_nombre,
	ind.cobertura_demografica_alcance AS indicador_cobertura_demografica_id,
	cda.nombre AS indicador_cobertura_demografica_nombre,
	ind.nivel_despliegue_demografica AS indicador_despliegue_demografica_id,
	ndd.nombre AS indicador_despliegue_demografica_nombre,
	ind.fuente_verificacion_id AS indicador_fuente_datos,
	ind.institucion_responsable_calculo_indicador AS indicador_institucion_responsable,
	ind.evaluacion_heci AS indicador_evaluacion_heci,
	ind.observaciones AS indicador_comentarios,
	ind.contacto AS indicador_contacto,
	meta.vencimiento AS fecha_metas_previstas,
	meta.cantidad AS cantidad_metas_previstas,
	ai.vencimiento AS fecha_avance,
	ai.cantidad AS cantidad_avance,
	ind.unidad_medida_id AS indicador_unidad_medida,
	um.nombre AS indicador_unidad_medida_nombre 
   FROM entidad ent
	JOIN nivel ON ent.nivel_id = nivel.id 
	JOIN unidad_responsable ur ON ur.entidad_id = ent.id AND ur.entidad_nivel_id = ent.nivel_id AND ur.entidad_nivel_id = nivel.id
	JOIN objetivo_has_indicador ohi ON nivel.id::text = split_part(ohi.producto_concat, '-'::text, 1)
			AND ent.id::text = split_part(ohi.producto_concat, '-'::text, 2)
			AND ohi.objetivo_tipo_objetivo_id = 2 AND ohi.indicador_tipo_indicador_id = 2
	JOIN objetivo obj ON obj.id = ohi.objetivo_id AND nivel.id::text = split_part(ohi.producto_concat, '-'::text, 1)
			AND ent.id::text = split_part(ohi.producto_concat, '-'::text, 2)
			AND obj.tipo_objetivo_id = 2
	JOIN tipo_objetivo tobj ON tobj.id = obj.tipo_objetivo_id AND tobj.id = 2 AND ohi.objetivo_tipo_objetivo_id = tobj.id 
	JOIN indicador ind ON ind.nivel = nivel.id AND ind.entidad = ent.id AND ind.id = ohi.indicador_id 
	LEFT JOIN cobertura_geografica_alcances cga ON ind.cobertura_geografica_alcance = cga.id
	LEFT JOIN cobertura_demografica_alcances cda ON ind.cobertura_demografica_alcance = cda.id
	LEFT JOIN nivel_despliegue_geografica_desagregaciones ndg ON ind.nivel_despliegue_geografico = ndg.id
	LEFT JOIN nivel_despliegue_demografica_desagregacion ndd ON ind.nivel_despliegue_demografica = ndd.id
	JOIN unidad_medida um ON ind.unidad_medida_id = um.id
	LEFT JOIN meta ON meta.nivel = ind.nivel AND meta.entidad = ind.entidad AND meta.indicador_id = ohi.indicador_id
	LEFT JOIN avance_indicador ai ON ai.indicador_id = ind.id 
			AND ai.nivel = ind.nivel
			AND ai.entidad = ind.entidad
  WHERE NOT nivel.borrado AND NOT ent.borrado AND NOT ur.borrado AND NOT obj.borrado AND NOT ind.borrado AND (ai.borrado = false or ai.borrado is null) AND (meta.borrado=FALSE or meta.borrado IS NULL)
  AND NOT um.borrado 
  ORDER BY nivel.id, ent.id, ur.id;
ALTER TABLE pivot_indicadores
  OWNER TO postgres;