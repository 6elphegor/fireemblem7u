	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080575D4
sub_080575D4: @ 0x080575D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080575FE
	bl SpellFx_ClearBG1
	ldr r1, _08057604 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080575FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057604: .4byte 0x0201774C
