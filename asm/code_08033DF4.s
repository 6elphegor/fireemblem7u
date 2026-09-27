	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateBattleForecastEffectivenessPalettes
UpdateBattleForecastEffectivenessPalettes: @ 0x08033DF4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033E18
	ldr r0, _08033E14 @ =0x08B96D34
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08033E1A
	.align 2, 0
_08033E14: .4byte 0x08B96D34
_08033E18:
	movs r0, #0
_08033E1A:
	lsls r0, r0, #5
	ldr r1, _08033E44 @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033E4C
	ldr r0, _08033E48 @ =0x08B96D34
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08033E4E
	.align 2, 0
_08033E44: .4byte 0x0200300C
_08033E48: .4byte 0x08B96D34
_08033E4C:
	movs r0, #0
_08033E4E:
	lsls r0, r0, #5
	ldr r1, _08033E64 @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033E64: .4byte 0x0200300C
