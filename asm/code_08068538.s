	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrClasschgRegisterDone
EkrClasschgRegisterDone: @ 0x08068538
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
