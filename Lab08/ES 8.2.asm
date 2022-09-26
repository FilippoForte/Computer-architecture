LUNG = 6
.data
	anni: .word 1945, 2008, 1800, 2006, 1748, 1600
	ris: .space LUNG*4
	
.text
.globl main
.ent main
main:
	la $a0, anni
	la $a1, ris
	li $a2, LUNG
	li $s0, 100
	li $s1, 400
	li $s2, 4
	li $s3, 1
	jal bisestile
	
	la $t0, ris
	li $t1, LUNG

stampa:	
	lw $a0, ($t0)
	li $v0, 1
	syscall
	
	addi $t1, $t1, -1
	add $t0, $t0, 4
	bne $t1, $0, stampa

	li $v0, 10
	syscall	
	

.end main


.globl bisestile
.ent bisestile
bisestile:

	lw $t0, ($a0)
	div $t0, $s0
	mfhi $t1
	bne $t1, $0, NoCentenario		#controllo divisione per 100
	
	div $t0, $s1
	mfhi $t1
	beq $t1, $0, AnnoBisestile			#controllo divisione per 400
	
NoBisestile:
	sw $0, ($a1)
	j fineAnno
	
NoCentenario:
	div $t0, $s2
	mfhi $t1
	bne $t1, $0, NoBisestile		#controllo divisione per 4
	
AnnoBisestile:
	sw $s3, ($a1)
	
fineAnno:
	addi $a2, $a2, -1

	beq $a2, $0, fine
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	j bisestile
	
fine:
	jr $ra

.end bisestile