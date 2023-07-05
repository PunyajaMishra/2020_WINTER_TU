#Write a MIPS program that:

# a) creates 2 arrays of 5 integers each. 
# b) Has a procedure that finds the largest element of all 10
# c) Has a procedure that adds elements from each array together and creates a 3rd array (5 elements long) (so C[i]=A[i]+B[i])
# d) Prints the largest element with a message “This is the largest element: “
# e) Prints the vector sum array with a message “This is the vector sum array: “

.data

array1: .space 20
array2: .space 20
array3: .space 20

user1: .asciiz "\nenter first array elements "
user2: .asciiz "\nenter second array elemts "

space: .asciiz " "
largest: .asciiz "\nThis is the largest element: "
sum: .asciiz "\nThis is the vector sum array: "

printarray1: "\narray1 :\n"
printarray2: "\narray2 :\n"

.text
li $t0,0 # array index/address/whatever

li $v0,4
la $a0,user1
syscall

loop1:
	bge $t0,20,nextarray
	li $v0,5
	syscall
	move $t1, $v0
	sw $t1, array1($t0)
 	addi $t0, $t0, 4
	j loop1
nextarray:
	li $v0, 4
	la $a0, user2
	syscall
	
addi $t0, $zero, 0

loop2:
	bge $t0, 20, nowadd
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, array2($t0)	
	addi $t0, $t0, 4
   	j loop2
nowadd:
	jal addition
addi $t0,$zero,0
li $v0,4
la $a0,sum
syscall

sumloop:
	beq $t0,20,largestelement
	li $v0,1
	lw $a0,array3($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	addi $t0,$t0,4
	j sumloop
	
addition:
	addi $t0,$zero,0
loop3:
	bge $t0,20,endadd
	lw $t1,array1($t0)
	lw $t2,array2($t0)
	add $t3,$t1,$t2
	sw $t3,array3($t0)
	addi $t0,$t0,4
	j loop3
endadd:
	jr $ra
		
largestelement:
	jal large
addi $t0,$t0,4
li $v0,4,
la $a0,largest
syscall

largeprint:
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,10
	syscall
large:
	addi $t0,$zero,0
	addi $t1,$zero,0
	lw $t2,array1($t0)
	lw $t3,array2($t0)
loop4:
	bge $t0,20,loop5
	lw $t7,array1($t0)
	addi $t0,$t0,4
	ble $t7,$t2,loop4
	addi $t2,$t7,0
	j loop4
loop5:
	bge $t1,20,finally
	lw $t8,array2($t1)
	addi $t1,$t1,4
	ble $t8,$t3,loop5
	addi $t3,$t8,0
	j loop5
finally:
	bgt $t2,$t3,swap
	jr $ra
swap:
	addi $t3,$t2,0
	jr $ra
	
	