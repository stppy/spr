SELECT
	case when concat(ppm.nivel_id, '-', ppm.entidad_id) = '12-1' then ur.abrev else entidad.sigla end institucion,
	case
    when ppm.proyecto_id > 0 then pry.nombre
    when ppm.proyecto_id = 0 and ppm.subprograma_id > 0 then sub.nombre
    when ppm.proyecto_id = 0 and ppm.subprograma_id = 0 and ppm.programa_id > 0 then pro.nombre
		else null
	end nombre_programatico,
	concat(ppm.nivel_id, '-', ppm.entidad_id, '-', ppm.tipo_presupuesto_id, '-', ppm.programa_id, '-', ppm.subprograma_id, '-', ppm.proyecto_id, '-', ppm.producto_id) AS producto_concat,
	ppm.producto_id,
	prod.nombre,
	prod.clase,
	ppm.unidad_medida_id,
	prod.uni_nombre as unidad_medida_nombre,
	ppm.departamento_id,
	departamento.nombre as departamento_nombre,
	ppm.anho,
	ppm.mes,
	ppm.cantidad,
	ppm.version
FROM producto_presupuesto_meta ppm
	join producto_unidad_medida prod on prod.id = ppm.producto_id
	join departamento on departamento.id = ppm.departamento_id
	join proyecto pry on concat(pry.subprograma_programa_entidad_nivel_id, '-', pry.subprograma_programa_entidad_id, '-', pry.subprograma_programa_tipo_presupuesto_id, '-', pry.subprograma_programa_id, '-', pry.subprograma_id, '-', pry.id) = concat(ppm.nivel_id, '-', ppm.entidad_id, '-', ppm.tipo_presupuesto_id, '-', ppm.programa_id, '-', ppm.subprograma_id, '-', ppm.proyecto_id)
	join subprograma sub on concat(sub.programa_entidad_nivel_id, '-', sub.programa_entidad_id, '-', sub.programa_tipo_presupuesto_id, '-', sub.programa_id, '-', sub.id) = concat(ppm.nivel_id, '-', ppm.entidad_id, '-', ppm.tipo_presupuesto_id, '-', ppm.programa_id, '-', ppm.subprograma_id)
	join programa pro on concat(pro.entidad_nivel_id, '-', pro.entidad_id, '-', pro.tipo_presupuesto_id, '-', pro.id) = concat(ppm.nivel_id, '-', ppm.entidad_id, '-', ppm.tipo_presupuesto_id, '-', ppm.programa_id)
	join entidad on concat(entidad.nivel_id, '-', entidad.id) = concat(ppm.nivel_id, '-', ppm.entidad_id)
	join unidad_responsable ur on concat(ur.entidad_nivel_id, '-', ur.entidad_id, '-', ur.id) = concat(pry.subprograma_programa_entidad_nivel_id, '-', pry.subprograma_programa_entidad_id, '-', pry.unidad_responsable_id)
WHERE NOT ppm.borrado and not pry.borrado and not sub.borrado and not pro.borrado and not ur.borrado and not entidad.borrado AND cantidad > 0
ORDER BY producto_concat, ppm.departamento_id, ppm.anho, ppm.mes
;
