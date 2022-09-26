	.data
msg: .asciiz "Inserire un numero"

	.text
	.globl main
	.ent main
	
main:
	la $a0, msg				#stampa messaggio
	li $v0, 4
	syscall
	
	li $v0, 5				#leggi numero
	syscall
	
	move $t0, $v0
	add $t1, $0, $0
	add $t4, $0, $0
	
for:
	slti $t2, $t1, 16		#controllo for
	beq $t2, $0, done

	addi $t1, $t1, 1		#incremento for
	
	andi $t3, $t0, 1
	bne $t3, $0, uno

continua:
	srl $t0, $t0, 1			#shift a destra
	j for	

uno:
	addi $t4, $t4, 1		#incremento contatore
	j continua

done:
	move $a0, $t4
	li $v0, 1
	syscall

	li $v0, 10
	syscall
	.end main