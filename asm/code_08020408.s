	.include "macro.inc"

	.syntax unified

	thumb_func_start GameOverScreen_LoopFadeOut
GameOverScreen_LoopFadeOut: @ 0x08020408
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0802042C
	adds r0, r4, #0
	bl Proc_Break
_0802042C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
