	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACCF4
sub_080ACCF4: @ 0x080ACCF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, _080ACD90 @ =0x08CE5784
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r1, r1, r0
	mov r8, r1
	lsls r3, r5, #1
	movs r0, #0x1f
	ands r3, r0
	ldr r0, _080ACD94 @ =0x08CE577C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	str r1, [sp, #8]
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080ACD98 @ =0x08CE5774
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r6, r0, #2
	adds r1, r1, r6
	ldrb r7, [r1, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	lsls r4, r3, #6
	ldr r0, _080ACD9C @ =0x02023C60
	mov sl, r0
	adds r1, r4, #0
	add r1, sl
	mov sb, r1
	mov r0, sb
	movs r1, #0x14
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	mov r0, r8
	bl ClearText
	cmp r5, #0x1f
	bgt _080ACE22
	ldr r1, _080ACD98 @ =0x08CE5774
	ldr r0, [r1]
	adds r0, r0, r6
	movs r2, #3
	ldrb r1, [r0]
	ands r2, r1
	cmp r2, #0
	beq _080ACE22
	cmp r2, #1
	bne _080ACD74
	movs r1, #4
	str r1, [sp, #0xc]
_080ACD74:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _080ACD7E
	movs r1, #1
	str r1, [sp, #0xc]
_080ACD7E:
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080ACE1C
	cmp r0, #1
	ble _080ACDA0
	cmp r0, #2
	beq _080ACDEE
	b _080ACE1C
	.align 2, 0
_080ACD90: .4byte 0x08CE5784
_080ACD94: .4byte 0x08CE577C
_080ACD98: .4byte 0x08CE5774
_080ACD9C: .4byte 0x02023C60
_080ACDA0:
	adds r0, r7, #0
	bl GetItemName
	mov r1, sl
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl PutDrawText
	mov r0, sl
	adds r0, #0x16
	adds r5, r4, r0
	ldr r4, [sp, #0xc]
	cmp r4, #0
	bne _080ACDCA
	movs r4, #2
_080ACDCA:
	adds r0, r7, #0
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	bl PutIcon
	b _080ACE1C
_080ACDEE:
	adds r0, r7, #0
	bl GetItemName
	mov r1, sl
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	bl PutIcon
_080ACE1C:
	movs r0, #4
	bl EnableBgSync
_080ACE22:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
