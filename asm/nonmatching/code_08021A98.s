	.include "macro.inc"

	.syntax unified

	thumb_func_start StartFightBallistaReview
StartFightBallistaReview: @ 0x08021A98
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021ADC @ =0x08B95A64
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021AE0 @ =0x03004690
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
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021ADC: .4byte 0x08B95A64
_08021AE0: .4byte 0x03004690
