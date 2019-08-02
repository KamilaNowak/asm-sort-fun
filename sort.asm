
section .bss
    var1 resd 4
    var2 resd 4
    var3 resd 4
    small resd 4
    mid resd 4
    big resd 4
  
section .data
	result db 'Liczby posortowane rosnaco: ',10,0
	lenres equ $- result
	
section .text
    global _start
 
_start:
    mov eax,3
    mov ebx,0
    mov ecx,var1
    mov edx,4
    int 0x80
 
    mov eax,3
    mov ebx,0
    mov ecx,var2
    mov edx,4
    int 0x80
 
    mov eax,3
    mov ebx,0
    mov ecx,var3
    mov edx,4
    int 0x80
 
    mov eax,[var1]
    sub eax,'0'
    mov ebx,[var2]
    sub ebx,'0'
    mov ecx,[var3]
    sub ecx,'0'
   
    cmp eax,ebx
    jna _instruct1      ;jump if not above tzn mniejsze lub rowne
    xchg eax,ebx
 
_instruct1:
    cmp eax,ecx
    jna _instruct2
    xchg eax,ecx
_instruct2:
    cmp ebx,ecx
    jna _instruct3
    xchg ebx,ecx
_instruct3:
    add eax,'0'
    mov [small],eax
    add ebx,'0'
    mov [mid],ebx
    add ecx,'0'
    mov [big],ecx
    jmp _exit
	
_exit:
	mov eax,4
	mov ebx,1
	mov ecx,result
	mov edx,lenres
	int 0x80
	
    mov eax,4
    mov ebx,1
    mov ecx,small
    mov edx,4
    int 0x80
 
    mov eax,4
    mov ebx,1
    mov ecx,mid
    mov edx,4
    int 0x80
 
    mov eax,4
    mov ebx,1
    mov ecx,big
    mov edx,4
    int 0x80
 
    mov eax,1
    xor ebx,ebx
    int 0x80