#Program Name: calculateKPH.s
#Author: David Blossom
#Date: 21 July 2024
#Purpose: Calculate kilometers per hour from miles and hours
#Input: milesValue - integer value for miles; hoursValue - integer value for hours
#Output: output1 - string with kph calculation

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
    LDR r0, =milesFormat
    LDR r1, =milesValue
    BL scanf

    #load miles integer value into r9
    LDR r9, =milesValue
    LDR r9, [r9]                //r9 has miles value

    #prompt for hours input
    LDR r0, =prompt2
    BL printf
    
    #read user input
    LDR r0, =hoursFormat
    LDR r1, =hoursValue
    BL scanf
    
    #load hours integer value into r4
    LDR r4, =hoursValue         
    LDR r4, [r4]                //r4 has hours value    

    #calculate KPH
    BL kph                        //r0 now has KPH value

    #print output
    MOV r1, r0                  //move KPH value from r0 to r1 for printing
    LDR r0, =output1
    BL printf
    
    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #input prompt 1
    prompt1:        .asciz  "Enter an integer for miles: "

    #format for variable
    milesFormat:    .asciz  "%d"

    #variable to hold miles value, initialized to 0
    milesValue:     .word   0

    #input prompt 2
    prompt2:        .asciz  "\nEnter an integer for hours: "

    #format for variable
    hoursFormat:    .asciz  "%d"

    #variable to hold hours integer, initialized to 0
    hoursValue:     .word   0

    #output string
    output1:        .asciz  "You entered %d kilometers per hour\n"




