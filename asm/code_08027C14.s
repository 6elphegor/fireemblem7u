	.include "macro.inc"

	.syntax unified

	thumb_func_start RepairMenuItemSelect
RepairMenuItemSelect: @ 0x08027C14
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08027C9A
	movs r6, #0
	ldr r0, _08027C54 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0xc1
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08027C5C
	ldr r6, _08027C58 @ =0x0000074C
	b _08027C8E
	.align 2, 0
_08027C54: .4byte 0x0203A85C
_08027C58: .4byte 0x0000074C
_08027C5C:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08027C74
	ldr r6, _08027C70 @ =0x00000741
	b _08027C8E
	.align 2, 0
_08027C70: .4byte 0x00000741
_08027C74:
	adds r0, r5, #0
	bl GetItemUses
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemMaxUses
	cmp r4, r0
	bne _08027C8A
	movs r6, #0xe8
	lsls r6, r6, #3
_08027C8A:
	cmp r6, #0
	beq _08027C96
_08027C8E:
	adds r0, r7, #0
	adds r1, r6, #0
	bl MenuFrozenHelpBox
_08027C96:
	movs r0, #8
	b _08027CAE
_08027C9A:
	ldr r1, _08027CB4 @ =0x0203A85C
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x15]
	ldr r0, _08027CB8 @ =0x03004690
	ldr r0, [r0]
	bl SetStaffUseAction
	movs r0, #0x37
_08027CAE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08027CB4: .4byte 0x0203A85C
_08027CB8: .4byte 0x03004690
