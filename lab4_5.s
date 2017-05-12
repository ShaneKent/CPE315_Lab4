main:
	li	$a0, 128
	li	$a1, 2048
	li	$a2, 8
	
	jal 	double_shift
	
end:	b 	end

double_shift:
	li	$t1, 0
loop:
	srl	$a1, $a1, 1
	and	$t0, $a0, 1
	srl	$a0, $a0, 1
	sll	$t0, $t0, 31
	or	$a1, $a1, $t0
	add	$t1, $t1, 1
	
	bne	$t1, $a2, loop