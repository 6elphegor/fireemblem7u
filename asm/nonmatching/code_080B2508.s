	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2508
sub_080B2508: @ 0x080B2508
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B2520 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, _080B2520 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #0xc]
	ldr r0, [r0, #0x10]
	adds r1, r2, r0
	adds r0, r1, #0
	b _080B2524
	.align 2, 0
_080B2520: .4byte 0x08CE7298
_080B2524:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
