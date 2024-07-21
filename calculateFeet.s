#Program Name: calculateFeet.s
#Author: David Blossom
#Date: 21 July 2024
#Purpose: Calculate feet from inches using branching
#Input: inchesValue - integer value for inches
#Output: output1 - string with feet calculation

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt for inches input
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =inchesFormat
    LDR r1, =inchesValue
    BL scanf

    #load inches integer value into r0
    LDR r0, =inchesValue
    LDR r0, [r0]                //r0 has inches value

    #calculate feet
    BL inchesToFeet             //r0 now has feet value
    MOV r4, r0                  //r4 = feet value

    #calculate decimal
    MOV r2, #12                 //r2 = 12
    MUL r0, r0, r2              //r0 = feet value * 12
    LDR r1, =inchesValue        //r1 = initial inches value
    LDR r1, [r1]
    SUB r0, r1, r0              //r0 = intial inches - feet in inches
    MOV r1, #12                 //r1 = 12
    MOV r3, #10                 //r3 = 10
    MUL r0, r0, r3              //r0 = remaining inches * 10
    BL __aeabi_idiv             //r0 = (remaining inches * 10)  / 12

    #print output
    MOV r1, r4                  //move feet value from r4 to r1 for printing
    MOV r2, r0                  //move decimal value from r0 to r2 for printing
    LDR r0, =output1
    BL printf
    
    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #input prompt 1
    prompt1:        .asciz  "Enter an integer for inches: "

    #format for variable
    inchesFormat:    .asciz  "%d"

    #variable to hold miles value, initialized to 0
    inchesValue:     .word   0

    #output string
    output1:        .asciz  "You entered approximately %d.%d feet\n"




