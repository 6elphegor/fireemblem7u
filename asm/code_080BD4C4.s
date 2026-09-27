	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD4C4
sub_080BD4C4: @ 0x080BD4C4
	push {lr}
	movs r1, #0x74
	str r1, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	ldr r0, _080BD4E8 @ =0x085E9AD4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BD4EC @ =0x085E9AF4
	ldr r1, _080BD4F0 @ =0x06010000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BD4E8: .4byte 0x085E9AD4
_080BD4EC: .4byte 0x085E9AF4
_080BD4F0: .4byte 0x06010000
