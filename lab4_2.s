# Lab 4, Part 2

.data
data: .word 128
hextab: .asciiz "0123456789ABCDEF"

.text
.globl main

main:	la $a0, data
	lw $a0, ($a0)
	jal bintohex
	
bintohex:
	li $t3, 8
	
loop:	srl $t0, $a0, 28
	sll $a0, $a0, 4
	la $t4, hextab
	add $t4, $t4, $t0
	lb $t1, 0($t4)
	sb $t1, 0($a1)
	addi $a1, $a1, 1
	addi $t3, $t3, -1
	bne $t3, $zero, loop
	sb $zero, 0($a1)
	
	jr $ra