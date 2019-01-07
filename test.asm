.text
main:
	addiu $sp, $sp, -8
#IfElse condition
	li $t0, 0x3f800000
	mtc1 $t0, $f12
	mov.s $f0, $f12
	li $t0, 0x40000000
	mtc1 $t0, $f12
	mov.s $f1, $f12
	c.le.s $f1, $f0
	bc1f set_false
	li $v0, 4
	li $fp, 1
	jal print
	j continue2
set_false:
	li $fp, 0
	beq $fp, $zero, else1
#Showing verdade
	li $v0, 4
	li $t0, 1
	li $fp, 1
	jal print
continue2:
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	j exit1
else1:
#Showing 2
	li $v0, 1
	li $t0, 2
	li $a0, 2
	syscall
	la $a0, newline
	li $v0, 4
	syscall
exit1:
#Showing 2.+3.
	li $v0, 2
	li $t0, 0x40000000
	mtc1 $t0, $f12
	mov.s $f0, $f12
	li $t0, 0x40400000
	mtc1 $t0, $f12
	mov.s $f1, $f12
	add.s $f12, $f0, $f1
	jal print
	syscall
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
true:
	.asciiz "verdade"
false:
	.asciiz "falso"
newline:
	.asciiz "\n"
