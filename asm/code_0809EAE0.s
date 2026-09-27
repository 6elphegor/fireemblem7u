	.include "macro.inc"

	.syntax unified

	thumb_func_start IsExtraSupportViewerEnabled
IsExtraSupportViewerEnabled: @ 0x0809EAE0
	push {r4, lr}
	movs r0, #0
	bl GGM_IsAnyCharacterKnown
	adds r4, r0, #0
	bl IsGamePlayedThrough
	ands r0, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
