CREATE TABLE avance_indicador
(
  id serial NOT NULL,
  cantidad text,
  vencimiento text,
  indicador_id integer NOT NULL,
  zona_geografica_id integer NOT NULL,
  demografia_id integer NOT NULL,
  borrado_int integer DEFAULT 0,
  anho integer DEFAULT 0,
  version integer DEFAULT 0,
  fecha_actualizacion timestamp without time zone DEFAULT now(),
  fecha_insercion timestamp without time zone DEFAULT now(),
  usuario_responsable text DEFAULT ''::text,
  nivel integer,
  entidad integer,
  borrado boolean DEFAULT false,
  producto_concat text NOT NULL DEFAULT ''::text,
  objetivo_id integer,
  tipo_objetivo_id integer,
  CONSTRAINT avance_indicador_pkey PRIMARY KEY (id, indicador_id, zona_geografica_id, demografia_id, objetivo_id, tipo_objetivo_id, nivel, entidad)
);