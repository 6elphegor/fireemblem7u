	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyMinimapGraphics
ApplyMinimapGraphics: @ 0x080A2E6C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080A2E76
	movs r4, #3
_080A2E76:
	ldr r0, _080A2E9C @ =0x0840F4D8
	ldr r1, _080A2EA0 @ =0x02020140
	bl Decompress
	ldr r0, _080A2EA4 @ =0x0840F8B0
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A2EA8 @ =0x0840F8D0
	adds r1, r4, #1
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E9C: .4byte 0x0840F4D8
_080A2EA0: .4byte 0x02020140
_080A2EA4: .4byte 0x0840F8B0
_080A2EA8: .4byte 0x0840F8D0
