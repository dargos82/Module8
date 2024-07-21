#Program Name: calculateCToF.s
#Author: David Blossom
#Date: 21 July 2024
#Purpose: Convert Celsius to Fahrenheit using branching
#Input: celsiusValue - integer value for Celsius
#Output: output1 - string with Fahrenheit calculation

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt for miles input
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =celsiusFormat
    LDR r1, =celsiusValue
    BL scanf

    #load Celsius integer value into r0
    LDR r0, =celsiusValue
    LDR r0, [r0]                //r0 has Celsius integer

    #convert to Fahrenheit
    BL cToF                     //r0 now has Fahrenheit

    #print output
    MOV r1, r0                  //move Fahrenheit integer from r0 to r1 for printing
    LDR r0, =output1
    BL printf
    
    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #input prompt 1
    prompt1:        .asciz  "Enter an integer for Celsius: "

    #format for variable
    celsiusFormat:    .asciz  "%d"

    #variable to hold miles value, initialized to 0
    celsiusValue:     .word   0

    #output string
    output1:        .asciz  "The temperature in Fahrenheit is: %d\n"




