.data

	ora_in: .byte 12, 47
	ora_out: .byte 18, 47
	X: .byte 1
	Y: .byte 40

.text
.globl main
.ent main
main:

	la $a0, ora_in # indirizzo di ora_in
	la $a1, ora_out # indirizzo di ora_out
	lbu $a2, X
	lbu $a3, Y
	li $s0, 60
	jal costoParcheggio

	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall


.end main


.globl costoParcheggio
.ent costoParcheggio
costoParcheggio:

	lb $t0, ($a0)		#ora inizio
	lb $t1, 1($a0)		#minuti inizio
	lb $t2, ($a1)		#ora fine
	lb $t3, 1($a1)		#minuti fine
	
	sub $t0, $t2, $t0	#differenza ore
	mul $t0, $t0, $s0	#differenza ore in minuti
	sub $t1, $t3, $t1	#differenza minuti
	add $t0, $t0, $t1	#differenza minuti totale
	div $t0, $a3		#numero periodi
	mflo $t0
	mfhi $t1
	mul $t0, $t0, $a2	#costo periodi

	beq $t1, $0, fine
	
	addi $t0, $t0, 1
	
fine:
	move $v0, $t0

	jr $ra
.end costoParcheggio