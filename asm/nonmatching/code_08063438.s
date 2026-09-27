	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSRankWeaponEffect
NewEfxSRankWeaponEffect: @ 0x08063438
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _08063454 @ =0x08BA44DC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063454: .4byte 0x08BA44DC
