	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079AB4
sub_08079AB4: @ 0x08079AB4
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08079ABA:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08079AD8
	ldr r0, [r1]
	cmp r0, #0
	beq _08079AD8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079AD8
	adds r5, #1
_08079AD8:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079ABA
	cmp r5, #3
	ble _08079AE6
	movs r0, #0
	b _08079AE8
_08079AE6:
	movs r0, #1
_08079AE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
