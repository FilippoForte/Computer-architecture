


.globl contaVicini
.ent contaVicini
contaVicini:
	move $t0, $a0
	add $t0, $t0, $a1
	addi $t1, $a3, -1       #colonna -1
	
	addi $t0, $t0, 1
	sub $t3, $t0, $a0
	div $t3, $a3
	mfhi $t2
	beq $t2, $t1, centroSinistra
	lw $t9, ($t0)			#valore a destra
	add $t8, $t8, $t9
	
centroSinistra:
	addi $t0, $t0, -2
	sub $t3, $t0, $a0
	div $t3, $a3
	mfhi $t2
	beq $t2, $0, centroAlto
	lw $t9, ($t0)			#valore a sinistra
	add $t8, $t8, $t9
	
centroAlto:
	addi $t0, $t0, 1
	sub $t3, $t0, $a0
	blt $t3, $a3, destraAlto
	add $t0, $t0, $a3
	lw $t9, ($t0)			#valore centro alto
	add $t8, $t8, $t9
	
destraAlto:
	addi $t0, $t0, 1
	sub $t3, $t0, $a0
	beq $t3, $t1, sinistraAlto
	lw $t9, ($t0)			#valore destra alto
	add $t8, $t8, $t9
	
sinistraAlto:
	addi $t0, $t0, -2
	sub $t3, $t0, $a0
	beq $t3, $0, centroBasso
	sub $t3, $t0, $a0
	lw $t9, ($t0)			#valore sinistra alto
	add $t8, $t8, $t9
	
centroBasso:
	addi $t0, $t0, 1
	div $t3, $a3
	mfhi $t2
	blt $t3, $a3, destraBasso
	sub $t3, $t0, $a0
	sub $t0, $t0, $a3
	sub $t0, $t0, $a3
	lw $t9, ($t0)			#valore centro basso
	add $t8, $t8, $t9

destraBasso
	addi $t0, $t0, 1
	div $t3, $a3
	mfhi $t2
	beq $t3, $t1, sinistraBasso
	sub $t3, $t0, $a0
	lw $t9, ($t0)			#valore destra basso
	add $t8, $t8, $t9
	
sinistraBasso:
	addi $t0, $t0, -2
	div $t3, $a3
	mfhi $t2
	beq $t3, $0, fine
	sub $t3, $t0, $a0
	lw $t9, ($t0)			#valore sinistra basso
	add $t8, $t8, $t9
	
fine:
	move $v0, $t8
	
.end contaVicini
	