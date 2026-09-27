	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitInventoryInfoWindow
RefreshUnitInventoryInfoWindow: @ 0x08031A98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	bl GetUnitItemCount
	mov sl, r0
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	adds r5, r0, #0
	movs r0, #0xd
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	cmp r0, #0
	bne _08031AC6
	movs r0, #1
	str r0, [sp, #4]
_08031AC6:
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r5, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r4, r0, #0
	mov r0, sl
	cmp r0, #0
	bne _08031B10
	adds r4, #0x38
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08031B08 @ =0x0000126D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	adds r1, r5, #0
	adds r1, #0x63
	lsls r1, r1, #1
	ldr r0, _08031B0C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	b _08031B94
	.align 2, 0
_08031B08: .4byte 0x0000126D
_08031B0C: .4byte 0x02022C60
_08031B10:
	movs r0, #0
	mov sb, r0
	cmp sb, sl
	bge _08031B94
	ldr r3, _08031BA4 @ =0x02022C60
	adds r2, r5, #0
	adds r2, #0x61
	adds r1, r5, #0
	adds r1, #0x6b
	adds r0, r5, #0
	adds r0, #0x63
	adds r5, r4, #0
	adds r5, #0x38
	lsls r0, r0, #1
	adds r0, r0, r3
	mov r8, r0
	lsls r1, r1, #1
	adds r7, r1, r3
	lsls r2, r2, #1
	adds r6, r2, r3
_08031B38:
	mov r0, sb
	lsls r1, r0, #1
	ldr r0, [sp, #8]
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	mov r1, r8
	bl PutText
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #0x80
	adds r7, #0x80
	movs r0, #0x80
	add r8, r0
	adds r5, #8
	movs r0, #1
	add sb, r0
	cmp sb, sl
	blt _08031B38
_08031B94:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031BA4: .4byte 0x02022C60
