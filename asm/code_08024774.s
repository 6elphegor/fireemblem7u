	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024774
sub_08024774: @ 0x08024774
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080247BC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080247B4
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080247A2
	cmp r1, #3
	bne _080247B4
_080247A2:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080247B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080247BC: .4byte 0x02033E40
