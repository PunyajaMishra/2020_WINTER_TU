.data
addition: .asciiz "\nThe matrix addition is  "
multiplication: .asciiz "\nThe matrix multiplication is  "
transpose: .asciiz "\nThe matrix transpose is  "
next: .asciiz "\n"
tab: .asciiz "\t"

matrixA: .word 2,1,9,2
	  .word 7,9,10,10
	  .word 3,4,3,4
	  .word 2,5,4,6
matrixB: .word	8,7,1,2
	  .word 2,7,3,6
	  .word 7,5,6,8
	  .word 9,4,8,9
size: .word 4
.eqv DATA_SIZE 4

.text
main:
la $a0,matrixA #base address of matrix A
la $a1,matrixB #base address of matrix B
lw $a2,size #size


li $v0,10
syscall

matrixSum:
add $t0,$zero,$zero  #i=0
la $t2,0($a0)

sum1:
add $t7,$zero,$zero
slt $t7,$t0,$a2
beq $t7,$zero,end

add $t1,$zero,$zero  #j=0

sum2:
add $t7,$zero,$zero
slt $t7,$t1,$a2
beq $t7,$zero,endline

mul	$t7, $t0, $a2
add	$t7, $t7, $t1				# c = i * n + j
sll	$t7, $t7, 2				# address format

add	$t6, $t7, $t2				# d = `matrix_1`[c]
add	$t5, $t7, $a1				# e = `matrix_2`[c]
add	$a0, $t5, $t6				# print (d + e)	
li	$v0, 1
move      $a1,$a0
syscall
						
addi	$t1, $t1, 1				# j++
li	$v0, 4					# printf("\t")
				
addi	$t1, $t1, 1


endline:
addi	$t0, $t0, 1				# i++
li	$v0, 4					# printf("\n")
la	$a0, next
syscall
	
j	sum1
	
end:	
li	$v0, 4					# printf("\n")
la	$a0, next
syscall

jr	$ra		