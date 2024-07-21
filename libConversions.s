
.global miles2Kilometers
.global kph
.global cToF
.global inchesToFeet

.text
miles2Kilometers:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #Convert miles to kilometers
    MOV r1, #161                //the actual conversion factor for miles to km is a decimal
                                //cannot use decimal as an immediate, therefore use a factor of 
                                //100 to convert decimal to an integer 
    MUL r0, r0, r1

    MOV r1, #100
    BL __aeabi_idiv

    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr    

.data

#END miles2Kilometers

.text
kph:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp]

    #Calculate kilometers per hour
    MOV r0, r9                  //move miles in r9 to r0 for use in division
    BL miles2Kilometers         //r0 has kilometers
    MOV r1, r4                  //move hours in r4 to r1 for use in division
    BL __aeabi_idiv             //r0 has calculated kph 

    #pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

#END kph

.text
cToF:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #Convert Celsius to Fahrenheit (C * (9/5)) + 32)

    #load immediate value from conversion formula into r1
    MOV r1, #9

    #multiply Celsius value by 9
    MUL r0, r0, r1              //r0 has result

    #load immediate value from conversion formula into r1
    MOV r1, #5

    #perform division per conversion formula
    BL __aeabi_idiv             //r0 has quotient

    #load immediate value from conversion formula into r1
    MOV r1, #32

    #perform addition per conversion formula; r0 has the converted value
    ADD r0, r0, r1              //r0 has sum 
    
    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

#END cToF

.text
inchesToFeet:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #Convert inches to feet
    MOV r1, #12
    BL __aeabi_idiv
    
    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

#END inchesToFeet
