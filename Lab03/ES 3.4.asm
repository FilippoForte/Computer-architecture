	.data
DIM: .byte 3
msg: .asciiz "Inserire un numero"

	.text
	.globl main
	.ent main
main:
	lb $t2, DIM
	li $t1, 0
	
for: 
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	add $t0, $t0, $v0
	
	addi $t1, $t1, 1
	bne $t1, $t2, for
	
	div $t3, $t0, $t2
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10	
	syscall
	
	.end main