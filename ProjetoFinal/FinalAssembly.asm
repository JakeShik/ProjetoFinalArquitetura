.MODEL FLAT, C			;Use the flat memory model. Use C calling conventions


.CODE					
PUBLIC add_vectors			
add_vectors PROC			
	push ebp				
	mov ebp,esp	
	push esi
	push ebx
	push edi
	push edx
	mov eax, [ebp+20] ;	tamanho array
	mov esi,[ebp+16]	; endereço do array3 colocado no registo esi
	mov ebx, [ebp+12] ; endereço do array2 colocado no registo ebx
	mov edi, [ebp+8] ; endereço do array1 colocado no registo edi	

repeate:
	movdqu xmm0, [edi]  ;move 16 bytes do registo edi, ou seja 4 inteiros, ('1000,1001,1002,1003') segundo o array1 
	movdqu xmm1, [ebx]  ;Faz a mesma operação, porem com o array2, cujo endereço se encontra no registo ebx
	paddd xmm0, xmm1    ; realiza uma soma(double word), com os valores dos dois arrays, que estao agora ocupando o registo xmm, e o resultado da soma e guardado no primeiro registo da operacao, no caso xmm0
	movdqu [esi], xmm0  ; no final move o resultado da soma pro array3, novamente sao movidos 16 bytes 
	add esi, 16			; avança para as proximas 4 posicoes do array, 3
	add edi, 16			; e o mesmo acontece para os registos edi e ebx
	add ebx, 16
	sub eax, 4			; no final, e feito uma subtracao de 4 no indice, antes colocado no registo eax atraves da stack. E necessario realizar a subtracao por 4 pois foram passados 4 valores.
	cmp eax, 4			; comparamos o tamanho do array para saber quando o mesmo nao e multiplo de 4, caso nao seja nao podemos realizar a soma de 4 valores por 4 e sim uma unica de cada vez
	jnbe repeate		; caso o numero nao esteja ainda abaixo de 4, como (1,2,3), volta para o inicio da operacao, cujo label e 'repeate', caso esteja no intervalo citado, o programa procede a proxima linha

soma_singular:			;Na soma singular o objetivo é somar os valores finais um a um, para que nenhum valor indesejado apareca no registo final (esi)
	mov edx, [edi]		; movemos apenas um valor do array1 e guardamos no registo edx
	add [ebx], edx		; adicionamos e guardamos o resultado no array2, onde posteriormente e movido para outro registo para ser colocado no array3, onde guarda o resultado final.
	mov ecx, [ebx]
	mov [esi], ecx
	add esi, 4			; e adicionado o valor 4 a cada registo para passar para o valor seguinte do array.
	add ebx, 4
	add edi, 4
	dec eax				;diminuimos o indice, anteriormente adicionado ao registo eax, 1 por vez, pois so movemos um numero.
	jnz soma_singular	;por fim, enquanto o indice nao atingir o 0, a operacao se repete. Nessa instrucao nao precisamos do cmp, pois a instrucao dec ja altera a flag
pop edi
pop ebx
pop esi
pop edx
pop ebp				
ret					
add_vectors ENDP	
END