; function prototype : int bin_search(int* arr, int first, int last, int target)
; [ebp+8] : array
; [ebp+12] : first 
; [ebp+16] : last
; [ebp+20] : target 

SYS_CALL equ 0x80

segment .bss 

segment .data 

segment .text 
	global _start
	global bin_search 

bin_search:				; bin_search:  
	push ebp 
	mov ebp, esp

	xor ecx, ecx		; temp 
	xor edx, edx 
	xor eax, eax 
	xor ebx, ebx 		; mid 
	mov esi, [ebp+8]	; array 
	xor ebx, ebx		; temp 
	mov ebx, [ebp+12] 	; first
	cmp ebx, [ebp+16] 	; if(first > last)
	jg bin_search_first_precede_last
	
	mov eax, [ebp+12] 
	add eax, [ebp+16] 	; first+last 
	mov ebx, 2 
	cdq 				; EDX:EAX 
	div ebx
	mov ebx, eax 		; mid(ebx) = (first+last)/2; 

	mov ecx, [esi+ebx*4] ;arr[mid]
	cmp ecx, [ebp+20] 				; if(arr[mid] == target)
	je bin_search_find_target
	jge	bin_search_set_down_scope 	; if(arr[mid] >= target) 
	jl bin_search_set_up_scope		; if(arr[mid] < target)

bin_search_set_up_scope:
	push dword [ebp+20] ;target 
	push dword [ebp+16] ;last 
	inc ecx				;mid 
	push ecx 			
	push esi 
	call bin_search 
	add esp, 16
	jmp bin_search_end				;재귀함수의 종료패턴 

bin_search_set_down_scope:
	push dword [ebp+20] ;target 
	dec ecx 
	push ecx			;mid 
	push dword [ebp+12] ;first 
	push esi 	
	call bin_search
	add esp, 16
	jmp bin_search_end 				;재귀함수의 종료패턴 

bin_search_find_target:
	mov eax, [esi+ebx*4] 
	jmp bin_search_end  

bin_search_first_precede_last: 
	mov eax, -1 
	jmp bin_search_end  
	
bin_search_end:						;실질적인 return의 값 
	pop ebp 
	ret 
	










