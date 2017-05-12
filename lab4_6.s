.data
hextab: .asciiz "0123456789ABCDEF"
output:
.text
.globl main

main:	li	$a0, 0x6608C000
	jal	mask
	or	$a0, $v0, $v0
	li	$v0, 0
	jal	bintohex
	
	li	$a0, 0xC2008000
	jal	mask
	or	$a0, $v0, $v0
	li	$v0, 0
	jal	bintohex
	
	li	$a0, 0x19070FFF
	jal	mask
	or	$a0, $v0, $v0
	li	$v0, 0
	jal	bintohex
	
end:	b	end

mask:	andi	$t0, $a0, 0xE0000000
	andi	$t1, $a0, 0x06000000
	andi	$t2, $a0, 0x00080000
	andi	$t3, $a0, 0x0000F000
	srl	$t0, $t0, 25
	srl	$t1, $t1, 25
	srl	$t2, $t2, 11
	li	$v0, 0
	or	$v0, $v0, $t0
	or	$v0, $v0, $t1
	or	$v0, $v0, $t2
	or	$v0, $v0, $t3
	jr	$ra
	
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
