	.include "macro.inc"

	.syntax unified

	thumb_func_start EventIsPidBlueForDisable
EventIsPidBlueForDisable: @ 0x0800DE98
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0800DEA0:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800DEBA
	ldr r0, [r0]
	cmp r0, #0
	beq _0800DEBA
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0800DEBA
	movs r0, #1
	b _0800DEC2
_0800DEBA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800DEA0
	movs r0, #0
_0800DEC2:
	pop {r4, r5}
	pop {r1}
	bx r1
