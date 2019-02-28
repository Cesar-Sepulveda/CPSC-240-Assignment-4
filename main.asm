;Cesar Sepulveda
;Date:02/27/19
;CPSC 240
;Assignment #4:
;Create a procedure that fills an array of doublewords with N random 
;integers, making sure the values fall within range j…k, inclusive. 
;When calling the procedure, pass a pointer to the array that will hold 
;the data, pass N, and pass the values of j and k. Preserve al register 
;values between calls to the procedure. Write a test program that calls 
;the procedure twice, using different values for j and k. Verify your 
;results using a debugger.

INCLUDE Irvine32.inc


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	myarray DWORD N DUP (?)							;Initializing the array
	j DWORD ?										;Initializing j
	K DWORD ?										;Initializing k
.code

main PROC
	mov exc,5										;Moving 5 to eax
	mov j,-5										;Setting the value of j
	mov k,5											;Setting the value of k
	mov esi, OFFSET myarray
	call ArrayFill									;Calling the procedure


	INVOKE ExitProcess, 0
main ENDP

ArrayFill PROC

	mov eax,j										;Moving j to eax 
	mov ebx,k										;Moving k to ebx

L1:
	xchg ebx, eax									;Exchanging the values of eax and ebx
	sub eax,ebx										;Subtracting ebx from eax
	call RandomRange								;Calling the procedure to generate a random value
	neg eax											;Changing the sign of eax
	call WriteInt									;Calling the write integer procedure

	mov [esi],eax									;Moving the value of eax into the array
	add esi,4										;Incrementing 

loop L1												;Looping
ret

ArrayFill ENDP
END main
