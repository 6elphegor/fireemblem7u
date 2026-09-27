	.include "macro.inc"

	.syntax unified

	thumb_func_start GenericSelection_BackToUM_CamWait
GenericSelection_BackToUM_CamWait: @ 0x08021738
	push {lr}
	bl EndTargetSelection
	ldr r0, _08021764 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl ResetTextFont
	ldr r0, _08021768 @ =0x08B93DDC
	movs r1, #3
	bl Proc_Start
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08021764: .4byte 0x02023C60
_08021768: .4byte 0x08B93DDC
