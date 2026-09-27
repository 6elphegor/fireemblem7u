	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035294
sub_08035294: @ 0x08035294
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r5, _080352EC @ =0x0203A85C
	ldr r0, _080352F0 @ =0x0202BD48
	ldrb r0, [r0]
	strb r0, [r5, #0xc]
	movs r0, #2
	strb r0, [r5, #0x11]
	ldr r4, _080352F4 @ =0x0203A97C
	ldrb r0, [r4, #6]
	strb r0, [r5, #0xd]
	ldr r6, _080352F8 @ =0x03004690
	ldr r1, [r6]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r6]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080352D2
	ldrb r0, [r4, #8]
	ldrb r1, [r4, #9]
	bl GetTrapAt
	ldrb r1, [r0]
	strb r1, [r5, #0x13]
	ldrb r1, [r0, #1]
	strb r1, [r5, #0x14]
	ldrb r0, [r0, #3]
	strb r0, [r5, #0x15]
_080352D2:
	movs r1, #7
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080352FC
	ldr r0, [r6]
	ldrb r1, [r4, #7]
	bl EquipUnitItemSlot
	movs r0, #0
	b _080352FE
	.align 2, 0
_080352EC: .4byte 0x0203A85C
_080352F0: .4byte 0x0202BD48
_080352F4: .4byte 0x0203A97C
_080352F8: .4byte 0x03004690
_080352FC:
	movs r0, #8
_080352FE:
	strb r0, [r5, #0x12]
	adds r0, r7, #0
	bl DoAction
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
