.arm // We are using arm right ?
.text
.global main
 
.macro plot_pixel x, y, color // Plotting out gorgeous pixels
    mov r0, #0x6000000        // Address of VRAM
    mov r1, \color            // Store colour param into r1
    ldr r2, =(\x+\y*240)*2 
    strh r1, [r0, r2]
.endm
 
main:
    mov r0, #0x4000000
    mov r1, #0x400
    add r1, r1, #3
    str r1, [r0]
 
    plot_pixel 115, 80, #0x1F
    plot_pixel 120, 80, #0x03E0
    plot_pixel 125, 80, #0x7C00
 
infin:
    b infin