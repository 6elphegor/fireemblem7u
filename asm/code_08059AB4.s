	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059AB4
sub_08059AB4: @ 0x08059AB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059B24 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059B28 @ =0x08BA206C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059B2C @ =0x081E85CE
	str r0, [r5, #0x48]
	ldr r0, _08059B30 @ =0x08BA2150
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059B34 @ =0x08BA2084
	str r0, [r5, #0x54]
	ldr r0, _08059B38 @ =0x08232BB0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, _08059B3C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _08059B40 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059B4E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059B44
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059B4E
	.align 2, 0
_08059B24: .4byte 0x0201774C
_08059B28: .4byte 0x08BA206C
_08059B2C: .4byte 0x081E85CE
_08059B30: .4byte 0x08BA2150
_08059B34: .4byte 0x08BA2084
_08059B38: .4byte 0x08232BB0
_08059B3C: .4byte 0x03002870
_08059B40: .4byte 0x0203E02C
_08059B44:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059B4E:
	pop {r4, r5}
	pop {r0}
	bx r0
