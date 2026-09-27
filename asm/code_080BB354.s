	.include "macro.inc"

	.syntax unified

	thumb_func_start HBlank_80BBDD0
HBlank_80BBDD0: @ 0x080BB354
	push {r4, r5, r6, lr}
	ldr r0, _080BB4A4 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bls _080BB366
	movs r4, #0
_080BB366:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r6, _080BB4A8 @ =0x03001620
	cmp r0, #0
	beq _080BB3EC
	ldr r0, [r6]
	ands r0, r1
	cmp r0, #0
	beq _080BB38E
	ldr r2, _080BB4AC @ =0x04000010
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BB4B4 @ =0x04000012
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BB38E:
	ldr r5, [r6]
	movs r0, #2
	ands r0, r5
	adds r3, r5, #0
	cmp r0, #0
	beq _080BB3AE
	ldr r2, _080BB4B8 @ =0x04000014
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BB4BC @ =0x04000016
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BB3AE:
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _080BB3D0
	ldr r2, _080BB4C0 @ =0x04000018
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	adds r2, #2
	adds r0, #0xa0
	ldr r1, _080BB4C4 @ =0x03002870
	ldrb r0, [r0]
	ldrh r1, [r1, #0x26]
	adds r0, r0, r1
	strh r0, [r2]
_080BB3D0:
	movs r0, #8
	ands r5, r0
	cmp r5, #0
	beq _080BB3EC
	ldr r2, _080BB4C8 @ =0x0400001C
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BB4CC @ =0x0400001E
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BB3EC:
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB462
	cmp r4, #0x83
	bne _080BB410
	ldr r1, _080BB4D0 @ =0x04000050
	movs r2, #0xf4
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
_080BB410:
	cmp r4, #0x83
	bls _080BB444
	cmp r4, #0x93
	bhi _080BB430
	adds r1, r4, #0
	subs r1, #0x84
	ldr r0, _080BB4D4 @ =0x020072BC
	ldr r0, [r0]
	muls r1, r0, r1
	asrs r1, r1, #4
	ldr r2, _080BB4D8 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BB430:
	cmp r4, #0x94
	bne _080BB444
	ldr r2, _080BB4D8 @ =0x04000052
	ldr r0, _080BB4D4 @ =0x020072BC
	ldr r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BB444:
	cmp r4, #0
	bne _080BB462
	ldr r2, _080BB4D0 @ =0x04000050
	ldr r1, _080BB4DC @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r3, [r1, #8]
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strh r0, [r2]
_080BB462:
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BB47A
	ldr r0, _080BB4BC @ =0x04000016
	movs r1, #1
	ands r1, r4
	lsrs r2, r4, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
_080BB47A:
	ldr r0, [r6]
	movs r1, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BB49E
	cmp r4, #0x9f
	bne _080BB490
	ldr r1, _080BB4D0 @ =0x04000050
	ldr r2, _080BB4E0 @ =0x00000441
	adds r0, r2, #0
	strh r0, [r1]
_080BB490:
	cmp r4, #1
	bne _080BB49E
	ldr r1, _080BB4D8 @ =0x04000052
	ldr r0, _080BB4E4 @ =0x02007500
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	strh r0, [r1]
_080BB49E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB4A4: .4byte 0x04000006
_080BB4A8: .4byte 0x03001620
_080BB4AC: .4byte 0x04000010
_080BB4B0: .4byte 0x020072B4
_080BB4B4: .4byte 0x04000012
_080BB4B8: .4byte 0x04000014
_080BB4BC: .4byte 0x04000016
_080BB4C0: .4byte 0x04000018
_080BB4C4: .4byte 0x03002870
_080BB4C8: .4byte 0x0400001C
_080BB4CC: .4byte 0x0400001E
_080BB4D0: .4byte 0x04000050
_080BB4D4: .4byte 0x020072BC
_080BB4D8: .4byte 0x04000052
_080BB4DC: .4byte 0x030028AC
_080BB4E0: .4byte 0x00000441
_080BB4E4: .4byte 0x02007500
