-- Adminer 4.3.1 PostgreSQL dump

\connect "spr";

CREATE SEQUENCE permiso_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."permiso" (
    "id" integer DEFAULT nextval('permiso_id_seq') NOT NULL,
    "nombre" character varying(45),
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "permiso_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."permiso" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE plan_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."plan" (
    "id" integer DEFAULT nextval('plan_id_seq') NOT NULL,
    "nombre" character varying(100) NOT NULL,
    "descripcion" character varying(1000),
    "detalle" character varying(50),
    "entidad_responsable" integer NOT NULL,
    "fecha_inicio" timestamp,
    "fecha_fin" timestamp,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "plan_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."plan" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE nivel_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."nivel" (
    "id" integer DEFAULT nextval('nivel_id_seq') NOT NULL,
    "numero_fila" integer,
    "cod_nivel" integer,
    "anho" integer,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "es_imputable" character varying(1),
    "fecha_creacion" timestamp,
    "verion" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "nivel_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."nivel" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE role_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."role" (
    "id" integer DEFAULT nextval('role_id_seq') NOT NULL,
    "nombre" character varying(45),
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "role_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."role" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_catalogo_destinatario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_catalogo_destinatario" (
    "id" integer DEFAULT nextval('tipo_catalogo_destinatario_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_catalogo_destinatario_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_catalogo_destinatario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_demografica_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_demografica" (
    "id" integer DEFAULT nextval('tipo_demografica_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" character varying(45),
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_demografica_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_demografica" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_objetivo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_objetivo" (
    "id" integer DEFAULT nextval('tipo_objetivo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_objetivo_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_objetivo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_presupuesto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_presupuesto" (
    "id" integer DEFAULT nextval('tipo_presupuesto_id_seq') NOT NULL,
    "nombre" text,
    "abrev" character varying(45),
    "descipcion" character varying(45),
    "anho" integer,
    "numero_fila" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_presupuesto_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_presupuesto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_programatico_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_programatico" (
    "id" integer DEFAULT nextval('tipo_programatico_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_programatico_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_programatico" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE unidad_medida_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."unidad_medida" (
    "id" integer DEFAULT nextval('unidad_medida_id_seq') NOT NULL,
    "nombre" character varying(60) NOT NULL,
    "abrev" character varying(20),
    "simbolo" character varying(10),
    "descripcion" character varying(45),
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "unidad_medida_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."unidad_medida" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE funcional_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."funcional" (
    "id" integer DEFAULT nextval('funcional_id_seq') NOT NULL,
    "numero_fila" integer,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "es_imputable" character varying(1),
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "funcional_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."funcional" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE objeto_de_gasto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."objeto_de_gasto" (
    "id" integer DEFAULT nextval('objeto_de_gasto_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "es_imputable" character varying(1),
    "numero_fila" integer,
    "anho" integer,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "objeto_de_gasto_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."objeto_de_gasto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE diccionario_formularios_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."diccionario_formularios" (
    "id" integer DEFAULT nextval('diccionario_formularios_id_seq') NOT NULL,
    "descripcion" text DEFAULT  NOT NULL,
    CONSTRAINT "PK_diccionario_formulario" PRIMARY KEY ("id")
) WITH (oids = true);


CREATE TABLE "public"."accion_has_producto" (
    "id" numeric(16,0) NOT NULL,
    "proporcion" integer,
    "accion_id" integer NOT NULL,
    "spr_producto_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "srp_proyecto_id" integer NOT NULL,
    "spr_subprograma_id" integer NOT NULL,
    "spr_programa_id" integer NOT NULL,
    "spr_tiprograma_id" integer NOT NULL,
    "spr_entidad_id" integer NOT NULL,
    "spr_nivel_id" integer NOT NULL,
    "spr_anho" integer NOT NULL,
    "spr_version" integer NOT NULL,
    "u_medida" text,
    "cant_fisica" double precision,
    "clase" text,
    "cant_financiera" double precision,
    "asignacion_financiera" double precision,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_has_producto_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE INDEX "accion_has_producto_accion_has_proccion12_idx" ON "public"."accion_has_producto" USING btree ("accion_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_has_producto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE accion_has_producto_has_presupuesto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."accion_has_producto_has_presupuesto" (
    "id" integer DEFAULT nextval('accion_has_producto_has_presupuesto_id_seq') NOT NULL,
    "codigoobjetogasto" integer,
    "id_accion_has_producto" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_has_producto_has_presupuesto_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_has_producto_has_presupuesto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."asignacion_presi" (
    "fila" integer,
    "nivel" integer DEFAULT 0 NOT NULL,
    "entidad" integer DEFAULT 0 NOT NULL,
    "tipo" integer DEFAULT 0 NOT NULL,
    "programa" integer DEFAULT 0 NOT NULL,
    "subprograma" integer DEFAULT 0 NOT NULL,
    "proyecto" integer DEFAULT 0 NOT NULL,
    "objeto_gasto" integer DEFAULT 0 NOT NULL,
    "fuente_financiamiento" integer DEFAULT 0 NOT NULL,
    "organismo_financiador" integer DEFAULT 0 NOT NULL,
    "pais" integer DEFAULT 0 NOT NULL,
    "departamento" integer DEFAULT 0 NOT NULL,
    "producto" integer DEFAULT 0 NOT NULL,
    "observacion" text,
    "planificado1" double precision,
    "ejecutado1" double precision,
    "planificado2" double precision,
    "ejecutado2" double precision,
    "planificado3" double precision,
    "ejecutado3" double precision,
    "planificado4" double precision,
    "ejecutado4" double precision,
    "planificado5" double precision,
    "ejecutado5" double precision,
    "planificado6" double precision,
    "ejecutado6" double precision,
    "planificado7" double precision,
    "ejecutado7" double precision,
    "planificado8" double precision,
    "ejecutado8" double precision,
    "planificado9" double precision,
    "ejecutado9" double precision,
    "planificado10" double precision,
    "ejecutado10" double precision,
    "planificado11" double precision,
    "ejecutado11" double precision,
    "planificado12" double precision,
    "ejecutado12" double precision,
    "anho" integer DEFAULT 0 NOT NULL,
    "version" integer DEFAULT 0 NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "asignacion_presi_pkey" PRIMARY KEY ("anho", "version", "nivel", "entidad", "tipo", "programa", "subprograma", "proyecto", "objeto_gasto", "fuente_financiamiento", "organismo_financiador", "pais", "departamento", "producto"),
    CONSTRAINT "asignacion_presi_unik" UNIQUE ("anho", "version", "nivel", "entidad", "tipo", "programa", "subprograma", "proyecto", "objeto_gasto", "fuente_financiamiento", "organismo_financiador", "pais", "departamento", "producto")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."asignacion_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();

CREATE TRIGGER "insert_asignacion_presi_shadow" BEFORE UPDATE ON "public"."asignacion_presi" FOR EACH ROW EXECUTE PROCEDURE insert_asignacion_presi_shadow();


CREATE TABLE "public"."asignacion_presi_ant" (
    "fila" integer,
    "nivel" integer DEFAULT 0 NOT NULL,
    "entidad" integer DEFAULT 0 NOT NULL,
    "tipo" integer DEFAULT 0 NOT NULL,
    "programa" integer DEFAULT 0 NOT NULL,
    "subprograma" integer DEFAULT 0 NOT NULL,
    "proyecto" integer DEFAULT 0 NOT NULL,
    "objeto_gasto" integer DEFAULT 0 NOT NULL,
    "fuente_financiamiento" integer DEFAULT 0 NOT NULL,
    "organismo_financiador" integer DEFAULT 0 NOT NULL,
    "pais" integer DEFAULT 0 NOT NULL,
    "departamento" integer DEFAULT 0 NOT NULL,
    "producto" integer DEFAULT 0 NOT NULL,
    "observacion" text,
    "planificado1" double precision,
    "ejecutado1" double precision,
    "planificado2" double precision,
    "ejecutado2" double precision,
    "planificado3" double precision,
    "ejecutado3" double precision,
    "planificado4" double precision,
    "ejecutado4" double precision,
    "planificado5" double precision,
    "ejecutado5" double precision,
    "planificado6" double precision,
    "ejecutado6" double precision,
    "planificado7" double precision,
    "ejecutado7" double precision,
    "planificado8" double precision,
    "ejecutado8" double precision,
    "planificado9" double precision,
    "ejecutado9" double precision,
    "planificado10" double precision,
    "ejecutado10" double precision,
    "planificado11" double precision,
    "ejecutado11" double precision,
    "planificado12" double precision,
    "ejecutado12" double precision,
    "anho" integer DEFAULT 0 NOT NULL,
    "version" integer DEFAULT 0 NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);


CREATE TABLE "public"."asignfinanproducto" (
    "numerofila" integer,
    "anio" integer,
    "nivel" integer,
    "entidad" integer,
    "codorigen" integer,
    "coddetalle" integer,
    "fuentefinanc" integer,
    "montoprogramado" double precision,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."asignfinanproducto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."asignfinanproducto_presi" (
    "numerofila" integer,
    "anio" integer,
    "nivel" integer,
    "entidad" integer,
    "codorigen" integer,
    "coddetalle" integer,
    "fuentefinanc" integer,
    "montoprogramado" double precision,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."asignfinanproducto_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE avance_indicador_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."avance_indicador" (
    "id" integer DEFAULT nextval('avance_indicador_id_seq') NOT NULL,
    "cantidad" text,
    "vencimiento" text,
    "indicador_id" integer NOT NULL,
    "zona_geografica_id" integer NOT NULL,
    "demografia_id" integer NOT NULL,
    "borrado_int" integer DEFAULT 0,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "nivel" integer NOT NULL,
    "entidad" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "producto_concat" text DEFAULT  NOT NULL,
    "objetivo_id" integer NOT NULL,
    "tipo_objetivo_id" integer NOT NULL,
    CONSTRAINT "avance_indicador_pkey" PRIMARY KEY ("id", "indicador_id", "zona_geografica_id", "demografia_id", "objetivo_id", "tipo_objetivo_id", "nivel", "entidad")
) WITH (oids = true);


CREATE SEQUENCE estrategia_has_objetivo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."estrategia_has_objetivo" (
    "id" integer DEFAULT nextval('estrategia_has_objetivo_id_seq') NOT NULL,
    "estrategia_id" integer NOT NULL,
    "estrategia_eje_estrategico_id" integer NOT NULL,
    "estrategia_linea_transversal_id" integer NOT NULL,
    "objetivo_id" integer NOT NULL,
    "objetivo_tipo_objetivo_id" integer NOT NULL,
    "es_principal" boolean,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."estrategia_has_objetivo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE objetivo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."objetivo" (
    "id" integer DEFAULT nextval('objetivo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "tipo_objetivo_id" integer NOT NULL,
    "nivel" integer,
    "entidad" integer,
    "tipo_presupuesto" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "funcional" integer,
    "borrado_int" integer DEFAULT 0,
    "version" integer DEFAULT 0 NOT NULL,
    "anho" integer DEFAULT 0 NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "objetivo_pkey" PRIMARY KEY ("id", "tipo_objetivo_id", "version", "anho"),
    CONSTRAINT "fk_objetivo_tipo_objetivo1" FOREIGN KEY (tipo_objetivo_id) REFERENCES tipo_objetivo(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "objetivo_fk_objetivo_tipo_objetivo1_idx" ON "public"."objetivo" USING btree ("tipo_objetivo_id");

CREATE INDEX "objetivo_pkey1" ON "public"."objetivo" USING btree ("id", "tipo_objetivo_id", "version", "anho");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."objetivo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."objetivo_sugerido" (
    "objetivo_id" integer NOT NULL,
    "objetivo_tipo_objetivo_id" integer NOT NULL,
    "objetivo_anho" integer NOT NULL,
    "objetivo_version" integer NOT NULL,
    "objetivo_sugerido_id" integer NOT NULL,
    "objetivo_sugerido_tipo_id" integer NOT NULL,
    "objetivo_sugerido_anho" integer NOT NULL,
    "objetivo_sugerido_version" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "objetivo_sugerido_pkey" PRIMARY KEY ("objetivo_id", "objetivo_tipo_objetivo_id", "objetivo_anho", "objetivo_version", "objetivo_sugerido_id", "objetivo_sugerido_tipo_id", "objetivo_sugerido_anho", "objetivo_sugerido_version"),
    CONSTRAINT "fk_objetivo_has_objetivo1_objetivo3" FOREIGN KEY (objetivo_id, objetivo_tipo_objetivo_id, objetivo_anho, objetivo_version) REFERENCES objetivo(id, tipo_objetivo_id, anho, version) NOT DEFERRABLE,
    CONSTRAINT "fk_objetivo_has_objetivo1_objetivo4" FOREIGN KEY (objetivo_sugerido_id, objetivo_sugerido_tipo_id, objetivo_sugerido_anho, objetivo_sugerido_version) REFERENCES objetivo(id, tipo_objetivo_id, anho, version) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "objetivo_sugerido_fk_objetivo_has_objetivo1_objetivo3_idx" ON "public"."objetivo_sugerido" USING btree ("objetivo_id", "objetivo_tipo_objetivo_id", "objetivo_anho", "objetivo_version");

CREATE INDEX "objetivo_sugerido_fk_objetivo_has_objetivo1_objetivo4_idx" ON "public"."objetivo_sugerido" USING btree ("objetivo_sugerido_id", "objetivo_sugerido_tipo_id", "objetivo_sugerido_anho", "objetivo_sugerido_version");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."objetivo_sugerido" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "cadena_valor_sugerida" ("pnd_est" integer, "pnd_obj_id" integer, "pnd_objetivo_nombre" text, "res_id" integer, "resultado_sugerido_nombre" text, "prod_id" integer, "producto_nombre" text);


CREATE SEQUENCE entidad_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."entidad" (
    "id" integer DEFAULT nextval('entidad_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "anho" integer,
    "nivel_id" integer NOT NULL,
    "abrev" character varying(45),
    "sigla" character varying(45),
    "base_legal" text,
    "mision" text,
    "vision" text,
    "politica" text,
    "objetivo" text,
    "diagnostico" text,
    "fecha_creacion" timestamp,
    "version" integer,
    "numero_fila" integer,
    "ruc" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "entidad_pkey" PRIMARY KEY ("id", "nivel_id"),
    CONSTRAINT "fk_entidad_nivel1" FOREIGN KEY (nivel_id) REFERENCES nivel(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "entidad_fk_entidad_nivel1_idx" ON "public"."entidad" USING btree ("nivel_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."entidad" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."objetivo_has_objetivo" (
    "objetivo_id" integer NOT NULL,
    "objetivo_tipo_objetivo_id" integer NOT NULL,
    "objetivo_anho" integer NOT NULL,
    "objetivo_version" integer NOT NULL,
    "objetivo_rel_id" integer NOT NULL,
    "objetivo_rel_tipo_objetivo_id" integer NOT NULL,
    "objetivo_rel_anho" integer NOT NULL,
    "objetivo_rel_version" integer NOT NULL,
    "colaboracion" double precision,
    "influencia" double precision,
    "nivel" integer,
    "entidad" integer,
    "tipo_presupuesto" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "producto" integer,
    "unidad_responsable" integer,
    "producto_concat" text NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "objetivo_has_objetivo_pkey" PRIMARY KEY ("objetivo_id", "objetivo_tipo_objetivo_id", "objetivo_anho", "objetivo_version", "objetivo_rel_id", "objetivo_rel_tipo_objetivo_id", "objetivo_rel_anho", "objetivo_rel_version", "producto_concat"),
    CONSTRAINT "fk_objetivo_has_objetivo1_objetivo5" FOREIGN KEY (objetivo_id, objetivo_tipo_objetivo_id, objetivo_anho, objetivo_version) REFERENCES objetivo(id, tipo_objetivo_id, anho, version) NOT DEFERRABLE,
    CONSTRAINT "fk_objetivo_has_objetivo1_objetivo6" FOREIGN KEY (objetivo_rel_id, objetivo_rel_tipo_objetivo_id, objetivo_rel_anho, objetivo_rel_version) REFERENCES objetivo(id, tipo_objetivo_id, anho, version) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "objetivo_has_objetivo_fk_objetivo_has_objetivo1_objetivo5_idx" ON "public"."objetivo_has_objetivo" USING btree ("objetivo_id", "objetivo_tipo_objetivo_id", "objetivo_anho", "objetivo_version");

CREATE INDEX "objetivo_has_objetivo_fk_objetivo_has_objetivo1_objetivo6_idx" ON "public"."objetivo_has_objetivo" USING btree ("objetivo_rel_id", "objetivo_rel_tipo_objetivo_id", "objetivo_rel_anho", "objetivo_rel_version");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."objetivo_has_objetivo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE producto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto" (
    "id" integer DEFAULT nextval('producto_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "clase" character varying(1),
    "unidad_medida_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "producto_pkey" PRIMARY KEY ("id", "unidad_medida_id"),
    CONSTRAINT "fk_producto_unidad_medida1" FOREIGN KEY (unidad_medida_id) REFERENCES unidad_medida(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "producto_fk_producto_unidad_medida1_idx" ON "public"."producto" USING btree ("unidad_medida_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE producto_presupusto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupusto" (
    "id" integer DEFAULT nextval('producto_presupusto_id_seq') NOT NULL,
    "numero_fila" integer,
    "anho" integer,
    "producto_id" integer NOT NULL,
    "producto_unidad_medida_id" integer NOT NULL,
    "proyecto_id" integer NOT NULL,
    "proyecto_subprograma_id" integer NOT NULL,
    "proyecto_subprograma_programa_id" integer NOT NULL,
    "proyecto_subprograma_programa_tipo_presupuesto_id" integer NOT NULL,
    "proyecto_subprograma_programa_entidad_id" integer NOT NULL,
    "proyecto_subprograma_programa_entidad_nivel_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "intermedio" boolean DEFAULT false
) WITH (oids = false);

CREATE INDEX "producto_presupusto_fk_producto_presupusto_producto1_idx" ON "public"."producto_presupusto" USING btree ("producto_id", "producto_unidad_medida_id");

CREATE INDEX "producto_presupusto_fk_producto_presupusto_proyecto1_idx" ON "public"."producto_presupusto" USING btree ("proyecto_id", "proyecto_subprograma_id", "proyecto_subprograma_programa_id", "proyecto_subprograma_programa_tipo_presupuesto_id", "proyecto_subprograma_programa_entidad_id", "proyecto_subprograma_programa_entidad_nivel_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupusto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "producto_unidad_medida" ("id" integer, "nombre" text, "descripcion" text, "clase" character varying(1), "unidad_medida_id" integer, "uni_nombre" character varying(60));


CREATE TABLE "public"."programa" (
    "id" integer NOT NULL,
    "numerofila" integer,
    "anho" integer,
    "cod_programa" integer,
    "nombre" text,
    "abrev" text,
    "descripcion" text,
    "objetivo" text,
    "diagnostico" text DEFAULT ,
    "base_legal" text,
    "resultado" text,
    "codigodepartamento" integer,
    "tipo_presupuesto_id" integer NOT NULL,
    "entidad_id" integer NOT NULL,
    "entidad_nivel_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "programa_pkey" PRIMARY KEY ("id", "tipo_presupuesto_id", "entidad_id", "entidad_nivel_id"),
    CONSTRAINT "fk_programa_tipo_presupuesto1" FOREIGN KEY (tipo_presupuesto_id) REFERENCES tipo_presupuesto(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "programa_fk_programa_entidad1_idx" ON "public"."programa" USING btree ("entidad_id", "entidad_nivel_id");

CREATE INDEX "programa_fk_programa_tipo_presupuesto1_idx" ON "public"."programa" USING btree ("tipo_presupuesto_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."programa" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE proyecto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."proyecto" (
    "id" integer DEFAULT nextval('proyecto_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "anho" integer,
    "subprograma_id" integer NOT NULL,
    "subprograma_programa_id" integer NOT NULL,
    "subprograma_programa_tipo_presupuesto_id" integer NOT NULL,
    "subprograma_programa_entidad_id" integer NOT NULL,
    "subprograma_programa_entidad_nivel_id" integer NOT NULL,
    "unidad_responsable_id" integer NOT NULL,
    "funcional_id" integer NOT NULL,
    "diagnostico" text,
    "resultado_esperado" text,
    "codigo_departamento" integer,
    "codigo_snip" integer,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_id_old" character varying(45),
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "proyecto_pkey" PRIMARY KEY ("id", "subprograma_id", "subprograma_programa_id", "subprograma_programa_tipo_presupuesto_id", "subprograma_programa_entidad_id", "subprograma_programa_entidad_nivel_id", "unidad_responsable_id", "funcional_id")
) WITH (oids = false);

CREATE INDEX "proyecto_fk_proyecto_funcional1_idx" ON "public"."proyecto" USING btree ("funcional_id");

CREATE INDEX "proyecto_fk_proyecto_subprograma1_idx" ON "public"."proyecto" USING btree ("subprograma_id", "subprograma_programa_id", "subprograma_programa_tipo_presupuesto_id", "subprograma_programa_entidad_id", "subprograma_programa_entidad_nivel_id");

CREATE INDEX "proyecto_fk_proyecto_unidad_responsable1_idx" ON "public"."proyecto" USING btree ("unidad_responsable_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."proyecto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."subprograma" (
    "id" integer NOT NULL,
    "programa_id" integer NOT NULL,
    "programa_tipo_presupuesto_id" integer NOT NULL,
    "programa_entidad_id" integer NOT NULL,
    "programa_entidad_nivel_id" integer NOT NULL,
    "anho" integer,
    "nombre" text,
    "abrev" character varying(45),
    "descripcion" text,
    "objetivo" text,
    "codigo_departamento" integer,
    "baselegal" text,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "subprograma_pkey" PRIMARY KEY ("id", "programa_id", "programa_tipo_presupuesto_id", "programa_entidad_id", "programa_entidad_nivel_id"),
    CONSTRAINT "fk_subprograma_programa1" FOREIGN KEY (programa_id, programa_tipo_presupuesto_id, programa_entidad_id, programa_entidad_nivel_id) REFERENCES programa(id, tipo_presupuesto_id, entidad_id, entidad_nivel_id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "subprograma_fk_subprograma_programa1" ON "public"."subprograma" USING btree ("programa_id", "programa_tipo_presupuesto_id", "programa_entidad_id", "programa_entidad_nivel_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."subprograma" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE unidad_responsable_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."unidad_responsable" (
    "id" integer DEFAULT nextval('unidad_responsable_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "numero_fila" integer,
    "entidad_id" integer NOT NULL,
    "entidad_nivel_id" integer NOT NULL,
    "unidad_jerarquica_id" integer NOT NULL,
    "anho" integer,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "unidad_responsable_pkey" PRIMARY KEY ("id", "entidad_id", "entidad_nivel_id", "unidad_jerarquica_id")
) WITH (oids = false);

CREATE INDEX "unidad_responsable_fk_unidad_responsable_entidad1_idx" ON "public"."unidad_responsable" USING btree ("entidad_id", "entidad_nivel_id");

CREATE INDEX "unidad_responsable_fk_unidad_responsable_unidad_jerarquica1_idx" ON "public"."unidad_responsable" USING btree ("unidad_jerarquica_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."unidad_responsable" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "cadena_valor_vinculada" ("niv" integer, "ent" integer, "entidad" character varying(45), "tp" integer, "pro" integer, "sub" integer, "pry" integer, "programa" text, "subprograma" text, "proyecto" text, "snip" integer, "unr_id" integer, "unr_abrev" character varying(45), "prd_id" integer, "prd_borr" boolean, "producto" text, "prd_um" character varying(60), "res_id" integer, "res_cat_borr" boolean, "res_borr" boolean, "resultado_esperado" text, "colab_prd_res" double precision, "influ_prd_res" double precision, "pnd_id" integer, "pnd_cat_borr" boolean, "pnd_borr" boolean, "objetivo_pnd" text, "colab_res_pnd" double precision, "influ_res_pnd" double precision);


CREATE SEQUENCE catalogo_destinatario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."catalogo_destinatario" (
    "id" integer DEFAULT nextval('catalogo_destinatario_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "tipo_catalogo_destinatario_id" integer NOT NULL,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "catalogo_destinatario_pkey" PRIMARY KEY ("id", "tipo_catalogo_destinatario_id"),
    CONSTRAINT "fk_catalogo_destinatario_tipo_catalogo_destinatario1" FOREIGN KEY (tipo_catalogo_destinatario_id) REFERENCES tipo_catalogo_destinatario(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "catalogo_destinatario_fk_catalogo_destinatario1_idx" ON "public"."catalogo_destinatario" USING btree ("tipo_catalogo_destinatario_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."catalogo_destinatario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE catalogo_dncp_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."catalogo_dncp" (
    "id" integer DEFAULT nextval('catalogo_dncp_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "anho" integer,
    "numero_fila" integer,
    "precio" double precision,
    "objeto_de_gasto_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "catalogo_dncp_pkey" PRIMARY KEY ("id", "objeto_de_gasto_id"),
    CONSTRAINT "fk_catalogo_dncp_objeto_de_gasto1" FOREIGN KEY (objeto_de_gasto_id) REFERENCES objeto_de_gasto(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "catalogo_dncp_fk_catalogo_dncp_objeto_de_gasto1_idx" ON "public"."catalogo_dncp" USING btree ("objeto_de_gasto_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."catalogo_dncp" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE cobertura_demografica_alcances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."cobertura_demografica_alcances" (
    "id" integer DEFAULT nextval('cobertura_demografica_alcances_id_seq') NOT NULL,
    "nombre" text,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."cobertura_demografica_alcances" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE cobertura_geografica_alcances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."cobertura_geografica_alcances" (
    "id" integer DEFAULT nextval('cobertura_geografica_alcances_id_seq') NOT NULL,
    "nombre" text,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."cobertura_geografica_alcances" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE demografia_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."demografia" (
    "id" integer DEFAULT nextval('demografia_id_seq') NOT NULL,
    "nombre" text,
    "descipcion" text,
    "tipo_demografica_id" integer NOT NULL,
    "abrev" character varying(45),
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "demografia_pkey" PRIMARY KEY ("id", "tipo_demografica_id"),
    CONSTRAINT "fk_demografia_tipo_demografica1" FOREIGN KEY (tipo_demografica_id) REFERENCES tipo_demografica(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "demografia_fk_demografia_tipo_demografica1_idx" ON "public"."demografia" USING btree ("tipo_demografica_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."demografia" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE departamento_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."departamento" (
    "id" integer DEFAULT nextval('departamento_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "pais" integer,
    "numero_fila" integer,
    "abrev" character varying(45),
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "departamento_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."departamento" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE diccionario_campos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."diccionario_campos" (
    "id" integer DEFAULT nextval('diccionario_campos_id_seq') NOT NULL,
    "nombre" text DEFAULT  NOT NULL,
    "descripcion" text DEFAULT  NOT NULL,
    "referencia_html" text DEFAULT  NOT NULL,
    "formulario_id" integer,
    CONSTRAINT "FK_formulario" FOREIGN KEY (formulario_id) REFERENCES diccionario_formularios(id) NOT DEFERRABLE
) WITH (oids = true);


CREATE SEQUENCE diccionario_dato_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."diccionario_dato" (
    "id" integer DEFAULT nextval('diccionario_dato_id_seq') NOT NULL,
    "clase" character varying(45),
    "nombre" character varying(45),
    "titulo" text,
    "descripcion" text,
    "instructivo" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "diccionario_dato_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."diccionario_dato" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."dim_fecha" (
    "dim_fecha_pk" integer NOT NULL,
    "fecha" date,
    "dia" integer,
    "mes" integer,
    "mesano_texto" text,
    "ano" integer,
    "administracion" text,
    "trimestre" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "dim_fecha_pkey" PRIMARY KEY ("dim_fecha_pk")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."dim_fecha" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."distrito" (
    "id" integer NOT NULL,
    "departamento_id" integer NOT NULL,
    "distrito_id" integer NOT NULL,
    "descripcion" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "distrito_id_UNIQUE" UNIQUE ("id"),
    CONSTRAINT "distrito_pkey" PRIMARY KEY ("id", "departamento_id", "distrito_id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."distrito" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE documentos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."documentos" (
    "id" integer DEFAULT nextval('documentos_id_seq') NOT NULL,
    "nombre" text,
    "url" text,
    "borrado" boolean DEFAULT false,
    "fecha_valides" date,
    "tipos_id" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "descripcion" text,
    CONSTRAINT "id" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."documentos" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE eje_estrategico_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."eje_estrategico" (
    "id" integer DEFAULT nextval('eje_estrategico_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "plan_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "eje_estrategico_pkey" PRIMARY KEY ("id", "plan_id"),
    CONSTRAINT "fk_eje_estrategico_plan1" FOREIGN KEY (plan_id) REFERENCES plan(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "eje_estrategico_fk_eje_estrategico_plan1_idx" ON "public"."eje_estrategico" USING btree ("plan_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."eje_estrategico" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE estrategia_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."estrategia" (
    "id" integer DEFAULT nextval('estrategia_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "numero_fila" integer,
    "eje_estrategico_id" integer NOT NULL,
    "linea_transversal_id" integer NOT NULL,
    "plan" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "estrategia_pkey" PRIMARY KEY ("id", "eje_estrategico_id", "linea_transversal_id", "plan")
) WITH (oids = false);

CREATE INDEX "estrategia_fk_eje_estrategico_eje_estrategico1_idx" ON "public"."estrategia" USING btree ("eje_estrategico_id");

CREATE INDEX "estrategia_fk_eje_estrategico_linea_transversal1_idx" ON "public"."estrategia" USING btree ("linea_transversal_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."estrategia" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE estructura_programatica_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."estructura_programatica" (
    "id" integer DEFAULT nextval('estructura_programatica_id_seq') NOT NULL,
    "anho" integer NOT NULL,
    "nivel" integer NOT NULL,
    "entidad" integer NOT NULL,
    "tipo" integer NOT NULL,
    "programa" integer NOT NULL,
    "subprograma" integer NOT NULL,
    "proyecto" integer NOT NULL,
    "nfprograma" integer NOT NULL,
    "nfsubprograma" integer NOT NULL,
    "nfproyecto" integer NOT NULL,
    "departamento" integer NOT NULL,
    "unidad_responsable" integer NOT NULL,
    "funcional" integer NOT NULL,
    "diagnostico" text NOT NULL,
    "objetivo" text NOT NULL,
    "resultado_esperado" text NOT NULL,
    "base_legal" text NOT NULL,
    "nombre" text NOT NULL,
    "abrev" text NOT NULL,
    "descripcion" text NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "estructura_programatica_pkey" PRIMARY KEY ("id", "anho", "nivel", "entidad", "tipo", "programa", "subprograma", "proyecto", "funcional"),
    CONSTRAINT "estructura_programatica_ibfk_1" FOREIGN KEY (funcional) REFERENCES funcional(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "estructura_programatica_funcional" ON "public"."estructura_programatica" USING btree ("funcional");

CREATE INDEX "estructura_programatica_id" ON "public"."estructura_programatica" USING btree ("id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."estructura_programatica" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE etiquetas_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."etiquetas" (
    "id" integer DEFAULT nextval('etiquetas_id_seq') NOT NULL,
    "nombre" text NOT NULL,
    CONSTRAINT "pk_etiqueta" PRIMARY KEY ("id")
) WITH (oids = true);


CREATE TABLE "fin_fun" ("id" integer, "numero_fila" integer, "nombre" text, "descripcion" text, "abrev" character varying(45), "es_imputable" character varying(1), "borrado" boolean, "anho" integer, "version" integer, "fecha_actualizacion" timestamp, "fecha_insercion" timestamp, "usuario_responsable" text, "finalidad" integer, "funcion" integer);


CREATE SEQUENCE fuente_financiamiento_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."fuente_financiamiento" (
    "id" integer DEFAULT nextval('fuente_financiamiento_id_seq') NOT NULL,
    "nombre" character varying(45),
    "descripcion" text,
    "anho" integer,
    "numero_fila" integer,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "fuente_financiamiento_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."fuente_financiamiento" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE fuente_verificacion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."fuente_verificacion" (
    "id" integer DEFAULT nextval('fuente_verificacion_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "uri" text,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "fuente_verificacion_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."fuente_verificacion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."fundamentacion_presi" (
    "fila" integer,
    "nivel" integer DEFAULT 0 NOT NULL,
    "entidad" integer DEFAULT 0 NOT NULL,
    "tipo" integer DEFAULT 0 NOT NULL,
    "programa" integer DEFAULT 0 NOT NULL,
    "subprograma" integer DEFAULT 0 NOT NULL,
    "proyecto" integer DEFAULT 0 NOT NULL,
    "objeto_gasto" integer DEFAULT 0 NOT NULL,
    "fuente_financiamiento" integer DEFAULT 0 NOT NULL,
    "organismo_financiador" integer DEFAULT 0 NOT NULL,
    "pais" integer DEFAULT 0 NOT NULL,
    "departamento" integer DEFAULT 0 NOT NULL,
    "secuencia" integer DEFAULT 0 NOT NULL,
    "precio" double precision,
    "cantidad" integer,
    "cantmeses" integer,
    "descripcion" text,
    "clg" integer DEFAULT 0 NOT NULL,
    "anho" integer DEFAULT 0 NOT NULL,
    "version" integer DEFAULT 0 NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "fundamentacion_presi_pkey" PRIMARY KEY ("anho", "version", "nivel", "entidad", "tipo", "programa", "subprograma", "proyecto", "objeto_gasto", "fuente_financiamiento", "organismo_financiador", "pais", "departamento", "clg", "secuencia")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."fundamentacion_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."fundamentaciongasto_presi" (
    "numerofila" integer,
    "anio" integer,
    "nivel" integer,
    "entidad" integer,
    "tipoprograma" integer,
    "codigoprograma" integer,
    "codigosubprograma" integer,
    "codigoproyecto" integer,
    "objetogasto" integer,
    "fuente" integer,
    "orgfinanciador" integer,
    "pais" integer,
    "departamento" integer,
    "secuencia" integer,
    "precio" double precision,
    "cantidad" integer,
    "cantmeses" integer,
    "descripcion" text,
    "clgcodigo" integer,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."fundamentaciongasto_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "grupo_subgrupo_objeto_gasto" ("id" integer, "nombre" text, "descripcion" text, "abrev" character varying(45), "es_imputable" character varying(1), "numero_fila" integer, "anho" integer, "borrado" boolean, "version" integer, "fecha_actualizacion" timestamp, "fecha_insercion" timestamp, "usuario_responsable" text, "grupo" integer, "subgrupo" integer);


CREATE SEQUENCE indicador_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."indicador" (
    "id" integer DEFAULT nextval('indicador_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "tipo_indicador_id" integer NOT NULL,
    "metodo_calculo_id_int" integer DEFAULT 0 NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "frecuencia_meses" integer,
    "desagregacion_tipo_zona_geografica_id" integer NOT NULL,
    "tipo_demografica_id" integer NOT NULL,
    "fuente_verificacion_id_old" integer,
    "observaciones" text,
    "objetivo_id" integer NOT NULL,
    "borrado_int" integer DEFAULT 0,
    "cobertura_geografica_alcance" integer,
    "nivel_despliegue_geografico" integer,
    "cobertura_demografica_alcance" integer,
    "nivel_despliegue_demografica" integer,
    "institucion_responsable_calculo_indicador" text,
    "evaluacion_heci" text,
    "contacto" text,
    "fecha_disponibilidad_informacion" text,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "nivel" integer NOT NULL,
    "entidad" integer NOT NULL,
    "fuente_verificacion_id" text DEFAULT Ninguna NOT NULL,
    "metodo_calculo_id" text DEFAULT ,
    CONSTRAINT "indicador_pkey" PRIMARY KEY ("id", "tipo_indicador_id", "unidad_medida_id", "desagregacion_tipo_zona_geografica_id", "tipo_demografica_id", "objetivo_id", "nivel", "entidad")
) WITH (oids = false);

CREATE INDEX "indicador_fk_indicador_fuente_verificacion1_idx" ON "public"."indicador" USING btree ("fuente_verificacion_id_old");

CREATE INDEX "indicador_fk_indicador_metodo_calculo1_idx" ON "public"."indicador" USING btree ("metodo_calculo_id_int");

CREATE INDEX "indicador_fk_indicador_objetivo1_idx" ON "public"."indicador" USING btree ("objetivo_id");

CREATE INDEX "indicador_fk_indicador_tipo_demografica1_idx" ON "public"."indicador" USING btree ("tipo_demografica_id");

CREATE INDEX "indicador_fk_indicador_tipo_indicador1_idx" ON "public"."indicador" USING btree ("tipo_indicador_id");

CREATE INDEX "indicador_fk_indicador_tipo_zona_geografica1_idx" ON "public"."indicador" USING btree ("desagregacion_tipo_zona_geografica_id");

CREATE INDEX "indicador_fk_indicador_unidad_medida1_idx" ON "public"."indicador" USING btree ("unidad_medida_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."indicador" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE institucion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."institucion" (
    "id" integer DEFAULT nextval('institucion_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "sigla" text,
    "orden" integer,
    "nivel_id" integer,
    "entidad_id" integer,
    "unidad_jerarquica_id" integer DEFAULT 0,
    "unidad_responsable_id" integer DEFAULT 0,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "abrev" text,
    "base_legal" text,
    "mision" text,
    "vision" text,
    "politica" text,
    "diagnostico" text,
    "ruc" text,
    "anho" integer,
    "fecha_creacion" timestamp,
    "objetivo" text,
    "nro_fila" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "institucion_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."institucion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE linea_transversal_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."linea_transversal" (
    "id" integer DEFAULT nextval('linea_transversal_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "plan_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "linea_transversal_pkey" PRIMARY KEY ("id", "plan_id"),
    CONSTRAINT "fk_linea_transversal_plan1" FOREIGN KEY (plan_id) REFERENCES plan(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "linea_transversal_fk_linea_transversal_plan1_idx" ON "public"."linea_transversal" USING btree ("plan_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."linea_transversal" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."mes" (
    "id" integer NOT NULL,
    "nombre" character varying(45),
    "abrev" character varying(45),
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "mes_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."mes" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE meta_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."meta" (
    "id" integer DEFAULT nextval('meta_id_seq') NOT NULL,
    "cantidad" text,
    "vencimiento" text,
    "indicador_id" integer NOT NULL,
    "zona_geografica_id" integer NOT NULL,
    "demografia_id" integer NOT NULL,
    "borrado_int" integer DEFAULT 0,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "nivel" integer,
    "entidad" integer,
    "borrado" boolean DEFAULT false,
    "producto_concat" text DEFAULT  NOT NULL,
    "objetivo_id" integer,
    "tipo_objetivo_id" integer
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."meta" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE metodo_calculo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."metodo_calculo" (
    "id" integer DEFAULT nextval('metodo_calculo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "clase" character varying(1),
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "metodo_calculo_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."metodo_calculo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE modulo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."modulo" (
    "id" integer DEFAULT nextval('modulo_id_seq') NOT NULL,
    "nombre" character varying(45),
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "modulo_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."modulo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."modulo_has_permiso" (
    "role_id" integer NOT NULL,
    "modulo_id" integer NOT NULL,
    "permiso_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "modulo_has_permiso_pkey" PRIMARY KEY ("role_id", "modulo_id", "permiso_id"),
    CONSTRAINT "fk_modulo_has_permiso_modulo1" FOREIGN KEY (modulo_id) REFERENCES modulo(id) NOT DEFERRABLE,
    CONSTRAINT "fk_modulo_has_permiso_permiso1" FOREIGN KEY (permiso_id) REFERENCES permiso(id) NOT DEFERRABLE,
    CONSTRAINT "fk_modulo_has_permiso_role1" FOREIGN KEY (role_id) REFERENCES role(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "modulo_has_permiso_fk_modulo_has_permiso_modulo1_idx" ON "public"."modulo_has_permiso" USING btree ("modulo_id");

CREATE INDEX "modulo_has_permiso_fk_modulo_has_permiso_permiso1_idx" ON "public"."modulo_has_permiso" USING btree ("permiso_id");

CREATE INDEX "modulo_has_permiso_fk_modulo_has_permiso_role1_idx" ON "public"."modulo_has_permiso" USING btree ("role_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."modulo_has_permiso" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE modulos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."modulos" (
    "id" integer DEFAULT nextval('modulos_id_seq') NOT NULL,
    "nombre" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "modulos_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."modulos" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE nivel_despliegue_demografica_desagregacion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."nivel_despliegue_demografica_desagregacion" (
    "id" integer DEFAULT nextval('nivel_despliegue_demografica_desagregacion_id_seq') NOT NULL,
    "nombre" text,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."nivel_despliegue_demografica_desagregacion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE nivel_despliegue_geografica_desagregaciones_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."nivel_despliegue_geografica_desagregaciones" (
    "id" integer DEFAULT nextval('nivel_despliegue_geografica_desagregaciones_id_seq') NOT NULL,
    "nombre" text,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."nivel_despliegue_geografica_desagregaciones" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."objetivo_abreviacion" (
    "id" integer NOT NULL,
    "nombre" text NOT NULL
) WITH (oids = false);


CREATE SEQUENCE objetivo_catalogo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."objetivo_catalogo" (
    "id" integer DEFAULT nextval('objetivo_catalogo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "tipo_objetivo_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "objetivo_catalogo_pkey" PRIMARY KEY ("id", "tipo_objetivo_id"),
    CONSTRAINT "fk_objetivo_catalogo_tipo_objetivo1" FOREIGN KEY (tipo_objetivo_id) REFERENCES tipo_objetivo(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "objetivo_catalogo_fk_objetivo_catalogo_tipo_objetivo1_idx" ON "public"."objetivo_catalogo" USING btree ("tipo_objetivo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."objetivo_catalogo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."objetivo_has_indicador" (
    "objetivo_id" integer NOT NULL,
    "objetivo_tipo_objetivo_id" integer NOT NULL,
    "objetivo_anho" integer NOT NULL,
    "objetivo_version" integer NOT NULL,
    "indicador_id" integer NOT NULL,
    "indicador_tipo_indicador_id" integer,
    "indicador_unidad_medida_id" integer,
    "indicador_desagregacion_tipo_zona_geografica_id" integer,
    "indicador_tipo_demografica_id" integer,
    "indicador_fuente_verificacion_id_old" integer,
    "indicador_objetivo_id" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "producto_concat" text DEFAULT  NOT NULL,
    "indicador_fuente_verificacion_id" text DEFAULT Ninguna NOT NULL,
    CONSTRAINT "objetivo_has_indicador_pkey" PRIMARY KEY ("objetivo_id", "objetivo_tipo_objetivo_id", "objetivo_anho", "objetivo_version", "indicador_id", "producto_concat")
) WITH (oids = true);

CREATE INDEX "objetivo_has_indicador_fk_objetivo_has_indicador_objetivo1_idx" ON "public"."objetivo_has_indicador" USING btree ("objetivo_id", "objetivo_tipo_objetivo_id", "objetivo_anho", "objetivo_version");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."objetivo_has_indicador" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE organismo_financiador_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."organismo_financiador" (
    "id" integer DEFAULT nextval('organismo_financiador_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "numero_fila" integer,
    "anho" integer,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "organismo_financiador_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."organismo_financiador" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE permisos_modulos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."permisos_modulos" (
    "id" integer DEFAULT nextval('permisos_modulos_id_seq') NOT NULL,
    "nombre" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "permisos_modulos_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."permisos_modulos" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE permisos_por_modulos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."permisos_por_modulos" (
    "id" integer DEFAULT nextval('permisos_por_modulos_id_seq') NOT NULL,
    "modulos_id" integer NOT NULL,
    "usuario_id" integer NOT NULL,
    "permisos_modulos_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "usuario_modulos_role_pkey" PRIMARY KEY ("modulos_id", "usuario_id"),
    CONSTRAINT "fk_usuario_permisos_modulos_id1" FOREIGN KEY (permisos_modulos_id) REFERENCES permisos_modulos(id) NOT DEFERRABLE,
    CONSTRAINT "fk_usuario_usuario_modulos_id" FOREIGN KEY (modulos_id) REFERENCES modulos(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."permisos_por_modulos" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "pivot_cadena_valor" ("plan_id" integer, "plan_nombre" character varying(100), "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "eje_estrategico_descripcion" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "linea_transversal_descripcion" text, "estrategia_id" integer, "estrategia_nombre" text, "estrategia_descripcion" text, "objetivo_pnd_id" integer, "objetivo_pnd_nombre" text, "objetivo_pnd_descripcion" text, "resultado_id" integer, "resultado_nombre" text, "resultado_descripcion" text, "colaboracion" double precision, "influencia" double precision, "nivel_id" integer, "nivel_nombre" text, "entidad_id" integer, "entidad_nombre" text, "tipo_presupuesto_id" integer, "tipo_presupuesto_nombre" text, "programa_id" integer, "programa_nombre" text, "subprograma_id" integer, "subprograma_nombre" text, "proyecto_id" integer, "proyecto_nombre" text, "producto_id" integer, "producto_nombre" text, "ur_id" integer, "ur_nombre" text);


CREATE SEQUENCE producto_presupuesto_destinatario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupuesto_destinatario" (
    "id" integer DEFAULT nextval('producto_presupuesto_destinatario_id_seq') NOT NULL,
    "nivel" integer,
    "entidad" integer,
    "tipo_presupuesto" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "producto" integer,
    "catalogo_destinatario" integer,
    "departamento" integer,
    "cantidad" double precision,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "descripcion" text DEFAULT  ,
    CONSTRAINT "producto_presupuesto_destinat_nivel_entidad_tipo_presupuest_key" UNIQUE ("nivel", "entidad", "tipo_presupuesto", "programa", "subprograma", "proyecto", "producto", "catalogo_destinatario", "departamento"),
    CONSTRAINT "producto_presupuesto_destinatario_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupuesto_destinatario" FOR EACH ROW EXECUTE PROCEDURE auditoria();

CREATE TRIGGER "insert_ppd_shadow" BEFORE UPDATE ON "public"."producto_presupuesto_destinatario" FOR EACH ROW EXECUTE PROCEDURE insert_ppd_shadow();


CREATE TABLE "pivot_destinatarios_producto" ("nivel_id" integer, "nivel_nombre" text, "entidad_id" integer, "entidad_nombre" text, "tipo_presupuesto_id" integer, "tipo_presupuesto_nombre" text, "programa_id" integer, "programa_nombre" text, "subprograma_id" integer, "subprograma_nombre" text, "proyecto_id" integer, "proyecto_nombre" text, "producto_id" integer, "producto_nombre" text, "catalogo_destinatario_id" integer, "catalogo_destinatario_nombre" text, "catalogo_destinatario_descripcion" text, "tipo_catalogo_destinatario_id" integer, "tipo_catalogo_destinatario_nombre" text, "departamento_id" integer, "departamento_nombre" text, "cantidad" double precision, "descripcion" text);


CREATE SEQUENCE producto_presupusto_has_etiquetas_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupusto_has_etiquetas" (
    "id" integer DEFAULT nextval('producto_presupusto_has_etiquetas_id_seq') NOT NULL,
    "producto_concat" text,
    "etiquetas_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "proyecto_id" integer NOT NULL,
    "subprograma_id" integer NOT NULL,
    "programa_id" integer NOT NULL,
    "tipo_presupuesto_id" integer NOT NULL,
    "entidad_id" integer NOT NULL,
    "nivel_id" integer NOT NULL,
    "version" integer NOT NULL,
    "anho" integer NOT NULL,
    CONSTRAINT "pk_id" PRIMARY KEY ("producto_id", "proyecto_id", "subprograma_id", "programa_id", "tipo_presupuesto_id", "entidad_id", "nivel_id", "anho", "version", "etiquetas_id")
) WITH (oids = true);


CREATE SEQUENCE proyecto_snip_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."proyecto_snip" (
    "id" integer DEFAULT nextval('proyecto_snip_id_seq') NOT NULL,
    "nombre" character varying(150) NOT NULL,
    "descripcion" text,
    "estado" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "proyecto_snip_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "unique_id" UNIQUE ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."proyecto_snip" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE proyecto_snip_autorizado_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."proyecto_snip_autorizado" (
    "id" integer DEFAULT nextval('proyecto_snip_autorizado_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "anho" integer NOT NULL,
    "monto" integer NOT NULL,
    "entidad_id" integer NOT NULL,
    "entidad_nivel_id" integer NOT NULL,
    "proyecto_snip_id" integer NOT NULL,
    "organismo_financiador_id" integer NOT NULL,
    "fuente_financiamiento_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "proyecto_snip_autorizado_pkey" PRIMARY KEY ("id", "entidad_id", "entidad_nivel_id", "proyecto_snip_id", "organismo_financiador_id", "fuente_financiamiento_id"),
    CONSTRAINT "uni_proyecto_snip_autorizado" UNIQUE ("entidad_nivel_id", "entidad_id", "proyecto_snip_id"),
    CONSTRAINT "fk_proyecto_snip_autorizado_entidad1" FOREIGN KEY (entidad_id, entidad_nivel_id) REFERENCES entidad(id, nivel_id) NOT DEFERRABLE,
    CONSTRAINT "fk_proyecto_snip_autorizado_fuente_financiamiento1" FOREIGN KEY (fuente_financiamiento_id) REFERENCES fuente_financiamiento(id) NOT DEFERRABLE,
    CONSTRAINT "fk_proyecto_snip_autorizado_organismo_financiador1" FOREIGN KEY (organismo_financiador_id) REFERENCES organismo_financiador(id) NOT DEFERRABLE,
    CONSTRAINT "fk_proyecto_snip_autorizado_proyecto_snip1" FOREIGN KEY (proyecto_snip_id) REFERENCES proyecto_snip(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "proyecto_snip_autorizado__idx" ON "public"."proyecto_snip_autorizado" USING btree ("proyecto_snip_id");

CREATE INDEX "proyecto_snip_autorizado_entidad1_idx" ON "public"."proyecto_snip_autorizado" USING btree ("entidad_id", "entidad_nivel_id");

CREATE INDEX "proyecto_snip_autorizado_fk_proyecto_iador1_idx" ON "public"."proyecto_snip_autorizado" USING btree ("organismo_financiador_id");

CREATE INDEX "proyecto_snip_autorizado_fk_proyecto_sniciamiento1_idx" ON "public"."proyecto_snip_autorizado" USING btree ("fuente_financiamiento_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."proyecto_snip_autorizado" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "pivot_estructura_programatica" ("nivel_id" integer, "nivel_nombre" text, "nivel_abrev" character varying(45), "entidad_id" integer, "entidad_nombre" text, "entidad_sigla" character varying(45), "tipo_presu_id" integer, "tipo_presu_nombre" text, "programa_id" integer, "programa_nombre" text, "programa_diagnostico" text, "programa_objetivo" text, "programa_base_legal" text, "programa_depto" integer, "subprograma_id" integer, "subprograma_nombre" text, "subprograma_objetivo" text, "subprograma_baselegal" text, "subprograma_departamento" integer, "proyecto_id" integer, "proyecto_nombre" text, "proyecto_diagnostico" text, "proyecto_objetivo" integer, "proyecto_objetivo_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "unidad_responsable_id" integer, "unidad_responsable_nombre" text, "finalidad_id" integer, "finalidad" text, "funcion_id" integer, "funcion" text, "snip_autorizado_id" integer, "snip_autorizado_nombre" character varying(150), "proyecto_depto" integer, "producto_id" integer, "producto_concat" text, "producto_nombre" text, "producto_unidad_medida_id" integer, "unidad_medida_nombre" character varying(60), "producto_intermedio" boolean, "producto_clase" character varying(1), "producto_anho" integer, "producto_etiqueta_id" integer, "producto_etiqueta_nombre" text);


CREATE TABLE "pivot_indicadores" ("nivel_id" integer, "nivel_nombre" text, "nivel_abrev" character varying(45), "entidad_id" integer, "entidad_nombre" text, "entidad_sigla" character varying(45), "unr_id" integer, "unr_nombre" text, "objetivo_id" integer, "objetivo_nombre" text, "objetivo_tipo" integer, "objetivo_tipo_nombre" text, "indicador_id" integer, "indicador_nombre" text, "indicador_descripcion" text, "indicador_tipo" integer, "indicador_metodo_calculo" text, "indicador_frecuencia_meses" integer, "indicador_fecha_disponibilidad" text, "indicador_cobertura_geografica_id" integer, "indicador_cobertura_geografica_nombre" text, "indicador_despliegue_geografico_id" integer, "indicador_despliegue_geografico_nombre" text, "indicador_despliegue_demografica_id" integer, "indicador_despliegue_demografica_nombre" text, "indicador_fuente_datos" text, "indicador_institucion_responsable" text, "indicador_evaluacion_heci" text, "indicador_comentarios" text, "indicador_contacto" text, "fecha_metas_previstas" text, "cantidad_metas_previstas" text, "fecha_avance" text, "cantidad_avance" text, "indicador_unidad_medida" integer, "indicador_unidad_medida_nombre" character varying(60));


CREATE SEQUENCE producto_presupuesto_meta_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupuesto_meta" (
    "id" integer DEFAULT nextval('producto_presupuesto_meta_id_seq') NOT NULL,
    "mes" integer,
    "anho" integer,
    "cantidad" double precision,
    "catalogo_destinatario_id" integer DEFAULT (1) NOT NULL,
    "departamento_id" integer DEFAULT (99) NOT NULL,
    "producto_presupusto_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "proyecto_id" integer NOT NULL,
    "subprograma_id" integer NOT NULL,
    "programa_id" integer NOT NULL,
    "tipo_presupuesto_id" integer NOT NULL,
    "entidad_id" integer NOT NULL,
    "nivel_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "producto_presupuesto_meta_pkey" PRIMARY KEY ("id", "catalogo_destinatario_id", "departamento_id", "producto_presupusto_id", "producto_id", "unidad_medida_id", "proyecto_id", "subprograma_id", "programa_id", "tipo_presupuesto_id", "entidad_id", "nivel_id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupuesto_meta" FOR EACH ROW EXECUTE PROCEDURE auditoria();

CREATE TRIGGER "insert_ppm_shadow" BEFORE UPDATE ON "public"."producto_presupuesto_meta" FOR EACH ROW EXECUTE PROCEDURE insert_ppm_shadow();


CREATE TABLE "pivot_metas_productos" ("institucion" character varying(45), "nombre_programatico" text, "producto_concat" text, "producto_id" integer, "nombre" text, "clase" character varying(1), "unidad_medida_id" integer, "unidad_medida_nombre" character varying(60), "departamento_id" integer, "departamento_nombre" text, "anho" integer, "mes" integer, "cantidad" double precision, "version" integer);


CREATE TABLE "pivot_perfil_institucional" ("nivel_id" integer, "nivel_nombre" text, "nivel_abrev" character varying(45), "entidad_id" integer, "entidad_nombre" text, "entidad_sigla" character varying(45), "unr_id" integer, "unr_nombre" text, "unr_abrev" character varying(45), "unr_unjer_id" integer, "institucion_id" integer, "institucion_nombre" text, "institucion_sigla" text, "institucion_abrev" text, "institucion_ruc" text, "institucion_base_legal" text, "institucion_mision" text, "institucion_vision" text, "institucion_diagnostico" text, "institucion_objetivo" text, "institucion_politica" text);


CREATE TABLE "pnd_entidad_resultado" ("plan_id" integer, "plan_nombre" unknown, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" character varying(45));


CREATE TABLE "pnd_resul_ent_prod_dest" ("plan_id" integer, "plan_nombre" unknown, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" character varying(45), "prod_concat" text, "prod_id" text, "producto_nombre" text, "cant_destinatarios" double precision, "cod_catalogo_destinatario" integer, "nombre_catalogo_destinatario" text, "ne_concat" text, "entidad_nombre" text, "tipo_nombre_catalogo_destinatario" text, "ur_id" integer, "ur_nombre" text);


CREATE TABLE "v_mes_suma" ("anho" integer, "mes" integer, "nivel_id" integer, "entidad_id" integer, "programa_id" integer, "subprograma_id" integer, "proyecto_id" integer, "producto_id" integer, "tipo_presupuesto_id" integer, "sumcantidad" double precision);


CREATE TABLE "producto_meta" ("niv" integer, "ent" integer, "tp" integer, "pro" integer, "sub" integer, "pry" integer, "prd" integer, "n_sum" double precision, "c_max" double precision, "meta_18" double precision, "meta_19" double precision, "producto_concat" text);


CREATE TABLE "pnd_prod_meta" ("plan_id" integer, "plan_nombre" unknown, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" character varying(45), "prod_concat" text, "prod_id" text, "producto_nombre" text, "cant_destinatarios" double precision, "n_sum" double precision, "c_max" double precision, "meta_18" double precision, "meta_19" double precision, "um_id" integer, "um_nombre" character varying(60), "producto_clase" character varying(1));


CREATE TABLE "pnd_producto_meta_destinatario" ("linea_id" integer, "linea_nombre" text, "eje_id" integer, "eje_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_id" integer, "objetivo_nombre" text, "nivel_id" integer, "entidad_id1" integer, "unidad_responsable_id" integer, "tipo_id" integer, "programa_id" integer, "subprograma_id1" integer, "proyecto_id" integer, "producto_id" integer, "producto_nombre" text, "producto_clase" character varying(1), "unidad_medida_id1" integer, "unidad_medida_nombre" character varying(60), "tipo_destinatario_id" integer, "tipo_destinatario_nombre" text, "destinatario_id" integer, "destinatario_nombre" text, "sum_cantidad" double precision, "max_cantidad" double precision, "destinatario_cantidad" double precision);


CREATE TABLE "pnd_resul_ent_prod_financiamiento" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "colaboracion_resultado" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "ur_id" integer, "ur_nombre" integer, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "colaboracion_producto" double precision, "producto_clase" text, "unidad_medida" character varying(60), "presupuesto" double precision, "objeto_gasto" text, "fuente_financiamiento" character varying(45), "organismo_financiador" text, "objeto_gasto_id" integer, "fuente_financiamiento_id" integer, "organismo_financiador_id" integer);


CREATE TABLE "pnd_resul_ent_prod_financiamiento_temporal" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "linea_transversal_id" integer, "estrategia_id" integer, "objetivo_estrategico_id" integer, "resultado_esperado_id" integer, "colaboracion_resultado" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "ur_id" integer, "prod_concat" text, "prod_id" integer, "colaboracion_producto" double precision, "producto_clase" text, "unidad_medida" character varying(60), "presupuesto" double precision, "objeto_gasto" text, "fuente_financiamiento" character varying(45), "organismo_financiador" text, "objeto_gasto_id" integer, "fuente_financiamiento_id" integer, "organismo_financiador_id" integer);


CREATE TABLE "pnd_resul_ent_prod_meta" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "ur_id" integer, "ur_nombre" text, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "producto_clase" text, "anho" integer, "cantidad" double precision, "unidad_medida" character varying(60));


CREATE TABLE "pnd_resul_ent_prod_meta2" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "colab_res" double precision, "influ_res" double precision, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "colab_prod" double precision, "influ_prod" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "producto_clase" text, "unidad_medida" character varying(60), "anho" integer, "cantidad" double precision);


CREATE TABLE "pnd_resul_ent_prod_meta3" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "colab_res" double precision, "influ_res" double precision, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "colab_prod" double precision, "influ_prod" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "responsable" character varying(45), "prod_concat" text, "prod_id" integer, "producto_nombre" text, "producto_clase" text, "unidad_medida" character varying(60), "anho" integer, "cantidad" double precision);


CREATE TABLE "pnd_resul_ent_prod_meta_depto" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "producto_clase" text, "mes" integer, "anho" integer, "departamento_id" integer, "cantidad" double precision, "unidad_medida" character varying(60));


CREATE TABLE "pnd_resul_ent_prod_meta_presupuesto" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "colaboracion_resultado" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "colaboracion_producto" double precision, "producto_clase" text, "anho" integer, "cantidad" double precision, "unidad_medida" character varying(60), "presupuesto" double precision);


CREATE TABLE "pnd_resul_ent_prod_presupuesto" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "colaboracion_resultado" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "ur_id" integer, "ur_nombre" text, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "colaboracion_producto" double precision, "producto_clase" text, "unidad_medida" character varying(60), "presupuesto" double precision);


CREATE TABLE "pnd_resul_ent_prod_presupuesto_depto" ("eje_estrategico_id" integer, "linea_transversal_id" integer, "estrategia_id" integer, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "anho" integer, "presupuesto" double precision);


CREATE TABLE "pnd_resul_ent_prod_presupuesto_og" ("plan_id" integer, "plan_nombre" text, "eje_estrategico_id" integer, "eje_estrategico_nombre" text, "linea_transversal_id" integer, "linea_transversal_nombre" text, "estrategia_id" integer, "estrategia_nombre" text, "objetivo_estrategico_id" integer, "objetivo_estrategico_nombre" text, "resultado_esperado_id" integer, "resultado_esperado_nombre" text, "colaboracion_resultado" double precision, "nivel_id" integer, "entidad_id" integer, "entidad_sigla" text, "prod_concat" text, "prod_id" integer, "producto_nombre" text, "colaboracion_producto" double precision, "producto_clase" text, "unidad_medida" character varying(60), "objeto_gasto" integer, "objeto_gasto_nombre" text, "grupo_objeto_gasto" integer, "subgrupo_objeto_gasto" integer, "presupuesto" double precision, "objetivo_estrategico_abrev" text);


CREATE TABLE "public"."pnp_pgn_2016" (
    "ani_aniopre" integer NOT NULL,
    "nen_codigo" integer NOT NULL,
    "ent_codigo" integer NOT NULL,
    "tip_codigo" integer NOT NULL,
    "pro_codigo" integer NOT NULL,
    "sub_codigo" integer NOT NULL,
    "pry_codigo" integer NOT NULL,
    "obj_codigo" integer NOT NULL,
    "fue_codigo" integer NOT NULL,
    "fin_codigo" integer NOT NULL,
    "vrs_codigo" integer NOT NULL,
    "pai_codigo" integer NOT NULL,
    "dpt_codigo" integer NOT NULL,
    "ver_desembolso" integer NOT NULL,
    "ver_contrnac" integer NOT NULL,
    "ver_programado" integer NOT NULL,
    "ver_fching" timestamp DEFAULT now() NOT NULL,
    "ver_usring" text,
    "ver_fchact" timestamp DEFAULT now() NOT NULL,
    "ver_usract" text NOT NULL,
    "ver_justifica" text,
    "ver_destino" integer NOT NULL,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."pnp_pgn_2016" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE presupuesto_gasto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."presupuesto_gasto" (
    "id" integer DEFAULT nextval('presupuesto_gasto_id_seq') NOT NULL,
    "codigonivel" integer,
    "codigoentidad" integer,
    "tipoprograma" integer,
    "codigoprograma" integer,
    "codigosubprograma" integer,
    "codigoproyecto" integer,
    "codigoobjetogasto" integer,
    "codigofuentefinan" integer,
    "codigoorgfinanciador" integer,
    "codigodpto" integer,
    "codigopais" integer,
    "aprobado" double precision,
    "modificaciones" double precision,
    "vigente" double precision,
    "planfinanciero" double precision,
    "obligado" double precision,
    "pagado" double precision,
    "saldo" double precision,
    "fechacreacion" timestamp DEFAULT now(),
    "borrado" boolean DEFAULT false,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "pg_indice_unico" UNIQUE ("codigonivel", "codigoentidad", "tipoprograma", "codigoprograma", "codigosubprograma", "codigoproyecto", "codigoobjetogasto", "codigofuentefinan", "codigoorgfinanciador", "codigodpto", "codigopais", "borrado", "anho", "version"),
    CONSTRAINT "presupuesto_gasto_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."presupuesto_gasto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."presupuestogasto_presi" (
    "nivel" integer NOT NULL,
    "entidad" integer NOT NULL,
    "tipo" integer NOT NULL,
    "programa" integer NOT NULL,
    "subprograma" integer NOT NULL,
    "proyecto" integer NOT NULL,
    "objeto" integer NOT NULL,
    "pais" integer NOT NULL,
    "departamento" integer NOT NULL,
    "fuente" integer NOT NULL,
    "organismo" integer NOT NULL,
    "verjustifica" text,
    "verprogramado" double precision NOT NULL,
    "fila" integer NOT NULL,
    "anho" integer NOT NULL,
    "version" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."presupuestogasto_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."presupuestoingreso_presi" (
    "numerofila" integer,
    "anio" integer,
    "nivel" integer,
    "entidad" integer,
    "codorigen" integer,
    "coddetalle" integer,
    "fuentefinanc" integer,
    "montoprogramado" double precision,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."presupuestoingreso_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "produccion" ("nivel_id" integer, "nivel_nombre" text, "entidad_id" integer, "entidad_nombre" text, "tipo_id" integer, "tipo_nombre" text, "programa_id" integer, "programa_nombre" text, "programa_abrev" text, "programa_descripcion" text, "programa_objetivo" text, "programa_diagnostico" text, "programa_base_legal" text, "programa_resultado" text, "programa_depto_cod" integer, "programa_depto_nomb" character varying(45), "subprograma_id" integer, "subprograma_nombre" text, "subprograma_abrev" character varying(45), "subprograma_descripcion" text, "subprograma_objetivo" text, "subprograma_depto_cod" integer, "subprograma_depto_nomb" character varying(45), "subprograma_base_legal" text, "proyecto_id" integer, "proyecto_nombre" text, "proyecto_abrev" character varying(45), "proyecto_unidad_responsable_id" integer, "proyecto_unidad_responsable_nombre" text, "proyecto_unidad_responsable_abrev" character varying(45), "proyecto_funcional_id" integer, "proyecto_funcional_nombre" text, "proyecto_diagnostico" text, "proyecto_depto_cod" integer, "proyecto_depto_nomb" text, "proyecto_snip_cod" integer, "proyecto_snip_nombre" character varying(150), "proyecto_obj_est_id" integer, "proyecto_obj_est_nomb" text, "estrategia_cod" integer, "estrategia_nombre" text, "eje_estrategico_cod" integer, "eje_estrategico_nombre" text, "linea_transversal_cod" integer, "linea_transversal_nombre" text, "producto_id" integer, "producto_nombree" text, "producto_clase" character varying(1), "unidad_medida_cod" integer, "unidad_meida_nomb" character varying(60), "producto_anho" integer, "producto_mes" integer, "producto_depto_cod" integer, "producto_depto_nomb" text, "cantidad" double precision);


CREATE TABLE "produccion_destinatarios" ("nivel_id" integer, "nivel_nombre" text, "entidad_id" integer, "entidad_nombre" text, "tipo_id" integer, "tipo_nombre" text, "programa_id" integer, "programa_nombre" text, "programa_abrev" text, "programa_descripcion" text, "programa_objetivo" text, "programa_diagnostico" text, "programa_base_legal" text, "programa_resultado" text, "programa_depto_cod" integer, "programa_depto_nomb" character varying(45), "subprograma_id" integer, "subprograma_nombre" text, "subprograma_abrev" character varying(45), "subprograma_descripcion" text, "subprograma_objetivo" text, "subprograma_depto_cod" integer, "subprograma_depto_nomb" character varying(45), "subprograma_base_legal" text, "proyecto_id" integer, "proyecto_nombre" text, "proyecto_abrev" character varying(45), "proyecto_unidad_responsable_id" integer, "proyecto_unidad_responsable_nombre" text, "proyecto_unidad_responsable_abrev" character varying(45), "proyecto_funcional_id" integer, "proyecto_funcional_nombre" text, "proyecto_diagnostico" text, "proyecto_depto_cod" integer, "proyecto_depto_nomb" text, "proyecto_snip_cod" integer, "proyecto_snip_nombre" character varying(150), "proyecto_obj_est_id" integer, "proyecto_obj_est_nomb" text, "estrategia_cod" integer, "estrategia_nombre" text, "eje_estrategico_cod" integer, "eje_estrategico_nombre" text, "linea_transversal_cod" integer, "linea_transversal_nombre" text, "producto_id" integer, "producto_nombree" text, "producto_clase" character varying(1), "destinatario_catalogo_cod" integer, "destinatario_catalogo_cod_nomb" text, "destinatario_departamento_cod" integer, "destinatario_departamento_nomb" text, "destinatario_cantidad" double precision);


CREATE TABLE "producto_cadena_valor" ("niv" integer, "ent" integer, "entidad" character varying(45), "tp" integer, "pro" integer, "sub" integer, "pry" integer, "programa" text, "subprograma" text, "proyecto" text, "snip" integer, "unr_id" integer, "unr_abrev" character varying(45), "estrategia" integer, "estrategia_nombre" text, "prd_id" integer, "prd_borr" boolean, "producto" text, "prd_um" character varying(60), "prd_meta_17" double precision, "prd_meta_18" double precision, "prd_meta_19" double precision, "res_id" integer, "res_cat_borr" boolean, "res_borr" boolean, "resultado_esperado" text, "colab_prd_res" double precision, "influ_prd_res" double precision, "pnd_id" integer, "pnd_cat_borr" boolean, "pnd_borr" boolean, "objetivo_pnd" text, "colab_res_pnd" double precision, "influ_res_pnd" double precision);


CREATE SEQUENCE producto_financiero_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_financiero" (
    "id" integer DEFAULT nextval('producto_financiero_id_seq') NOT NULL,
    "nro_fila" integer,
    "codigonivel" integer,
    "codigoentidad" integer,
    "tipoprograma" integer,
    "codigoprograma" integer,
    "codigosubprograma" integer,
    "codigoproyecto" integer,
    "codigoproducto" integer,
    "descripcionproducto" text,
    "codigoobjetogasto" integer,
    "codigofuentefinan" integer,
    "codigoorgfinanciador" integer,
    "codigodpto" integer,
    "planificado1" double precision,
    "ejecutado1" double precision,
    "planificado2" double precision,
    "ejecutado2" double precision,
    "planificado3" double precision,
    "ejecutado3" double precision,
    "planificado4" double precision,
    "ejecutado4" double precision,
    "planificado5" double precision,
    "ejecutado5" double precision,
    "planificado6" double precision,
    "ejecutado6" double precision,
    "planificado7" double precision,
    "ejecutado7" double precision,
    "planificado8" double precision,
    "ejecutado8" double precision,
    "planificado9" double precision,
    "ejecutado9" double precision,
    "planificado10" double precision,
    "ejecutado10" double precision,
    "planificado11" double precision,
    "ejecutado11" double precision,
    "planificado12" double precision,
    "ejecutado12" double precision,
    "fechacreacion" timestamp DEFAULT now(),
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "producto_financiero_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_financiero" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE producto_fisico_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_fisico" (
    "id" integer DEFAULT nextval('producto_fisico_id_seq') NOT NULL,
    "codigonivel" integer,
    "codigoentidad" integer,
    "tipoprograma" integer,
    "codigoprograma" integer,
    "codigosubprograma" integer,
    "codigoproyecto" integer,
    "codigoproducto" integer,
    "descripcionproducto" text,
    "unidadmedida" text,
    "clase" text,
    "meta1" double precision,
    "avance1" double precision,
    "meta2" double precision,
    "avance2" double precision,
    "meta3" double precision,
    "avance3" double precision,
    "meta4" double precision,
    "avance4" double precision,
    "meta5" double precision,
    "avance5" double precision,
    "meta6" double precision,
    "avance6" double precision,
    "meta7" double precision,
    "avance7" double precision,
    "meta8" double precision,
    "avance8" double precision,
    "meta9" double precision,
    "avance9" double precision,
    "meta10" double precision,
    "avance10" double precision,
    "meta11" double precision,
    "avance11" double precision,
    "meta12" double precision,
    "avance12" double precision,
    "fechacreacion" timestamp DEFAULT now(),
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "producto_fisico_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_fisico" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."producto_presupuesto_financiero" (
    "id" double precision NOT NULL,
    "nivel" integer NOT NULL,
    "entidad" integer NOT NULL,
    "tipo" integer NOT NULL,
    "programa" integer NOT NULL,
    "subprograma" integer NOT NULL,
    "proyecto" integer NOT NULL,
    "grupo_objeto_gasto_id" integer NOT NULL,
    "subgrupo_objeto_gasto_id" integer NOT NULL,
    "objeto_gasto_id" integer NOT NULL,
    "fuente_id" integer NOT NULL,
    "funcional_id" integer NOT NULL,
    "funcional_nombre" text NOT NULL,
    "departamento_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "producto_nombre" text NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "nombre_unidad_medida" text NOT NULL,
    "mes" integer NOT NULL,
    "snip" integer,
    "meta" double precision NOT NULL,
    "asignacion" double precision,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "producto_presupuesto_financiero_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupuesto_financiero" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "programas_producto_meta" ("niv" integer, "ent" integer, "tp" integer, "pro" integer, "sub" integer, "pry" integer, "programa" text, "subprograma" text, "proyecto" text, "snip" integer, "unr_id" integer, "unr_abrev" character varying(45), "estrategia" integer, "estrategia_nombre" text, "prd" integer, "producto" text, "prd_um" character varying(60), "clase" character varying(1), "n_sum" double precision, "c_max" double precision, "meta_18" double precision, "meta_19" double precision);


CREATE SEQUENCE programatico_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."programatico" (
    "id" integer DEFAULT nextval('programatico_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "tipo_programatico_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "programatico_pkey" PRIMARY KEY ("id", "tipo_programatico_id"),
    CONSTRAINT "fk_programatico_tipo_programatico" FOREIGN KEY (tipo_programatico_id) REFERENCES tipo_programatico(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "programatico_fk_programatico_tipo_programatico_idx" ON "public"."programatico" USING btree ("tipo_programatico_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."programatico" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."programatico_has_objetivo" (
    "programatico_id" integer NOT NULL,
    "programatico_tipo_programatico_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "programatico_has_objetivo_pkey" PRIMARY KEY ("programatico_id", "programatico_tipo_programatico_id"),
    CONSTRAINT "fk_programatico_has_objetivo_programatico1" FOREIGN KEY (programatico_id, programatico_tipo_programatico_id) REFERENCES programatico(id, tipo_programatico_id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "programatico_has_objetivo_fk_programatico_h1_idx" ON "public"."programatico_has_objetivo" USING btree ("programatico_id", "programatico_tipo_programatico_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."programatico_has_objetivo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE proyecto_has_objetivo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."proyecto_has_objetivo" (
    "id" integer DEFAULT nextval('proyecto_has_objetivo_id_seq') NOT NULL,
    "nivel" integer,
    "entidad" integer,
    "tipo_presupuesto" integer,
    "programa" integer,
    "sub_programa" integer,
    "funcional" integer,
    "proyecto" integer,
    "objetivo" integer,
    "valoracion" integer,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "proyecto_has_objetivo_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."proyecto_has_objetivo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "resultado_indicador_meta" ("nivel_id" integer, "nivel_nombre" text, "entidad_id" integer, "entidad_nombre" text, "tipo_id" integer, "tipo_nombre" text, "programa_id" integer, "programa_nombre" text, "programa_abrev" text, "programa_descripcion" text, "programa_objetivo" text, "programa_diagnostico" text, "programa_base_legal" text, "programa_resultado" text, "programa_depto_cod" integer, "programa_depto_nomb" character varying(45), "subprograma_id" integer, "subprograma_nombre" text, "subprograma_abrev" character varying(45), "subprograma_descripcion" text, "subprograma_objetivo" text, "subprograma_depto_cod" integer, "subprograma_depto_nomb" character varying(45), "subprograma_base_legal" text, "proyecto_id" integer, "proyecto_nombre" text, "proyecto_abrev" character varying(45), "proyecto_unidad_responsable_id" integer, "proyecto_unidad_responsable_nombre" text, "proyecto_unidad_responsable_abrev" character varying(45), "proyecto_funcional_id" integer, "proyecto_funcional_nombre" text, "proyecto_diagnostico" text, "proyecto_depto_cod" integer, "proyecto_depto_nomb" text, "proyecto_snip_cod" integer, "proyecto_snip_nombre" character varying(150), "proyecto_obj_est_id" integer, "proyecto_obj_est_nomb" text, "estrategia_cod" integer, "estrategia_nombre" text, "eje_estrategico_cod" integer, "eje_estrategico_nombre" text, "linea_transversal_cod" integer, "linea_transversal_nombre" text, "resultado_id" integer, "resultado_nombre" text, "indicador_id" integer, "indicador_nombre" text, "unidad_medida_id" integer, "unidad_medida_nombre" character varying(60), "meta_vencimiento" text, "meta_cantidad" text);


CREATE TABLE "public"."servicio" (
    "id" integer NOT NULL,
    "urlimagen" text NOT NULL,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."servicio" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_documentos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_documentos" (
    "id" integer DEFAULT nextval('tipo_documentos_id_seq') NOT NULL,
    "nombre" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_documentos" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_indicador_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_indicador" (
    "id" integer DEFAULT nextval('tipo_indicador_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_indicador_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_indicador" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_zona_geografica_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_zona_geografica" (
    "id" integer DEFAULT nextval('tipo_zona_geografica_id_seq') NOT NULL,
    "nombre" text,
    "descipcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tipo_zona_geografica_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_zona_geografica" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE unidad_jerarquica_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."unidad_jerarquica" (
    "id" integer DEFAULT nextval('unidad_jerarquica_id_seq') NOT NULL,
    "nombre" text,
    "descipcion" text,
    "entidad_id" integer NOT NULL,
    "entidad_nivel_id" integer NOT NULL,
    "anho" integer,
    "numero_fila" integer,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "unidad_jerarquica_pkey" PRIMARY KEY ("id", "entidad_id", "entidad_nivel_id"),
    CONSTRAINT "fk_unidad_jerarquica_entidad1" FOREIGN KEY (entidad_id, entidad_nivel_id) REFERENCES entidad(id, nivel_id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "unidad_jerarquica_fk_unidad_jerarquica_entidad1_idx" ON "public"."unidad_jerarquica" USING btree ("entidad_id", "entidad_nivel_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."unidad_jerarquica" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE usuario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."usuario" (
    "id" integer DEFAULT nextval('usuario_id_seq') NOT NULL,
    "correo" text,
    "passwd" text,
    "last_login" timestamp,
    "entidad" text,
    "role_id" integer DEFAULT 4 NOT NULL,
    "entidad_id" integer,
    "nivel_id" integer,
    "nombre" text,
    "urlimagen" text,
    "unr_id" integer DEFAULT 0 NOT NULL,
    "borrado" boolean DEFAULT false,
    "url" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "role_id_movil" integer DEFAULT 4 NOT NULL,
    "role_id_tablero" integer DEFAULT 4 NOT NULL,
    "role_identificaciones" integer DEFAULT 4 NOT NULL,
    "email_real" boolean DEFAULT true,
    CONSTRAINT "correo_pk" UNIQUE ("correo"),
    CONSTRAINT "usuario_correo_key" UNIQUE ("correo"),
    CONSTRAINT "usuario_pkey" PRIMARY KEY ("id", "role_id"),
    CONSTRAINT "fk_usuario_role1" FOREIGN KEY (role_id) REFERENCES role(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "usuario_fk_usuario_role1_idx" ON "public"."usuario" USING btree ("role_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."usuario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "v_depto_suma" ("anho" integer, "departamento_id" integer, "nivel_id" integer, "entidad_id" integer, "programa_id" integer, "subprograma_id" integer, "proyecto_id" integer, "producto_id" integer, "tipo_presupuesto_id" integer, "sum_cantidad" double precision);


CREATE TABLE "v_depto_top" ("anho" integer, "departamento_id" integer, "nivel_id" integer, "entidad_id" integer, "programa_id" integer, "subprograma_id" integer, "proyecto_id" integer, "producto_id" integer, "tipo_presupuesto_id" integer, "macantidad" double precision);


CREATE TABLE "v_estructura" ("ppf_id" double precision, "ppf_nivel" integer, "ppf_entidad" integer, "entidad_nombre" text, "entidad_descripcion" text, "ppf_tipo" integer, "ppf_programa" integer, "ppf_subprograma" integer, "ppf_proyecto" integer, "ppf_snip" integer, "programa_nombre" text, "subprograma_nombre" text, "proyecto_nombre" text, "ppf_producto_id" integer, "ppf_producto_nombre" text, "ppf_unidad_medida_id" integer, "ppf_nombre_unidad_medida" text, "ppf_meta" double precision, "ppf_asignacion" double precision);


CREATE TABLE "v_mes_top" ("anho" integer, "mes" integer, "nivel_id" integer, "entidad_id" integer, "programa_id" integer, "subprograma_id" integer, "proyecto_id" integer, "producto_id" integer, "tipo_presupuesto_id" integer, "max_cantidad" double precision);


CREATE TABLE "v_pre_mes" ("nivel" integer, "entidad" integer, "tipo" integer, "programa" integer, "subprograma" integer, "proyecto" integer, "departamento_id" integer, "producto_id" integer, "enero" double precision, "febrero" double precision, "marzo" double precision, "abril" double precision, "mayo" double precision, "junio" double precision, "julio" double precision, "agosto" double precision, "setiembre" double precision, "octubre" double precision, "noviembre" double precision, "diembre" double precision);


CREATE TABLE "v_producto_esperado_destinatario" ("nivel_id" integer, "nivel_nombre" text, "entidad_id" integer, "entidad_nombre" text, "tipo_id" integer, "tipo_nombre" text, "programa_id" integer, "programa_nombre" text, "programa_abrev" text, "programa_descripcion" text, "programa_objetivo" text, "programa_diagnostico" text, "programa_base_legal" text, "programa_resultado" text, "programa_depto_cod" integer, "programa_depto_nomb" character varying(45), "subprograma_id" integer, "subprograma_nombre" text, "subprograma_abrev" character varying(45), "subprograma_descripcion" text, "subprograma_objetivo" text, "subprograma_depto_cod" integer, "subprograma_depto_nomb" character varying(45), "subprograma_base_legal" text, "proyecto_id" integer, "proyecto_nombre" text, "proyecto_abrev" character varying(45), "proyecto_unidad_responsable_id" integer, "proyecto_unidad_responsable_nombre" text, "proyecto_unidad_responsable_abrev" character varying(45), "proyecto_funcional_id" integer, "proyecto_funcional_nombre" text, "proyecto_diagnostico" text, "proyecto_depto_cod" integer, "proyecto_depto_nomb" text, "proyecto_snip_cod" integer, "proyecto_snip_nombre" character varying(150), "proyecto_obj_est_id" integer, "producto_nombre" text, "v_ppd_cantidad" double precision);


CREATE TABLE "v_proyecto_has_objetivo" ("id" integer, "nivel" integer, "entidad" integer, "tipo_presupuesto" integer, "programa" integer, "sub_programa" integer, "funcional" integer, "proyecto" integer, "objetivo" integer, "valoracion" integer);


CREATE TABLE "public"."version" (
    "nro" bigint NOT NULL,
    "anho" bigint NOT NULL,
    "descripcion" text NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "version_pkey" PRIMARY KEY ("nro", "anho")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."version" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE version_db_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."version_db" (
    "id" integer DEFAULT nextval('version_db_id_seq') NOT NULL,
    "id_anterior" integer,
    "usuario_git" text,
    "descripcion" text,
    "fecha_insercion" time without time zone DEFAULT now(),
    "fecha_actualizacion" time without time zone DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ID_VERSION_DB" PRIMARY KEY ("id")
) WITH (oids = true);


CREATE SEQUENCE zona_geografica_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."zona_geografica" (
    "id" integer DEFAULT nextval('zona_geografica_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "abrev" text,
    "tipo_zona_geografica_id" integer NOT NULL,
    "cod_geo_unif" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "zona_geografica_pkey" PRIMARY KEY ("id", "tipo_zona_geografica_id"),
    CONSTRAINT "fk_zona_geografica_tipo_zona_geografica1" FOREIGN KEY (tipo_zona_geografica_id) REFERENCES tipo_zona_geografica(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "zona_geografica_fk_zona_geografica_tipo_zona_geografica1_idx" ON "public"."zona_geografica" USING btree ("tipo_zona_geografica_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."zona_geografica" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE meta1_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."meta1" (
    "id" integer DEFAULT nextval('meta1_id_seq') NOT NULL,
    "cantidad" text,
    "vencimiento" text,
    "indicador_id" integer NOT NULL,
    "zona_geografica_id" integer NOT NULL,
    "demografia_id" integer NOT NULL,
    "borrado_int" integer DEFAULT 0,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "nivel" integer,
    "entidad" integer,
    "borrado" boolean DEFAULT false,
    "b" text,
    "producto_concat" text DEFAULT ,
    "objetivo_id" integer,
    "tipo_objetivo_id" integer
) WITH (oids = true);


CREATE SEQUENCE producto_presupuesto_meta_n_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupuesto_meta_n" (
    "id" integer DEFAULT nextval('producto_presupuesto_meta_n_id_seq') NOT NULL,
    "mes" integer,
    "anho" integer,
    "cantidad" double precision,
    "catalogo_destinatario_id" integer DEFAULT (1) NOT NULL,
    "departamento_id" integer DEFAULT (99) NOT NULL,
    "producto_presupusto_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "proyecto_id" integer NOT NULL,
    "subprograma_id" integer NOT NULL,
    "programa_id" integer NOT NULL,
    "tipo_presupuesto_id" integer NOT NULL,
    "entidad_id" integer NOT NULL,
    "nivel_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);


CREATE TABLE "duplicados" ("mes" integer, "anho" integer, "cantidad" double precision, "catalogo_destinatario_id" integer, "departamento_id" integer, "producto_presupusto_id" integer, "producto_id" integer, "unidad_medida_id" integer, "proyecto_id" integer, "subprograma_id" integer, "programa_id" integer, "tipo_presupuesto_id" integer, "entidad_id" integer, "nivel_id" integer, "borrado" boolean, "version" integer, "usuario_responsable" text, "count" bigint);


CREATE SEQUENCE justificacion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."justificacion" (
    "id" integer DEFAULT nextval('justificacion_id_seq') NOT NULL,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "nivel" integer,
    "entidad" integer,
    "tipoprograma" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "producto" integer,
    "descripcion" text DEFAULT ,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."justificacion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE dictamen_stp_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."dictamen_stp" (
    "id" integer DEFAULT nextval('dictamen_stp_id_seq') NOT NULL,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "nivel" integer,
    "entidad" integer,
    "tipoprograma" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "producto" integer,
    "eleccion" integer NOT NULL,
    "observacion" text DEFAULT ,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "url_documento" text
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."dictamen_stp" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE producto_presupuesto_meta_shadow_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupuesto_meta_shadow" (
    "id" integer DEFAULT nextval('producto_presupuesto_meta_shadow_id_seq') NOT NULL,
    "mes" integer,
    "anho" integer,
    "cantidad" double precision,
    "catalogo_destinatario_id" integer DEFAULT (1) NOT NULL,
    "departamento_id" integer DEFAULT (99) NOT NULL,
    "producto_presupusto_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "proyecto_id" integer NOT NULL,
    "subprograma_id" integer NOT NULL,
    "programa_id" integer NOT NULL,
    "tipo_presupuesto_id" integer NOT NULL,
    "entidad_id" integer NOT NULL,
    "nivel_id" integer NOT NULL,
    "borrado" boolean DEFAULT false,
    "version" integer DEFAULT 0,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupuesto_meta_shadow" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE producto_presupuesto_destinatario_shadow_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto_presupuesto_destinatario_shadow" (
    "id" integer DEFAULT nextval('producto_presupuesto_destinatario_shadow_id_seq') NOT NULL,
    "nivel" integer,
    "entidad" integer,
    "tipo_presupuesto" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "producto" integer,
    "catalogo_destinatario" integer,
    "departamento" integer,
    "cantidad" double precision,
    "anho" integer DEFAULT 0,
    "version" integer DEFAULT 0,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "descripcion" text DEFAULT  
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupuesto_destinatario_shadow" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."asignacion_presi_shadow" (
    "fila" integer,
    "nivel" integer DEFAULT 0 NOT NULL,
    "entidad" integer DEFAULT 0 NOT NULL,
    "tipo" integer DEFAULT 0 NOT NULL,
    "programa" integer DEFAULT 0 NOT NULL,
    "subprograma" integer DEFAULT 0 NOT NULL,
    "proyecto" integer DEFAULT 0 NOT NULL,
    "objeto_gasto" integer DEFAULT 0 NOT NULL,
    "fuente_financiamiento" integer DEFAULT 0 NOT NULL,
    "organismo_financiador" integer DEFAULT 0 NOT NULL,
    "pais" integer DEFAULT 0 NOT NULL,
    "departamento" integer DEFAULT 0 NOT NULL,
    "producto" integer DEFAULT 0 NOT NULL,
    "observacion" text,
    "planificado1" double precision,
    "ejecutado1" double precision,
    "planificado2" double precision,
    "ejecutado2" double precision,
    "planificado3" double precision,
    "ejecutado3" double precision,
    "planificado4" double precision,
    "ejecutado4" double precision,
    "planificado5" double precision,
    "ejecutado5" double precision,
    "planificado6" double precision,
    "ejecutado6" double precision,
    "planificado7" double precision,
    "ejecutado7" double precision,
    "planificado8" double precision,
    "ejecutado8" double precision,
    "planificado9" double precision,
    "ejecutado9" double precision,
    "planificado10" double precision,
    "ejecutado10" double precision,
    "planificado11" double precision,
    "ejecutado11" double precision,
    "planificado12" double precision,
    "ejecutado12" double precision,
    "anho" integer DEFAULT 0 NOT NULL,
    "version" integer DEFAULT 0 NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."asignacion_presi_shadow" FOR EACH ROW EXECUTE PROCEDURE auditoria();


DROP TABLE IF EXISTS "cadena_valor_sugerida";
CREATE TABLE "public"."cadena_valor_sugerida" (
    "pnd_est" integer,
    "pnd_obj_id" integer,
    "pnd_objetivo_nombre" text,
    "res_id" integer,
    "resultado_sugerido_nombre" text,
    "prod_id" integer,
    "producto_nombre" text
) WITH (oids = false);

DROP TABLE IF EXISTS "producto_unidad_medida";
CREATE TABLE "public"."producto_unidad_medida" (
    "id" integer,
    "nombre" text,
    "descripcion" text,
    "clase" character varying(1),
    "unidad_medida_id" integer,
    "uni_nombre" character varying(60)
) WITH (oids = false);

DROP TABLE IF EXISTS "cadena_valor_vinculada";
CREATE TABLE "public"."cadena_valor_vinculada" (
    "niv" integer,
    "ent" integer,
    "entidad" character varying(45),
    "tp" integer,
    "pro" integer,
    "sub" integer,
    "pry" integer,
    "programa" text,
    "subprograma" text,
    "proyecto" text,
    "snip" integer,
    "unr_id" integer,
    "unr_abrev" character varying(45),
    "prd_id" integer,
    "prd_borr" boolean,
    "producto" text,
    "prd_um" character varying(60),
    "res_id" integer,
    "res_cat_borr" boolean,
    "res_borr" boolean,
    "resultado_esperado" text,
    "colab_prd_res" double precision,
    "influ_prd_res" double precision,
    "pnd_id" integer,
    "pnd_cat_borr" boolean,
    "pnd_borr" boolean,
    "objetivo_pnd" text,
    "colab_res_pnd" double precision,
    "influ_res_pnd" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "fin_fun";
CREATE TABLE "public"."fin_fun" (
    "id" integer,
    "numero_fila" integer,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "es_imputable" character varying(1),
    "borrado" boolean,
    "anho" integer,
    "version" integer,
    "fecha_actualizacion" timestamp,
    "fecha_insercion" timestamp,
    "usuario_responsable" text,
    "finalidad" integer,
    "funcion" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "grupo_subgrupo_objeto_gasto";
CREATE TABLE "public"."grupo_subgrupo_objeto_gasto" (
    "id" integer,
    "nombre" text,
    "descripcion" text,
    "abrev" character varying(45),
    "es_imputable" character varying(1),
    "numero_fila" integer,
    "anho" integer,
    "borrado" boolean,
    "version" integer,
    "fecha_actualizacion" timestamp,
    "fecha_insercion" timestamp,
    "usuario_responsable" text,
    "grupo" integer,
    "subgrupo" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "pivot_cadena_valor";
CREATE TABLE "public"."pivot_cadena_valor" (
    "plan_id" integer,
    "plan_nombre" character varying(100),
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "eje_estrategico_descripcion" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "linea_transversal_descripcion" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "estrategia_descripcion" text,
    "objetivo_pnd_id" integer,
    "objetivo_pnd_nombre" text,
    "objetivo_pnd_descripcion" text,
    "resultado_id" integer,
    "resultado_nombre" text,
    "resultado_descripcion" text,
    "colaboracion" double precision,
    "influencia" double precision,
    "nivel_id" integer,
    "nivel_nombre" text,
    "entidad_id" integer,
    "entidad_nombre" text,
    "tipo_presupuesto_id" integer,
    "tipo_presupuesto_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "producto_id" integer,
    "producto_nombre" text,
    "ur_id" integer,
    "ur_nombre" text
) WITH (oids = false);

DROP TABLE IF EXISTS "pivot_destinatarios_producto";
CREATE TABLE "public"."pivot_destinatarios_producto" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "entidad_id" integer,
    "entidad_nombre" text,
    "tipo_presupuesto_id" integer,
    "tipo_presupuesto_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "producto_id" integer,
    "producto_nombre" text,
    "catalogo_destinatario_id" integer,
    "catalogo_destinatario_nombre" text,
    "catalogo_destinatario_descripcion" text,
    "tipo_catalogo_destinatario_id" integer,
    "tipo_catalogo_destinatario_nombre" text,
    "departamento_id" integer,
    "departamento_nombre" text,
    "cantidad" double precision,
    "descripcion" text
) WITH (oids = false);

DROP TABLE IF EXISTS "pivot_estructura_programatica";
CREATE TABLE "public"."pivot_estructura_programatica" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "nivel_abrev" character varying(45),
    "entidad_id" integer,
    "entidad_nombre" text,
    "entidad_sigla" character varying(45),
    "tipo_presu_id" integer,
    "tipo_presu_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "programa_diagnostico" text,
    "programa_objetivo" text,
    "programa_base_legal" text,
    "programa_depto" integer,
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "subprograma_objetivo" text,
    "subprograma_baselegal" text,
    "subprograma_departamento" integer,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "proyecto_diagnostico" text,
    "proyecto_objetivo" integer,
    "proyecto_objetivo_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "unidad_responsable_id" integer,
    "unidad_responsable_nombre" text,
    "finalidad_id" integer,
    "finalidad" text,
    "funcion_id" integer,
    "funcion" text,
    "snip_autorizado_id" integer,
    "snip_autorizado_nombre" character varying(150),
    "proyecto_depto" integer,
    "producto_id" integer,
    "producto_concat" text,
    "producto_nombre" text,
    "producto_unidad_medida_id" integer,
    "unidad_medida_nombre" character varying(60),
    "producto_intermedio" boolean,
    "producto_clase" character varying(1),
    "producto_anho" integer,
    "producto_etiqueta_id" integer,
    "producto_etiqueta_nombre" text
) WITH (oids = false);

DROP TABLE IF EXISTS "pivot_indicadores";
CREATE TABLE "public"."pivot_indicadores" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "nivel_abrev" character varying(45),
    "entidad_id" integer,
    "entidad_nombre" text,
    "entidad_sigla" character varying(45),
    "unr_id" integer,
    "unr_nombre" text,
    "objetivo_id" integer,
    "objetivo_nombre" text,
    "objetivo_tipo" integer,
    "objetivo_tipo_nombre" text,
    "indicador_id" integer,
    "indicador_nombre" text,
    "indicador_descripcion" text,
    "indicador_tipo" integer,
    "indicador_metodo_calculo" text,
    "indicador_frecuencia_meses" integer,
    "indicador_fecha_disponibilidad" text,
    "indicador_cobertura_geografica_id" integer,
    "indicador_cobertura_geografica_nombre" text,
    "indicador_despliegue_geografico_id" integer,
    "indicador_despliegue_geografico_nombre" text,
    "indicador_despliegue_demografica_id" integer,
    "indicador_despliegue_demografica_nombre" text,
    "indicador_fuente_datos" text,
    "indicador_institucion_responsable" text,
    "indicador_evaluacion_heci" text,
    "indicador_comentarios" text,
    "indicador_contacto" text,
    "fecha_metas_previstas" text,
    "cantidad_metas_previstas" text,
    "fecha_avance" text,
    "cantidad_avance" text,
    "indicador_unidad_medida" integer,
    "indicador_unidad_medida_nombre" character varying(60)
) WITH (oids = false);

DROP TABLE IF EXISTS "pivot_metas_productos";
CREATE TABLE "public"."pivot_metas_productos" (
    "institucion" character varying(45),
    "nombre_programatico" text,
    "producto_concat" text,
    "producto_id" integer,
    "nombre" text,
    "clase" character varying(1),
    "unidad_medida_id" integer,
    "unidad_medida_nombre" character varying(60),
    "departamento_id" integer,
    "departamento_nombre" text,
    "anho" integer,
    "mes" integer,
    "cantidad" double precision,
    "version" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "pivot_perfil_institucional";
CREATE TABLE "public"."pivot_perfil_institucional" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "nivel_abrev" character varying(45),
    "entidad_id" integer,
    "entidad_nombre" text,
    "entidad_sigla" character varying(45),
    "unr_id" integer,
    "unr_nombre" text,
    "unr_abrev" character varying(45),
    "unr_unjer_id" integer,
    "institucion_id" integer,
    "institucion_nombre" text,
    "institucion_sigla" text,
    "institucion_abrev" text,
    "institucion_ruc" text,
    "institucion_base_legal" text,
    "institucion_mision" text,
    "institucion_vision" text,
    "institucion_diagnostico" text,
    "institucion_objetivo" text,
    "institucion_politica" text
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_entidad_resultado";
CREATE TABLE "public"."pnd_entidad_resultado" (
    "plan_id" integer,
    "plan_nombre" unknown,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" character varying(45)
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_dest";
CREATE TABLE "public"."pnd_resul_ent_prod_dest" (
    "plan_id" integer,
    "plan_nombre" unknown,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" character varying(45),
    "prod_concat" text,
    "prod_id" text,
    "producto_nombre" text,
    "cant_destinatarios" double precision,
    "cod_catalogo_destinatario" integer,
    "nombre_catalogo_destinatario" text,
    "ne_concat" text,
    "entidad_nombre" text,
    "tipo_nombre_catalogo_destinatario" text,
    "ur_id" integer,
    "ur_nombre" text
) WITH (oids = false);

DROP TABLE IF EXISTS "v_mes_suma";
CREATE TABLE "public"."v_mes_suma" (
    "anho" integer,
    "mes" integer,
    "nivel_id" integer,
    "entidad_id" integer,
    "programa_id" integer,
    "subprograma_id" integer,
    "proyecto_id" integer,
    "producto_id" integer,
    "tipo_presupuesto_id" integer,
    "sumcantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "producto_meta";
CREATE TABLE "public"."producto_meta" (
    "niv" integer,
    "ent" integer,
    "tp" integer,
    "pro" integer,
    "sub" integer,
    "pry" integer,
    "prd" integer,
    "n_sum" double precision,
    "c_max" double precision,
    "meta_18" double precision,
    "meta_19" double precision,
    "producto_concat" text
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_prod_meta";
CREATE TABLE "public"."pnd_prod_meta" (
    "plan_id" integer,
    "plan_nombre" unknown,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" character varying(45),
    "prod_concat" text,
    "prod_id" text,
    "producto_nombre" text,
    "cant_destinatarios" double precision,
    "n_sum" double precision,
    "c_max" double precision,
    "meta_18" double precision,
    "meta_19" double precision,
    "um_id" integer,
    "um_nombre" character varying(60),
    "producto_clase" character varying(1)
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_producto_meta_destinatario";
CREATE TABLE "public"."pnd_producto_meta_destinatario" (
    "linea_id" integer,
    "linea_nombre" text,
    "eje_id" integer,
    "eje_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_id" integer,
    "objetivo_nombre" text,
    "nivel_id" integer,
    "entidad_id1" integer,
    "unidad_responsable_id" integer,
    "tipo_id" integer,
    "programa_id" integer,
    "subprograma_id1" integer,
    "proyecto_id" integer,
    "producto_id" integer,
    "producto_nombre" text,
    "producto_clase" character varying(1),
    "unidad_medida_id1" integer,
    "unidad_medida_nombre" character varying(60),
    "tipo_destinatario_id" integer,
    "tipo_destinatario_nombre" text,
    "destinatario_id" integer,
    "destinatario_nombre" text,
    "sum_cantidad" double precision,
    "max_cantidad" double precision,
    "destinatario_cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_financiamiento";
CREATE TABLE "public"."pnd_resul_ent_prod_financiamiento" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "colaboracion_resultado" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "ur_id" integer,
    "ur_nombre" integer,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "colaboracion_producto" double precision,
    "producto_clase" text,
    "unidad_medida" character varying(60),
    "presupuesto" double precision,
    "objeto_gasto" text,
    "fuente_financiamiento" character varying(45),
    "organismo_financiador" text,
    "objeto_gasto_id" integer,
    "fuente_financiamiento_id" integer,
    "organismo_financiador_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_financiamiento_temporal";
CREATE TABLE "public"."pnd_resul_ent_prod_financiamiento_temporal" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "linea_transversal_id" integer,
    "estrategia_id" integer,
    "objetivo_estrategico_id" integer,
    "resultado_esperado_id" integer,
    "colaboracion_resultado" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "ur_id" integer,
    "prod_concat" text,
    "prod_id" integer,
    "colaboracion_producto" double precision,
    "producto_clase" text,
    "unidad_medida" character varying(60),
    "presupuesto" double precision,
    "objeto_gasto" text,
    "fuente_financiamiento" character varying(45),
    "organismo_financiador" text,
    "objeto_gasto_id" integer,
    "fuente_financiamiento_id" integer,
    "organismo_financiador_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_meta";
CREATE TABLE "public"."pnd_resul_ent_prod_meta" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "ur_id" integer,
    "ur_nombre" text,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "producto_clase" text,
    "anho" integer,
    "cantidad" double precision,
    "unidad_medida" character varying(60)
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_meta2";
CREATE TABLE "public"."pnd_resul_ent_prod_meta2" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "colab_res" double precision,
    "influ_res" double precision,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "colab_prod" double precision,
    "influ_prod" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "producto_clase" text,
    "unidad_medida" character varying(60),
    "anho" integer,
    "cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_meta3";
CREATE TABLE "public"."pnd_resul_ent_prod_meta3" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "colab_res" double precision,
    "influ_res" double precision,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "colab_prod" double precision,
    "influ_prod" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "responsable" character varying(45),
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "producto_clase" text,
    "unidad_medida" character varying(60),
    "anho" integer,
    "cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_meta_depto";
CREATE TABLE "public"."pnd_resul_ent_prod_meta_depto" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "producto_clase" text,
    "mes" integer,
    "anho" integer,
    "departamento_id" integer,
    "cantidad" double precision,
    "unidad_medida" character varying(60)
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_meta_presupuesto";
CREATE TABLE "public"."pnd_resul_ent_prod_meta_presupuesto" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "colaboracion_resultado" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "colaboracion_producto" double precision,
    "producto_clase" text,
    "anho" integer,
    "cantidad" double precision,
    "unidad_medida" character varying(60),
    "presupuesto" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_presupuesto";
CREATE TABLE "public"."pnd_resul_ent_prod_presupuesto" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "colaboracion_resultado" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "ur_id" integer,
    "ur_nombre" text,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "colaboracion_producto" double precision,
    "producto_clase" text,
    "unidad_medida" character varying(60),
    "presupuesto" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_presupuesto_depto";
CREATE TABLE "public"."pnd_resul_ent_prod_presupuesto_depto" (
    "eje_estrategico_id" integer,
    "linea_transversal_id" integer,
    "estrategia_id" integer,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "anho" integer,
    "presupuesto" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "pnd_resul_ent_prod_presupuesto_og";
CREATE TABLE "public"."pnd_resul_ent_prod_presupuesto_og" (
    "plan_id" integer,
    "plan_nombre" text,
    "eje_estrategico_id" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_id" integer,
    "linea_transversal_nombre" text,
    "estrategia_id" integer,
    "estrategia_nombre" text,
    "objetivo_estrategico_id" integer,
    "objetivo_estrategico_nombre" text,
    "resultado_esperado_id" integer,
    "resultado_esperado_nombre" text,
    "colaboracion_resultado" double precision,
    "nivel_id" integer,
    "entidad_id" integer,
    "entidad_sigla" text,
    "prod_concat" text,
    "prod_id" integer,
    "producto_nombre" text,
    "colaboracion_producto" double precision,
    "producto_clase" text,
    "unidad_medida" character varying(60),
    "objeto_gasto" integer,
    "objeto_gasto_nombre" text,
    "grupo_objeto_gasto" integer,
    "subgrupo_objeto_gasto" integer,
    "presupuesto" double precision,
    "objetivo_estrategico_abrev" text
) WITH (oids = false);

DROP TABLE IF EXISTS "produccion";
CREATE TABLE "public"."produccion" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "entidad_id" integer,
    "entidad_nombre" text,
    "tipo_id" integer,
    "tipo_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "programa_abrev" text,
    "programa_descripcion" text,
    "programa_objetivo" text,
    "programa_diagnostico" text,
    "programa_base_legal" text,
    "programa_resultado" text,
    "programa_depto_cod" integer,
    "programa_depto_nomb" character varying(45),
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "subprograma_abrev" character varying(45),
    "subprograma_descripcion" text,
    "subprograma_objetivo" text,
    "subprograma_depto_cod" integer,
    "subprograma_depto_nomb" character varying(45),
    "subprograma_base_legal" text,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "proyecto_abrev" character varying(45),
    "proyecto_unidad_responsable_id" integer,
    "proyecto_unidad_responsable_nombre" text,
    "proyecto_unidad_responsable_abrev" character varying(45),
    "proyecto_funcional_id" integer,
    "proyecto_funcional_nombre" text,
    "proyecto_diagnostico" text,
    "proyecto_depto_cod" integer,
    "proyecto_depto_nomb" text,
    "proyecto_snip_cod" integer,
    "proyecto_snip_nombre" character varying(150),
    "proyecto_obj_est_id" integer,
    "proyecto_obj_est_nomb" text,
    "estrategia_cod" integer,
    "estrategia_nombre" text,
    "eje_estrategico_cod" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_cod" integer,
    "linea_transversal_nombre" text,
    "producto_id" integer,
    "producto_nombree" text,
    "producto_clase" character varying(1),
    "unidad_medida_cod" integer,
    "unidad_meida_nomb" character varying(60),
    "producto_anho" integer,
    "producto_mes" integer,
    "producto_depto_cod" integer,
    "producto_depto_nomb" text,
    "cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "produccion_destinatarios";
CREATE TABLE "public"."produccion_destinatarios" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "entidad_id" integer,
    "entidad_nombre" text,
    "tipo_id" integer,
    "tipo_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "programa_abrev" text,
    "programa_descripcion" text,
    "programa_objetivo" text,
    "programa_diagnostico" text,
    "programa_base_legal" text,
    "programa_resultado" text,
    "programa_depto_cod" integer,
    "programa_depto_nomb" character varying(45),
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "subprograma_abrev" character varying(45),
    "subprograma_descripcion" text,
    "subprograma_objetivo" text,
    "subprograma_depto_cod" integer,
    "subprograma_depto_nomb" character varying(45),
    "subprograma_base_legal" text,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "proyecto_abrev" character varying(45),
    "proyecto_unidad_responsable_id" integer,
    "proyecto_unidad_responsable_nombre" text,
    "proyecto_unidad_responsable_abrev" character varying(45),
    "proyecto_funcional_id" integer,
    "proyecto_funcional_nombre" text,
    "proyecto_diagnostico" text,
    "proyecto_depto_cod" integer,
    "proyecto_depto_nomb" text,
    "proyecto_snip_cod" integer,
    "proyecto_snip_nombre" character varying(150),
    "proyecto_obj_est_id" integer,
    "proyecto_obj_est_nomb" text,
    "estrategia_cod" integer,
    "estrategia_nombre" text,
    "eje_estrategico_cod" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_cod" integer,
    "linea_transversal_nombre" text,
    "producto_id" integer,
    "producto_nombree" text,
    "producto_clase" character varying(1),
    "destinatario_catalogo_cod" integer,
    "destinatario_catalogo_cod_nomb" text,
    "destinatario_departamento_cod" integer,
    "destinatario_departamento_nomb" text,
    "destinatario_cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "producto_cadena_valor";
CREATE TABLE "public"."producto_cadena_valor" (
    "niv" integer,
    "ent" integer,
    "entidad" character varying(45),
    "tp" integer,
    "pro" integer,
    "sub" integer,
    "pry" integer,
    "programa" text,
    "subprograma" text,
    "proyecto" text,
    "snip" integer,
    "unr_id" integer,
    "unr_abrev" character varying(45),
    "estrategia" integer,
    "estrategia_nombre" text,
    "prd_id" integer,
    "prd_borr" boolean,
    "producto" text,
    "prd_um" character varying(60),
    "prd_meta_17" double precision,
    "prd_meta_18" double precision,
    "prd_meta_19" double precision,
    "res_id" integer,
    "res_cat_borr" boolean,
    "res_borr" boolean,
    "resultado_esperado" text,
    "colab_prd_res" double precision,
    "influ_prd_res" double precision,
    "pnd_id" integer,
    "pnd_cat_borr" boolean,
    "pnd_borr" boolean,
    "objetivo_pnd" text,
    "colab_res_pnd" double precision,
    "influ_res_pnd" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "programas_producto_meta";
CREATE TABLE "public"."programas_producto_meta" (
    "niv" integer,
    "ent" integer,
    "tp" integer,
    "pro" integer,
    "sub" integer,
    "pry" integer,
    "programa" text,
    "subprograma" text,
    "proyecto" text,
    "snip" integer,
    "unr_id" integer,
    "unr_abrev" character varying(45),
    "estrategia" integer,
    "estrategia_nombre" text,
    "prd" integer,
    "producto" text,
    "prd_um" character varying(60),
    "clase" character varying(1),
    "n_sum" double precision,
    "c_max" double precision,
    "meta_18" double precision,
    "meta_19" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "resultado_indicador_meta";
CREATE TABLE "public"."resultado_indicador_meta" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "entidad_id" integer,
    "entidad_nombre" text,
    "tipo_id" integer,
    "tipo_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "programa_abrev" text,
    "programa_descripcion" text,
    "programa_objetivo" text,
    "programa_diagnostico" text,
    "programa_base_legal" text,
    "programa_resultado" text,
    "programa_depto_cod" integer,
    "programa_depto_nomb" character varying(45),
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "subprograma_abrev" character varying(45),
    "subprograma_descripcion" text,
    "subprograma_objetivo" text,
    "subprograma_depto_cod" integer,
    "subprograma_depto_nomb" character varying(45),
    "subprograma_base_legal" text,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "proyecto_abrev" character varying(45),
    "proyecto_unidad_responsable_id" integer,
    "proyecto_unidad_responsable_nombre" text,
    "proyecto_unidad_responsable_abrev" character varying(45),
    "proyecto_funcional_id" integer,
    "proyecto_funcional_nombre" text,
    "proyecto_diagnostico" text,
    "proyecto_depto_cod" integer,
    "proyecto_depto_nomb" text,
    "proyecto_snip_cod" integer,
    "proyecto_snip_nombre" character varying(150),
    "proyecto_obj_est_id" integer,
    "proyecto_obj_est_nomb" text,
    "estrategia_cod" integer,
    "estrategia_nombre" text,
    "eje_estrategico_cod" integer,
    "eje_estrategico_nombre" text,
    "linea_transversal_cod" integer,
    "linea_transversal_nombre" text,
    "resultado_id" integer,
    "resultado_nombre" text,
    "indicador_id" integer,
    "indicador_nombre" text,
    "unidad_medida_id" integer,
    "unidad_medida_nombre" character varying(60),
    "meta_vencimiento" text,
    "meta_cantidad" text
) WITH (oids = false);

DROP TABLE IF EXISTS "v_depto_suma";
CREATE TABLE "public"."v_depto_suma" (
    "anho" integer,
    "departamento_id" integer,
    "nivel_id" integer,
    "entidad_id" integer,
    "programa_id" integer,
    "subprograma_id" integer,
    "proyecto_id" integer,
    "producto_id" integer,
    "tipo_presupuesto_id" integer,
    "sum_cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_depto_top";
CREATE TABLE "public"."v_depto_top" (
    "anho" integer,
    "departamento_id" integer,
    "nivel_id" integer,
    "entidad_id" integer,
    "programa_id" integer,
    "subprograma_id" integer,
    "proyecto_id" integer,
    "producto_id" integer,
    "tipo_presupuesto_id" integer,
    "macantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_estructura";
CREATE TABLE "public"."v_estructura" (
    "ppf_id" double precision,
    "ppf_nivel" integer,
    "ppf_entidad" integer,
    "entidad_nombre" text,
    "entidad_descripcion" text,
    "ppf_tipo" integer,
    "ppf_programa" integer,
    "ppf_subprograma" integer,
    "ppf_proyecto" integer,
    "ppf_snip" integer,
    "programa_nombre" text,
    "subprograma_nombre" text,
    "proyecto_nombre" text,
    "ppf_producto_id" integer,
    "ppf_producto_nombre" text,
    "ppf_unidad_medida_id" integer,
    "ppf_nombre_unidad_medida" text,
    "ppf_meta" double precision,
    "ppf_asignacion" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_mes_top";
CREATE TABLE "public"."v_mes_top" (
    "anho" integer,
    "mes" integer,
    "nivel_id" integer,
    "entidad_id" integer,
    "programa_id" integer,
    "subprograma_id" integer,
    "proyecto_id" integer,
    "producto_id" integer,
    "tipo_presupuesto_id" integer,
    "max_cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_pre_mes";
CREATE TABLE "public"."v_pre_mes" (
    "nivel" integer,
    "entidad" integer,
    "tipo" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "departamento_id" integer,
    "producto_id" integer,
    "enero" double precision,
    "febrero" double precision,
    "marzo" double precision,
    "abril" double precision,
    "mayo" double precision,
    "junio" double precision,
    "julio" double precision,
    "agosto" double precision,
    "setiembre" double precision,
    "octubre" double precision,
    "noviembre" double precision,
    "diembre" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_producto_esperado_destinatario";
CREATE TABLE "public"."v_producto_esperado_destinatario" (
    "nivel_id" integer,
    "nivel_nombre" text,
    "entidad_id" integer,
    "entidad_nombre" text,
    "tipo_id" integer,
    "tipo_nombre" text,
    "programa_id" integer,
    "programa_nombre" text,
    "programa_abrev" text,
    "programa_descripcion" text,
    "programa_objetivo" text,
    "programa_diagnostico" text,
    "programa_base_legal" text,
    "programa_resultado" text,
    "programa_depto_cod" integer,
    "programa_depto_nomb" character varying(45),
    "subprograma_id" integer,
    "subprograma_nombre" text,
    "subprograma_abrev" character varying(45),
    "subprograma_descripcion" text,
    "subprograma_objetivo" text,
    "subprograma_depto_cod" integer,
    "subprograma_depto_nomb" character varying(45),
    "subprograma_base_legal" text,
    "proyecto_id" integer,
    "proyecto_nombre" text,
    "proyecto_abrev" character varying(45),
    "proyecto_unidad_responsable_id" integer,
    "proyecto_unidad_responsable_nombre" text,
    "proyecto_unidad_responsable_abrev" character varying(45),
    "proyecto_funcional_id" integer,
    "proyecto_funcional_nombre" text,
    "proyecto_diagnostico" text,
    "proyecto_depto_cod" integer,
    "proyecto_depto_nomb" text,
    "proyecto_snip_cod" integer,
    "proyecto_snip_nombre" character varying(150),
    "proyecto_obj_est_id" integer,
    "producto_nombre" text,
    "v_ppd_cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_proyecto_has_objetivo";
CREATE TABLE "public"."v_proyecto_has_objetivo" (
    "id" integer,
    "nivel" integer,
    "entidad" integer,
    "tipo_presupuesto" integer,
    "programa" integer,
    "sub_programa" integer,
    "funcional" integer,
    "proyecto" integer,
    "objetivo" integer,
    "valoracion" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "duplicados";
CREATE TABLE "public"."duplicados" (
    "mes" integer,
    "anho" integer,
    "cantidad" double precision,
    "catalogo_destinatario_id" integer,
    "departamento_id" integer,
    "producto_presupusto_id" integer,
    "producto_id" integer,
    "unidad_medida_id" integer,
    "proyecto_id" integer,
    "subprograma_id" integer,
    "programa_id" integer,
    "tipo_presupuesto_id" integer,
    "entidad_id" integer,
    "nivel_id" integer,
    "borrado" boolean,
    "version" integer,
    "usuario_responsable" text,
    "count" bigint
) WITH (oids = false);

-- 2017-05-05 15:37:43.818004-04
