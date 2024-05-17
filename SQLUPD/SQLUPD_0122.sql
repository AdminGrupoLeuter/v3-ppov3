---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0122
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0121
--
--GENERA FICHERO LOG SQLUPD_0122.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0122.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES
-----------------------------------CREAMOS FUNCION RECURSOUNICO

create or replace FUNCTION RecursoUnico(iEstcod in number, iRecMaqCod in number)
RETURN NUMBER IS tmpVar NUMBER;
iEstProPas number;
cRecUni char(1);
BEGIN
   tmpVar := 0;
   cREcUni := ' ';
   iEstProPas := 0;
   if iEstcod <> 0 then
      SELECT RECUNI,ESTPROPAS
        INTO cRecUni,iEstProPas
        FROM ALMEST WHERE 
        ESTCOD = iEstcod;
        if cRecUni = 'S' then
            tmpVar :=1;
            seLECT 1
            INTO tmpVar
             FROM ACCTRA,ACCCOL
             WHERE ACCTRA.ACCCOLCOD = ACCCOL.ACCCOLCOD
             AND ACCTIPTAR IN ('RE','UB','EX','EXMP','UBMA','CA')
             AND RECMAQCOD not in (0, iRecMaqCod)
             AND (
                 ((ESTORICOD IN (iEstcod,iEstproPas) or ESTDESCOD IN (iEstCod,iEstPropas)) AND iEstProPas<>0) 
                 OR
                 ((ESTORICOD IN (iEstcod) or ESTDESCOD IN (iEstCod)) AND iEstProPas=0)
                 ); 
        end if;  
   end if;     
   RETURN tmpVar;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       RETURN 0;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END RecursoUnico;
/

-- ACTUALIZAMOS VISTA W_ACCTRAPRI PARA QUE TOME EN CUENTA LA FUNCION RECURSOUNICO

CREATE OR REPLACE FORCE VIEW W_ACCTRAPRI ("ACCCOD", "ACCCOLCOD", "ANCOPE", "COLEST", "COLPIC", "COLPRI", "COLSIGCOD", "COLTIP", "EXPORDCOD", "MOMINI", "MOVHORPOS", "MOVVER", "NUMCNT", "RECMAQCOD", "RECOPECOD", "RFTTERCOD", "ZONCARCOD", "ZONCOLCOD", "ZONPRECOD", "CNTCODETI", "ACCEST", "ACCORD", "ACCRELCOD", "ACCTIPTAR", "CAN", "CANMOV", "CNTCOD", "CNTDESCOD", "ESTDESCOD", "ESTORICOD", "EXPORDLIN", "MOMCRE", "MOMFIN", "NDOCOD", "PESMOV", "RECCOD", "RECLIN", "UBIDESCOD", "UBIORICOD", "VENCIDO", "ACTRECMAQ", "ACTDIS", "ZONAOK")
AS
  (SELECT acctra.acccod,
    acctra.acccolcod,
    acccol.ancope,
    acccol.colest,
    acccol.colpic,
    acccol.colpri,
    acccol.colsigcod,
    acccol.coltip,
    acctra.expordcod,
    acctra.momini,
    acccol.movhorpos,
    acccol.movver,
    acccol.numcnt,
    acccol.recmaqcod,
    acccol.recopecod,
    acccol.rfttercod,
    acccol.zoncarcod,
    acccol.zoncolcod,
    acccol.zonprecod,
    acccol.cntcodeti,
    acctra.accest,
    acctra.accord,
    acctra.accrelcod,
    acctra.acctiptar,
    acctra.can,
    acctra.canmov,
    acctra.cntcod,
    acctra.cntdescod,
    acctra.estdescod,
    acctra.estoricod,
    acctra.expordlin,
    acctra.momcre,
    acctra.momfin,
    acctra.ndocod,
    acctra.pesmov,
    acctra.reccod,
    acctra.reclin,
    acctra.ubidescod,
    acctra.ubioricod,
    vencido (acctra.momini) vencido,
    r.recmaqcod actrecmaq,
    distancia (acctra.ubioricod, r.ultubi, acctra.acctiptar) actdis,
    zona_ok (acccol.zoncarcod, acccol.zonprecod, r.recmaqcod) zonaok
  FROM acctra,
    acccol,
    recmaqope r
  WHERE (acccol.acccolcod                          = acctra.acccolcod)
  AND recursounico (acctra.estoricod, r.recmaqcod) = 0
  AND recursounico (acctra.estdescod, r.recmaqcod) = 0
  ) ;      

-----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0122', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION
