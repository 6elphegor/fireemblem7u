	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTextPart
ClearTextPart: @ 0x08005518
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _08005554 @ =0x02028D70
	ldr r4, [r3]
	ldrb r5, [r0, #4]
	ldrb r6, [r0, #6]
	adds r3, r5, #0
	muls r3, r6, r3
	ldrh r0, [r0]
	adds r3, r0, r3
	adds r3, r3, r1
	lsls r3, r3, #6
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08005558 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005554: .4byte 0x02028D70
_08005558: .4byte 0x001FFFFF
