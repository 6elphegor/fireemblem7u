	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047D60
sub_08047D60: @ 0x08047D60
	push {lr}
	sub sp, #4
	ldr r3, _08047D7C @ =0x08B9A398
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08047D7C: .4byte 0x08B9A398
