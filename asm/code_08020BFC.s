	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020BFC
sub_08020BFC: @ 0x08020BFC
	push {lr}
	ldr r0, _08020C10 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08020C10: .4byte 0x02022C60
