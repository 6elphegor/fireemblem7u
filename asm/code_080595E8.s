	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080595E8
sub_080595E8: @ 0x080595E8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059668 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805966C @ =0x08BA1E4C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059670 @ =0x081E848C
	str r0, [r5, #0x48]
	ldr r0, _08059674 @ =0x08BA1E64
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059678 @ =0x08BA1F08
	str r0, [r5, #0x54]
	ldr r0, _0805967C @ =0x08227128
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _08059680 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08059684 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059692
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059688
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08059692
	.align 2, 0
_08059668: .4byte 0x0201774C
_0805966C: .4byte 0x08BA1E4C
_08059670: .4byte 0x081E848C
_08059674: .4byte 0x08BA1E64
_08059678: .4byte 0x08BA1F08
_0805967C: .4byte 0x08227128
_08059680: .4byte 0x03002870
_08059684: .4byte 0x0203E02C
_08059688:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08059692:
	pop {r4, r5}
	pop {r0}
	bx r0
