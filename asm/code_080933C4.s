	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_DrawUnitItems
PrepUnit_DrawUnitItems: @ 0x080933C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl InitIcons
	ldr r4, _080934B0 @ =0x02022DA2
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _08093498
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov sb, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_08093404:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _080934B4 @ =0x02012B10
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093442
	movs r6, #1
_08093442:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _080934B8 @ =0x02022C62
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08093472
	movs r5, #2
_08093472:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add sb, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _08093404
_08093498:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080934B0: .4byte 0x02022DA2
_080934B4: .4byte 0x02012B10
_080934B8: .4byte 0x02022C62
