	.include "macro.inc"

	.syntax unified

	thumb_func_start MapFloodCoreStepRam
MapFloodCoreStepRam: @ 0x080043E0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08004404 @ =0x03004150
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r0]
	ldr r0, [r7]
	bl _call_via_r3
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004404: .4byte 0x03004150
