	.include "macro.inc"

	.syntax unified

	thumb_func_start MassEffectDisplay_Watch
MassEffectDisplay_Watch: @ 0x08032ED0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
