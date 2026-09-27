	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPlayCriticalHittedSFX
EfxPlayCriticalHittedSFX: @ 0x08067D78
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08067DB4
	cmp r0, #0
	blt _08067DB4
	adds r0, r5, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08067DB4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08067DB4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
