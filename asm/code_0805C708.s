	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFenrirBG2_B
StartSubSpell_efxFenrirBG2_B: @ 0x0805C708
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805C764 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C768 @ =0x08BA2E70
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _0805C76C @ =0x081E82CC
	str r0, [r5, #0x48]
	ldr r0, _0805C770 @ =0x08BA1B68
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805C774 @ =0x08BA1B14
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _0805C778 @ =0x08252100
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805C77C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805C78A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C780
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805C78A
	.align 2, 0
_0805C764: .4byte 0x0201774C
_0805C768: .4byte 0x08BA2E70
_0805C76C: .4byte 0x081E82CC
_0805C770: .4byte 0x08BA1B68
_0805C774: .4byte 0x08BA1B14
_0805C778: .4byte 0x08252100
_0805C77C: .4byte 0x0203E02C
_0805C780:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805C78A:
	pop {r4, r5}
	pop {r0}
	bx r0
