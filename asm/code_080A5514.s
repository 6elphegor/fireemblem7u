	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5514
sub_080A5514: @ 0x080A5514
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A5584 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A5588 @ =0x08CE4158
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #9
	add r8, r1
	ldr r0, _080A558C @ =0x08CE4584
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5584: .4byte 0x000001FF
_080A5588: .4byte 0x08CE4158
_080A558C: .4byte 0x08CE4584
