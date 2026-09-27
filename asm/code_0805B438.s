	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B438
sub_0805B438: @ 0x0805B438
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B48C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B490 @ =0x08BA2B68
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B494 @ =0x081E8A6A
	str r0, [r5, #0x48]
	ldr r0, _0805B498 @ =0x08BA2B94
	str r0, [r5, #0x4c]
	ldr r0, _0805B49C @ =0x08BA2B80
	str r0, [r5, #0x54]
	ldr r0, _0805B4A0 @ =0x08279EA4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805B4A4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805B4B4
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B4A8
	movs r0, #1
	movs r1, #0xf8
	b _0805B4AC
	.align 2, 0
_0805B48C: .4byte 0x0201774C
_0805B490: .4byte 0x08BA2B68
_0805B494: .4byte 0x081E8A6A
_0805B498: .4byte 0x08BA2B94
_0805B49C: .4byte 0x08BA2B80
_0805B4A0: .4byte 0x08279EA4
_0805B4A4: .4byte 0x0203E02C
_0805B4A8:
	movs r0, #1
	movs r1, #0x18
_0805B4AC:
	movs r2, #0
	bl SetBgOffset
	b _0805B4C8
_0805B4B4:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B4C8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
_0805B4C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
