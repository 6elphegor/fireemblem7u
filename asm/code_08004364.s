	.include "macro.inc"

	.syntax unified

	thumb_func_start DecodeStringRam
DecodeStringRam: @ 0x08004364
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08004384 @ =0x03003940
	ldr r1, [r7, #4]
	ldr r2, [r0]
	ldr r0, [r7]
	bl _call_via_r2
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004384: .4byte 0x03003940
