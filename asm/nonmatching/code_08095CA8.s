	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095CA8
sub_08095CA8: @ 0x08095CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, _08095CF4 @ =0x02012466
	ldrh r0, [r1]
	cmp r0, #0
	bne _08095CFC
	ldr r0, [sp]
	bl ClearText
	ldr r0, _08095CF8 @ =0x0000126D
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b _08095DA6
	.align 2, 0
_08095CF4: .4byte 0x02012466
_08095CF8: .4byte 0x0000126D
_08095CFC:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _08095DA6
	ldrh r1, [r1]
	cmp r6, r1
	bge _08095DA6
_08095D0A:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _08095DB8 @ =0x020117E4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov sb, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095D34
	movs r0, #1
	mov sb, r0
_08095D34:
	mov r0, r8
	bl ClearText
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, sb
	bl Text_InsertDrawString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	bne _08095D84
	movs r5, #2
_08095D84:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _08095DA6
	ldr r0, _08095DBC @ =0x02012466
	ldrh r0, [r0]
	cmp r6, r0
	blt _08095D0A
_08095DA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095DB8: .4byte 0x020117E4
_08095DBC: .4byte 0x02012466
