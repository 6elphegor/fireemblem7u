	.include "macro.inc"

	.syntax unified

	thumb_func_start StartFadeFromBlack
StartFadeFromBlack: @ 0x08013F1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F34 @ =0x08B9294C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F34: .4byte 0x08B9294C
