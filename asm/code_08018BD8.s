	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitPortraitId
GetUnitPortraitId: @ 0x08018BD8
	adds r2, r0, #0
	ldr r1, [r2]
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08018BF0
	ldr r1, [r2, #4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _08018BEE
	movs r0, #0
	b _08018BF0
_08018BEE:
	ldrh r0, [r1, #8]
_08018BF0:
	bx lr
	.align 2, 0
