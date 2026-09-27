	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080985A0
sub_080985A0: @ 0x080985A0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080985CC @ =0x0000DF80
	movs r5, #0x30
	movs r4, #3
_080985AA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _080985D0 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080985AA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080985CC: .4byte 0x0000DF80
_080985D0: .4byte 0x08B905F8
