.data # Data declaration section
	string_ingrese_numero: .asciiz "Ingrese un numero: "
	string_fact: .asciiz "El factorial es: "
	string_endl: .asciiz "\n"
	
.text # Assembly language instructions
main: # Start of code section	
	
	li $t1,0 # index
	li $t2,0 # iteration number
	li $t3,0
	li $t4,1 # 
	li $t5,5 #
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

		mul $t3,$t5,$t4
		add $t4,$t4,1

		# i++
		add $t1,$t1,1  

		bge $t3,$t2, Exit

		move $a0, $t3
		li $v0, 1 
		syscall	

		li $v0, 4 				
		la $a0, string_endl 		
		syscall 
		
		j Loop
	Exit:		
	
	jr $ra