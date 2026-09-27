	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelp_Init
SubtitleHelp_Init: @ 0x080324D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0x1f
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _080324EC @ =0x08B969E4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080324EC: .4byte 0x08B969E4
