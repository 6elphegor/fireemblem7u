	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF5FC
sub_080AF5FC: @ 0x080AF5FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	movs r7, #0xe0
	lsls r7, r7, #8
	cmp r1, #0
	beq _080AF61A
	movs r7, #0xf0
	lsls r7, r7, #8
_080AF61A:
	ldr r4, _080AF65C @ =0x08CE6104
	str r7, [sp]
	movs r0, #4
	movs r1, #0x74
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0
	cmp r5, r8
	bge _080AF686
	mov sb, r4
	movs r6, #0x74
	movs r4, #0x74
_080AF636:
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge _080AF660
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	b _080AF67C
	.align 2, 0
_080AF65C: .4byte 0x08CE6104
_080AF660:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, _080AF694 @ =0x08CE60FC
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, _080AF698 @ =0x08CE610C
	bl PutSpriteExt
_080AF67C:
	adds r6, #8
	subs r4, #8
	adds r5, #1
	cmp r5, r8
	blt _080AF636
_080AF686:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF694: .4byte 0x08CE60FC
_080AF698: .4byte 0x08CE610C
