	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08063458
sub_08063458: @ 0x08063458
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063472
	ldr r0, [r6, #0x5c]
	bl NewEfxSRankWeaponEffectBG
	b _080634BC
_08063472:
	cmp r0, #0x15
	bne _08063486
	ldr r0, [r6, #0x5c]
	movs r1, #0x2d
	movs r2, #1
	bl NewEfxRestWINH_
	bl sub_0806353C
	b _080634BC
_08063486:
	cmp r0, #0x46
	bne _080634BC
	ldr r5, _080634C4 @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_080634BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080634C4: .4byte 0x02000000
