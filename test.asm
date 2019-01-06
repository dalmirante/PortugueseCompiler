.text
main:
	addiu $sp, $sp, -8
#Storing x
	li $t0, 1
	sw $t0, x
#Storing y
	li $t0, 0
	sw $t0, y
#Storing z
	li $t0, 1
	li $a0, 1
	sw $t0, z
#Showing x
	li $v0, 4
	lw $t0, x
	lw $a0, x
	jal print
	syscall
	la $a0, newline
	li $v0, 4
	syscall
#Showing y AND x
	li $v0, 4
	lw $t0, y
	lw $a0, y
	sw $t0, 4($sp)
	lw $t0, x
	lw $a0, x
	move $t1, $t0
	lw $t0, 4($sp)
	and $t0, $t1, $t0
	jal print
	syscall
	la $a0, newline
	li $v0, 4
	syscall
#Showing y OR x
	li $v0, 4
	lw $t0, y
	lw $a0, y
	sw $t0, 4($sp)
	lw $t0, x
	lw $a0, x
	move $t1, $t0
	lw $t0, 4($sp)
	or $t0, $t1, $t0
	jal print
	syscall
	la $a0, newline
	li $v0, 4
	syscall
#Showing z+2
	li $v0, 1
	lw $t0, z
	lw $a0, z
	sw $t0, 4($sp)
	li $t0, 2
	li $a0, 2
	lw $t1, 4($sp)
	add $a0, $t0, $t1
	syscall
	la $a0, newline
	li $v0, 4
	syscall
#Showing z
	li $v0, 1
	lw $t0, z
	lw $a0, z
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
x:
	.space 4
y:
	.space 4
z:
	.space 4
true:
	.asciiz "verdade"
false:
	.asciiz "falso"
newline:
	.asciiz "\n"
