
.global miles2Kilometers
.global kph
.global CToF
.global InchesToFt

.text
miles2Kilometers:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #Convert miles to kilometers
    MOV r1, #161
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
CToF:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #Convert Celsius to Fahrenheit
    
    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

#END CToF

.text
InchesToFt:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #Convert inches to feet
    
    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

#END InchesToFt
