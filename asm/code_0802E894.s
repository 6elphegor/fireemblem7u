	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupplyUnit
GetSupplyUnit: @ 0x0802E894
	push {r4, lr}
	movs r4, #1
_0802E898:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802E8C0
	ldr r1, [r2]
	cmp r1, #0
	beq _0802E8C0
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E8C0
	adds r0, r2, #0
	b _0802E8C8
_0802E8C0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0802E898
	movs r0, #0
_0802E8C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
