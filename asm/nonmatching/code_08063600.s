	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxSRankWeaponEffectSCR2Main
EfxSRankWeaponEffectSCR2Main: @ 0x08063600
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806363C
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806363C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
