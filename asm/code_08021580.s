	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021580
sub_08021580: @ 0x08021580
	push {lr}
	ldr r0, _08021590 @ =0x08B93374
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021590: .4byte 0x08B93374
