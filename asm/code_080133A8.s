	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080133A8
sub_080133A8: @ 0x080133A8
	push {r4, lr}
	movs r1, #0x9f
	movs r3, #0xf0
	movs r4, #1
	rsbs r4, r4, #0
	adds r2, r4, #0
_080133B4:
	strh r3, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080133B4
	pop {r4}
	pop {r0}
	bx r0
