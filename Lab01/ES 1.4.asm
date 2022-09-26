	.data
var:	.word 0x3FFFFFF0

	.text
	.globl main
	.ent main
main:

	lw $t0, var
	li $t2, 2
	mul $t1, $t0, $t2  #t1 contiene 2*var
	
	add $a0, $t1, $0 
	li $v0, 1 # syscall 1 (print_int)
	syscall
	
	addi $t3, $t1, 40 #t1+40 immediato
	
	add $a0, $t3, $0
	li $v0, 1 # syscall 1 (print_int)
	syscall
	
	addi $t2, $0, 40
	
	add $a0, $t2, $t1 # somma degli operandi
	li $v0, 1 # syscall 1 (print_int)
	syscall
	
	li $v0, 10 # codice per uscita dal programma
	syscall # fine
	.end main
	