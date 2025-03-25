.data 
prompt: .asciiz "\nEnter a number: "
output: .asciiz "\nThe number you entered: "
output2: .asciiz "\nAfter it is multiplied: "
output3: .asciiz "\nThe bits [4-1] are: "
space: .asciiz " "
.text

main:
while:
li $v0,4 #output prompt for user
la $a0,prompt
syscall

li $v0,5 #input the number and save it to $t1
syscall
move $t1,$v0

beqz $t1, exit #loop will end if user inputs is 0

sll $t0, $t1, 3 #multiply by 8 using shift left logical (2^3 = 8)

li $v0,4 #print the output label
la $a0,output
syscall

li $v0,1 #output the number that was entered
move $a0,$t1 #may also use lw $a0,$t1
syscall

li $v0,4 #print output2 label
la $a0,output2
syscall

li $v0,1 #output the number mutliplied by 8
move $a0,$t0
syscall

li $v0,4 #print output3 label
la $a0,output3
syscall

li $t3,4 #loop counter / index

move $t4,$t1 #copy contents
sll $t4,$t4,27 #shifts to the 4th bit
bitLoop:
rol $t4,$t4,1 #rotate to the next bit
andi $a0,$t4,1 #turns to binary

li $v0,1 #print only one bit
syscall

li $v0,4 #output space bewtween each number
la $a0,space
syscall

sub $t3,$t3,1 #decrements the loop by 1
bne $t3,$zero,bitLoop #when the index is 0; return back to loop

j while #continues loop

exit: #end of program

li $v0,10 #exit program
syscall