	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBlendWindowUnitSprite
PutBlendWindowUnitSprite: @ 0x0802647C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r5, r0, #0
	bl UseUnitSprite
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r7, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026550
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026550
	ldr r1, _080264CC @ =0x08C99700
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026500
	cmp r0, #1
	bgt _080264D0
	cmp r0, #0
	beq _080264D6
	b _08026550
	.align 2, 0
_080264CC: .4byte 0x08C99700
_080264D0:
	cmp r0, #2
	beq _0802652C
	b _08026550
_080264D6:
	ldr r3, _080264F8 @ =0x08B94152
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _080264FC @ =0x08B9416A
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	b _08026550
	.align 2, 0
_080264F8: .4byte 0x08B94152
_080264FC: .4byte 0x08B9416A
_08026500:
	adds r5, r6, #0
	subs r5, #0x10
	ldr r3, _08026524 @ =0x08B9415A
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	ldr r3, _08026528 @ =0x08B94172
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	b _08026550
	.align 2, 0
_08026524: .4byte 0x08B9415A
_08026528: .4byte 0x08B94172
_0802652C:
	adds r5, r7, #0
	subs r5, #8
	subs r6, #0x10
	ldr r3, _08026560 @ =0x08B94162
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _08026564 @ =0x08B9417A
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
_08026550:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026560: .4byte 0x08B94162
_08026564: .4byte 0x08B9417A
