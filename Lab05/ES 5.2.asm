.data
	msg: .asciiz "Inserire una stringa"
	msg1: .asciiz "Stringa non palidroma"
	msg2: .asciiz "Stringa palidroma"
	
	
.text
.globl main
.ent main
main:
	
	la $a0, msg
	li $v0, 4
	syscall
	
	li $t0, 0
	li $t7, '\n'
	
	move $t0, $sp
	
for:

	li $v0, 12					#leggi carattere
	syscall
	
	beq $v0, $t7, fineStringa	#controlla invio
	
	addi $sp, $sp, -4			#decrementa stack
	sw $v0, 0($sp)				#salva nello stack
	
	addi $t1, $t1, 4			#conta
	
	j for
	
fineStringa:
	
	addi $t0, $t0, -4
	lw $t2, 0($t0)
	lw $t3, 0($sp)
	
	bne $t2, $t3, falso

	addi $sp, $sp, 4
	addi $t1, $t1, -4
	beq $t1, $0, vero
	
	j fineStringa
	
falso:
	la $a0, msg1
	li $v0, 4
	syscall
	j fine
	
vero:
	la $a0, msg2
	li $v0, 4
	syscall
	
fine:
	li $v0, 10
	syscall