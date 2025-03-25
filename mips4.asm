.data
prompt: .asciiz "\n Enter an integer:"
msg1: .asciiz "\n Number representation in binary is:"
msg2: .asciiz "\n Number representation in hexadecimal is:"
table: .asciiz "0123456789ABCDEF"
.text

main:
 li $t3, 32
# Printing prompt message to read an integer
li $v0, 4 # system call code for print string
la $a0, prompt # loads address of prompt into $a0
syscall # print the prompt message
# Reading the integer. Read integer is stored $v0
li $v0, 5 # system call code for read integer
syscall
move $t0, $v0
# Displaying the entered number in binary
# Printing msg1 to display binary number
li $v0, 4 # system call code for print string
la $a0, msg1 # loads address of prompt into $a0
syscall # print the prompt message
# Initializing loop counter $t3
li $t3, 32

loop:
 rol $t0, $t0, 1
 andi $a0,$t0, 1
# Print the integer result in a0
li $v0, 1 # Load the system call number
syscall

sub $t3, $t3, 1
 bne $t3, $zero, loop
 
# Printing msg2 to display hexadecimal number
li $v0, 4 # system call code for print string
la $a0, msg2 # loads address of prompt into $a0
syscall # print the prompt message
# Initializing loop counter $t3
li $t3, 8

loop2:
 rol $t0, $t0, 4
 andi $a0,$t0, 15
# Converting number into in $a0 to hex character
la $t1, table
addu $t1, $t1, $a0
 lb $t1, 0($t1)
move $a0, $t1
# Print the character result in a0
li $v0, 11 # Load the system call number
syscall

sub $t3, $t3, 1
bne $t3, $zero, loop2
# Return to operating system
li $v0, 10 # Load the system call number.
syscall # Return.