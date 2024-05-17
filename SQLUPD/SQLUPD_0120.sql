---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0120
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0119
--
--GENERA FICHERO LOG SQLUPD_0120.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0120.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES

--- DIC11i
ALTER TABLE CCALIN 
ADD (AJSMTV CHAR(4 BYTE) DEFAULT 'CCAA' NOT NULL);

COMMENT ON COLUMN CCALIN.AJSMTV IS 'Motivo de ajuste';


-----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0120', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION