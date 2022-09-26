	.data
n1: .byte 18
n2: .byte 15
n3: .byte 23


	.text
	.globl main
	.ent main
main:
	
	lb $t0, n1
	lb $t1, n2
	lb $t2, n3
	
	blt $t1, $t0, swapAB
check1:
	blt $t2, $t0, swapAC
check2:
	blt $t2, $t1, swapBC
	j done
	
	
swapAB:
	move $t3, $t0
	move $t0, $t1
	move $t1, $t3

	j check1

swapAC:
	move $t3, $t0
	move $t0, $t2
	move $t2, $t3

	j check2
swapBC:
	move $t3, $t2
	move $t2, $t1
	move $t1, $t3

	
done:
	move $a0, $t0
	li $v0, 1
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall

	li $v0, 10
	syscall
	
	.end main