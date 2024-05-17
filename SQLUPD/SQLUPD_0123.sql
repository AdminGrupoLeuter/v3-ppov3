---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0123
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0122
--
--GENERA FICHERO LOG SQLUPD_0123.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0123.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES

create or replace PROCEDURE SP_NEXTVAL
(
  VAL OUT NUMBER
, SEQUENCENAME IN VARCHAR2
) AS
BEGIN
   execute immediate 'select '||sequenceName||'.nextval from dual' into val;
   EXCEPTION WHEN OTHERS THEN
      VAL := 0;
END SP_NEXTVAL;
/

-----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0123', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION