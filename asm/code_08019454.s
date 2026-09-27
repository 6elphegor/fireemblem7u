	.include "macro.inc"

	.syntax unified

	thumb_func_start PutLimitViewSquare
PutLimitViewSquare: @ 0x08019454
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x10]
	lsls r0, r0, #5
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r4, r4, r0
	cmp r4, #0
	bne _0801946E
	bl nullsub_7
_0801946E:
	ldr r0, _08019490 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08019498
	movs r1, #0x85
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _08019494 @ =0x00004281
	b _080194D2
	.align 2, 0
_08019490: .4byte 0x0202E3E4
_08019494: .4byte 0x00004281
_08019498:
	ldr r0, _080194BC @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080194F0
	ldrh r0, [r4]
	cmp r0, #0
	beq _080194C8
	ldr r1, _080194C0 @ =0x00005284
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _080194C4 @ =0x00005285
	b _080194D2
	.align 2, 0
_080194BC: .4byte 0x0202E3E8
_080194C0: .4byte 0x00005284
_080194C4: .4byte 0x00005285
_080194C8:
	movs r1, #0xa5
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _080194EC @ =0x00005281
_080194D2:
	adds r0, r2, #0
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	b _080194FE
	.align 2, 0
_080194EC: .4byte 0x00005281
_080194F0:
	strh r1, [r4]
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_080194FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
