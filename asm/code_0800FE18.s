	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FE18
sub_0800FE18: @ 0x0800FE18
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0800FE40
	movs r0, #0
	b _0800FE76
_0800FE40:
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0800FE64
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartEventWarpAnim
	b _0800FE74
_0800FE64:
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartEventWarpAnim
_0800FE74:
	movs r0, #2
_0800FE76:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
