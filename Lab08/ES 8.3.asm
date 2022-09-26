NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
.data
	prezzi: .word 39, 1880, 2394, 1000, 1590
	scontati: .space DIM


.text
.globl main
.ent main
main:
	la $a0, prezzi
	la $a1, scontati
	li $a2, NUM
	li $a3, SCONTO
	li $t0, ARROTONDA
	subu $sp, 4
	sw $t0, ($sp)
	
	li $s0, 100
	li $s1, 50

	jal calcola_sconto

	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall


.end main

.globl calcola_sconto
.ent calcola_sconto
calcola_sconto:

	sub $t2, $s0, $a3
	lw $t3, ($sp)
	addi $sp, -4

nuovoPrezzo:
	lw $t0, ($a0)
	mul $t1, $t0, $t2
	div $t1, $t1, $s0
	
	beq $t3, $0, skip
	
	mfhi $t4
	blt $t4, $s1, skip
	
	addi $t1, $t1, 1
	
skip:
	sub $t5, $t0, $t1
	add $t6, $t6, $t5
	
	sw $t1, ($a1)
	
	addi $a2, $a2, -1
	addi $a1, $a1, 4
	addi $a0, $a0, 4
	
	bne $a2, $0, nuovoPrezzo
	
	move $v0, $t6
	jr $ra


.end calcola_sconto