	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyBallistaUpdates
BattleApplyBallistaUpdates: @ 0x08029D38
	push {r4, r5, lr}
	ldr r1, _08029D64 @ =0x0203A3D8
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08029D5C
	ldr r4, _08029D68 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemUses
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	strb r5, [r0, #6]
_08029D5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029D64: .4byte 0x0203A3D8
_08029D68: .4byte 0x0203A3F0
