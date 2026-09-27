	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08087D74
sub_08087D74: @ 0x08087D74
	push {lr}
	ldr r0, _08087D8C @ =0x08CC306C
	bl Proc_Find
	cmp r0, #0
	beq _08087D86
	movs r1, #0
	bl Proc_Goto
_08087D86:
	pop {r0}
	bx r0
	.align 2, 0
_08087D8C: .4byte 0x08CC306C
