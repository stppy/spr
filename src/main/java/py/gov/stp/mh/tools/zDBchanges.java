package py.gov.stp.mh.tools;
/**
 * @author		DGTIC-STP
 * @email		dgtic@stp.gov.py 
 *
 **/
public class zDBchanges {
	
	/* 20150602001
	  ALTER TABLE `spr`.`meta` 
	  ADD COLUMN `borrado` INT NULL DEFAULT 0 AFTER `demografia_id`;
	  
	  ALTER TABLE `spr`.`indicador` 
	  ADD COLUMN `borrado` INT NULL DEFAULT 0 AFTER `objetivo_id`;
	  
	  ALTER TABLE `spr`.`objetivo` 
      ADD COLUMN `borrado` INT NULL DEFAULT 0 AFTER `funcional`;
      
      INSERT INTO `spr`.`unidad_medida` (`id`, `nombre`, `abrev`) VALUES ('2541', 'SENTENCIAS DEFINITIVAS', 'SENTENCIAS DEFINITIVAS');
      
      ALTER TABLE `spr`.`producto_presupuesto_meta` 
CHANGE COLUMN `cantidad` `cantidad` DOUBLE NULL DEFAULT NULL ;

	 */

}
