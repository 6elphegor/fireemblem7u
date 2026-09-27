	.include "macro.inc"

	.syntax unified

	thumb_func_start AiUnitWithCharIdExists
AiUnitWithCharIdExists: @ 0x0803707C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_08037084:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080370B8
	ldr r0, [r1]
	cmp r0, #0
	beq _080370B8
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080370B8
	ldr r1, [r1, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080370AA
_080370A6:
	movs r0, #1
	b _080370C0
_080370AA:
	ldr r0, _080370B4 @ =0x00010005
	ands r1, r0
	cmp r1, #0
	bne _080370BE
	b _080370A6
	.align 2, 0
_080370B4: .4byte 0x00010005
_080370B8:
	adds r4, #1
	cmp r4, #0xbf
	ble _08037084
_080370BE:
	movs r0, #0
_080370C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
