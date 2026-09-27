	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2F28
sub_080B2F28: @ 0x080B2F28
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B2F3C @ =0x08CE750C
	adds r0, r1, #0
	bl sub_0800AF5C
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2F3C: .4byte 0x08CE750C
