	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079F1C
sub_08079F1C: @ 0x08079F1C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08079F24:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08079F3E
	ldr r0, [r0]
	cmp r0, #0
	beq _08079F3E
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _08079F3E
	movs r0, #1
	b _08079F46
_08079F3E:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079F24
	movs r0, #0
_08079F46:
	pop {r4, r5}
	pop {r1}
	bx r1
