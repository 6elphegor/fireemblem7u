	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAnimSpriteRotScaleX
GetAnimSpriteRotScaleX: @ 0x0806740C
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08067424 @ =0x082E5AF8
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08067424: .4byte 0x082E5AF8
