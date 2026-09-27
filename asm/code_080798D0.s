	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetPermanentFlags
ResetPermanentFlags: @ 0x080798D0
	ldr r1, _080798E0 @ =0x03004AD0
	movs r2, #0
	adds r0, r1, #7
_080798D6:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080798D6
	bx lr
	.align 2, 0
_080798E0: .4byte 0x03004AD0
