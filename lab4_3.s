#Lab 4, Part 3
#Nicole Butler and Shane Kent

main:	li	$a0, 20
	jal	Fibonacci

end:	b 	end 

Fibonacci:
	li	$t0, 0
	li	$t1, 1
	li	$t2, 1
	
	beq	$a0, 0, done_zero
	
loop:	
	beq	$t2, $a0, done
	add	$t3, $t0, $t1
	move	$t0, $t1
	move	$t1, $t3
	
	add	$t2, $t2, 1
	b	loop

done:
	move	$v0, $t1
	jr	$ra
	
done_zero:
	li	$v0, 0
	jr	$ra
