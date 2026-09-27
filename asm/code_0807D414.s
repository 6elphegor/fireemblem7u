	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D414
sub_0807D414: @ 0x0807D414
	push {lr}
	ldr r0, _0807D420 @ =0x00004E20
	bl sub_08079C48
	pop {r0}
	bx r0
	.align 2, 0
_0807D420: .4byte 0x00004E20
