	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDamageMojiEffectOBJ
NewEfxDamageMojiEffectOBJ: @ 0x080624E0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08062504 @ =0x08BA41EC
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	cmp r4, #0
	bne _0806250C
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _08062508 @ =0x08B9D9F0
	b _08062512
	.align 2, 0
_08062504: .4byte 0x08BA41EC
_08062508: .4byte 0x08B9D9F0
_0806250C:
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _0806254C @ =0x08B9DA64
_08062512:
	adds r0, r5, #0
	bl GetAnimPosition
	movs r2, #0xa2
	lsls r2, r2, #7
	cmp r0, #0
	bne _08062524
	movs r2, #0xc2
	lsls r2, r2, #7
_08062524:
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r3, #4
	ldrsh r1, [r5, r3]
	subs r1, #0x28
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	adds r2, r4, #0
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x60]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806254C: .4byte 0x08B9DA64
