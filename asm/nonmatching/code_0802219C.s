	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802219C
sub_0802219C: @ 0x0802219C
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _080221F8
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ResetTextFont
	ldr r0, _080221F0 @ =0x08B95A40
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080221F4 @ =0x03004690
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
	b _080221FA
	.align 2, 0
_080221F0: .4byte 0x08B95A40
_080221F4: .4byte 0x03004690
_080221F8:
	movs r0, #0
_080221FA:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
