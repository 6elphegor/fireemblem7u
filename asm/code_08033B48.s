	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleForecastFramePalettes
InitBattleForecastFramePalettes: @ 0x08033B48
	push {r4, lr}
	ldr r0, _08033B7C @ =0x0203A3F0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0xc0
	ands r0, r4
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08033B80 @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08033B84
	ands r0, r4
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08033B92
	.align 2, 0
_08033B7C: .4byte 0x0203A3F0
_08033B80: .4byte 0x0203A470
_08033B84:
	movs r0, #0xc0
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_08033B92:
	pop {r4}
	pop {r0}
	bx r0
