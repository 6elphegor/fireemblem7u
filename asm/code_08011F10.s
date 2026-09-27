	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011F10
sub_08011F10: @ 0x08011F10
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #1
	bl StartEventWarpAnim
	add r1, sp, #4
	adds r0, r5, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #4
	adds r1, r2, #0
	ldr r0, [r4, #0x2c]
	strb r0, [r1, #6]
	strb r0, [r2, #4]
	ldr r0, [r4, #0x30]
	strb r0, [r1, #7]
	strb r0, [r2, #5]
	adds r0, r1, #0
	bl LoadUnit
	adds r5, #0x10
	str r5, [r4, #0x54]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
