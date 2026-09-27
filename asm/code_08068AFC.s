	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEkrLvupDone
CheckEkrLvupDone: @ 0x08068AFC
	ldr r0, _08068B0C @ =0x020200AC
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08068B10
	movs r0, #0
	b _08068B12
	.align 2, 0
_08068B0C: .4byte 0x020200AC
_08068B10:
	movs r0, #1
_08068B12:
	bx lr
