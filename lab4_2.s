# Lab 4, Part 2
# Shane Kent and Nicole Butler

.data
hextab: .asciiz "0123456789ABCDEF"
output:
.text
.globl main

main:	li 	$a0, 4294967295
	jal 	bintohex
	
	li	$a0, 16
	jal	bintohex
	
end:	b	end

bintohex:
	li 	$t7, 28
	move	$t0, $a0
	
loop:	srlv 	$t1, $t0, $t7
	and	$t1, 15
	
	la	$t2, hextab
	add	$t2, $t2, $t1
	lb	$t3, 0($t2)
	
	sb	$t3, output
	la	$a0, output
	ori	$v0, 4
	syscall
	
	add	$t7, $t7, -4
	bne 	$t7, -4, loop
	
	add	$t3, $zero, 10
	sb	$t3, output
	la	$a0, output
	syscall
	
	jr	$ra