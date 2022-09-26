.data 
	msgA: .asciiz "Inserire il valore di A"
	msgB: .asciiz "Inserire il valore di B"
	msgC: .asciiz "Inserire il valore di C"
	msgDue: .asciiz "Due soluzioni"
	msgUna: .asciiz "Una soluzione"
	msgZero: .asciiz "Nessuna soluzione"
	
.text
.globl main
.ent main
main:

	la $a0, msgA		#messaggio a
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	la $a0, msgB		#messaggio b
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	la $a0, msgC		#messaggio b
	li $v0, 4
	syscall
		
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	mul $t1, $t1, $t1	#b*b
	mul $t2, $t2, $t0	#a*c
	sll $t2, $t2, 2		#4ac
	sub $t1, $t1, $t2	#bb-4ac
	
	
	slt $t3, $0, $t1
	bne $t3, $0, due
	beq $t1, $0, una
	
	la $a0, msgZero		#messaggio Nessuna soluzione
	li $v0, 4
	syscall
	j fine
	
due:	
	la $a0, msgDue		#messaggio due soluzioni
	li $v0, 4
	syscall
	j fine
	
una:
	la $a0, msgUna		#messaggio una soluzione
	li $v0, 4
	syscall
	
fine:
	li $v0, 10
	syscall