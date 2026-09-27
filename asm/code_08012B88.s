	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012B88
sub_08012B88: @ 0x08012B88
	push {r4, lr}
	ldr r4, _08012BA8 @ =0x08B924BC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012BA8: .4byte 0x08B924BC
