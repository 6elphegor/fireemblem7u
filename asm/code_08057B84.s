	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057B84
sub_08057B84: @ 0x08057B84
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08057BAE
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _08057BB4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057BAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057BB4: .4byte 0x0201774C
