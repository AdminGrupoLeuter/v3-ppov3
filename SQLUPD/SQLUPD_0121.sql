---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0121
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0120
--
--GENERA FICHERO LOG SQLUPD_0121.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0121.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES

-- Trunkamos owner a una longitud fija de 30 pues en diferentes versiones de oracle (12) tiene diferente longitud
-- Lo cual trae problemas para la compilacion del catalogo

CREATE OR REPLACE FORCE VIEW w_gencon (wgenconcod,
                                           valact,
                                           wvalini,
                                           wvalfin,
                                           valinc,
                                           owner)
AS
   (SELECT SUBSTR(sequence_name,1,30), last_number, min_value, max_value, increment_by,SUBSTR(sequence_owner,1,30)
      FROM all_sequences);
      
--Mantenemos los mismos comentarios
COMMENT ON TABLE W_GENCON IS 'V2.8(208): Vista de contadores basada en all_sequences';
COMMENT ON COLUMN W_GENCON.WGENCONCOD IS 'V2.8(208): ';
COMMENT ON COLUMN W_GENCON.VALACT IS 'V2.8(208): Valor Actual';
COMMENT ON COLUMN W_GENCON.WVALINI IS 'V2.8(208): ';
COMMENT ON COLUMN W_GENCON.WVALFIN IS 'V2.8(208): ';
COMMENT ON COLUMN W_GENCON.VALINC IS 'V2.8(208): Incremento';
COMMENT ON COLUMN W_GENCON.OWNER IS 'V2.8(208): ';


-----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0121', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION
