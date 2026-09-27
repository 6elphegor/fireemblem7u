	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022DB4
sub_08022DB4: @ 0x08022DB4
	push {lr}
	ldr r1, _08022DCC @ =0x0203A85C
	movs r0, #0x1a
	strb r0, [r1, #0x11]
	ldr r0, _08022DD0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0
	bl StartBmSupply
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022DCC: .4byte 0x0203A85C
_08022DD0: .4byte 0x03004690
