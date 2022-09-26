	.data
opa: .word 2043
opb: .word 5
res: .space 4
switch: .word somma, sottraz, moltip, divis
msg: .asciiz "0.add  1.sub  2.mul  3.div"

	.text
	.globl main
	.ent main
main:
	lw $s0, opa
	lw $s1, opb
	
	la $a0, msg			#stampa messaggio
	li $v0, 4
	syscall
	
	li $v0, 5			#leggi istruzione
	syscall
	
	sll $t0, $v0, 2
	lw $t1, switch($t0)
	jr $t1
	
somma:
	add $a0, $s0, $s1
	sw $a0, res
	li $v0, 1
	syscall
	j fine

sottraz:
	sub $a0, $s0, $s1
	sw $a0, res
	li $v0, 1
	syscall
	j fine

moltip:
	mul $a0, $s0, $s1
	sw $a0, res
	li $v0, 1
	syscall
	j fine

divis:
	div $a0, $s0, $s1
	sw $a0, res
	li $v0, 1
	syscall
	
	
fine:
	li $v0, 10
	syscall
