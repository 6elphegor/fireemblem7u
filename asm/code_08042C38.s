	.include "macro.inc"

	.syntax unified

	thumb_func_start StartNameSelect
StartNameSelect: @ 0x08042C38
	push {lr}
	adds r1, r0, #0
	ldr r0, _08042C54 @ =0x08B98E14
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x33
	movs r2, #0
	movs r1, #7
	strb r1, [r3]
	adds r0, #0x32
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08042C54: .4byte 0x08B98E14
