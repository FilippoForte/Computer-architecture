.data
    tabella:    .word   154,    123,    109,    86,     4,      0
                .word   412,   -23,   -231,     9,      50,     0
                .word   123,   -24,     12,     55,    -45,     0
                .word   0,      0,      0,      0,      0,      0

.text
.globl main
.ent main
main:
	
	li $t0, 3
	li $t1, 5
	li $t3, 0
	la $s0, tabella
	
	add $t2, $0, $s0
	
for1:
	
	lw $t3, 0($t2)
	add $t4, $t4, $t3		#somma numeri
	
	addi $t2, $t2, 4		#numero successivo
	
	addi $t1, $t1, -1
	
	bne $t1, $0, for1		#controllo fine riga
	
	addi $t2, $t2, 4
	
	sw $t4, 0($t2)			#scrittura parola
	
	li $t4, 0
	li $t1, 5
	
	addi $t0, $t0, -1
	bne $t0, $0, for1		#controllo fine colonna
	
		
	li $v0, 10
	syscall
	