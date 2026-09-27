	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLunaBG3
StartSubSpell_efxLunaBG3: @ 0x0805FA00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805FA58 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FA5C @ =0x08BA38EC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805FA60 @ =0x081E92D4
	str r0, [r5, #0x48]
	ldr r0, _0805FA64 @ =0x08BA3904
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805FA68 @ =0x08BA3934
	str r0, [r5, #0x54]
	ldr r0, _0805FA6C @ =0x08295850
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805FA70 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805FA7E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805FA74
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805FA7E
	.align 2, 0
_0805FA58: .4byte 0x0201774C
_0805FA5C: .4byte 0x08BA38EC
_0805FA60: .4byte 0x081E92D4
_0805FA64: .4byte 0x08BA3904
_0805FA68: .4byte 0x08BA3934
_0805FA6C: .4byte 0x08295850
_0805FA70: .4byte 0x0203E02C
_0805FA74:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805FA7E:
	pop {r4, r5}
	pop {r0}
	bx r0
