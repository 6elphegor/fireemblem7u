	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009020
sub_08009020: @ 0x08009020
	push {lr}
	ldr r0, _08009030 @ =0x08B90A0C
	bl Proc_Find
	cmp r0, #0
	bne _08009034
	movs r0, #0
	b _08009036
	.align 2, 0
_08009030: .4byte 0x08B90A0C
_08009034:
	movs r0, #1
_08009036:
	pop {r1}
	bx r1
	.align 2, 0
