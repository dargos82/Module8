#Program Name: getKPH.s
#Author: David Blossom
#Date: 20 July 2024
#Purpose: Calculate kilometers per hour from miles and hours
#Input: fahrenheitValue - integer value in Fahrenheit 
#Output: output1 - string with conversion to Celsius

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for input
    LDR r0, =prompt1
    BL printF

    #read user input
    LDR r0, =milesFormat
    LDR r1, =milesValue
    BL scanf

    #load miles integer value into r0
    LDR r0, =milesValue
    LDR r0, [r0]

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #input prompt
    prompt1:        .asciz  "Enter an integer for miles: \n"

    #format for variable
    milesFormat:    .asciz  "%d"

    #variable to hold integer value, initialized to 0
    milesValue:     .word   0




