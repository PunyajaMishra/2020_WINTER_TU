.text

li $t5,0
li $t6,5

loop :
beq $t6,$t5,endloop

addi $t5,$t5,1
li $v0,5
 syscall
 move $t0,$v0
 
 li $v0,5
 syscall
 move $t1,$v0
 
bgt $t0, $t1, t0_bigger 
move $t2, $t1 # otherwise, copy $t1 into $t2. 
b endif # and then branch to endif 

t0_bigger: 
move $t2, $t0 # copy $t0 into $t2 
b endif

 
endif: li $v0,1
 move $a0,$t2
 syscall
 j loop

  
 endloop:
 li $v0,10
 syscall
 
