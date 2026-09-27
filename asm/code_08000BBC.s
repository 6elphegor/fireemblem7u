	.include "macro.inc"

	.syntax unified

	thumb_func_start SetIrqFunc
SetIrqFunc: @ 0x08000BBC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08000BDC @ =0x030028E0
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	str r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BDC: .4byte 0x030028E0
