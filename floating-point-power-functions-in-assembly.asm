INCLUDE irvine32.inc
.data

msg1 byte "Enter floating vlaue: ", 0
msg2 byte "Enter Power", 0
msg3 byte "Answer is: ", 0
result real4 0.0
power real4 0.0
a tbyte ?
one real4 1.0
.code

floatPower PROTO, result: real4, power: real4, a: TBYTE, one: real4

main proc
	mov edx, offset msg1
	call writestring
	call readfloat
	FSTP result	

	mov edx, offset msg2
	call writestring
	call readfloat
	FSTP power

	invoke floatPower, result, power, a, one

	mov edx, offset msg3
	call writestring
	
	call writefloat
	call crlf
	call crlf
	call waitmsg
	EXIT
main endp

floatPower PROC, result2: real4, power2: real4, a2: TBYTE, onep: real4
	FLD power2
	FBSTP a2

	mov ecx, 0
	mov ecx, dword PTR a2

	FLD onep
	L1:
		FMUL result2
		loop L1
	ret
floatPower endp

end main