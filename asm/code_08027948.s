	.include "macro.inc"

	.syntax unified

	thumb_func_start WarpSelect_OnCancel
WarpSelect_OnCancel: @ 0x08027948
	push {lr}
	bl ResetTextFont
	bl HideMoveRangeGraphics
	bl EndSubtitleHelp
	ldr r0, _08027974 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r0, _08027978 @ =0x08B93DDC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08027974: .4byte 0x03004690
_08027978: .4byte 0x08B93DDC
