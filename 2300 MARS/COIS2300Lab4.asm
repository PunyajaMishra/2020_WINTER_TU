.data

int1: .asciiz "\nEnter the first integer : "
int2: .asciiz "\nEnter the second integer : "
sum: .asciiz "\nThe final sum : " 

.text
main :
li $v0,4
la $a0,int1
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,int2
syscall
li $v0,5
syscall
move $t1,$v0
addi $t3,$t1,2
jal mysum

li $v0,4
la $a0,sum
syscall
li $v0,1
move $a0,$t6
syscall


li $v0,10
syscall

mysum: 
bne $t0,$t3,ms_recurse
move $t4,$t0


jr $ra

ms_recurse:
sub $sp,$sp,8
sw $ra,0($sp)
sw $t0,4($sp)
add $t0,$t0,1
jal mysum
addi $sp,$sp,8
lw $ra,0($sp)
lw $t0,4($sp)
add $t6,$t6,$t0
jr $ra




