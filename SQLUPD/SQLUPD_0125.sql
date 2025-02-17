  ---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0125
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0124
--
--GENERA FICHERO LOG SQLUPD_0125.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0125.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES

--PDU09c2
ALTER TABLE ARTALM 
ADD (PRVCAMCOM VARCHAR2(160 BYTE) );
COMMENT ON COLUMN ARTALM.PRVCAMCOM IS 'r0725: Campo Comodin de uso privado';

 
 
 -----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0125', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION