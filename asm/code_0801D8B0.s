	.include "macro.inc"

	.syntax unified

	thumb_func_start HandleGiveUnitItem
HandleGiveUnitItem: @ 0x0801D8B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl UnitAddItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D942
	ldr r0, _0801D918 @ =0x03004690
	str r4, [r0]
	ldr r0, _0801D91C @ =0x0202BBB8
	strh r5, [r0, #0x2c]
	adds r0, r4, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #4
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xf
	movs r3, #0xa
	bl StartEquipInfoWindow
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D924
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt _0801D924
	ldr r0, _0801D920 @ =0x00000727
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartSubtitleHelp
	b _0801D934
	.align 2, 0
_0801D918: .4byte 0x03004690
_0801D91C: .4byte 0x0202BBB8
_0801D920: .4byte 0x00000727
_0801D924:
	movs r0, #0xe5
	lsls r0, r0, #3
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartSubtitleHelp
_0801D934:
	movs r0, #2
	bl SetTalkChoiceResult
	ldr r0, _0801D94C @ =0x08B9369C
	adds r1, r6, #0
	bl Proc_StartBlocking
_0801D942:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D94C: .4byte 0x08B9369C
