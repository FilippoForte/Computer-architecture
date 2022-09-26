.data
	vettore: .word 1, 4, 5, 6, 3, 7, 8, 9, 2
	dim: .word 9
	
.text
.globl main
.ent main
main:
	la $a0, vettore				#carica indirizzo vettore
	la $t1, dim
	lw $a1, ($t1)				#carica dimensione vettore
	
	li $v0, 0
	jal trovaMax				#chiama procedura
	
	move $a0, $v0				#stampa
	li $v0, 1
	syscall

	li $v0, 10					#fine
	syscall

.end main

.globl trovaMax
.ent trovaMax
trovaMax:
	lw $t0, ($a0)					#carica valore vettore
	blt $t0, $v0, minore		#contfronto se e' minore
	
	move $v0, $t0				#salvo se e' maggiore
	
minore:
	addi $a1, $a1, -1			#decremento indice
	addi $a0, $a0, 4			#cambio valore
	bne $a1, $0, trovaMax		#verifico fine

	jr $ra
.end trovaMax