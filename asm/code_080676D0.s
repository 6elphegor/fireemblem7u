	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterEfxSoundSeExist
RegisterEfxSoundSeExist: @ 0x080676D0
	ldr r1, _080676D8 @ =0x020200A4
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080676D8: .4byte 0x020200A4
