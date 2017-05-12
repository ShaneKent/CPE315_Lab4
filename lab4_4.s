.data
hextab: .asciiz "0123456789ABCDEF"
output:
.text
.globl main

main:		li	$a0, 322222
		li	$a1, 3
		li	$a2, 322222
		li	$a3, 3
		jal	double_add
		or	$s0, $v0, $v0
		or	$s1, $v1, $v1
		andi	$v0, 0 
		or	$a0, $s1, $s1
		jal	bintohex
		or	$a0, $s0, $s0
		jal	bintohex

double_add:	addu	$v1, $a1, $a3
		sltu	$t0, $v1, $a1
		add	$a0, $t0, $a0
		add	$v0, $a0, $a2
		jr	$ra
		
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
