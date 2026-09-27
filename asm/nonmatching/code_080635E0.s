	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSRankWeaponEffectSCR2
NewEfxSRankWeaponEffectSCR2: @ 0x080635E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080635FC @ =0x08BA4524
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080635FC: .4byte 0x08BA4524
