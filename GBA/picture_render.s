.arm
.text
.global main

main:

    mov r0, #0x4000000  // Routine setup
    mov r1, #0x400      // 0x403 is BG 2 enable, and vid mode 3.
    add r1, r1 , #3
    strh r1, [r0]       // The memory I/O value we are setting is actually 16bits, so be careful with 32.
    
    mov r0, #0x6000000  // Adress of VRAM
    ldr r1, =pic        // Putting the adress of pic laber into R1 with ldr
    mov r2, #0x960      // the amount of 32 BYTES writes to fill the screem

loop1:
// Will start with the address in r1, it will load each listed registerwith 32bits from memory, incrementing the address by 4 each time.
//  The final address used +4 will be written back into r1

    ldmia r1!, { r3,r4,r5,r6,r7,r8,r9,r10 }
    stmia r0!, { r3,r4,r5,r6,r7,r8,r9,r10 }

    subs r2, r2, #1 // Subtraction setting the flags
    bne loop1       // Will loop if r2 was not zero

infin:

    b infin         // Infinite loop

.ltorg
pic:

    .incbin "test.bin"