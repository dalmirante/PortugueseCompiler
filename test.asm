.text
start:
	la $t0, end
	li $v0, 1
	li $a0, 1
	jr $t0
another_end:
	li $v0, 4 
end:
	syscall