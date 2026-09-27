	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueOutro_FadeDragonsGateToBlack
NilsEpilogueOutro_FadeDragonsGateToBlack: @ 0x0807F684
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
