	.include "macro.inc"

	.syntax unified

	thumb_func_start PopulateSaveBlockChecksum
PopulateSaveBlockChecksum: @ 0x080A19BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl SramChecksum32
	str r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
