	.include "macro.inc"

	.syntax unified

	thumb_func_start InitRightAnim
InitRightAnim: @ 0x08054474
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, _0805455C @ =0x081D856C
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, _08054560 @ =0x081D859E
	ldr r0, _08054564 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _08054568 @ =0x02000030
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, _0805456C @ =0x02000034
	strh r1, [r0, #2]
	ldr r0, _08054570 @ =0x02000028
	strh r2, [r0, #2]
	ldr r1, _08054574 @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, _08054578 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805457C @ =0x02011BC8
	adds r0, r1, r0
	cmp r3, #0xff
	bne _080544C6
	ldr r0, _08054580 @ =0x08B9B28C
_080544C6:
	adds r1, r4, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054570 @ =0x02000028
	ldr r0, _08054584 @ =0x0201FB00
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054574 @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, _08054588 @ =0x02002088
	str r0, [r2, #0x2c]
	ldr r0, _0805458C @ =0x020099C8
	str r0, [r2, #0x30]
	ldr r0, _08054590 @ =0x02000000
	str r2, [r0, #8]
	ldr r0, _08054578 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805457C @ =0x02011BC8
	adds r0, r1, r0
	cmp r6, #0xff
	bne _08054518
	ldr r0, _08054580 @ =0x08B9B28C
_08054518:
	adds r1, r7, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054570 @ =0x02000028
	ldr r0, _08054584 @ =0x0201FB00
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054574 @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, _08054588 @ =0x02002088
	str r0, [r2, #0x2c]
	ldr r0, _0805458C @ =0x020099C8
	str r0, [r2, #0x30]
	ldr r0, _08054590 @ =0x02000000
	str r2, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805455C: .4byte 0x081D856C
_08054560: .4byte 0x081D859E
_08054564: .4byte 0x0203E02C
_08054568: .4byte 0x02000030
_0805456C: .4byte 0x02000034
_08054570: .4byte 0x02000028
_08054574: .4byte 0x0200002C
_08054578: .4byte 0x02000060
_0805457C: .4byte 0x02011BC8
_08054580: .4byte 0x08B9B28C
_08054584: .4byte 0x0201FB00
_08054588: .4byte 0x02002088
_0805458C: .4byte 0x020099C8
_08054590: .4byte 0x02000000
