	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08026250
sub_08026250: @ 0x08026250
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	bl GetClassSMSId
	adds r6, r0, #0
	bl UseUnitSprite
	adds r7, r0, #0
	adds r7, #0x80
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080262F4
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080262F4
	ldr r1, _0802629C @ =0x08C99700
	movs r0, #0x7f
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _080262B4
	cmp r0, #1
	bgt _080262A0
	cmp r0, #0
	beq _080262A6
	b _080262F4
	.align 2, 0
_0802629C: .4byte 0x08C99700
_080262A0:
	cmp r0, #2
	beq _080262D4
	b _080262F4
_080262A6:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r4, r0
	ldr r3, _080262B0 @ =0x08B905B8
	b _080262C4
	.align 2, 0
_080262B0: .4byte 0x08B905B8
_080262B4:
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _080262D0 @ =0x08B905D8
_080262C4:
	str r7, [sp]
	mov r0, r8
	adds r1, r5, #0
	bl PutSpriteExt
	b _080262F4
	.align 2, 0
_080262D0: .4byte 0x08B905D8
_080262D4:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08026300 @ =0x000001FF
	ands r1, r0
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08026304 @ =0x08B905C0
	str r7, [sp]
	mov r0, r8
	bl PutSpriteExt
_080262F4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026300: .4byte 0x000001FF
_08026304: .4byte 0x08B905C0
