	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B252C
sub_080B252C: @ 0x080B252C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B253C @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	adds r0, r1, #0
	b _080B2540
	.align 2, 0
_080B253C: .4byte 0x08CE7298
_080B2540:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
