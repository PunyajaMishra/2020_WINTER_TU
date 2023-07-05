.data
	theArray: .space 20
 #        .space an int is 4 bytes, so 3 integers is 12 bytes
.text
#this first bit just puts values into registers
# after this we need to copy them to an array
	addi $s0, $zero, 1
	addi $s1, $zero, 3
	addi $s2, $zero, 5
	addi $s3, $zero, 7
	addi $s4, $zero, 9
	#now we need to use sw (store word) to move values into an array
	#set the index 0
	addi $t0, $zero, 0
#copy pasteable
	#Store values
	sw $s0, theArray($t0)
		addi $t0, $t0, 4
	sw $s1, theArray($t0)
		addi $t0, $t0, 4
	sw $s2, theArray($t0)
		addi $t0, $t0, 4
	sw $s3, theArray($t0)
		addi $t0, $t0, 4
	sw $s4, theArray($t0)
		addi $t0, $t0, 4
		
	#loading data (to print it)
	addi $t0, $zero, 0

	loop:
	beq $t0, 20, exit
	lw $t6, theArray($t0)
	addi $t0,$t0,4
	
	#print it
	print:
	li $v0, 1
	addi $a0, $t6, 0	
	syscall
	
	b loop	
	
	#done
	exit:
	li $v0, 10
	syscall
