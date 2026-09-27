	.include "macro.inc"

	.syntax unified

	thumb_func_start MixPalette_Loop
MixPalette_Loop: @ 0x080AA900
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldr r1, [r2, #0x2c]
	adds r0, r0, r1
	str r0, [r2, #0x38]
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _080AA918
	movs r0, #0
	str r0, [r2, #0x38]
_080AA918:
	ldr r0, [r2, #0x38]
	subs r1, r1, r0
	cmp r0, #0x7f
	bgt _080AA922
	adds r1, r0, #0
_080AA922:
	adds r0, r2, #0
	bl MixPaletteCore
	pop {r0}
	bx r0
