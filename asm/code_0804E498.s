	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxFarAttackWithDistance
NewEfxFarAttackWithDistance: @ 0x0804E498
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0804E4B4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804E564
	lsls r0, r0, #2
	ldr r1, _0804E4B8 @ =_0804E4BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E4B4: .4byte 0x0203E02C
_0804E4B8: .4byte _0804E4BC
_0804E4BC: @ jump table
	.4byte _0804E564 @ case 0
	.4byte _0804E4D0 @ case 1
	.4byte _0804E4D0 @ case 2
	.4byte _0804E564 @ case 3
	.4byte _0804E564 @ case 4
_0804E4D0:
	ldr r0, _0804E504 @ =0x08B9AD6C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimPosition
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0804E50C
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, _0804E508 @ =0x0203E02C
	b _0804E526
	.align 2, 0
_0804E504: .4byte 0x08B9AD6C
_0804E508: .4byte 0x0203E02C
_0804E50C:
	ldr r0, _0804E51C @ =0x0203E02C
	adds r2, r0, #0
	ldrh r0, [r2]
	cmp r0, #1
	bne _0804E520
	movs r0, #5
	b _0804E522
	.align 2, 0
_0804E51C: .4byte 0x0203E02C
_0804E520:
	movs r0, #7
_0804E522:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_0804E526:
	movs r1, #0xf0
	ldrh r2, [r2]
	cmp r2, #1
	bne _0804E530
	movs r1, #0x20
_0804E530:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne _0804E548
	rsbs r0, r1, #0
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b _0804E556
_0804E548:
	movs r0, #0
	strh r0, [r4, #0x32]
	rsbs r1, r1, #0
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
_0804E556:
	ldr r1, _0804E56C @ =0x0201FB00
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, _0804E570 @ =0x02017748
	movs r0, #1
	str r0, [r1]
_0804E564:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E56C: .4byte 0x0201FB00
_0804E570: .4byte 0x02017748
