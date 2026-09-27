	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CC14
sub_0807CC14: @ 0x0807CC14
	push {lr}
	ldr r0, _0807CC30 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807CC34 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807CC30: .4byte 0x02023460
_0807CC34: .4byte 0x02022C60
