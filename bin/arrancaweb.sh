cd $ADAIA_HOME/Speedweb
export SHLIB_PATH=/home/oracle/product/11.2/cln_32:/home/Speedware/SpeedWeb304/lib
export LIBPATH=/home/Speedware/SpeedWeb304/lib
export SPW_LIB=/home/Speedware/SpeedWeb304/lib
nohup $SPW_HOME/SpeedWeb304/bin/speedweb $ADAIA_HOME/Speedweb/sweb.ini &

export ADAIA_START=LOGIC-RFL-INI-001
export ADAIA_TTR='P'
nohup $SPW_HOME/SpeedWeb304/bin/speedweb $ADAIA_HOME/Speedweb/swebrf.ini &

exit 0
