-- Table: configuraciones
CREATE TABLE configuraciones
(
  id serial NOT NULL,
  nombre text,
  borrado boolean DEFAULT false,
  version integer DEFAULT 0,
  fecha_actualizacion timestamp without time zone DEFAULT now(),
  fecha_insercion timestamp without time zone DEFAULT now(),
  usuario_responsable text DEFAULT ''::text,
  CONSTRAINT p_k_configuraciones PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE configuraciones
  OWNER TO postgres;
  
  
-- Tabla: usuario_has_configuraciones
CREATE TABLE usuario_has_configuraciones
(
  configuracion_id integer,
  usuario_correo text,
  valor integer,
  borrado boolean DEFAULT false,
  version integer DEFAULT 0,
  fecha_actualizacion timestamp without time zone DEFAULT now(),
  fecha_insercion timestamp without time zone DEFAULT now(),
  usuario_responsable text DEFAULT ''::text,
  CONSTRAINT configuracion_has_usuario_configuracion_id_fkey FOREIGN KEY (configuracion_id)
      REFERENCES configuraciones (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_correo FOREIGN KEY (usuario_correo)
      REFERENCES usuario (correo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=TRUE
);
ALTER TABLE usuario_has_configuraciones
OWNER TO postgres;