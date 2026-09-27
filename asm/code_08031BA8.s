	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitStealInventoryInfoWindow
RefreshUnitStealInventoryInfoWindow: @ 0x08031BA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	str r0, [sp, #0x10]
	movs r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	movs r1, #0
	mov sl, r1
	ldr r1, [sp, #0xc]
	cmp sl, r1
	bge _08031CA6
	ldr r1, [sp, #0x10]
	adds r1, #0x6b
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	adds r1, #0x63
	str r1, [sp, #0x18]
	movs r1, #0x60
	str r1, [sp, #0x1c]
	adds r7, r0, #0
	adds r7, #0x38
_08031BF8:
	mov r1, sl
	lsls r0, r1, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemStealable
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl ClearText
	movs r1, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
	cmp r4, #0
	bne _08031C24
	movs r1, #1
_08031C24:
	adds r0, r7, #0
	bl Text_SetColor
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r0, _08031CB8 @ =0x02022C60
	mov r8, r0
	add r1, r8
	adds r0, r7, #0
	bl PutText
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	mov r1, r8
	adds r4, r0, r1
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	beq _08031C5A
	movs r5, #2
_08031C5A:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r4, [sp, #0x1c]
	adds r4, #1
	ldr r1, [sp, #0x10]
	adds r4, r4, r1
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, #0x40
	str r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	str r0, [sp, #0x1c]
	adds r7, #8
	movs r1, #1
	add sl, r1
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _08031BF8
_08031CA6:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031CB8: .4byte 0x02022C60
