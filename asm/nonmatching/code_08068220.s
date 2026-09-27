	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrClasschgFinished
EkrClasschgFinished: @ 0x08068220
	ldr r0, _08068230 @ =0x020200A8
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08068234
	movs r0, #0
	b _08068236
	.align 2, 0
_08068230: .4byte 0x020200A8
_08068234:
	movs r0, #1
_08068236:
	bx lr
