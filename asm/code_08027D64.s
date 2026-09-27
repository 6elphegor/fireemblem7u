	.include "macro.inc"

	.syntax unified

	thumb_func_start DoUseBarrierStaff
DoUseBarrierStaff: @ 0x08027D64
	push {r4, lr}
	bl MakeTargetListForBarrier
	ldr r0, _08027D94 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027D98 @ =0x08B95B38
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027D9C @ =0x0000072F
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D94: .4byte 0x0202E3E4
_08027D98: .4byte 0x08B95B38
_08027D9C: .4byte 0x0000072F
