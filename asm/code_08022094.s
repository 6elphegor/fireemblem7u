	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayCommandEffect
PlayCommandEffect: @ 0x08022094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov sl, r1
	movs r7, #0
	ldr r6, _0802210C @ =0x03004690
	ldr r0, [r6]
	bl MakeTargetListForRefresh
	bl CountTargets
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _080220F2
_080220C4:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _080220DE
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080220DE
	movs r7, #1
_080220DE:
	adds r5, #1
	cmp r5, #4
	bgt _080220F2
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080220C4
_080220F2:
	mov r0, r8
	cmp r0, #0
	beq _08022110
	cmp r7, #0
	bne _08022110
	mov r0, sb
	mov r1, sl
	bl ItemMenu_Select1stCommand
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022150
	.align 2, 0
_0802210C: .4byte 0x03004690
_08022110:
	ldr r0, _08022160 @ =0x08B959F8
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022164 @ =0x03004690
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
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0x17
_08022150:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022160: .4byte 0x08B959F8
_08022164: .4byte 0x03004690
