	.include "macro.inc"

	.syntax unified

	thumb_func_start GameOverScreen_LoopFadeIn
GameOverScreen_LoopFadeIn: @ 0x08020354
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08020382
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020382
	adds r0, r4, #0
	bl Proc_Break
_08020382:
	pop {r4}
	pop {r0}
	bx r0
