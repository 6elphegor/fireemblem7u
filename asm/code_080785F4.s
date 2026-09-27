	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080785F4
sub_080785F4: @ 0x080785F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r3, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	ldrb r2, [r2, #8]
	ldrb r0, [r4, #0x18]
	cmp r2, r0
	bne _08078648
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r3, r0
	bne _08078648
	cmp r5, #0x15
	bne _08078632
	ldr r0, _08078644 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x71
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08078648
_08078632:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	movs r0, #1
	b _0807864A
	.align 2, 0
_08078644: .4byte 0x03004690
_08078648:
	movs r0, #0
_0807864A:
	pop {r4, r5}
	pop {r1}
	bx r1
