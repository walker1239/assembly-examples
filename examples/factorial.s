.data # Data declaration section
	string_ingrese_numero: .asciiz "Ingrese un numero: "
	string_fact: .asciiz "El factorial es: "
	
.text # Assembly language instructions
main: # Start of code section	
	
	li $t1,0 # index
	li $t2,0 # iteration number
	li $t4,1 # multiplicador
	li $t5,1 # fac
	
	# show text "ingrese numero"
	li $v0, 4 				
	la $a0, string_ingrese_numero 		
	syscall 			
	
	# read iteration number
	li $v0,5
	syscall
	
	# t2 alamcena el numero de iteraciones
	move $t2,$v0 
	
	add $t1,$t1,1   # incrementamos el contador
	
	Loop:
		beq $t2,$t1, Exit

		# factorial
		add $t4,$t4,1
		mul $t5,$t5,$t4

		# i++
		add $t1,$t1,1  
			
		
		j Loop
	Exit:		
	
	# El numero mayor
	li $v0, 4 				
	la $a0, string_fact 		
	syscall 
	
	move $a0, $t5
	li $v0, 1 
	syscall
		
	jr $ra