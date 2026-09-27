	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonUpdatePal_08065510
EkrDragonUpdatePal_08065510: @ 0x08064D20
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064D44 @ =0x082E589C
	ldr r4, _08064D48 @ =0x020228E0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064D44: .4byte 0x082E589C
_08064D48: .4byte 0x020228E0
