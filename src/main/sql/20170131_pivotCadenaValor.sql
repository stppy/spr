CREATE OR REPLACE VIEW pivot_cadena_valor AS 
SELECT plan.id AS plan_id,
    plan.nombre AS plan_nombre,
    ee.id AS eje_estrategico_id,
    ee.nombre AS eje_estrategico_nombre,
    ee.descripcion AS eje_estrategico_descripcion,
    lt.id AS linea_transversal_id,
    lt.nombre AS linea_transversal_nombre,
    lt.descripcion AS linea_transversal_descripcion,
    est.id AS estrategia_id,
    est.nombre AS estrategia_nombre,
    est.descripcion AS estrategia_descripcion,
    eho.id AS objetivo_pnd_id,
    obj.nombre AS objetivo_pnd_nombre,
    obj.descripcion AS objetivo_pnd_descripcion,
    oho.objetivo_id AS resultado_id,
    res.nombre AS resultado_nombre,
    res.descripcion AS resultado_descripcion,
    oho.colaboracion,
    oho.influencia,
    oho.nivel AS nivel_id,
    nivel.nombre AS nivel_nombre,
    oho.entidad AS entidad_id,
    ent.nombre AS entidad_nombre,
    oho.tipo_presupuesto AS tipo_presupuesto_id,
    tp.nombre AS tipo_presupuesto_nombre,
    oho.programa AS programa_id,
    prog.nombre AS programa_nombre,
    oho.subprograma AS subprograma_id,
    subpr.nombre AS subprograma_nombre,
    oho.proyecto AS proyecto_id,
    proy.nombre AS proyecto_nombre,
    oho.producto AS producto_id,
    prod.nombre AS producto_nombre,
    ur.id AS ur_id,
    ur.nombre AS ur_nombre
   FROM plan
     JOIN eje_estrategico ee ON ee.plan_id = plan.id
     JOIN linea_transversal lt ON lt.plan_id = plan.id
     JOIN estrategia est ON est.plan = plan.id AND est.eje_estrategico_id = ee.id AND est.linea_transversal_id = lt.id
     LEFT JOIN estrategia_has_objetivo eho ON eho.estrategia_id = est.id AND eho.estrategia_eje_estrategico_id = ee.id AND eho.estrategia_linea_transversal_id = lt.id AND eho.objetivo_tipo_objetivo_id = 1
     JOIN objetivo obj ON obj.id = eho.objetivo_id AND obj.tipo_objetivo_id = eho.objetivo_tipo_objetivo_id
     LEFT JOIN objetivo_has_objetivo oho ON oho.objetivo_rel_id = eho.objetivo_id AND oho.objetivo_tipo_objetivo_id = 2 AND oho.objetivo_rel_tipo_objetivo_id = 1
     JOIN objetivo res ON res.id = oho.objetivo_id AND res.tipo_objetivo_id = oho.objetivo_tipo_objetivo_id
     JOIN nivel ON nivel.id = oho.nivel
     JOIN entidad ent ON ent.id = oho.entidad AND ent.nivel_id = oho.nivel
     JOIN tipo_presupuesto tp ON tp.id = oho.tipo_presupuesto AND ent.id = oho.entidad AND ent.nivel_id = oho.nivel
     JOIN programa prog ON prog.id = oho.programa AND prog.tipo_presupuesto_id = oho.tipo_presupuesto AND prog.entidad_id = oho.entidad AND prog.entidad_nivel_id = oho.nivel
     JOIN subprograma subpr ON subpr.id = oho.subprograma AND subpr.programa_id = oho.programa AND subpr.programa_tipo_presupuesto_id = oho.tipo_presupuesto AND subpr.programa_entidad_id = oho.entidad AND subpr.programa_entidad_nivel_id = oho.nivel
     JOIN proyecto proy ON proy.id = oho.proyecto AND proy.subprograma_id = oho.subprograma AND proy.subprograma_programa_id = oho.programa AND proy.subprograma_programa_tipo_presupuesto_id = oho.tipo_presupuesto AND proy.subprograma_programa_entidad_id = oho.entidad AND proy.subprograma_programa_entidad_nivel_id = oho.nivel
     JOIN producto prod ON oho.producto = prod.id
     JOIN unidad_responsable ur ON ur.id = proy.unidad_responsable_id AND ur.entidad_id = proy.subprograma_programa_entidad_id AND ur.entidad_nivel_id = proy.subprograma_programa_entidad_nivel_id
  WHERE NOT plan.borrado AND NOT plan.id = 8 AND NOT ee.borrado AND NOT est.borrado AND NOT lt.borrado AND NOT eho.borrado AND NOT obj.borrado AND NOT oho.borrado AND NOT prog.borrado AND NOT proy.borrado AND NOT prod.borrado
  ORDER BY plan.id, ee.id, lt.id, nivel.id, ent.id;


ALTER TABLE pivot_cadena_valor
  OWNER TO postgres;