	.include "macro.inc"

	.syntax unified

	thumb_func_start StartGreenText
StartGreenText: @ 0x08005FF4
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08006008
	ldr r0, _08006004 @ =0x08B86150
	bl Proc_Start
	b _08006010
	.align 2, 0
_08006004: .4byte 0x08B86150
_08006008:
	ldr r0, _08006014 @ =0x08B86150
	movs r1, #3
	bl Proc_Start
_08006010:
	pop {r0}
	bx r0
	.align 2, 0
_08006014: .4byte 0x08B86150
