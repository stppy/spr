SET @@GLOBAL.sql_mode ='NO_AUTO_VALUE_ON_ZERO';
SELECT  @@GLOBAL.sql_mode;

select * from usuario;					-- modelo db 												listo
select * from role;						-- modelo db 												listo
select * from modulo;					-- modelo db 												listo
select * from permiso;					-- modelo db 												listo
select * from modulo_has_permiso;		-- modelo db 												listo

select * from tipo_zona_geografica;		-- modelo db catalogo historico								listo
select * from tipo_catalogo_destinatario;-- modelo db catalogo historico							listo
select * from tipo_demografica;			-- modelo db catalogo historico								listo
select * from tipo_indicador;			-- modelo db catalogo historico								listo
select * from tipo_objetivo;			-- modelo db catalogo historico								listo

select * from zona_geografica;			-- modelo db												listo
select * from catalogo_destinatario;	-- modelo db												listo
select * from demografia;   			-- modelo db 												listo

select * from indicador;				-- modelo db												pendiente
select * from meta;						-- modelo db												pendiente

select * from metodo_calculo;			-- modelo db												listo
select * from objetivo;					-- modelo db												pendiente

select * from funcional;				-- ws import catalogo										listo
select * from unidad_medida;			-- ws import catalogo										listo						

select * from plan;						-- ws import catalogo actualmente en modelo					listo
select * from eje_estrategico;			-- ws import (EjesPorPlan)									listo
 select * from linea_transversal;		-- modelo db												listo
select * from estrategia;				-- es import catalogo										listo


select * from departamento; 			-- ws import catalogo										listo
select * from proyecto_snip;			-- ws import catalogo										listo
select * from objeto_de_gasto;			-- ws import catalogo										listo
select * from catalogo_dncp;			-- ws import catalogo -- requiere objeto de gasto no conicide
select * from organismo_financiador;	-- ws import catalogo										listo
select * from fuente_financiamiento;	-- ws import catalogo

select * from nivel;					-- ws import catalogo										listo
select * from entidad;					-- ws import catalogo requiere nivel						listo					
select * from tipo_presupuesto;			-- ws import catalogo (tipo programa)						listo
select * from unidad_jerarquica;		-- ws import catalogo										listo
select * from unidad_responsable;		-- ws import catalogo requiere unidad jerarquica			listo

-- insert into fuente_financiamiento values (0,"NO aplica","",0,2015);								fix para psa
-- insert into organismo_financiador values (0,"NO aplica","",0,2015);								fix para psa
select * from proyecto_snip_autorizado; -- ws import catalogo										listo
           	-- requiere entidad, proyectosnip, fuente y org le falta nombre y descp. FF y OF son falsos


select * from programa;					-- ws import catalogo historico								listo con nullpointer al final
select * from subprograma;				-- ws import catalogo historico
-- ALTER TABLE subprograma MODIFY nombre TEXT;
select * from proyecto;					-- ws import catalogo historico
ALTER TABLE proyecto MODIFY nombre TEXT;
select * from producto;					-- ws import catalogo futuramente solo ws en linea sin historico

select * from producto_presupuesto;		-- ws import historico
select * from producto_presupuesto_meta;-- ws import historico

select * from estrategia_has_objetivo;
















select * from diccionario_dato;			-- modelo db no importa
select * from programatico;				-- en desuso
select * from tipo_programatico;		-- en desuso
select * from programatico_has_objetivo;-- en desuso
