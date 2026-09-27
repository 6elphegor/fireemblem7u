	.include "macro.inc"

	.syntax unified

	thumb_func_start OnSelectPutTrap
OnSelectPutTrap: @ 0x08027A14
	push {lr}
	ldr r2, _08027A2C @ =0x0203A85C
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0
	bl SetStaffUseAction
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027A2C: .4byte 0x0203A85C
