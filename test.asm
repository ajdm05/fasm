		     format PE CONSOLE 4.0
entry start

include 'win32a.inc'

section '.data' data readable writeable
   temp1 dd 0

section '.code' code readable executable 
start: 

mov eax,1
mov [@A@],eax
mov eax,2
mov [@B@],eax
mov eax,[@B@]
mov ebx,[@B@]
mul ebx
mov [temp1],eax
mov eax,[temp1]
mov [@eax@],eax
push [@eax@]
push @intprintstr
call [printf]
add esp,8

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
