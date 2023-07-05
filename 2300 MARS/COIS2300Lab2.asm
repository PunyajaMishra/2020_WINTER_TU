#Punyaja Mishra
#punyajamishra
#0660001

.data			#data declaration section

out_string: .asciiz "\nHello, World!\n"
.text			#assembly language instruction
main:	#start of code section
	li $v0, 4		#system call code for printing string = 4
	la $a0,out_string #load address of string to be printed into $a0
	syscall #call operating system to perform print performation
	
  li $v0, 10
  syscall