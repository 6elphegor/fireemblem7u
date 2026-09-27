	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxResireBG
StartSubSpell_efxResireBG: @ 0x08059A28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08059A88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059A8C @ =0x08BA203C
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, _08059A90 @ =0x081E8502
	str r0, [r6, #0x48]
	ldr r0, _08059A94 @ =0x08BA2150
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, _08059A98 @ =0x08BA2084
	str r0, [r6, #0x54]
	ldr r0, _08059A9C @ =0x08232BB0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08059AA0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059AAE
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059AA4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059AAE
	.align 2, 0
_08059A88: .4byte 0x0201774C
_08059A8C: .4byte 0x08BA203C
_08059A90: .4byte 0x081E8502
_08059A94: .4byte 0x08BA2150
_08059A98: .4byte 0x08BA2084
_08059A9C: .4byte 0x08232BB0
_08059AA0: .4byte 0x0203E02C
_08059AA4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059AAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
