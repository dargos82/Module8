
global miles2kilometers
.text

miles2kilometers:

    #Convert miles to kilometers
    MOV r1, #161
    MUL r0, r0, r1

    MOV r1, #100
    BL __aeabi_idiv

    MOV pc, lr    

.data

#END miles2kilometers
