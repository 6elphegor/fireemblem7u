	.include "macro.inc"

	.syntax unified

	thumb_func_start StoreConvoyWeaponIconGraphics
StoreConvoyWeaponIconGraphics: @ 0x08095C6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08095C98 @ =0x08405EA4
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08095C9C @ =0x08405B4C
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08095CA0 @ =0x08405CE4
	ldr r1, _08095CA4 @ =0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095C98: .4byte 0x08405EA4
_08095C9C: .4byte 0x08405B4C
_08095CA0: .4byte 0x08405CE4
_08095CA4: .4byte 0x06000200
