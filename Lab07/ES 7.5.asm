.data
	n1: .word 1
	n2: .word 2
	n3: .word 3
	n4: .word 4
	n5: .word 5
	n6: .word 6
	n7: .word 7
	n8: .word 8
	n9: .word 9
	
	
.text
.globl main
.ent main
main:
	la $t1, n1
	la $t2, n2
	la $t3, n3
	la $t4, n4
	la $t5, n5
	la $t6, n6
	la $t7, n7
	la $s0, n8
	lw $s0, ($s0)
	la $s1, n9
	lw $s1, ($s1)

	jal leggiEchiama

	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall


.end main


.globl leggiEchiama
.ent leggiEchiama
leggiEchiama:

	
	
	lw $a0, ($t1)				#salvo parametri nei registri a0 a1 a2 a3
	lw $a1, ($t2)
	lw $a2, ($t3)
	lw $a3, ($t4)
	lw $t5, ($t5)
	lw $t6, ($t6)
	lw $t7, ($t7)
	
	addi $sp, $sp, -4
	sw $t5 ($sp)
	
	addi $sp, $sp, -4
	sw $t6 ($sp)
	
	addi $sp, $sp, -4
	sw $t7 ($sp)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal determinante3x3
	
	lw $ra, ($sp)
	addi $sp, $sp, -4

	jr $ra

.end leggiEchiama




.globl determinante3x3				#calcolo determinante2x2
.ent determinante3x3
determinante3x3:

	move $t0, $a0					#t0 --> A11
	move $t1, $a1					#t1 --> A12
	move $t2, $a2					#t2 --> A13
	move $t3, $a3					#t3 --> A21
	lw $t4, ($sp)					#t4 --> A22
	addi $t3, $sp, 4
	lw $t5, ($sp)					#t5 --> A23
	addi $sp, $sp, 4
	lw $t6, ($sp)					#t6 --> A31
	addi $sp, $sp, 4
	lw $t7, ($sp)					#t7 --> A32
	addi $sp, $sp, 4				#s1 --> A33
	
	sw $ra, ($sp)
	addi $sp, $sp, 4
	
	

	move $a0, $t4
	move $a1, $t5
	move $a2, $t7
	move $a3, $s1
	
	jal determinante2x2				#prima sottomatrice
	
	mul $t0, $t0, $v0
	
	move $a0, $t3
	move $a1, $t5
	move $a2, $t6
	move $a3, $s1
	
	jal determinante2x2				#seconda sottomatrice
	
	mul $t1, $t1, $v0
	
	move $a0, $t3
	move $a1, $t4
	move $a2, $t6
	move $a3, $s7
	
	jal determinante2x2				#seconda sottomatrice
	
	mul $t2, $t2, $v0
	
	sub $v0, $t0, $t1				#calcolo determinante3x3
	add $v0, $v0, $t2

	
	sub $v0, $a0, $a1
	
	lw $ra, ($sp)					
	addi $sp, $sp, -4
	jr $ra
.end determinante3x3


.globl determinante2x2				#calcolo determinante2x2
.ent determinante2x2
determinante2x2:

	mul $a0, $a0, $a3
	mul $a1, $a1, $a2
	
	sub $v0, $a0, $a1
	jr $ra
.end determinante2x2