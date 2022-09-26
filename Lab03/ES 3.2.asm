	.data
msg: .asciiz "Inserire un numero"
NaN: .asciiz "Il carattere inserito non è un numero\n"
number: .asciiz "Il carattere inserito è un numero\n"
big: .asciiz "numero troppo grande"

	.text
	.globl main
	.ent main
	
main:
	
	la $a0, msg  #stampa messaggio
	li $v0, 4
	syscall
	
	li $t0, 57			#9
	li $t1, 48			#0
	li $t3, 10			#invio
	li $t4, 0xFFFFFFFF
	
while:
	
	li $v0, 12
	syscall
	
	move $t2, $v0		
	beq $t2, $t3, fine			#controlli
	bltu $t2, $t1, carattere
	bgtu $t2, $t0, carattere
	
	sub $t2, $t2, $t1			#aggiunta cifra
	mul $t5, $t5, $t3
	add $t5, $t5, $t2
	bgtu $t5, $t4, bigNumber
	
	j while
	
	
carattere:
	
	la $a0, NaN  #stampa messaggio
	li $v0, 4
	syscall
	j while
	
bigNumber:
	la $a0, big  #stampa messaggio
	li $v0, 4
	syscall
	j while

fine:	
	move $a0, $t5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	.end main