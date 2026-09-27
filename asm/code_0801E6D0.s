	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E6D0
sub_0801E6D0: @ 0x0801E6D0
	push {lr}
	ldr r0, _0801E6E4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0801E6E4: .4byte 0x02022C60
