	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCD_Warp
EventCD_Warp: @ 0x0800FD90
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FDB0
	ldr r5, _0800FDAC @ =0x0000FFFF
	ands r5, r2
	b _0800FDB4
	.align 2, 0
_0800FDAC: .4byte 0x0000FFFF
_0800FDB0:
	movs r5, #1
	rsbs r5, r5, #0
_0800FDB4:
	ldr r3, [r4, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800FDC8
	adds r6, r1, #0
_0800FDC8:
	ldr r3, [r3, #8]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0800FDE0
	movs r0, #0
	b _0800FE10
_0800FDE0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FDFC
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartEventWarpAnim
	b _0800FE0E
_0800FDFC:
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartEventWarpAnim
_0800FE0E:
	movs r0, #2
_0800FE10:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
