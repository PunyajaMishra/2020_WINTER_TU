.data 
# the next two lines define an array (mdArray as a 2x2 multidimensional array)
mdArray: 	.word 2,5,6  
			.word 3,7,8
			        .word 4,2,7

		
size: .word 3  #dimension of the array (2x2 in this case, note this is only for square matrices)
.eqv DATA_SIZE 4 # number of bytes per element, 4 for ints, 1 for chars, 8 for doubles

.text
main:
la $a0, mdArray # base address
lw $a1, size # size
jal sumDiagonal  #sum of diagonals, in our starting example, this is 9.  
move $a0, $v0 # this is because sumDiagonal will return it's last value in $v0
li $v0, 1
syscall

#and done
li $v0, 10
syscall

sumDiagonal:

li $v0,0 #sum =0
li $t0,0 #t0 as the index

	sumLoop: 
		#The next 4 lines are the bit you need to derive and fill in yourself
		mul $t1,$a1,$t0 #rowindex*no of columns
		add $t1, $t1, $t0
		mul $t1, $t1, 4
		add $t1, $t1, $a0

		lw $t2, ($t1)  #getting element 
		add $v0, $v0, $t2 # sum = sum + mdArray[i][i]
 
		addi $t0, $t0, 1 # i = i+1
		blt $t0, $a1, sumLoop  #if i < size, loop again

jr $ra  #ends sum diagonal
