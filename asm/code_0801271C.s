	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_RestoreMainBGM
GC_RestoreMainBGM: @ 0x0801271C
	push {lr}
	movs r0, #0x5a
	movs r1, #0
	bl StartBgmCore
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
	.align 2, 0
