	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSRankWeaponEffectBG
NewEfxSRankWeaponEffectBG: @ 0x080634C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08063504 @ =0x08BA44F4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08063508 @ =0x081F3440
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806350C @ =0x081F3500
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r2, _08063510 @ =0x081F3520
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063504: .4byte 0x08BA44F4
_08063508: .4byte 0x081F3440
_0806350C: .4byte 0x081F3500
_08063510: .4byte 0x081F3520
