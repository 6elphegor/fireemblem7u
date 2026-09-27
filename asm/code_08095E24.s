	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095E24
sub_08095E24: @ 0x08095E24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _08095ED0 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r2
	ble _08095EC4
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _08095ED4 @ =0x020117E4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095E64
	movs r0, #1
	mov r8, r0
_08095E64:
	lsls r4, r4, #6
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertDrawString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl PutIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl PutText
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _08095EB4
	movs r5, #2
_08095EB4:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
_08095EC4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095ED0: .4byte 0x02012466
_08095ED4: .4byte 0x020117E4
