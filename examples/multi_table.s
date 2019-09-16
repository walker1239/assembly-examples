.data # Data declaration section
	string_ingrese_numero: .asciiz "Ingrese un numero: "
	string_text1: .asciiz "La tabla de multiplar del "
	string_es: .asciiz " es:\n"
	string_endl: .asciiz "\n"
	string_mul: .asciiz "*"
	string_igaul: .asciiz "="

	
.text # Assembly language instructions
main: # Start of code section	
	
	li $t1,0 # index
	li $t2,12 # iteration number
	li $t3,0
	li $t4,0 # multiplicador
	li $t5,0 # fac
	
	# show text "ingrese numero"
	li $v0, 4 				
	la $a0, string_ingrese_numero 		
	syscall 			
	
	# read iteration number
	li $v0,5
	syscall
	
	# t2 alamcena el numero de iteraciones
	move $t5,$v0 
	  # incrementamos el contador
	
	li $v0, 4 				
	la $a0, string_text1
	syscall 

	move $a0, $t5
	li $v0, 1 
	syscall	

	li $v0, 4 				
	la $a0, string_es	
	syscall 

	Loop:

		move $a0, $t1
		li $v0, 1 
		syscall	

		li $v0, 4 				
		la $a0, string_mul		
		syscall 

		move $a0, $t5
		li $v0, 1 
		syscall	

		li $v0, 4 				
		la $a0, string_igaul	
		syscall 

		mul $t3,$t5,$t1

		move $a0, $t3
		li $v0, 1 
		syscall	

		li $v0, 4 				
		la $a0, string_endl	
		syscall 

		beq $t1,$t2, Exit

		# i++
		add $t1,$t1,1  

		j Loop
	Exit:		
	
	jr $ra