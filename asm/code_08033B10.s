	.include "macro.inc"

	.syntax unified

	thumb_func_start GetFactionBattleForecastFramePalette
GetFactionBattleForecastFramePalette: @ 0x08033B10
	cmp r0, #0x40
	beq _08033B38
	cmp r0, #0x40
	bgt _08033B1E
	cmp r0, #0
	beq _08033B28
	b _08033B42
_08033B1E:
	cmp r0, #0x80
	beq _08033B30
	cmp r0, #0xc0
	beq _08033B40
	b _08033B42
_08033B28:
	ldr r0, _08033B2C @ =0x08195BAC
	b _08033B42
	.align 2, 0
_08033B2C: .4byte 0x08195BAC
_08033B30:
	ldr r0, _08033B34 @ =0x08195BCC
	b _08033B42
	.align 2, 0
_08033B34: .4byte 0x08195BCC
_08033B38:
	ldr r0, _08033B3C @ =0x08195BEC
	b _08033B42
	.align 2, 0
_08033B3C: .4byte 0x08195BEC
_08033B40:
	ldr r0, _08033B44 @ =0x08195C0C
_08033B42:
	bx lr
	.align 2, 0
_08033B44: .4byte 0x08195C0C
