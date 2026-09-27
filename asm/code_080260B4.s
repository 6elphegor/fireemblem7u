	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnitSprite
PutUnitSprite: @ 0x080260B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r7, r2, #0
	adds r4, r3, #0
	adds r0, r4, #0
	bl GetUnitSMSId
	adds r5, r0, #0
	bl UseUnitSprite
	adds r6, r0, #0
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802618A
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802618A
	ldr r1, _08026104 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026138
	cmp r0, #1
	bgt _08026108
	cmp r0, #0
	beq _0802610E
	b _0802618A
	.align 2, 0
_08026104: .4byte 0x08C99700
_08026108:
	cmp r0, #2
	beq _08026164
	b _0802618A
_0802610E:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	ldr r3, _08026134 @ =0x08B905B8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	bl PutSprite
	b _0802618A
	.align 2, 0
_08026134: .4byte 0x08B905B8
_08026138:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026160 @ =0x08B905D8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _0802618A
	.align 2, 0
_08026160: .4byte 0x08B905D8
_08026164:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r4, r4, r0
	mov r1, r8
	subs r1, #8
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026198 @ =0x08B905C0
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_0802618A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026198: .4byte 0x08B905C0
