	.include "macro.inc"

	.syntax unified

	thumb_func_start IsPidBlue
IsPidBlue: @ 0x08079D40
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08079D48:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08079D6C
	ldr r2, [r0]
	cmp r2, #0
	beq _08079D6C
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079D6C
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _08079D6C
	movs r0, #1
	b _08079D74
_08079D6C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079D48
	movs r0, #0
_08079D74:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
