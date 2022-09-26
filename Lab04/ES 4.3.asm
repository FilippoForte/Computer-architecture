.data

    vettRiga:   .word   9, 8, 7, 6
    matRis:     .space  4*4*4
    vettCol:    .word   1, 2, 3, 4

.text
    .globl main
    .ent main

main:
	add $t0, $0, $0		#azzero indice riga
	add $t1, $0, $0		#azzero indice colonna
	
	addi $t7, $0, 16	#N
	
	la $s0, vettRiga	#indirizzo riga
	la $s1, vettCol		#indirizzo colonna
	
	la $s2, matRis
	
for1:	
	add $t4, $t0, $s0
	lw $t2, 0($t4)	#valore riga
	
	add $t5, $t1, $s1
	lw $t3, 0($t5)	#valore colonna
	mul $t2, $t2, $t3
	
	add $t4, $t0, $t1
	add $t4, $t4, $s2
	sw $t2, 0($t4)
	
	move $a0, $t2		#stampa numero
	li $v0, 1
	syscall
	
	li $a0, ' '		#stampa spazio
	li $v0, 11
	syscall
	
	addi $t1, $t1, 4	#incremento indice colonna
	beq $t1, $t7, for2  #controllo fine riga
	j for1
	
for2: 
	add $t1, $0, $0		#azzero indice colonna
	addi $t0, $t0, 4    #incremento indice riga
	
	li $a0, '\n'		#stampa spazio
	li $v0, 11
	syscall
	
	bne $t0, $t7, for1  #controllo fine colonne

	li $v0, 10
	syscall
	