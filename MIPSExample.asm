.data
prompt: .asciiz "Enter an integer to print: "
output: .asciiz "The number you entered is "
.text
main:
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $s0,$v0

li $v0,4
la $a0,output
syscall

li $v0,1
move $a0,$s0
syscall

li $v0,10
syscall