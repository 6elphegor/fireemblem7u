	.include "macro.inc"

	.syntax unified

	thumb_func_start StartFightItemReview
StartFightItemReview: @ 0x08021AE4
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021B2C @ =0x08B95A88
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021B30 @ =0x03004690
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
	bl sub_080790B8
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021B2C: .4byte 0x08B95A88
_08021B30: .4byte 0x03004690
