format PE CONSOLE 4.0
entry start
include 'win32a.inc'
section '.data' data readable writeable
str_pause db  'p','a','u','s','e',0
@intprintstr db '%d',10,0
@intscanstr db '%d',0 
@A@ dd 0
@B@ dd 0
temp1 dd 0
@C@ dd 0
section '.code' code readable executable
start:
mov eax,1
mov [@A@],eax
mov eax,5
mov [@B@],eax
mov eax,[@A@]
sub eax,[@B@]
mov [temp1],eax
mov eax,[temp1]
mov [@C@],eax
push [@C@]
push @intprintstr
call [printf]
add esp,8

;End Process
push str_pause
call [system]
add esp, 4
call [ExitProcess]

section '.idata' import data readable writeable

library kernel,'KERNEL32.DLL',\
ms ,'msvcrt.dll'

import kernel,\
ExitProcess,'ExitProcess'

import ms,\
printf,'printf',\
cget ,'_getch',\
system,'system',\
scanf,'scanf'