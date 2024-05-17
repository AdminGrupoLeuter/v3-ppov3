#localizamos el pid del servicio
export PIDSERVICIO=`grep "Starting server..." $ADAIA_HOME/Speedweb/speedweb.log | tail -n 1 | awk '{print $2}' | awk -F ";" '{print $1}'`

#matamos todas los procesos menos el servicio
for I in `ps -ef | grep -v grep | grep $LOGNAME | grep Speedweb | awk '{print $2}' | grep -v $PIDSERVICIO`
do
  kill -9 $I
done

#matamos el servicio
kill -9 $PIDSERVICIO
