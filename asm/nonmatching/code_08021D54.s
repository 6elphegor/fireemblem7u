	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021D54
sub_08021D54: @ 0x08021D54
	push {lr}
	ldr r0, _08021D64 @ =0x08B93E0C
	movs r1, #3
	bl Proc_Start
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_08021D64: .4byte 0x08B93E0C
