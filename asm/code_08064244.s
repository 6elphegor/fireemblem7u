	.include "macro.inc"

	.syntax unified

	thumb_func_start StartClassReelSpellAnim
StartClassReelSpellAnim: @ 0x08064244
	push {r4, lr}
	adds r4, r0, #0
	bl GetMagicEffectBufferFor
	ldr r1, _08064264 @ =0x08BA47D8
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064264: .4byte 0x08BA47D8
