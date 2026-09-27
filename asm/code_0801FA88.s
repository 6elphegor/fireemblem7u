	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801FA88
sub_0801FA88: @ 0x0801FA88
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FAAA
	adds r0, r4, #0
	bl Proc_Break
_0801FAAA:
	pop {r4}
	pop {r0}
	bx r0
