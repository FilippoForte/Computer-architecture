	.data
msg1: .asciiz "Inserire il primo numero"
msg2: .asciiz "Inserire il secondo numero"
msgErrore: .asciiz "Numero maggiore di 8 bit"

	.text
	.globl main
	.ent main
	
main:
	la $a0, msg1			#stampa messaggio
	li $v0, 4
	syscall
	
	li $v0, 5				#carica numero
	syscall
	
	move $t0, $v0			#sposta numero
	
	la $a0, msg1			#stampa messaggio
	li $v0, 4
	syscall
	
	li $v0, 5				#carica numero
	syscall
	
	move $t1, $v0			#sposta numero
	
	sltiu $s0, $t0, 0xFF	#controllo primo numero minore di 8bit
	beq $s0, $0, errore
	
	sltiu $s0, $t1, 0xFF	#controllo secondo numero minore di 8bit
	beq $s0, $0, errore
	
	xor $t2, $t0, $t1
	not $t1, $t1
	and $t0, $t0, $t1
	not $t0, $t0
	or $t0, $t0, $t2
	
	andi $t0, $t0, 0x000000FF
	
	move $a0, $t0
	li $v0, 1
	syscall
	j fine
	
	
errore:
	la $a0, msgErrore
	li $v0, 4
	syscall
	
fine:
	li $v0, 10
	syscall
	
	.end main