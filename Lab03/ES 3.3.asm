	.data
gg: .byte 10
hh: .byte 8
mm: .byte 15
risultato: .space 2

	.text
	.globl main
	.ent main
main:
	
	lb $t0, gg
	lb $t1, hh
	lb $t2, mm
	
	li $t3, 24				#gg to hh
	mul $t0, $t0, $t3
	
	add $t1, $t1, $t0
	li $t3, 60				#hh to mm
	mul $t1, $t1, $t3
	
	add $t2, $t2, $t1
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	sw $t2, risultato
	
	li $v0, 10
	syscall
	
	
	.end main