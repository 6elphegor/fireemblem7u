	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037744
sub_08037744: @ 0x08037744
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08037774 @ =0x030013B8
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl sub_08035838
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080377D0
	ldr r0, _08037778 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037784
	ldr r1, _0803777C @ =0x08B989F0
	ldr r0, _08037780 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x42
	b _0803778C
	.align 2, 0
_08037774: .4byte 0x030013B8
_08037778: .4byte 0x030013B4
_0803777C: .4byte 0x08B989F0
_08037780: .4byte 0x03004690
_08037784:
	ldr r1, _080377A4 @ =0x08B989E4
	ldr r0, _080377A8 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x44
_0803778C:
	ldr r1, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r5, #0
	beq _080377CC
	lsls r0, r4, #4
	adds r0, r0, r1
	ldr r2, _080377AC @ =0x030013B0
	b _080377BA
	.align 2, 0
_080377A4: .4byte 0x08B989E4
_080377A8: .4byte 0x03004690
_080377AC: .4byte 0x030013B0
_080377B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r1
_080377BA:
	ldrb r3, [r0]
	cmp r3, #0x1b
	bne _080377B0
	ldrb r0, [r0, #3]
	cmp r0, r5
	bne _080377B0
	adds r0, r4, #1
	strb r0, [r6]
	b _080377D8
_080377CC:
	strb r5, [r6]
	b _080377D6
_080377D0:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_080377D6:
	ldr r2, _080377E4 @ =0x030013B0
_080377D8:
	movs r0, #0
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080377E4: .4byte 0x030013B0
