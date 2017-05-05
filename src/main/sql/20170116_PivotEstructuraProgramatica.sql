CREATE OR REPLACE VIEW pivot_estructura_programatica AS 
SELECT  nivel.id AS nivel_id,
	nivel.nombre AS nivel_nombre,
	nivel.abrev AS nivel_abrev,
	ent.id AS entidad_id,
	ent.nombre AS entidad_nombre,
	ent.sigla AS entidad_sigla,
	prog.tipo_presupuesto_id AS tipo_presu_id,
	tp.nombre AS tipo_presu_nombre,
	prog.id AS programa_id,
	prog.nombre AS programa_nombre,
	prog.diagnostico AS programa_diagnostico,
	prog.objetivo AS programa_objetivo,
	prog.base_legal AS programa_base_legal,
	prog.codigodepartamento AS programa_depto,
	subprog.id AS subprograma_id,
	subprog.nombre AS subprograma_nombre,
	subprog.objetivo AS subprograma_objetivo,
	subprog.baselegal AS subprograma_baselegal,
	subprog.codigo_departamento AS subprograma_departamento,
	proye.id AS proyecto_id,
	proye.nombre AS proyecto_nombre,
	proye.diagnostico AS proyecto_diagnostico,
	proye.objetivo_estrategico_id AS proyecto_objetivo,
	obj.nombre AS proyecto_objetivo_nombre,
	eho.estrategia_eje_estrategico_id AS eje_estrategico_id, 
	ee.nombre AS eje_estrategico_nombre,
	eho.estrategia_linea_transversal_id AS linea_transversal_id, 
	lt.nombre as linea_transversal_nombre,
	eho.estrategia_id AS estrategia_id,
	est.nombre AS estrategia_nombre,
	proye.unidad_responsable_id AS unidad_responsable_id,
	ur.nombre AS unidad_responsable_nombre,
	fin_fun1.finalidad as finalidad_id,
	fin_fun2.nombre as finalidad,
	fin_fun1.funcion as funcion_id,
	fin_fun3.nombre as funcion,
	psnip_aut.id AS snip_autorizado_id,
	proyecto_snip.nombre AS snip_autorizado_nombre,
	proye.codigo_departamento AS proyecto_depto,
	pp.producto_id AS producto_id,
	pphe.producto_concat,
	p.nombre AS producto_nombre,
	pp.producto_unidad_medida_id AS producto_unidad_medida_id,
	um.nombre AS unidad_medida_nombre,
	pp.intermedio AS producto_intermedio,
	p.clase AS producto_clase,
	--p.anho AS producto_anho,
	--ppm.mes AS producto_mes,
	--ppm.cantidad AS producto_cantidad,
	pphe.id AS producto_etiqueta_id,
	etiquetas.nombre AS producto_etiqueta_nombre
FROM nivel
	JOIN entidad ent ON ent.nivel_id = nivel.id
	JOIN programa prog ON prog.entidad_id = ent.id AND prog.entidad_nivel_id = nivel.id
	JOIN tipo_presupuesto tp ON tp.id = prog.tipo_presupuesto_id
	JOIN subprograma subprog ON subprog.programa_id = prog.id AND subprog.programa_entidad_id = ent.id AND subprog.programa_entidad_nivel_id = nivel.id
	JOIN proyecto proye ON proye.subprograma_id = subprog.id AND proye.subprograma_programa_id = prog.id AND proye.subprograma_programa_entidad_id = ent.id and proye.subprograma_programa_entidad_nivel_id = nivel.id
	LEFT JOIN objetivo_has_objetivo rev ON rev.nivel = proye.subprograma_programa_entidad_nivel_id 
					AND rev.entidad = proye.subprograma_programa_entidad_id 
					AND rev.tipo_presupuesto = proye.subprograma_programa_tipo_presupuesto_id
					AND rev.programa = proye.subprograma_programa_id 
					AND rev.subprograma = proye.subprograma_id 
					AND rev.proyecto = proye.id 
					AND rev.objetivo_rel_tipo_objetivo_id = 1 
					AND rev.objetivo_tipo_objetivo_id = 2	
	LEFT JOIN objetivo obj ON rev.objetivo_rel_id = obj.id and 
				obj.id = proye.objetivo_estrategico_id AND obj.tipo_objetivo_id = 1  
	LEFT JOIN estrategia_has_objetivo eho ON eho.objetivo_id = proye.objetivo_estrategico_id AND eho.objetivo_tipo_objetivo_id = 1
	LEFT JOIN estrategia est on est.id = eho.estrategia_id AND est.eje_estrategico_id = eho.estrategia_eje_estrategico_id AND est.linea_transversal_id = eho.estrategia_linea_transversal_id
	LEFT JOIN eje_estrategico ee on ee.id = eho.estrategia_eje_estrategico_id and ee.id = est.eje_estrategico_id
	LEFT JOIN linea_transversal lt on lt.id = eho.estrategia_linea_transversal_id and lt.id = est.linea_transversal_id
	LEFT JOIN unidad_responsable ur ON ur.id = proye.unidad_responsable_id and ur.entidad_id = proye.subprograma_programa_entidad_id and ur.entidad_nivel_id = proye.subprograma_programa_entidad_nivel_id
	LEFT JOIN fin_fun fin_fun1 ON fin_fun1.id = proye.funcional_id
	LEFT JOIN fin_fun fin_fun2 ON fin_fun2.id = fin_fun1.finalidad
	LEFT JOIN fin_fun fin_fun3 ON fin_fun3.id = fin_fun1.funcion
	LEFT JOIN proyecto_snip on proyecto_snip.id = proye.codigo_snip
	LEFT JOIN proyecto_snip_autorizado psnip_aut ON psnip_aut.proyecto_snip_id = proye.codigo_snip 
		and psnip_aut.entidad_id = proye.subprograma_programa_entidad_id 
		and psnip_aut.entidad_nivel_id = proye.subprograma_programa_entidad_nivel_id
	LEFT JOIN producto_presupusto pp ON pp.proyecto_id = proye.id and pp.proyecto_subprograma_id = proye.subprograma_id and pp.proyecto_subprograma_programa_id = proye.subprograma_programa_id and pp.proyecto_subprograma_programa_entidad_id = proye.subprograma_programa_entidad_id and pp.proyecto_subprograma_programa_entidad_nivel_id = proye.subprograma_programa_entidad_nivel_id
	LEFT JOIN producto_presupusto_has_etiquetas pphe ON pphe.producto_id = pp.producto_id and pphe.proyecto_id = pp.proyecto_id and pphe.subprograma_id = pp.proyecto_subprograma_id and pphe.programa_id = pp.proyecto_subprograma_programa_id and pphe.entidad_id = pp.proyecto_subprograma_programa_entidad_id and pphe.nivel_id = pp.proyecto_subprograma_programa_entidad_nivel_id
	LEFT JOIN producto p ON p.id = pp.producto_id
	LEFT JOIN unidad_medida um ON um.id = pp.producto_unidad_medida_id AND pp.producto_unidad_medida_id = p.unidad_medida_id
	/*JOIN producto_presupuesto_meta ppm ON ppm.producto_presupusto_id = pp.producto_id and 
						ppm.proyecto_id = pp.proyecto_id and 
						ppm.subprograma_id = pp.proyecto_subprograma_id and 
						ppm.programa_id = pp.proyecto_subprograma_programa_id and 
						ppm.entidad_id = pp.proyecto_subprograma_programa_entidad_id and 
						ppm.nivel_id = pp.proyecto_subprograma_programa_entidad_nivel_id and
						ppm.unidad_medida_id = pp.producto_unidad_medida_id*/
	LEFT JOIN etiquetas ON etiquetas.id = pphe.etiquetas_id AND 
			pphe.producto_id = pp.producto_id AND 
			pphe.proyecto_id = pp.proyecto_id AND 
			pphe.subprograma_id = pp.proyecto_subprograma_id AND 
			pphe.programa_id = pp.proyecto_subprograma_programa_id AND 
			pphe.tipo_presupuesto_id = pp.proyecto_subprograma_programa_tipo_presupuesto_id AND 
			pphe.entidad_id = pp.proyecto_subprograma_programa_entidad_id AND 
			pphe.nivel_id = proyecto_subprograma_programa_entidad_nivel_id
	WHERE NOT nivel.borrado 
		AND NOT ent.borrado 
		AND NOT prog.borrado 
		AND NOT tp.borrado 
		AND NOT subprog.borrado 
		AND NOT proye.borrado 
		AND NOT eho.borrado 
		AND NOT rev.borrado 
		--AND NOT obj.borrado 
		AND NOT ur.borrado 
		AND NOT p.borrado 
		AND NOT um.borrado 
		AND NOT pp.borrado
		--AND NOT ppm.borrado  
	GROUP BY nivel.id,
		nivel.nombre,
		nivel.abrev,
		ent.id,
		ent.nombre,
		ent.sigla,
		prog.tipo_presupuesto_id,
		tp.nombre,
		prog.id,
		prog.nombre,
		prog.diagnostico,
		prog.objetivo,
		prog.base_legal,
		prog.codigodepartamento,
		subprog.id,
		subprog.nombre,
		subprog.objetivo,
		subprog.baselegal,
		subprog.codigo_departamento,
		proye.id ,
		proye.nombre,
		proye.diagnostico,
		proye.objetivo_estrategico_id,
		obj.nombre,
		eho.estrategia_eje_estrategico_id, 
		ee.nombre,
		eho.estrategia_linea_transversal_id, 
		lt.nombre,
		eho.estrategia_id,
		est.nombre,
		proye.unidad_responsable_id,
		ur.nombre,
		fin_fun1.finalidad,
		fin_fun2.nombre,
		fin_fun1.funcion,
		fin_fun3.nombre,
		psnip_aut.id,
		proyecto_snip.nombre,
		proye.codigo_departamento,
		pp.producto_id,
		pphe.producto_concat,
		p.nombre,
		pp.producto_unidad_medida_id,
		um.nombre,
		pp.intermedio,
		p.clase,
		pphe.id,
		etiquetas.nombre
	ORDER BY nivel.id, ent.id;
	
ALTER TABLE pivot_estructura_programatica
  OWNER TO postgres;