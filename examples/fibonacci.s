.data
text1: .asciiz "\n La serie es "
text2: .asciiz "\n Ingrese numero: "
coma: .asciiz ", "

	.text
main:
	
	li $t1, 0 
	li $t2, 0 
	li $t3, 1 
	li $t4, 1 
	li $t5, 0

	li $v0, 4
	la $a0, text2
	syscall

	li $v0, 5
	syscall
	move $t2, $v0
	
li $v0, 1
move $a0, $t3	
syscall

li $v0, 4
la $a0, coma
syscall

add $t1, $t1, 1

loop:	
	beq $t2, $t1, exit

	li $v0, 1
	move $a0, $t4
	syscall

	li $v0, 4
	la $a0, coma
	syscall

	add $t5,$t3,$t4
	move $t3,$t4
	move $t4,$t5

	add $t1, $t1, 1
	j loop

exit:	
	jr $ra
