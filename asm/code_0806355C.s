	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxSRankWeaponEffectSCRMain
EfxSRankWeaponEffectSCRMain: @ 0x0806355C
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, _080635A4 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _080635A8 @ =0x0201FDB8
	cmp r0, #0
	bne _0806356C
	ldr r4, _080635AC @ =0x0201FEF8
_0806356C:
	movs r3, #0
	movs r7, #0x88
	lsls r7, r7, #0x10
	movs r6, #0x88
	ldr r5, _080635B0 @ =0x08BA453C
_08063576:
	cmp r3, #0x77
	bhi _080635C2
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r2, ip
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080635BE
	cmp r3, #0x3b
	bhi _080635B8
	adds r0, r3, #0
	subs r0, #0x88
	cmp r1, r0
	bhs _080635BE
	ldr r1, _080635B4 @ =0x0000FF78
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080635BE
	.align 2, 0
_080635A4: .4byte 0x0201FDAC
_080635A8: .4byte 0x0201FDB8
_080635AC: .4byte 0x0201FEF8
_080635B0: .4byte 0x08BA453C
_080635B4: .4byte 0x0000FF78
_080635B8:
	cmp r1, r6
	bls _080635BE
	lsrs r2, r7, #0x10
_080635BE:
	strh r2, [r4]
	b _080635C6
_080635C2:
	movs r0, #0
	strh r0, [r4]
_080635C6:
	adds r4, #2
	ldr r2, _080635DC @ =0xFFFF0000
	adds r7, r7, r2
	subs r6, #1
	adds r5, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _08063576
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080635DC: .4byte 0xFFFF0000
