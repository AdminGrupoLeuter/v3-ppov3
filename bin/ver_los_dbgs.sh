cd $ADAIA_HOME/log
#
#
echo Procesos actualmente en marcha
echo ------------------------------
echo
for pid in `ps -e | awk '$NF~/spw4gl/ {print $1}'`
do 
  if test -r dbg_$pid.pin
  then
     ps -fp$pid
     echo ---------------------------
     tail -10 `tail -1 dbg_$pid.pin`
     echo ---------------------------
  fi
done
#
#
#
echo Procesos terminados anomalamanete
echo ---------------------------------
#
for fname in `ls dbg_*.pin`
do
   pid=`echo $fname | cut -c5-14 | cut -f 1 -d"."`
   if [[ `ps -p$pid | wc -l` -eq 1 ]] 
   then
     echo ---------------------------
     echo $fname, `tail -1 $fname`
     echo ---------------------------
     tail -10 `tail -1 $fname`
     echo ---------------------------
   fi
done
