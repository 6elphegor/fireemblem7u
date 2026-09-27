	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEfxSoundType2FromBaseCon
GetEfxSoundType2FromBaseCon: @ 0x08067C9C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #4
	bls _08067CBE
	cmp r0, #8
	bhi _08067CB0
	movs r1, #1
	b _08067CBE
_08067CB0:
	cmp r0, #0xb
	bhi _08067CB8
	movs r1, #2
	b _08067CBE
_08067CB8:
	cmp r2, #0xf
	bhi _08067CBE
	movs r1, #3
_08067CBE:
	adds r0, r1, #0
	bx lr
	.align 2, 0
