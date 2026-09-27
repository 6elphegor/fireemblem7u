	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_AreOtherCommandsAvailable
ItemMenu_AreOtherCommandsAvailable: @ 0x080236EC
	push {r4, r5, lr}
	ldr r5, _08023718 @ =0x03004690
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802371C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802371C
	movs r0, #1
	b _0802371E
	.align 2, 0
_08023718: .4byte 0x03004690
_0802371C:
	movs r0, #3
_0802371E:
	pop {r4, r5}
	pop {r1}
	bx r1
