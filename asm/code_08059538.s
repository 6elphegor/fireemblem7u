	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059538
sub_08059538: @ 0x08059538
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059590 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059594 @ =0x08BA1E4C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059598 @ =0x081E845A
	str r0, [r5, #0x48]
	ldr r0, _0805959C @ =0x08BA1E64
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080595A0 @ =0x08BA1F08
	str r0, [r5, #0x54]
	ldr r0, _080595A4 @ =0x08227108
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _080595A8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080595B6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080595AC
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _080595B6
	.align 2, 0
_08059590: .4byte 0x0201774C
_08059594: .4byte 0x08BA1E4C
_08059598: .4byte 0x081E845A
_0805959C: .4byte 0x08BA1E64
_080595A0: .4byte 0x08BA1F08
_080595A4: .4byte 0x08227108
_080595A8: .4byte 0x0203E02C
_080595AC:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_080595B6:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080595CC
	ldr r0, _080595C8 @ =0x03002870
	ldrh r1, [r0, #0x20]
	adds r1, #4
	b _080595D2
	.align 2, 0
_080595C8: .4byte 0x03002870
_080595CC:
	ldr r0, _080595E4 @ =0x03002870
	ldrh r1, [r0, #0x20]
	subs r1, #4
_080595D2:
	strh r1, [r0, #0x20]
	adds r1, r0, #0
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080595E4: .4byte 0x03002870
