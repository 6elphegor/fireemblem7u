	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrBaseKaiten
NewEkrBaseKaiten: @ 0x08051274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r3, _080512DC @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080512E0 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _080512E4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _080512E8 @ =0x0203E02E
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r1, #4
	ldrsh r2, [r0, r1]
	cmp r3, r2
	bne _080512EC
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt _08051318
	movs r4, #6
	b _08051318
	.align 2, 0
_080512DC: .4byte 0x03002870
_080512E0: .4byte 0x0000FFE0
_080512E4: .4byte 0x0000E0FF
_080512E8: .4byte 0x0203E02E
_080512EC:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _08051302
	movs r4, #4
	cmp r3, r2
	bge _08051318
	movs r4, #0
	b _08051318
_08051302:
	cmp r3, r2
	bge _08051310
	movs r4, #1
	cmp r1, r0
	blt _08051318
	movs r4, #7
	b _08051318
_08051310:
	movs r4, #3
	cmp r1, r0
	blt _08051318
	movs r4, #5
_08051318:
	ldr r0, _0805132C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _08051330
	cmp r0, #1
	bge _0805133C
	cmp r0, #0
	beq _08051334
	b _0805133C
	.align 2, 0
_0805132C: .4byte 0x0203E02C
_08051330:
	cmp r0, #4
	bne _0805133C
_08051334:
	ldr r0, _08051338 @ =0x08B9B0B4
	b _0805133E
	.align 2, 0
_08051338: .4byte 0x08B9B0B4
_0805133C:
	ldr r0, _08051370 @ =0x08B9B0D4
_0805133E:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, _08051374 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _08051378 @ =0x081E7FF8
	ldr r1, _0805137C @ =0x02022AE0
	movs r2, #1
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _08051380 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls _08051366
	b _08051642
_08051366:
	lsls r0, r0, #2
	ldr r1, _08051384 @ =_08051388
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051370: .4byte 0x08B9B0D4
_08051374: .4byte 0x06010000
_08051378: .4byte 0x081E7FF8
_0805137C: .4byte 0x02022AE0
_08051380: .4byte 0x0203E02C
_08051384: .4byte _08051388
_08051388: @ jump table
	.4byte _0805139C @ case 0
	.4byte _0805143C @ case 1
	.4byte _0805143C @ case 2
	.4byte _080515A8 @ case 3
	.4byte _0805139C @ case 4
_0805139C:
	ldr r0, _080513EC @ =0x08B9B09C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, _080513F0 @ =0x0203E02E
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080513F8
	ldr r0, _080513F4 @ =0x08B9B0F4
	b _080513FA
	.align 2, 0
_080513EC: .4byte 0x08B9B09C
_080513F0: .4byte 0x0203E02E
_080513F4: .4byte 0x08B9B0F4
_080513F8:
	ldr r0, _08051428 @ =0x08B9B154
_080513FA:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805142C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051432
	.align 2, 0
_08051428: .4byte 0x08B9B154
_0805142C:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051432:
	strh r0, [r2, #4]
	ldr r0, _08051438 @ =0x08B9B1B4
	b _08051636
	.align 2, 0
_08051438: .4byte 0x08B9B1B4
_0805143C:
	ldr r0, _08051498 @ =0x08B9B09C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _0805149C @ =0x0203E02E
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _080514A0 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #1
	bne _0805148E
	ldr r1, _080514A4 @ =0x081D85A4
	ldr r0, _080514A8 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_0805148E:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080514B0
	ldr r0, _080514AC @ =0x08B9B114
	b _080514B2
	.align 2, 0
_08051498: .4byte 0x08B9B09C
_0805149C: .4byte 0x0203E02E
_080514A0: .4byte 0x02017744
_080514A4: .4byte 0x081D85A4
_080514A8: .4byte 0x0203E02C
_080514AC: .4byte 0x08B9B114
_080514B0:
	ldr r0, _080514E0 @ =0x08B9B174
_080514B2:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080514E4
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _080514EA
	.align 2, 0
_080514E0: .4byte 0x08B9B174
_080514E4:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_080514EA:
	strh r0, [r2, #4]
	ldr r0, _08051558 @ =0x08B9B1D4
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, _0805155C @ =0x08B9B09C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08051560 @ =0x0203E02E
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _08051564 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0805154C
	ldr r1, _08051568 @ =0x081D85A4
	ldr r0, _0805156C @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
_0805154C:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051574
	ldr r0, _08051570 @ =0x08B9B134
	b _08051576
	.align 2, 0
_08051558: .4byte 0x08B9B1D4
_0805155C: .4byte 0x08B9B09C
_08051560: .4byte 0x0203E02E
_08051564: .4byte 0x02017744
_08051568: .4byte 0x081D85A4
_0805156C: .4byte 0x0203E02C
_08051570: .4byte 0x08B9B134
_08051574:
	ldr r0, _080515A4 @ =0x08B9B194
_08051576:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805162C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051632
	.align 2, 0
_080515A4: .4byte 0x08B9B194
_080515A8:
	ldr r0, _080515EC @ =0x08B9B09C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _080515F0 @ =0x0203E02E
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080515F8
	ldr r0, _080515F4 @ =0x08B9B134
	b _080515FA
	.align 2, 0
_080515EC: .4byte 0x08B9B09C
_080515F0: .4byte 0x0203E02E
_080515F4: .4byte 0x08B9B134
_080515F8:
	ldr r0, _08051628 @ =0x08B9B194
_080515FA:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805162C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051632
	.align 2, 0
_08051628: .4byte 0x08B9B194
_0805162C:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051632:
	strh r0, [r2, #4]
	ldr r0, _08051648 @ =0x08B9B1F4
_08051636:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
_08051642:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051648: .4byte 0x08B9B1F4
