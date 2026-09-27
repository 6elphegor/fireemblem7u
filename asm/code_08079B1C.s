	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079B1C
sub_08079B1C: @ 0x08079B1C
	push {r4, lr}
	movs r4, #1
_08079B20:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08079B4E
	ldr r3, [r2]
	cmp r3, #0
	beq _08079B4E
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079B4E
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _08079B4E
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #0x13
	ble _08079B54
	movs r0, #1
	b _08079B56
_08079B4E:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079B20
_08079B54:
	movs r0, #0
_08079B56:
	pop {r4}
	pop {r1}
	bx r1
