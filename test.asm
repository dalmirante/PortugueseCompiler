.text
main:
	addiu $sp, $sp, -8
#Storing n
	li $t0, 10
	li $a0, 10
	sw $a0, n
#Valor 1 em While
continue1:
	lw $t0, n
	lw $a0, n
	sw $t0, 4($sp)
	li $t0, 5
	li $a0, 5
	move $t1, $t0
	lw $t0, 4($sp)
	sgt $fp, $t0, $t1
	beq $fp, $zero, exitWhile1
#Showing n INT
	li $v0, 1
	lw $t0, n
	lw $a0, n
	syscall
	la $a0, newline
	li $v0, 4
	syscall
#Storing n
	lw $t0, n
	lw $a0, n
	sw $t0, 4($sp)
	li $t0, 1
	li $a0, 1
	lw $t1, 4($sp)
	sub $a0, $t1, $t0
	sw $a0, n
	b continue1
exitWhile1:
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
n:
	.space 4
true:
	.asciiz "verdade"
false:
	.asciiz "falso"
newline:
	.asciiz "\n"
