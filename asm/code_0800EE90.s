	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPopup_800EE90
StartPopup_800EE90: @ 0x0800EE90
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupNumber
	ldr r0, _0800EEAC @ =0x08B91BE4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEAC: .4byte 0x08B91BE4
