	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022984
sub_08022984: @ 0x08022984
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080229DC
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080229D4 @ =0x08B95A1C
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080229D8 @ =0x03004690
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
	b _080229E4
	.align 2, 0
_080229D4: .4byte 0x08B95A1C
_080229D8: .4byte 0x03004690
_080229DC:
	ldr r1, _080229EC @ =0x0000073B
	bl MenuFrozenHelpBox
	movs r0, #8
_080229E4:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080229EC: .4byte 0x0000073B
