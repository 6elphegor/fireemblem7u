	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshHammerneUnitInfoWindow
RefreshHammerneUnitInfoWindow: @ 0x08031CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	movs r1, #0x10
	bl GetUnitInfoWindowX
	mov sb, r0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	mov r2, sb
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _08031DE0
	mov r1, sb
	adds r1, #0x6c
	str r1, [sp, #0x14]
	mov r2, sb
	adds r2, #0x63
	str r2, [sp, #0x18]
	movs r1, #0x60
	mov sl, r1
	adds r7, r0, #0
	adds r7, #0x38
_08031D0C:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemRepairable
	movs r5, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08031D28
	movs r5, #1
_08031D28:
	adds r0, r7, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r2, _08031DF8 @ =0x02022C60
	mov r8, r2
	add r1, r8
	adds r0, r7, #0
	bl PutText
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	add r0, r8
	adds r1, r5, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	bl IsItemRepairable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08031D72
	movs r5, #2
_08031D72:
	mov r4, sl
	adds r4, #0xb
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	mov r4, sl
	adds r4, #0xe
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	mov r4, sl
	adds r4, #1
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	ldr r2, [sp, #0x14]
	adds r2, #0x40
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x40
	add sl, r1
	adds r7, #8
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08031D0C
_08031DE0:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031DF8: .4byte 0x02022C60
