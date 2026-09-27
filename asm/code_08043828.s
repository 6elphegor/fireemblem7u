	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043828
sub_08043828: @ 0x08043828
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	adds r7, r1, #0
	mov sl, r3
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	str r4, [sp, #0x10]
	movs r6, #0
	cmp r7, #0
	bne _08043848
	b _08043960
_08043848:
	cmp r7, #0x32
	bne _0804387C
	ldr r7, _08043878 @ =0x00001186
	adds r0, r7, #0
	bl DecodeMsg
	bl GetStringTextLen
	adds r5, r0, #0
	cmp r4, #0
	beq _08043864
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_08043864:
	adds r0, r7, #0
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	b _08043960
	.align 2, 0
_08043878: .4byte 0x00001186
_0804387C:
	ldr r5, [sp]
	asrs r4, r7, #1
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r4, r0, #0
	mov r0, r8
	cmp r0, #0
	beq _080438B0
	ldr r1, _08043970 @ =0x08B99880
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	subs r0, #1
	str r0, [sp, #4]
	adds r5, r5, r0
_080438B0:
	lsls r0, r4, #1
	ldr r1, _08043970 @ =0x08B99880
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	subs r0, #1
	str r0, [sp, #8]
	adds r5, r5, r0
	ldr r0, _08043974 @ =0x00001185
	bl DecodeMsg
	bl GetStringTextLen
	str r0, [sp, #0xc]
	adds r5, r5, r0
	movs r4, #1
	ands r4, r7
	cmp r4, #0
	beq _080438EA
	ldr r0, _08043978 @ =0x00001188
	bl DecodeMsg
	bl GetStringTextLen
	adds r5, r5, r0
_080438EA:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _080438F6
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_080438F6:
	ldr r0, [sp]
	adds r6, r6, r0
	mov r0, r8
	cmp r0, #0
	beq _0804391C
	lsls r0, r0, #1
	ldr r1, _08043970 @ =0x08B99880
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #4]
	adds r6, r6, r0
_0804391C:
	ldr r2, [sp, #0x14]
	ldrh r0, [r2]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #8]
	adds r6, r6, r0
	ldr r0, _08043974 @ =0x00001185
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #0xc]
	adds r6, r6, r0
	cmp r4, #0
	beq _08043960
	ldr r0, _08043978 @ =0x00001188
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
_08043960:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043970: .4byte 0x08B99880
_08043974: .4byte 0x00001185
_08043978: .4byte 0x00001188
