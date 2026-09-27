	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012BAC
sub_08012BAC: @ 0x08012BAC
	push {r4, lr}
	ldr r4, _08012BCC @ =0x08B924BC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #6
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012BCC: .4byte 0x08B924BC
