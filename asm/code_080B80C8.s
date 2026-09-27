	.include "macro.inc"

	.syntax unified

	thumb_func_start SetupCharacterEndingGfx
SetupCharacterEndingGfx: @ 0x080B80C8
	push {lr}
	ldr r0, _080B80E0 @ =0x085DC154
	ldr r1, _080B80E4 @ =0x06005000
	bl Decompress
	ldr r0, _080B80E8 @ =0x08407440
	ldr r1, _080B80EC @ =0x06008000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080B80E0: .4byte 0x085DC154
_080B80E4: .4byte 0x06005000
_080B80E8: .4byte 0x08407440
_080B80EC: .4byte 0x06008000
