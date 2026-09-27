	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F600
sub_0807F600: @ 0x0807F600
	push {lr}
	ldr r0, _0807F614 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F614: .4byte 0x02022C60
