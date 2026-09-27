	.include "macro.inc"

	.syntax unified

	thumb_func_start UnregisterEfxSoundSeExist
UnregisterEfxSoundSeExist: @ 0x080676C4
	ldr r1, _080676CC @ =0x020200A4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080676CC: .4byte 0x020200A4
