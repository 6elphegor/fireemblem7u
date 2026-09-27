	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021630
sub_08021630: @ 0x08021630
	push {lr}
	ldr r0, _08021640 @ =0x08B93DA4
	bl StartEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021640: .4byte 0x08B93DA4
