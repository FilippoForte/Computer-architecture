.data

	parola: .asciiz "banana"
	
.text
.globl main
.ent main
main:

	la $t0, parola
	li $t7, 0
	
check:
	
	lb $a0, ($t0)
	beq $a0, $t7, fine	#controllo carattere fine riga
	
	jal converti
	
	move $a0, $v0		#stampa carattere maiuscolo
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1	#carattere successivo
	j check

fine:
	li $v0, 10
	syscall
	
.end main
	
#procedura converti	
.globl converti
.ent converti
converti:
	addi $v0, $a0, -32
	
	jr $ra
.end converti	