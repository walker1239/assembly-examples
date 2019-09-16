	.data # Data declaration section

text1: .asciiz "\nLa suma de impares es: "
text2: .asciiz "\nLa suma de pares es: "
text0: .asciiz "Ingrese el numero: "


	.text # Assembly language instructions

main: # Start of code section

li $t1,0 #index
li $t2,0 #iteration
li $t3,0 #impar
li $t4,0 #par

li $v0, 4 				
la $a0, text0 		
syscall 			

# read iteration number
li $v0,5
syscall

# t2 alamcena el numero de iteraciones
move $t2,$v0 


loop:

	beq $t1,$t2, exit
	add $t1,$t1,1  

	li $v0,5
	syscall
	move $t5,$v0 

	remu $a0,$t5,2
	beqz $a0,par

	impar:
	add $t3,$t3,$t5
	j loop  


	par:
	add $t4,$t4,$t5
	j loop

exit:

li $v0, 4 				
la $a0, text2 		
syscall

move $a0, $t4
li $v0, 1 
syscall	

li $v0, 4 				
la $a0, text1 		
syscall

move $a0, $t3
li $v0, 1 
syscall	

jr $ra

	
	
