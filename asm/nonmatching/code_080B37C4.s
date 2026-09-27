	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B37C4
sub_080B37C4: @ 0x080B37C4
	push {r4, lr}
	ldr r0, _080B3838 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B37D6
	movs r3, #0
_080B37D6:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B3830
	ldr r1, _080B383C @ =0x02000814
	movs r0, #2
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _080B3804
	ldr r1, _080B3840 @ =0x0203E668
	cmp r3, #0
	bne _080B37F8
	ldr r0, _080B3844 @ =0x0203E660
	ldr r0, [r0]
	str r0, [r1]
_080B37F8:
	ldr r2, _080B3848 @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B3804:
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080B3830
	ldr r0, _080B384C @ =0x02000815
	ldrb r1, [r0]
	cmp r3, r1
	blo _080B3830
	adds r0, r1, #0
	adds r0, #0x28
	cmp r3, r0
	bge _080B3830
	subs r0, r3, r1
	lsls r0, r0, #1
	ldr r1, _080B3850 @ =0x02022AE0
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080B3854 @ =0x05000268
	strh r1, [r0]
	subs r0, #0x20
	strh r1, [r0]
_080B3830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3838: .4byte 0x04000006
_080B383C: .4byte 0x02000814
_080B3840: .4byte 0x0203E668
_080B3844: .4byte 0x0203E660
_080B3848: .4byte 0x04000040
_080B384C: .4byte 0x02000815
_080B3850: .4byte 0x02022AE0
_080B3854: .4byte 0x05000268
