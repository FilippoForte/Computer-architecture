DIM = 3
DIM_RIGA = DIM * 4

.data
	mat1: .word    4,  -45, 15565, 
				6458, 4531,   124, 
				-548, 2124, 31000

	mat2: .word    6, -5421,  -547, 
				 -99,  4531,  1456, 
				4592,   118, 31999
				
	indice: .word 2
	vet_out: .space DIM_RIGA


.text
.globl main
.ent main
main:
	la $a0, mat1
	la $a1, mat2
	la $a2, vet_out
	li $a3, DIM
	subu $sp, $sp, 4
	lw $t0, indice
	sw $t0, ($sp)
	
	subu $sp, $sp, 4
	li $t1, DIM_RIGA
	sw $t1, ($sp)
	
	jal ProceduraVariazione
	addu $sp, $sp, 4


.end main


.globl ProceduraVariazione
.ent ProceduraVariazione
ProceduraVariazione:

	addi $a3, $a3, -1				#decremento DIM
	lw $t7, ($sp)
	addu $sp, $sp, 4				#salvo DIM_RIGA
	li $t6, 100						#carico 100
	
	lw $t0, ($sp)
	addu $sp, $sp, 4				#salvo indice
	
	mul $t0, $t0, $a3
	add $t1, $t1, $t0
	mul $t0, $t0, $a3
	add $t2, $t2, $t0
	
inizio:	
	
	lw $t3, $t1($a0)				#carico parola matrice 1
	lw $t4, $t2($a1)				#carico parola matrice 2
	
	sub $t5, $t4, $t3				
	mul $t5, $t5, $t6
	div $t5, $t5, $t3
	
	lw $t5, ($a2)
	addi $a2, $t0, 4				#carico vet_out
	
	add $t1, $t1, $t7
	add $t2, $t2, $a3
	addi $a3, $a3, -1
	
	bne $a3, $0, inizio
	
	
	
	




.end ProceduraVariazione




