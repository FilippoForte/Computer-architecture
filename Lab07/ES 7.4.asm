.data
	n1: .word 10
	n2: .word 20
	n3: .word 30
	n4: .word 40
	
	
.text
.globl main
.ent main
main:

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

	la $t1, n1
	la $t2, n2
	la $t3, n3
	la $t4, n4
		
	lw $a0, ($t1)				#caricamento paramentri
	lw $a1, ($t2)
	lw $a2, ($t3)
	lw $a3, ($t4)
	
	addi $sp, $sp, -4			#salvo indirizzo di ritorno
	sw $ra, ($sp)
	
	jal determinante2x2
	
	lw $ra, ($sp)
	addi $sp, $sp, -4

	jr $ra



.end leggiEchiama


.globl .globl determinante2x2	 #calcolo del determinante
.ent determinante2x2
determinante2x2:

	mul $a0, $a0, $a3
	mul $a1, $a1, $a2
	
	sub $v0, $a0, $a1
	jr $ra
.end determinante2x2
.ent calcolaDeterminante
calcolaDeterminante:

	mul $a0, $a0, $a3
	mul $a1, $a1, $a2
	
	sub $v0, $a0, $a1
	jr $ra
.end calcolaDeterminante