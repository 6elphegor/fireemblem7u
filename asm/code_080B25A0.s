	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B25A0
sub_080B25A0: @ 0x080B25A0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B25C0 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B25C0 @ =0x08CE7298
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B25C0 @ =0x08CE7298
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	cmp r0, r1
	beq _080B25C4
	movs r0, #1
	b _080B25C8
	.align 2, 0
_080B25C0: .4byte 0x08CE7298
_080B25C4:
	movs r0, #0
	b _080B25C8
_080B25C8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
