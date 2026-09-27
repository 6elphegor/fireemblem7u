	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNextAvailableBlueUnitId
GetNextAvailableBlueUnitId: @ 0x0800CFAC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x3f
	bgt _0800CFDA
_0800CFB4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800CFD4
	ldr r0, [r1]
	cmp r0, #0
	beq _0800CFD4
	ldr r0, [r1, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800CFD4
	adds r0, r4, #0
	b _0800CFDC
_0800CFD4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800CFB4
_0800CFDA:
	movs r0, #0
_0800CFDC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
