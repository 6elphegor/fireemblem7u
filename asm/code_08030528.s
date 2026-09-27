	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenProc_DimMapImmediate
PrepScreenProc_DimMapImmediate: @ 0x08030528
	push {lr}
	bl ArchiveCurrentPalettes
	ldr r3, _08030540 @ =0xFF00FFF0
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
_08030540: .4byte 0xFF00FFF0
