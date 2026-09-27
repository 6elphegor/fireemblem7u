	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEfxSoundSeExist
CheckEfxSoundSeExist: @ 0x080676DC
	ldr r0, _080676E4 @ =0x020200A4
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080676E4: .4byte 0x020200A4
