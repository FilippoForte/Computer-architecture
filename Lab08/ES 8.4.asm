DIM = 5
.data
	vet1: .word 56, 12, 98, 129, 58
	vet2: .word 1, 0, 245, 129, 12
	risultato: .space DIM
	
.text
.globl main
.ent main
main:
	la $a0, vet1
	la $a1, vet2
	la $a2, risultato
	li $a3, DIM
	li $s0, 2
	jal CalcolaDistanzaH
	
	la $t0, risultato
	li $t1, DIM
	
ciclo:
	lw $a0, ($t0)
	li $v0, 1
	syscall
	
	addi $t0, 4
	addi $t1, -1
	bne $t1, $0, ciclo
	
	li $v0, 10
	syscall
	
.end main



.globl CalcolaDistanzaH
.ent CalcolaDistanzaH
CalcolaDistanzaH:
	
	lw $t0, ($a0)
	lw $t1, ($a1)
	li $t4, 0

inizio:	
	div $t0, $t0, $s0
	mfhi $t2
	
	div $t1, $t1, $s0
	mfhi $t3
	
	beq $t2, $t3, check
	
	addi $t4, 1
	
check:
	bne $t0, $0, inizio
	bne $t1, $0, inizio
	
	addi $a3, -1
	sw $t4, ($a2)
	addi $a0, 4
	addi $a1, 4
	addi $a2, 4
	bne $a3, $0, CalcolaDistanzaH
	
	jr $ra
	
	
.end CalcolaDistanzaH