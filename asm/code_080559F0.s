	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTwobaiRSTMain
EfxTwobaiRSTMain: @ 0x080559F0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x44]
	cmp r0, r1
	bne _08055A0A
	adds r0, r2, #0
	bl Proc_Break
_08055A0A:
	pop {r0}
	bx r0
	.align 2, 0
