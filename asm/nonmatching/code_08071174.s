	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08071174
sub_08071174: @ 0x08071174
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	ldr r0, _080711A8 @ =0x0203A4F0
	str r0, [r7, #0xc]
	ldr r1, _080711AC @ =0x0203A3F0
	adds r0, r1, #0
	movs r1, #0
	bl sub_08071088
	ldr r1, _080711B0 @ =0x0203A470
	adds r0, r1, #0
	movs r1, #1
	bl sub_08071088
	bl ClearBattleHits
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7]
_0807119E:
	ldr r0, [r7]
	cmp r0, #4
	ble _080711B4
	b _08071204
	.align 2, 0
_080711A8: .4byte 0x0203A4F0
_080711AC: .4byte 0x0203A3F0
_080711B0: .4byte 0x0203A470
_080711B4:
	movs r0, #0
	str r0, [r7, #4]
_080711B8:
	ldr r0, [r7, #4]
	cmp r0, #1
	ble _080711C0
	b _080711F4
_080711C0:
	ldr r1, _080711E8 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080711EC
	movs r0, #1
	str r0, [r7, #0x10]
	b _080711F4
	.align 2, 0
_080711E8: .4byte 0x08C9D938
_080711EC:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080711B8
_080711F4:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080711FC
	b _08071204
_080711FC:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0807119E
_08071204:
	ldr r0, [r7]
	cmp r0, #5
	bne _08071214
	ldr r0, [r7, #4]
	cmp r0, #2
	bne _08071214
	movs r0, #0
	b _080713E2
_08071214:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #8]
_08071220:
	ldr r0, [r7, #8]
	cmp r0, #9
	ble _08071228
	b _080713C2
_08071228:
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	str r0, [r7]
	ldr r0, [r7, #8]
	movs r1, #1
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _08071284 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	cmp r0, #8
	bhi _08071316
	lsls r1, r0, #2
	ldr r2, _08071288 @ =_0807128C
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071284: .4byte 0x08C9D938
_08071288: .4byte _0807128C
_0807128C: @ jump table
	.4byte _080712E2 @ case 0
	.4byte _080712E2 @ case 1
	.4byte _080712E2 @ case 2
	.4byte _080712E2 @ case 3
	.4byte _080712B0 @ case 4
	.4byte _080712B0 @ case 5
	.4byte _080712B0 @ case 6
	.4byte _080712B0 @ case 7
	.4byte _080712F8 @ case 8
_080712B0:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071316
_080712E2:
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071316
_080712F8:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071316
_08071316:
	ldr r1, [r7, #0x10]
	subs r0, r1, #2
	cmp r0, #6
	bhi _080713AA
	lsls r1, r0, #2
	ldr r2, _08071328 @ =_0807132C
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071328: .4byte _0807132C
_0807132C: @ jump table
	.4byte _08071348 @ case 0
	.4byte _08071368 @ case 1
	.4byte _0807138A @ case 2
	.4byte _080713AA @ case 3
	.4byte _08071348 @ case 4
	.4byte _08071368 @ case 5
	.4byte _0807138A @ case 6
_08071348:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080713AA
_08071366:
	.byte 0x20, 0xE0
_08071368:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080713AA
_08071388:
	.byte 0x0F, 0xE0
_0807138A:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080713AA
_080713A8:
	.byte 0xFF, 0xE7
_080713AA:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080713B2
	b _080713B4
_080713B2:
	b _080713BA
_080713B4:
	ldr r0, [r7, #0xc]
	adds r1, r0, #4
	str r1, [r7, #0xc]
_080713BA:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08071220
_080713C2:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #2]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	movs r0, #1
	b _080713E2
_080713E2:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
