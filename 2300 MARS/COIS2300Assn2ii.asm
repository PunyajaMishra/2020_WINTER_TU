# punyajamishra
# 0660001
# array of floating point numbers, find largest, smallest, range
.data
largest: .asciiz "\n The largest number is : "
smallest: .asciiz "\nThe smallest number is : "
rangee: .asciiz "\n The range is: "

.align 4
array: .float 65,61,32,45,21,67,22,14,87,64,31,88,1,10,23,61,76,78,71,20,30,42,3

.text
########################################### minimum ##################################################
main:
la $t0, array
addi $t1,,$t0,92  # 23 * 4 = 92. 23 integers take in total of 92 bytes

lw $t2,0($t0)  #temp minimum
move $s1,$t2

findSmallestFloat:
beq $t0,$t1, exit_loop1 #at the end of array

lw $s0,0($t0) #loading the value of array element at the current index
addi $t0,$t0,4 #incrmeenting to next index


slt $s2,$s0,$t2  #checking if array[index]<temp
bne $s2,$zero,min

j findSmallestFloat

min:
move $t2,$s0  #swap
move $t6,$t2
j findSmallestFloat

########################################### maximum ###############################################
main2:
la $t0, array
addi $t1,,$t0,92	 # 23 * 4 = 92. 23 integers take in total of 92 bytes

lw $t2,0($t0)	 #temp maximum
move $s1,$t2

findLargestFloat:
beq $t0,$t1, exit_loop	#at the end of array

lw $s0,0($t0) #loading the value of array element at the current index
addi $t0,$t0,4	#incrmeenting to next index


sgt $s2,$s0,$t2
bne $s2,$zero,max

j findLargestFloat

max:
move $t2,$s0	#swap
move $t5,$t2
j findLargestFloat

############################### printing and calculating range and printing ###########################################################
exit_loop1:
j main2

exit_loop:
li $v0,4
la $a0,largest
syscall
li $v0,1
move $a0,$t5 
syscall

li $v0,4
la $a0,smallest
syscall
li $v0,1
move $a0,$t6
syscall

j rangeFloat

rangeFloat:
sub $s3,$t5,$t6
li $v0,4
la $a0,rangee
syscall
li $v0,1
move $a0,$s3
syscall


  
li $v0,10
syscall

