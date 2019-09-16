	.data # Data declaration section

text1: .asciiz "El numero es impar"
text2: .asciiz "El numero es par"
text0: .asciiz "Ingrese el numero: "


	.text # Assembly language instructions

main: # Start of code section
    

    la $a0, text0
	li $v0,4
	syscall 

    li      $v0, 5  
	syscall
	move $a1,$v0


	remu $a0,$a1,2
	beqz $a0,par

	impar:
	la $a0, text1
	b end  


	par:
	la $a0, text2
	b end 

	end: 
	li $v0, 4
	syscall
    jr $ra 