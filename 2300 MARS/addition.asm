.text
main: #start execution
li $t1,1 #load 1 in $t1
#li $t2,2

 li $v0,5
 syscall
 move $t2,$v0
  
add $t0,$t1,$t2 #compute sum of $t1 and $t2 and load it in $t0

li $v0,1
move $a0,$t0
syscall

li $v0,10 #syscall code 10 is for exit
syscall #make syscall