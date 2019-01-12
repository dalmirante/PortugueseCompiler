.text
main:
	addiu $sp, $sp, -8
#Adicionar FOR
	la $t1, x
	lw $t0, 4($t1)
	lw $a0, 4($t1)
	beqz $t0, ExitFOR1
	move $t3, $t0
	li $a0, 0
	sw $a0, j
FOR1:
#Showing j INT
	li $v0, 1
	lw $t0, j
	lw $a0, j
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	lw $fp, j
	add $fp, $fp, 1
	sw $fp, j
	bne $fp, $t3, FOR1
ExitFOR1:
	j end
print:
	move $t4, $ra
	bnez $fp, verdade
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
j:
	.space 4
true:
	.asciiz "verdade"
false:
	.asciiz "falso"
newline:
	.asciiz "\n"
x:
	.word 1, 2, 3
