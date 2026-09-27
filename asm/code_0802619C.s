	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnitSpriteForClassId
PutUnitSpriteForClassId: @ 0x0802619C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	mov r8, r0
	bl UseUnitSprite
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802623C
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802623C
	ldr r1, _080261F0 @ =0x08C99700
	movs r0, #0x7f
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026210
	cmp r0, #1
	bgt _080261F4
	cmp r0, #0
	beq _080261FA
	b _0802623C
	.align 2, 0
_080261F0: .4byte 0x08C99700
_080261F4:
	cmp r0, #2
	beq _08026228
	b _0802623C
_080261FA:
	ldr r3, _0802620C @ =0x08B905B8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutSprite
	b _0802623C
	.align 2, 0
_0802620C: .4byte 0x08B905B8
_08026210:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026224 @ =0x08B905D8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	bl PutSprite
	b _0802623C
	.align 2, 0
_08026224: .4byte 0x08B905D8
_08026228:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0802624C @ =0x08B905C0
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	bl PutSprite
_0802623C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802624C: .4byte 0x08B905C0
