
.global miles2kilometers
.global CToF
.global InchesToFt

.text
miles2kilometers:

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

#END miles2kilometers

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
