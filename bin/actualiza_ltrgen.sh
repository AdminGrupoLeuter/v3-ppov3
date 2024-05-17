cd $ADAIA_HOME/ltrgen
ex ltrgeny <<?
%s/adaia2\/tmp/$USUARIO_PRINCIPAL\/tmp/g
wq!
?
ex ltrgeny <<?
%s/CONNECT(ADAIA2/CONNECT(\U$USUARIO_PRINCIPAL\E/
wq!
?
ex ltrgeny <<?
%s/ADAIA2)/\U$USUARIO_PRINCIPAL\E)/
wq!
?
ex ltrgeny <<?
%s/CONNECT(adaia2/CONNECT(\U$USUARIO_PRINCIPAL\E/
wq!
?
ex ltrgeny <<?
%s/adaia2)/\U$USUARIO_PRINCIPAL\E)/
wq!
?
ex ltrgeny <<?
%s/~ADAIA2\./~\U$USUARIO_PRINCIPAL\E\./g
wq!
?

rm ltrgenc
makecat ltrgenc -B <<!
#INCLUDE ltrgeny;
EXIT;
!
