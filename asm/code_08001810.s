	.include "macro.inc"

	.syntax unified

	thumb_func_start TmFill
TmFill: @ 0x08001810
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	lsls r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, _0800183C @ =0x01000200
	ldr r1, [r7]
	bl CpuFastSet
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800183C: .4byte 0x01000200
