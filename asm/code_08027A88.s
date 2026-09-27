	.include "macro.inc"

	.syntax unified

	thumb_func_start RepairSelectOnSelect
RepairSelectOnSelect: @ 0x08027A88
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	bl ResetTextFont
	ldr r5, _08027AE0 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r5, #0xd]
	ldr r0, _08027AE4 @ =0x08B958FC
	bl StartMenu
	adds r4, r0, #0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0xb
	bl StartEquipInfoWindow
	ldrb r0, [r5, #0xd]
	bl GetUnit
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027AE0: .4byte 0x0203A85C
_08027AE4: .4byte 0x08B958FC
