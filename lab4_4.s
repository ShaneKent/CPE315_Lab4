main:		li	$a0, 322222
		li	$a1, 3
		li	$a2, 322222
		li	$a3, 3
		jal	double_add

double_add:	addu	$v1, $a1, $a3
		sltu	$t0, $v1, $a1
		add	$a0, $t0, $a0
		add	$v0, $a0, $a2