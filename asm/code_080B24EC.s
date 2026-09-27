	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B24EC
sub_080B24EC: @ 0x080B24EC
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B24FC @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	b _080B2500
	.align 2, 0
_080B24FC: .4byte 0x08CE7298
_080B2500:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
