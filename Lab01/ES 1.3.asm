    .data
op1: .byte 150
op2: .byte 100

    .text
    .globl main
    .ent main
main: 
    lb $t1, op1
    lb $t2, op2
    
    add $a0, $t1, $t2 # somma degli operandi
	li $v0, 1 # syscall 1 (print_int)
	syscall
    
	li $v0, 10 # codice per uscita dal programma
	syscall # fine
	.end main
	