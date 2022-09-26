.data
	matPitagorica: .space 10*10*4
	
.text
.globl main
.ent main
main:

	li $t0, 1
	li $t1, 1
	li $t7, 11
	la $s0, matPitagorica
	
for1:
	mul $t2, $t0, $t1	#calcolo valore
	
	addi $t3, $t0, -1
	addi $t4, $t1, -1

	sll $t3, $t3, 2
	sll $t4, $t4, 2
	
	
	add $t5, $t3, $t4	#calcolo indice
	add $t5, $t5, $s0	#calcolo indirizzo
	
	sw $t2, 0($t5)
	
	move $a0, $t2		#stampa numero
	li $v0, 1
	syscall
	
	li $a0, '	'		#stampa spazio
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1
	bne $t0, $t7, for1
	
	addi $t1, $t1, 1
	addi $t0, $0, 1
	
	li $a0, '\n'		#stampa spazio
	li $v0, 11
	syscall
	
	
	bne $t1, $t7, for1
	
	li $v0, 10
	syscall
	