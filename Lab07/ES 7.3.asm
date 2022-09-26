.data
	numero: .word 19
	
.text
.globl main
.ent main
main:

	la $t0, numero
	lw $a0, ($t0)
	li $s0, 1
	li $s1, 2
	li $s2, 3
	
	jal sequenzaDiCollatz
	
	move $a0, $v0			#stampa
	li $v0, 1
	syscall
	
	li $v0, 10				#fine
	syscall



.end main


.globl sequenzaDiCollatz
.ent sequenzaDiCollatz
sequenzaDiCollatz:
	addi $sp, $sp, -4
	sw $ra, ($sp)

ripeti:
	jal calcolasuccessivo
	
	addi $s3, $s3, 1
	
	beq $v0, $s0, fineSequenza		#controllo fine sequenza
	move $a0, $v0 
	j ripeti
	
fineSequenza:
	addi $v0, $s3, 1			#sposto risultato e aggiungo primo valore
	lw $ra, ($sp)				#carico indirizzo di ritorno
	addi $sp, $sp, 4
	jr $ra

.end sequenzaDiCollatz





.globl calcolasuccessivo
.ent calcolasuccessivo
calcolasuccessivo:


	div $a0, $s1			#controllo pari dispari
	mfhi $t2
	beq $t2, $0, pari
	
	mul $a0, $a0, $s2		#dispari
	addi $a0, $a0, 1
	j fine
	
pari: 
	div $a0, $a0, $s1		#pari

fine:
	move $v0, $a0
	jr $ra

.end calcolasuccessivo