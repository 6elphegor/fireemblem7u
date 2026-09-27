	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLiveBG_A
StartSubSpell_efxLiveBG_A: @ 0x0805D03C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0805D084 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D088 @ =0x08BA30D0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq _0805D09C
	cmp r6, #2
	bhi _0805D0EE
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805D08C @ =0x081E8CBC
	str r0, [r5, #0x48]
	ldr r0, _0805D090 @ =0x0826B454
	str r0, [r5, #0x4c]
	ldr r0, _0805D094 @ =0x0826BDB4
	str r0, [r5, #0x50]
	ldr r0, _0805D098 @ =0x0826AC5C
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b _0805D0EE
	.align 2, 0
_0805D084: .4byte 0x0201774C
_0805D088: .4byte 0x08BA30D0
_0805D08C: .4byte 0x081E8CBC
_0805D090: .4byte 0x0826B454
_0805D094: .4byte 0x0826BDB4
_0805D098: .4byte 0x0826AC5C
_0805D09C:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805D0D4 @ =0x081E8CB0
	str r0, [r5, #0x48]
	ldr r0, _0805D0D8 @ =0x08269E88
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805D0DC @ =0x08269CF8
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805D0E0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D0EE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D0E4
	movs r0, #1
	movs r1, #0x18
	b _0805D0E8
	.align 2, 0
_0805D0D4: .4byte 0x081E8CB0
_0805D0D8: .4byte 0x08269E88
_0805D0DC: .4byte 0x08269CF8
_0805D0E0: .4byte 0x0203E02C
_0805D0E4:
	movs r0, #1
	movs r1, #0xe8
_0805D0E8:
	movs r2, #0
	bl SetBgOffset
_0805D0EE:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0
