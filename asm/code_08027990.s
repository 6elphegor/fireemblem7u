	.include "macro.inc"

	.syntax unified

	thumb_func_start WarpOnSelectTarget
WarpOnSelectTarget: @ 0x08027990
	push {r4, lr}
	adds r4, r1, #0
	bl EndTargetSelection
	ldr r1, _080279B0 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	ldr r0, _080279B4 @ =0x08B94194
	movs r1, #3
	bl Proc_Start
	movs r0, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080279B0: .4byte 0x0203A85C
_080279B4: .4byte 0x08B94194
