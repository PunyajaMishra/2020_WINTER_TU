#Punyaja Mishra
#0660001
#Assignment 1 I:Program 2

.data
input: .asciiz "\nEnter a negative number (I trust you'll put between 0 and -5) : "
error: .asciiz "Error! Not negative! "
error2: .asciiz "Error! Not in range! "
Fac: .asciiz "\nThe factorial of the square of the number you input is : "

.text
errorloop:
li $v0,4
la $a0,input
syscall
li $v0,5
syscall
move $t0,$v0

blt $t0,-5,OUT
bgt $t0,0,OUTT
ble $t0,0,CORR
j OUT
OUT:
li $v0,4
la $a0,error2
syscall
j errorloop
OUTT:
li $v0,4
la $a0,error
syscall
j errorloop
CORR:
b endit
endit:

mul $t1,$t0,$t0

li $t2,1

Factorial:
bgt $t1,$zero,continue
b end

continue:
mul $t3,$t2,$t1
move $t2,$t3 
sub $t1,$t1,1
j Factorial

end:
li $v0,4
la $a0,Fac
syscall
li $v0,1
move $a0,$t2
syscall
