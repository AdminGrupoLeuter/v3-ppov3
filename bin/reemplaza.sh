#Buscamos y reemplazamos entorno de LEUTER
for i in $ADAIA_HOME/bin/*
do
echo $i
sed 's/\/home\/leuter/\/casa\/leuter/g' $i >$i.old
mv $i.old $i
done

#Buscamos y reemplazamos entorno de ADAIA
for i in $ADAIA_HOME/bin/*
do
echo $i
sed 's/\/home\/adaia/\/casa\/adaia/g' $i >$i.old
mv $i.old $i
done

#Buscamos y reemplazamos entorno de SPEEDWARE
for i in $ADAIA_HOME/bin/*
do
echo $i
sed 's/\/home\/Speedware/\/casa\/Speedware/g' $i >$i.old
mv $i.old $i
done
