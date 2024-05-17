  ---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0127
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0126
--
--GENERA FICHERO LOG SQLUPD_0127.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0127.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES

--Adaia Slotting (AdaiaRankingLogistico)
ALTER TABLE ALMZONPIC
ADD (ABCLOG VARCHAR2(1) );
COMMENT ON COLUMN ALMZONPIC.ABCLOG IS 'Clasificacion logistica para zona de picking';
 
 
 -----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0127', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION
