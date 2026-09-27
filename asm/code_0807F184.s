	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F184
sub_0807F184: @ 0x0807F184
	push {lr}
	ldr r0, _0807F190 @ =0x083FC99C
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F190: .4byte 0x083FC99C
