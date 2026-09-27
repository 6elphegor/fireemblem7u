	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F1A4
sub_0807F1A4: @ 0x0807F1A4
	push {lr}
	ldr r0, _0807F1B0 @ =0x083FC9C4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1B0: .4byte 0x083FC9C4
