	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062620
sub_08062620: @ 0x08062620
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08062640
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08062640:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
