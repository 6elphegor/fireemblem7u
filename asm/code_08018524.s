	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitKeyItemSlotForTerrain
GetUnitKeyItemSlotForTerrain: @ 0x08018524
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801854A
	adds r0, r4, #0
	movs r1, #0x6a
	bl GetUnitItemSlot
	cmp r0, #0
	bge _08018572
_0801854A:
	cmp r5, #0x1e
	beq _08018568
	cmp r5, #0x21
	bne _0801856A
	adds r0, r4, #0
	movs r1, #0x68
	bl GetUnitItemSlot
	cmp r0, #0
	bge _08018572
	adds r0, r4, #0
	movs r1, #0x78
	bl GetUnitItemSlot
	b _08018572
_08018568:
	movs r6, #0x69
_0801856A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetUnitItemSlot
_08018572:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
