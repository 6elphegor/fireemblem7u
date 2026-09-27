	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemUse_WaitPromotionDone
PrepItemUse_WaitPromotionDone: @ 0x08095828
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _08095840
	adds r0, r4, #0
	bl Proc_Break
_08095840:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
