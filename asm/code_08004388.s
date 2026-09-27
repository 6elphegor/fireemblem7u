	.include "macro.inc"

	.syntax unified

	thumb_func_start PutOamHiRam
PutOamHiRam: @ 0x08004388
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080043B0 @ =0x03002920
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080043B0: .4byte 0x03002920
