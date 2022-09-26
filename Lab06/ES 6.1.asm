.data

.text
.globl main
.ent main
main:

	li $t0, 9
	li $t1, 1
	move $t2, $t1

stampa:
	
	li $a0, '*'					#stampa *
	li $v0, 11
	syscall
	
	addi $t2, $t2, -1			#decremanta contatore
	bne $t2, $0, stampa
	
	addi $t1, $t1, 1			#riga successiva
	move $t2, $t1
	
	li $a0, '\n'				#nuova riga
	li $v0, 11
	syscall
	
	bne $t2, $t0, stampa
	
	li $t4, 0
	li $t3, 0
	
stampaQuadrato:
	
	li $a0, '*'					#stampa *
	li $v0, 11
	syscall
	
	addi $t3, $t3, 1
	bne $t3, $t0, stampaQuadrato
	li $t3, 0
	
	li $a0, '\n'				#nuova riga
	li $v0, 11
	syscall
	
	addi $t4, $t4, 1
	bne $t4, $t0, stampaQuadrato
	
	li $v0, 10
	syscall
	