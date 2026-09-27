	.include "macro.inc"

	.syntax unified

	thumb_func_start StaffSelectOnSelect
StaffSelectOnSelect: @ 0x08027680
	push {lr}
	ldr r2, _08027694 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0
	bl SetStaffUseAction
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027694: .4byte 0x0203A85C
