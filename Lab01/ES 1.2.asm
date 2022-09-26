    .data
var1: .byte 'm'
var2: .byte 'i'
var3: .byte 'p'
var4: .byte 's'
var5: .byte 0

    .text
    .globl main
    .ent main
    
main: 
    li $t0, 0x20
    
    lb $t1, var1
    sub $t1, $t1, $t0
    sb $t1, var1
    
    lb $t1, var2
    sub $t1, $t1, $t0
    sb $t1, var2
    
    lb $t1, var3
    sub $t1, $t1, $t0
    sb $t1, var3
    
    lb $t1, var4
    sub $t1, $t1, $t0
    sb $t1, var4
    
	li $v0, 4
	la $a0, var1
	syscall
	
	li $v0, 10 # codice per uscita dal programma
	syscall # fine
	.end main
    