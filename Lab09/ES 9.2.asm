.data
	str_orig: .asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente"
	str_sost: .asciiz "per me si va"
	str_new: .space 200
.text
.globl main
.ent main
main:
	la $a0, str_orig
	la $a1, str_sost
	la $a2, str_new
	jal sostituisci
	
	move $a0, $v0
	li $v0, 4
	syscall


.end main

.globl sostituisci
.ent sostituisci
sostituisci:
	li $t1, '%'
	li $t4, '0'

sostituisci2:	
	lw $t0, ($a0)
	beq $t0, $t4, fine
	beq $t0, $t1, cambia			#controllo cambio
	sw $t0, ($a2)
	addi $a2, $a2, 4
	addi $t5, $t5, 1
	j sostituisci2
	
cambia:								#sostituzione
	li $t3, 0
cambia2:
	lw $t2, $t3($a1)			
	beq $t2, $t4, sostituisci2		#controllo fine
	sw $t2, ($a2)						#scrivo lettera
	addi $a2, $a2, 4
	addi $t5, $t5, 1
	j cambia2

fine:
	move $v0, $t5	

.end sostituisci