function Convierte_a_Adaia
{
#Alta de UNIT
for FNAME in `ls -rt ALUNI*`
do
   mv $FNAME TRUNIT.$FNAME
done

#ConfirmaciÆn de movimientos
for FNAME in `ls -rt CFMOV*`
do
   mv $FNAME TRMVTOUNIT.$FNAME
done


#ArtÕculos
for FNAME in `ls -rt ARTIC*`
do
   mv $FNAME TRART.$FNAME
done


#Presentaciones
for FNAME in `ls -rt PRESE*`
do
   mv $FNAME TRARPR.$FNAME
done


#CÆdigos EAN
for FNAME in `ls -rt CDEAN*`
do
   mv $FNAME TRAREA.$FNAME
done


#Terceros
for FNAME in `ls -rt TERCE*`
do
   mv $FNAME TRTER.$FNAME
done


#Ordenes de RecepciÆn
for FNAME in `ls -rt ORREC*`
do
   mv $FNAME TRRECORD.$FNAME
done


#Ordenes de ExpediciÆn
for FNAME in `ls -rt OREXP*`
do
   mv $FNAME TREXPORD.$FNAME
done


#Cambios de Estado
for FNAME in `ls -rt CBEST*`
do
   mv $FNAME TRESTADO.$FNAME
done

rm FALUNI* 2>/dev/null
rm FCFMOV* 2>/dev/null
rm FARTIC* 2>/dev/null
rm FPRESE* 2>/dev/null
rm FCDEAN* 2>/dev/null
rm FTERCE* 2>/dev/null
rm FORREC* 2>/dev/null
rm FOREXP* 2>/dev/null
rm FSTUBI* 2>/dev/null
rm FSTART* 2>/dev/null
rm FSTAJU* 2>/dev/null
rm FCBEST* 2>/dev/null
}


function Convierte_a_Gestion
{
EXTENSION=$1
echo $EXTENSION
#Stock por ArtÕculos
for FNAME in `find . -name 'TRSTOART.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Stock por Ajustes
for FNAME in `find . -name 'TRSTOMOV.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Stock por UbicaciÆn
for FNAME in `find . -name 'TRSTO.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Acciones de Expediciones
for FNAME in `find . -name 'TREXPACC.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Expediciones
for FNAME in `find . -name 'TREXP.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Recepciones
for FNAME in `find . -name 'TRREC1.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null
for FNAME in `find . -name 'TRREC.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Carga de camion
for FNAME in `find . -name 'TRCAM.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Confirmaciones de movimientos
for FNAME in `find . -name 'TRMVTOUNIT.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Confirmaciones de Produccion
for FNAME in `find . -name 'TRUNITCON.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Cambios de estado - baja de units
#for FNAME in `find . -name 'TRESTADO.*'`
#do
#   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
#   FICHERO=`echo $FNAME|cut -f 1 -d"."`
#   cat $FNAME >>tmp_$FICHERO.$EXTENSION
#   rm $FNAME
#done
#mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null

#Consolidaciones
for FNAME in `find . -name 'TRSPCONS.*'`
do
   FNAME=`echo $FNAME|awk -F"\.\/" '{print $2}'`
   FICHERO=`echo $FNAME|cut -f 1 -d"."`
   cat $FNAME >>tmp_$FICHERO.$EXTENSION
   rm $FNAME
done
mv tmp_$FICHERO.$EXTENSION $FICHERO.$EXTENSION 2>/dev/null
}

#------------------------------------------------------------------------
#Programa Principal
#------------------------------------------------------------------------
EXTENSION=`date +"%j%H%M%S"`
echo $EXTENSION

if test $1
then
if test $1 = 'ADAIA'
then
   echo "Cambiando el nombre de ficheros para ADAIA"
   Convierte_a_Adaia
fi

if test $1 = 'GESTION'
then
   echo "Cambiando el nombre de ficheros para Gestion"
   Convierte_a_Gestion $EXTENSION
fi
else
   echo "------------------------------------------------------"
   echo "Error de Sintaxis !"
   echo "Sintaxis correcta: "
   echo
   echo " convierte.sh parametro"
   echo
   echo "donde parametro puede ser ADAIA o GESTION"
   echo "------------------------------------------------------"
fi
