	.data
vettore: .word 1, 1 .space 72

	.text
	.globl main
	.ent main
main:
	la $s0, vett

	li $t0, 1
	sw $t0, 0($s0)		# primo numero
	sw $t0, 1($s0)		#secondo numero
	li $t2, 20
	
	addi $s0, $s0, 2
	
for:
	lw $t0, -1($s0)
	lw $t1, -2($s0)
	
	add $t0, $t0, $t1	#somma due numeri precendenti
	sw $t0, 0($s0)
	
	addi $s0, $s0, 1	#controlli
	bne  $s0, $t2, for
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

	.end main