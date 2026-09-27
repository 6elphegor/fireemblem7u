	.include "macro.inc"

	.syntax unified

	thumb_func_start DoorCommandUsability
DoorCommandUsability: @ 0x08022C58
	push {r4, lr}
	ldr r4, _08022C78 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022C74
	adds r0, r2, #0
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08022C7C
_08022C74:
	movs r0, #3
	b _08022C92
	.align 2, 0
_08022C78: .4byte 0x03004690
_08022C7C:
	ldr r0, [r4]
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	movs r1, #3
	cmp r0, #0
	beq _08022C90
	movs r1, #1
_08022C90:
	adds r0, r1, #0
_08022C92:
	pop {r4}
	pop {r1}
	bx r1
