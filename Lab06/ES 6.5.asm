.data 
	n: .word 12
	k: .word 2
	
.text
.globl main
.ent main
main:
	li $t7, 1

	la $t0, n
	la $t1, k
	
	lw $a0, ($t0)			#carico indirizzo n
	lw $a1, ($t1)			#carico indirizzo k
	
	move $t0, $a0			#salva valore n
	move $t1, $a1			#salva valore k
	move $t2, $a1			#salva valore k

	
	jal combina
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.end main



.globl combina
.ent combina
combina:

	addi $t0, $t0, -1		#n-1
	addi $t1, $t1, -1		#k-1
	mul $a0, $a0, $t0
	mul $t2, $t2, $t1
	
	bne $t1, $t7, combina
	
	div	$v0, $a0, $t2	
		
	jr $ra
.end combina