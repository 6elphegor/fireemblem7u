	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSpecalEffect
NewEfxSpecalEffect: @ 0x0806337C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080633B0 @ =0x02017768
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080633CA
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080633B8
	ldr r0, _080633B4 @ =0x0203E094
	b _080633BA
	.align 2, 0
_080633B0: .4byte 0x02017768
_080633B4: .4byte 0x0203E094
_080633B8:
	ldr r0, _080633F8 @ =0x0203E098
_080633BA:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08063400
_080633CA:
	ldr r4, _080633FC @ =0x02000000
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0x40
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	b _08063422
	.align 2, 0
_080633F8: .4byte 0x0203E098
_080633FC: .4byte 0x02000000
_08063400:
	ldr r0, _08063428 @ =0x08BA44C4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xf0
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r5, #0
	bl NewEfxSRankWeaponEffect
_08063422:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063428: .4byte 0x08BA44C4
