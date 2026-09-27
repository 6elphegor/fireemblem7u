	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxOuraBG_B
StartSubSpell_efxOuraBG_B: @ 0x08061004
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08061068 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806106C @ =0x08BA3D1C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08061070 @ =0x081E9436
	str r0, [r5, #0x48]
	ldr r0, _08061074 @ =0x08BA3D34
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061078 @ =0x0829DDD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806107C @ =0x0829E750
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08061080 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806108E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061084
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0806108E
	.align 2, 0
_08061068: .4byte 0x0201774C
_0806106C: .4byte 0x08BA3D1C
_08061070: .4byte 0x081E9436
_08061074: .4byte 0x08BA3D34
_08061078: .4byte 0x0829DDD8
_0806107C: .4byte 0x0829E750
_08061080: .4byte 0x0203E02C
_08061084:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0806108E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
