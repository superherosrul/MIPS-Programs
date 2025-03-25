.data
PRODUCTS: .space 32 #space for 8 integers #sample number
prompt: .asciiz "\nEnter the first number: "
secPrompt: .asciiz "Enter the second number: "
outputProductAnswers: .asciiz "\nThe answers are: "
newLine: .asciiz "\n"
.text
main:

while: #begin the while loop
li $v0,4 #output the first prompt for user
la $a0,prompt
syscall

li $v0,5 #input the number and move it to $t0
syscall
move $t1,$v0

li $v0,4 #output the second prompt for user
la $a0,secPrompt
syscall

li $v0,5 #input the number and move it to $t1
syscall
move $t2,$v0

beq $t1,0,endwhile #if the first number = 0, loop ends
beq $t2,0,endwhile #if the second number = 0, loop ends

addi $t0, $zero, 0 #index

mulo $s0,$t1,$t2 #multiplication

sw $s0, PRODUCTS($t0) #store integers in the array
addi $t0,$t0,4
mulo $s1,$t1,$t2 #multiplication
sw $s1, PRODUCTS($t0)
addi $t0,$t0,4
sw $s2, PRODUCTS($t0)
addi $t0,$t0,4
sw $s3, PRODUCTS($t0)
addi $t0,$t0,4
sw $s4, PRODUCTS($t0)
addi $t0,$t0,4
sw $s5, PRODUCTS($t0)
addi $t0,$t0,4
sw $s6, PRODUCTS($t0)
addi $t0,$t0,4
sw $s7, PRODUCTS($t0)

j while #continue while

endwhile: #to end the loop

li $v0,4 #print Product prompt
la $a0,outputProductAnswers
syscall

addi $t0,$zero,0
printArray: #loop to print the values int the array
beq $t0,32,endPrintArray

lw $t6, PRODUCTS($t0) #retrieve the values

addi $t0,$t0,4 #index++

li $v0,1 #output the number of the products
addi $a0,$t6,0 #could also use lw $a0,$t1
syscall

li $v0,4 #prints number to the next Line
la $a0,newLine
syscall

j printArray #continue loop
endPrintArray: #end of the print loop

li $v0,10 #exit program
syscall
