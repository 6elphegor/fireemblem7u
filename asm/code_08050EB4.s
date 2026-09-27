	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrbattleending
NewEkrbattleending: @ 0x08050EB4
	push {lr}
	ldr r0, _08050EC8 @ =0x08B9B04C
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_08050EC8: .4byte 0x08B9B04C
