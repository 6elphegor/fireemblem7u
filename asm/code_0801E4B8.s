	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E4B8
sub_0801E4B8: @ 0x0801E4B8
	push {lr}
	ldr r0, _0801E4C8 @ =0x08B93704
	bl Proc_Find
	cmp r0, #0
	bne _0801E4CC
	movs r0, #0
	b _0801E4CE
	.align 2, 0
_0801E4C8: .4byte 0x08B93704
_0801E4CC:
	movs r0, #1
_0801E4CE:
	pop {r1}
	bx r1
	.align 2, 0
