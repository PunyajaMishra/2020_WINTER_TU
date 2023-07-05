.data
 newline: .asciiz "\n"
 before: .asciiz "\nBefore calling procedure"
 during: .asciiz "\nduring procedure"
 after: .asciiz "\nAfter calling procedure"
 int1: .asciiz "\n Int 1: "
 int2: .asciiz "\n Int 2: "
 sum: .asciiz "\n Summ  : "
 
 .text
 
 main:
 li $s0,10
 li $s1,20
 
 add $s2,$s0,$s1
 li $v0,4
 la $a0,before
 syscall
  li $v0,4
 la $a0,int1
 syscall
  li $v0,1
 move $a0,$s0
 syscall
  li $v0,4
 la $a0,int2
 syscall
  li $v0,1
 move $a0,$s1
 syscall
  li $v0,4
 la $a0,sum
 syscall
li $v0,1
move $a0,$s2
syscall
 
 jal increasestack
 
 li $v0, 4
 la $a0, newline
 syscall
 #print
 
  li $v0,4
 la $a0,after
 syscall
  li $v0,4
 la $a0,int1
 syscall
  li $v0,1
 move $a0,$s0
 syscall
  li $v0,4
 la $a0,int2
 syscall
  li $v0,1
 move $a0,$s1
 syscall
  li $v0,4
 la $a0,sum
 syscall
li $v0,1
move $a0,$s2
syscall
   
 #end of program
 li $v0, 10
 syscall
 
increasestack: 
addi $sp, $sp, -4
sw $s0, 0($sp)
addi $sp,$sp,-4
sw $s1,0($sp)

addi $s0, $s0, 30 #this is the only line that changes s0
addi $s1,$s1, 30
add $s2, $s1, $s0
  
 li $v0,4
 la $a0,during
 syscall
  li $v0,4
 la $a0,int1
 syscall
  li $v0,1
 move $a0,$s0
 syscall
  li $v0,4
 la $a0,int2
 syscall
  li $v0,1
 move $a0,$s1
 syscall
  li $v0,4
 la $a0,sum
 syscall
li $v0,1
move $a0,$s2
syscall

 #this restores the previous state in memory
 lw $s1, 0($sp)
 addi $sp, $sp, 4 
 lw $s0,0($sp)
 addi $sp,$sp,4
 
 jr $ra #jumps back to where you were before
