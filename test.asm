.text
main:
	addiu $sp, $sp, -8
	la $a0, false
	li $t0, 0
	sw $t0, 4($sp)
	la $a0, true
	li $t0, 1
	move $t1, $t0
	lw $t0, 4($sp)
	and $t0, $t1, $t0
	beq $t0, $zero, continue
#Showing 1
	li $v0, 1
	li $t0, 1
	li $a0, 1
	syscall
	la $a0, newline
	li $v0, 4
	syscall
continue:
#Showing 2
	li $v0, 1
	li $t0, 2
	li $a0, 2
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	j end
print:
	move $t4, $ra
	bnez $t0, verdade
	jal prepare_return
verdade:
	jal print_true
	jr $t4
print_true:
	la $a0, true
	j show
print_false:
	la $a0, false
show:
	jr $ra
prepare_return:
	move $t0, $ra
	add $t0, $t0, 4
	move $ra, $t0
	j print_false
end:
	addiu $sp, $sp, 8
.data
true:
	.asciiz "verdade"
false:
	.asciiz "falso"
newline:
	.asciiz "\n"
