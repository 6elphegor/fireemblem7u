	.include "macro.inc"

	.syntax unified

	thumb_func_start TrapDamageDisplay_Watch
TrapDamageDisplay_Watch: @ 0x080331B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	ldrh r1, [r2, #2]
	cmp r1, r0
	beq _080331DA
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
_080331DA:
	pop {r4}
	pop {r0}
	bx r0
