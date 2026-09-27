	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F560
sub_0800F560: @ 0x0800F560
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r4, [r1, #4]
	ldr r5, [r1, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F5A2
	cmp r2, #0
	beq _0800F596
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl WmMergeFace
	b _0800F5A2
_0800F596:
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4D4C
_0800F5A2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
