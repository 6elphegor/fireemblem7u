	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACABC
sub_080ACABC: @ 0x080ACABC
	push {lr}
	sub sp, #4
	ldr r0, _080ACAF0 @ =0x08CE45B4
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc
	movs r2, #8
	bl PutSpriteExt
	ldr r0, _080ACAF4 @ =0x08CE45A8
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080ACAF0: .4byte 0x08CE45B4
_080ACAF4: .4byte 0x08CE45A8
