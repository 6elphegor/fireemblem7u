	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxElfireBG_Loop
EfxElfireBG_Loop: @ 0x080587DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _08058804
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _0805880C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805880C: .4byte 0x0201774C
