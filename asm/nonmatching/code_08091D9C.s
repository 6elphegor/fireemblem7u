	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_ResumeFromStatScreen
PrepItemScreen_ResumeFromStatScreen: @ 0x08091D9C
	push {r4, lr}
	adds r4, r0, #0
	bl PrepItemScreen_SetupGfx
	bl GetLatestUnitIndexInPrepListByUId
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08092AE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
