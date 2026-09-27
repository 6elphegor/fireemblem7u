	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098790
sub_08098790: @ 0x08098790
	push {r4, lr}
	sub sp, #4
	ldr r4, _080987D0 @ =0x08B905F8
	ldr r0, _080987D4 @ =0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x8c
	movs r2, #0x58
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r3, _080987D8 @ =0x08B905D0
	ldr r0, _080987DC @ =0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xac
	movs r2, #0x58
	bl PutSpriteExt
	ldr r0, _080987E0 @ =0x0000B098
	str r0, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x38
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080987D0: .4byte 0x08B905F8
_080987D4: .4byte 0x0000B090
_080987D8: .4byte 0x08B905D0
_080987DC: .4byte 0x0000B094
_080987E0: .4byte 0x0000B098
