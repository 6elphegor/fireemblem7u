	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095F90
sub_08095F90: @ 0x08095F90
	push {r4, lr}
	ldr r4, _08095FC0 @ =0x02012B50
	ldr r1, _08095FC4 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _08095FC8 @ =0x08194674
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095FC0: .4byte 0x02012B50
_08095FC4: .4byte 0x06011000
_08095FC8: .4byte 0x08194674
