	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxGetCamMovDuration
EfxGetCamMovDuration: @ 0x08050778
	ldr r0, _08050788 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0805078C
	movs r0, #0x18
	b _08050796
	.align 2, 0
_08050788: .4byte 0x0203E02C
_0805078C:
	cmp r0, #1
	beq _08050794
	movs r0, #0
	b _08050796
_08050794:
	movs r0, #0x10
_08050796:
	bx lr
