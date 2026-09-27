	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058AC4
sub_08058AC4: @ 0x08058AC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058B18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058B1C @ =0x08BA1C24
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058B20 @ =0x081E8378
	str r0, [r5, #0x48]
	ldr r0, _08058B24 @ =0x08BA1C3C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08058B28 @ =0x08BA1C54
	str r0, [r5, #0x54]
	ldr r0, _08058B2C @ =0x0821BBA8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08058B30 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058B3E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08058B34
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058B3E
	.align 2, 0
_08058B18: .4byte 0x0201774C
_08058B1C: .4byte 0x08BA1C24
_08058B20: .4byte 0x081E8378
_08058B24: .4byte 0x08BA1C3C
_08058B28: .4byte 0x08BA1C54
_08058B2C: .4byte 0x0821BBA8
_08058B30: .4byte 0x0203E02C
_08058B34:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058B3E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
