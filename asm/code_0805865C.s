	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFireHITBG
StartSubSpell_efxFireHITBG: @ 0x0805865C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080586B4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080586B8 @ =0x08BA1AFC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080586BC @ =0x081E82CC
	str r0, [r5, #0x48]
	ldr r0, _080586C0 @ =0x08BA1B68
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080586C4 @ =0x08BA1B14
	str r0, [r5, #0x54]
	ldr r0, _080586C8 @ =0x08207A18
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _080586CC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080586DA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080586D0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _080586DA
	.align 2, 0
_080586B4: .4byte 0x0201774C
_080586B8: .4byte 0x08BA1AFC
_080586BC: .4byte 0x081E82CC
_080586C0: .4byte 0x08BA1B68
_080586C4: .4byte 0x08BA1B14
_080586C8: .4byte 0x08207A18
_080586CC: .4byte 0x0203E02C
_080586D0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_080586DA:
	pop {r4, r5}
	pop {r0}
	bx r0
