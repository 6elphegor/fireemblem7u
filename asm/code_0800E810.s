	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LynModeDeathFadeToBlack
EvtCmd_LynModeDeathFadeToBlack: @ 0x0800E810
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E826
	movs r0, #0
	b _0800E83E
_0800E826:
	bl GetLynModeDeathFlag
	lsls r0, r0, #0x18
	movs r1, #4
	cmp r0, #0
	beq _0800E834
	movs r1, #0x10
_0800E834:
	adds r0, r1, #0
	adds r1, r4, #0
	bl StartLockingFadeToBlack
	movs r0, #2
_0800E83E:
	pop {r4}
	pop {r1}
	bx r1
