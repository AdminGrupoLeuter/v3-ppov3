  ---------------------------------------------------------------------------------
--SCRIPT DE ACTUALIZACION BD A VERSION: 0126
--
--IMPORTANTE: SOLAMENTE EJECUTAR ESTE SCRIPT SOBRE UNA BD CON ESTRUCTURA 0125
--
--GENERA FICHERO LOG SQLUPD_0126.LOG
---------------------------------------------------------------------------------

SPOOL SQLUPD_0126.LOG
SET ECHO ON
SET TIMING ON

-----------------------------------INICIO MODIFICACIONES

--MAI
CREATE TABLE EVE 
(
EVEREF char(4) primary key,
EVEA varchar2(254),
EVECC varchar2(254),
EVECCO varchar2(254),
EVEMOM date
);

COMMENT ON TABLE EVE IS 'Eventos. Registro de a quien enviarlos';
COMMENT ON COLUMN EVE.EVEREF IS 'Referencia';
COMMENT ON COLUMN EVE.EVEA IS 'Destinatario. Direcciones de correo separadas por coma';
COMMENT ON COLUMN EVE.EVECC IS 'Con copia. Direcciones de correo separadas por coma';
COMMENT ON COLUMN EVE.EVECCO IS 'Con copia oculta. Direcciones de correo separadas por coma';
COMMENT ON COLUMN EVE.EVEMOM IS 'En blanco, se envia automaticamente; si tiene valor se envia despues de pasado el momento';

CREATE TABLE MAI 
(
MAICOD number(9) primary key,
MAIREF char(4) not null,
MAIASU varchar2(254),
MAITXT varchar2(1024),
MAIADJ varchar2(254),
MAISIT char(2),
MAIMOMCRE date,
MAIMOMENV date,
constraint fk_maieveref
foreign key (mairef) references eve(everef)
);

COMMENT ON TABLE MAI IS 'Mensajes para enviar';
COMMENT ON COLUMN MAI.MAICOD IS 'Codigo';
COMMENT ON COLUMN MAI.MAIREF IS 'Referencia de evento';
COMMENT ON COLUMN MAI.MAIASU IS 'Asunto del correo';
COMMENT ON COLUMN MAI.MAITXT IS 'Mensaje del correo';
COMMENT ON COLUMN MAI.MAIADJ IS 'Lista de archivos .pdf para enviar separados por comas. No se usa de momento';
COMMENT ON COLUMN MAI.MAISIT IS 'Situacion del correo: PD pendiente, CE enviado';
COMMENT ON COLUMN MAI.MAIMOMCRE IS 'Momento de creacion del evento';
COMMENT ON COLUMN MAI.MAIMOMENV IS 'Momento de envio del evento';

CREATE OR REPLACE TRIGGER TR_MAI_INCI
BEFORE INSERT ON HISMOVALM
FOR EACH ROW
DECLARE
   l_Asunto     char(254);
   l_Mensaje    char(254);
   l_AccTipTar  char(4);
   l_ArtDes     char(40);
   l_RecMaqRef  char(16);
   l_RecMaqDes  char(40);
   l_RecOpeRef  char(16);
   l_RecOpeDes  char(40);
   l_RftTerRef  char(16);
   l_RftTerDes  char(40);
   l_NumVal     number(9,0);
begin
   l_AccTipTar := :new.AccTipTar;
   if l_AccTipTar like 'IN%' then
      -- Tipo de incidencia
      l_Mensaje := 'Tipo incidencia: ' || l_AccTipTar || chr(10);
      -- Momento
      l_Mensaje := l_Mensaje || 'Momento: ' || :new.MomMov || chr(10);
      -- Ubicacion
      l_Mensaje := l_Mensaje || 'Ubicaci∆n: ' || :new.AlmUbiRef || chr(10);
      -- Articulo
      select ArtDes
         into l_ArtDes
         from art
 where artcod = :new.ArtCod;
 l_Mensaje := l_Mensaje || 'Art’culo: ' || :new.ArtRef || ', ' || l_ArtDes || chr(10);
      -- Cantidad
 l_Mensaje := l_Mensaje || 'Cantidad: ' || :new.CanUni || ' UD' || chr(10);
 -- Operario
 select recmaqref,recoperef,rftterref
    into l_RecMaqRef,l_RecOpeRef,l_RftTerRef
    from hismovope
 where hisopecod = :new.hisopecod;
 select RecOpeDes
    into l_RecOpeDes
    from RecOpe
 where RecOpeRef = l_RecOpeRef;
 select RecMaqDes
    into l_RecMaqDes
    from RecMaq
 where RecMaqRef = l_RecMaqRef;
 select RftTerDes
    into l_RftTerDes
    from RftTer
 where RftTerRef = l_RftTerRef;
 l_Mensaje := l_Mensaje || 'Operario: ' || l_RecOpeRef || ', ' || l_RecOpeDes || chr(10);
      l_Mensaje := l_Mensaje || 'Terminal: ' || l_RftTerRef || ', ' || l_RftTerDes || chr(10);
      select ValAct
         into l_NumVal
    from gencon
 where genconcod = 'CMAI';
 update gencon
    set ValAct = l_NumVal +1
 where genconcod = 'CMAI';
 l_Asunto := 'Incidencia';
 insert into mai (maicod, mairef, maiasu, maitxt, maisit, maimomcre)
    values (l_NumVal,'INCI',l_Asunto,l_Mensaje,'PD',sysdate);
   end if; -- if IN*
end; -- begin del trigger
/

-- Se deja desactivado
ALTER TRIGGER TR_MAI_INCI DISABLE;


 
 
 -----------------------------------FIN MODIFICACIONES

UPDATE VERSIONES SET VERSION='0126', MOMENTO=SYSDATE WHERE SOFCOD='BD';
COMMIT;

SPOOL OFF;

EXIT;

--FIN DEL SCRIPT DE ACTUALIZACION
