	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_Preparefx
EkrDragon_Preparefx: @ 0x08064D4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #0x8a
	bl EkrPrepareBanimfx
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonBaseHide
	ldr r1, _08064D70 @ =0x0203E024
	movs r0, #0x13
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064D70: .4byte 0x0203E024
