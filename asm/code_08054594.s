	.include "macro.inc"

	.syntax unified

	thumb_func_start SwitchAISFrameDataFromBARoundType
SwitchAISFrameDataFromBARoundType: @ 0x08054594
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _080545B4
	ldr r0, _080545B0 @ =0x081D856C
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b _080545C2
	.align 2, 0
_080545B0: .4byte 0x081D856C
_080545B4:
	ldr r2, _080545E0 @ =0x081D856C
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
_080545C2:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq _08054608
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080545EC
	ldr r0, _080545E4 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080545E8 @ =0x0200F1C8
	b _080545F8
	.align 2, 0
_080545E0: .4byte 0x081D856C
_080545E4: .4byte 0x0200005C
_080545E8: .4byte 0x0200F1C8
_080545EC:
	ldr r0, _08054600 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054604 @ =0x02011BC8
_080545F8:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b _08054612
	.align 2, 0
_08054600: .4byte 0x02000060
_08054604: .4byte 0x02011BC8
_08054608:
	ldr r0, _08054658 @ =0x08B9B28C
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
_08054612:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldr r0, _0805465C @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	movs r0, #0xe0
	lsls r0, r0, #3
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, _08054660 @ =0x020041C8
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl AnimSort
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054658: .4byte 0x08B9B28C
_0805465C: .4byte 0x0000F3FF
_08054660: .4byte 0x020041C8
