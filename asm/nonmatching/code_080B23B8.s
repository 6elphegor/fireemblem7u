	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B23B8
sub_080B23B8: @ 0x080B23B8
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080B2414 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r2, _080B2414 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	adds r1, r2, #0
	movs r2, #0
	bl sub_080B209C
	adds r1, r0, #0
	ldr r2, _080B2414 @ =0x08CE7298
	ldr r0, [r2]
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080B2414 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r1, _080B2414 @ =0x08CE7298
	ldr r2, [r1]
	ldrh r1, [r2, #2]
	ldr r2, _080B2414 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #4]
	ldr r3, _080B2414 @ =0x08CE7298
	ldr r4, [r3]
	ldrh r3, [r4, #6]
	bl sub_080B21C0
	cmp r0, #0
	beq _080B241E
	cmp r0, #0
	bgt _080B2418
	movs r1, #1
	cmn r0, r1
	beq _080B246C
	b _080B241E
	.align 2, 0
_080B2414: .4byte 0x08CE7298
_080B2418:
	cmp r0, #1
	beq _080B2420
	b _080B241E
_080B241E:
	b _080B24AC
_080B2420:
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, _080B2468 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B2468 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r4, _080B2468 @ =0x08CE7298
	ldr r3, [r4]
	ldrh r4, [r3, #4]
	adds r3, r2, r4
	subs r2, r3, #1
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B24AC
	.align 2, 0
_080B2468: .4byte 0x08CE7298
_080B246C:
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, _080B24A8 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	subs r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B24A8 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B24AC
	.align 2, 0
_080B24A8: .4byte 0x08CE7298
_080B24AC:
	ldr r0, _080B24E8 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B24E8 @ =0x08CE7298
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B24E8 @ =0x08CE7298
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	ldr r2, _080B24E8 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #0xa]
	bl sub_080B224C
	adds r1, r0, #0
	ldr r2, _080B24E8 @ =0x08CE7298
	ldr r0, [r2]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B24E8: .4byte 0x08CE7298
