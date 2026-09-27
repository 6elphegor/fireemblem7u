	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022404
sub_08022404: @ 0x08022404
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080223EC
	adds r0, r4, #0
	bl MenuCommand_SelectNo
	ldr r0, _08022454 @ =0x08B95A40
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022458 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022454: .4byte 0x08B95A40
_08022458: .4byte 0x03004690
