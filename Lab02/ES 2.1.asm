	.data
msg1: .asciiz "Inserire il numero"
msgPari: .asciiz "numero pari"
msgDispari: .asciiz "numero dispari"

	.text
	.globl main
	.ent main
	
main:
	la $a0, msg1			#stampa messaggio
	li $v0, 4
	syscall
	
	li $v0, 5				#carica numero
	syscall
	
	move $t0, $v0
	li $t1, 1
	
	and $t0, $t0, $t1
	
	beq $t0, $t1, dispari
	j pari
	
	
dispari:
	la $a0, msgDispari			#stampa messaggio
	li $v0, 4
	syscall
	j fine
	
pari:
	la $a0, msgPari			#stampa messaggio
	li $v0, 4
	syscall
	j fine
	
fine:
	li $v0, 10
	syscall
	
	.end main