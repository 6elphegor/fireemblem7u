	.include "macro.inc"

	.syntax unified

	thumb_func_start FaceExists
FaceExists: @ 0x08009FB8
	push {lr}
	ldr r0, _08009FCC @ =0x08B907C0
	bl Proc_Find
	cmp r0, #0
	beq _08009FC6
	movs r0, #1
_08009FC6:
	pop {r1}
	bx r1
	.align 2, 0
_08009FCC: .4byte 0x08B907C0
