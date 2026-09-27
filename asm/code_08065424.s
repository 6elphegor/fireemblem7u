	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_WaitForFadeOut
EkrDragon_WaitForFadeOut: @ 0x08065424
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	bne _0806543E
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806543E:
	pop {r4}
	pop {r0}
	bx r0
