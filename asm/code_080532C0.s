	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrPrepareBanimfx
EkrPrepareBanimfx: @ 0x080532C0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetAnimPosition
	ldr r1, _080532E8 @ =0x0203E08E
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	bl UpdateBanimFrame
	adds r0, r5, #0
	movs r1, #6
	bl SwitchAISFrameDataFromBARoundType
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080532E8: .4byte 0x0203E08E
