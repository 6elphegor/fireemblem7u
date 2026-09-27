	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLiveBG_B
StartSubSpell_efxLiveBG_B: @ 0x0805D0F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0805D140 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D144 @ =0x08BA30D0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq _0805D158
	cmp r6, #2
	bhi _0805D1A2
	ldr r0, _0805D148 @ =0x081E8CC2
	str r0, [r5, #0x48]
	ldr r0, _0805D14C @ =0x0826B454
	str r0, [r5, #0x4c]
	ldr r0, _0805D150 @ =0x0826BDB4
	str r0, [r5, #0x50]
	ldr r0, _0805D154 @ =0x0826AC5C
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b _0805D1A2
	.align 2, 0
_0805D140: .4byte 0x0201774C
_0805D144: .4byte 0x08BA30D0
_0805D148: .4byte 0x081E8CC2
_0805D14C: .4byte 0x0826B454
_0805D150: .4byte 0x0826BDB4
_0805D154: .4byte 0x0826AC5C
_0805D158:
	ldr r0, _0805D188 @ =0x081E8CB6
	str r0, [r5, #0x48]
	ldr r0, _0805D18C @ =0x08269E88
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805D190 @ =0x08269CF8
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805D194 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D1A2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D198
	movs r0, #1
	movs r1, #0xe8
	b _0805D19C
	.align 2, 0
_0805D188: .4byte 0x081E8CB6
_0805D18C: .4byte 0x08269E88
_0805D190: .4byte 0x08269CF8
_0805D194: .4byte 0x0203E02C
_0805D198:
	movs r0, #1
	movs r1, #0x18
_0805D19C:
	movs r2, #0
	bl SetBgOffset
_0805D1A2:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0
