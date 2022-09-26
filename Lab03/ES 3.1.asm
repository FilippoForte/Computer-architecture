	.data
msg: .asciiz "Inserire un numero"
NaN: .asciiz "Il carattere inserito non è un numero\n"
number: .asciiz "Il carattere inserito è un numero\n"

	.text
	.globl main
	.ent main
	
main:
	
	la $a0, msg  #stampa messaggio
	li $v0, 4
	syscall
	
	li $t0, 57
	li $t1, 48
	li $t3, 10
	
while:
	
	li $v0, 12
	syscall
	
	move $t2, $v0
	beq $t2, $t3, fine
	blt $t2, $t1, carattere
	bgt $t2, $t0, carattere
	
	la $a0, number  #stampa messaggio
	li $v0, 4
	syscall
	
	j while
	
	
carattere:
	
	la $a0, NaN  #stampa messaggio
	li $v0, 4
	syscall
	j while
	

fine:	
	li $v0, 10
	syscall
	
	.end main