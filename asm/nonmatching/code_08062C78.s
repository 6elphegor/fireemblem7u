	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxMagfcastMain
EfxMagfcastMain: @ 0x08062C78
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08062C90
	adds r0, r1, #0
	bl Proc_Break
_08062C90:
	pop {r0}
	bx r0
