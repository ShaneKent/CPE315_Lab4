main:		li	$a0, 0
		li	$a1, 1
		li	$a2, 5
		jal	Fibonacci

Fibonacci:	addi	$sp, $sp, -8
		add	$t0, $a0, $a1
		lw	$a0, ($a1)
		lw	$a1, ($t0)
		addi	$t1, $a2, -1
		sw	$t0, 0($sp)
		sw 	$ra, 4($sp)
		bne	$a2, $zero, ELSE
		
ELSE:		