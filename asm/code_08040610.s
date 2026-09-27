	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040610
sub_08040610: @ 0x08040610
	push {lr}
	ldr r0, _08040628 @ =0x08B98B60
	bl Proc_EndEach
	ldr r0, _0804062C @ =0x08B98B88
	bl Proc_EndEach
	ldr r0, _08040630 @ =0x08B98B38
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08040628: .4byte 0x08B98B60
_0804062C: .4byte 0x08B98B88
_08040630: .4byte 0x08B98B38
