	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_PalSpriteAnim_LoopIn
StatusHealEffect_PalSpriteAnim_LoopIn: @ 0x08032D24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl StatusHealEffect_PalSpriteAnim_SetOutlineIntensity
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _08032D4A
	adds r0, r5, #0
	bl Proc_Break
_08032D4A:
	pop {r4, r5}
	pop {r0}
	bx r0
