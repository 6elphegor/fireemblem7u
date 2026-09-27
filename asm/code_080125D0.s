	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_StartClassReel
GC_StartClassReel: @ 0x080125D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetTitleClassReelSet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartLordSelect
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
