.data
additionprint: .asciiz "\naddition of matrix is \n"
multiplicationprint: .asciiz "\nmultiplication of matrix is \n"
transposeprint: .asciiz "\ntranspose of matrix is\n"
nextline: .asciiz "\n"
tab: .asciiz "\t"

matrixA : .word 2,1,9,2
	  .word 7,9,10,10
	  .word 3,4,3,4
	  .word 2,5,4,6
	  
matrixB:  .word 8,7,1,2
          .word 2,7,3,6
          .word 7,5,6,8
          .word 9,4,8,9
matrixC: .word 0:4
	 .word 0:4
	 .word 0:4
	 .word 0:4

size: .word 4
.eqv DATA_SIZE 4 #defining constant - since integers, thus data size is 4

.text
la $a0,matrixA #base address of matrix A is in $a0
la $a1,matrixB #base address of matrix B is in $a1
lw $a3,size #$a3 has the size


###############################addition#################################
li $t0,0
li $t1,0
li $t9,0

addition:
beq $t0,4,print

beq $t1,4,nextrow
#finding the address
mul $t5,$t0,$a3
add $t5,$t5,$t1
mul $t5,$t5,4
add $t6,$t5,$a0
add $t7,$t5,$a1
#loading the number of the address form the memory
lw $t6,($t6)
lw $t7,($t7)
#adding the two integers of two matrices
add $t8,$t6,$t7
#storing the sum in matrix C
sw $t8,matrixC($t9)
#increment
add $t1,$t1,1
add $t9,$t9,4
j addition


###############################print#################################
print:
li $t9,0 #index through matrix C
li $t2,0 #column count
li $t3,0 #rowcount
jal stringprint
j print1

print1:
beq $t3,4,end
beq $t2,4,nextrowcount

#load integer
lw $t6,matrixC($t9)

#print it
li $v0,1
move $a0,$t6
syscall
li $v0,4
la $a0,tab
syscall

#increment
add $t2,$t2,1
add $t9,$t9,4
j print1

stringprint:
li $v0,4
la $a0,additionprint
syscall
jr $ra

#######################next row and column###################################
nextrow:
add $t0,$t0,1
sub $t1,$t1,$t1
j addition

nextrowcount:
add $t3,$t3,1
li $v0,4
la $a0,nextline
syscall
sub $t2,$t2,$t2
j print1

end:
li $v0,10
syscall
