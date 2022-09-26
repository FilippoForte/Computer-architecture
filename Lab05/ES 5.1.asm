.data 
	numero: .word 3141592653

.text
.globl main
.ent main
main:
	la $t0, numero
	lw $t0, 0($t0)
	
	li $t1, 10
	
for:

	divu $t0, $t1
	mfhi $t2
	mflo $t0
	addi $sp, -4
	addi $t3, 1
	sw $t2, ($sp)
		
	bne $t0, $0, for
		
	
lettura:
	
	lw $a0, ($sp)
	addi $sp, 4
	
	addi $a0, 48
	li $v0, 11
	syscall
	
	addi $t3, -1
	bne $t3, $0, lettura
	
	li $v0, 10
	syscall

.end main