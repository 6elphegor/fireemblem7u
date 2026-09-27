	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5748
sub_080A5748: @ 0x080A5748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	ldr r2, _080A57AC @ =0x000001FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _080A57B0 @ =0x08CE4158
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	adds r2, r5, #0
	bl PutSpriteExt
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A57DC
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _080A57B8
	adds r2, r5, #0
	adds r2, #9
	ldr r0, _080A57AC @ =0x000001FF
	ands r2, r0
	ldr r0, _080A57B4 @ =0x08CE4584
	ldr r3, [r0, #0x24]
	b _080A57C4
	.align 2, 0
_080A57AC: .4byte 0x000001FF
_080A57B0: .4byte 0x08CE4158
_080A57B4: .4byte 0x08CE4584
_080A57B8:
	adds r2, r5, #0
	adds r2, #9
	ldr r0, _080A57D4 @ =0x000001FF
	ands r2, r0
	ldr r0, _080A57D8 @ =0x08CE4584
	ldr r3, [r0, #0x20]
_080A57C4:
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
	b _080A5806
	.align 2, 0
_080A57D4: .4byte 0x000001FF
_080A57D8: .4byte 0x08CE4584
_080A57DC:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #9
	ldr r1, _080A5810 @ =0x000001FF
	ands r2, r1
	ldr r1, _080A5814 @ =0x08CE4584
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
_080A5806:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5810: .4byte 0x000001FF
_080A5814: .4byte 0x08CE4584
