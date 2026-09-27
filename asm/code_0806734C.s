	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrsubAnimeEmulatorMain
EkrsubAnimeEmulatorMain: @ 0x0806734C
	push {r4, r5, lr}
	sub sp, #0x48
	adds r2, r0, #0
	ldr r1, [r2, #0x44]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080673C4
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r1, #0x3f
	ldrb r0, [r0, #3]
	ands r1, r0
	cmp r1, #0
	bne _080673A2
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08067392
	cmp r0, #1
	bgt _08067384
	cmp r0, #0
	beq _0806738A
	b _080673C4
_08067384:
	cmp r0, #2
	beq _08067398
	b _080673C4
_0806738A:
	adds r0, r2, #0
	bl Proc_Break
	b _080673FE
_08067392:
	strh r0, [r2, #0x2c]
	strh r1, [r2, #0x2e]
	b _080673C4
_08067398:
	movs r0, #1
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	b _080673C2
_080673A2:
	cmp r1, #4
	bne _080673AA
	strh r3, [r2, #0x2c]
	b _080673BE
_080673AA:
	ldr r0, _08067408 @ =0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x48]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
	strh r0, [r2, #0x2c]
_080673BE:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
_080673C2:
	strh r0, [r2, #0x2e]
_080673C4:
	ldrh r0, [r2, #0x2c]
	subs r0, #1
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r3, [r0]
	cmp r3, #0
	bne _080673FE
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _080673FE
	str r0, [sp, #0x3c]
	mov r1, sp
	ldr r0, [r2, #0x4c]
	strh r0, [r1, #8]
	ldr r0, [r2, #0x50]
	str r0, [sp, #0x1c]
	ldrh r5, [r2, #0x32]
	ldrh r4, [r2, #0x34]
	adds r0, r5, r4
	strh r0, [r1, #2]
	ldrh r5, [r2, #0x3a]
	ldrh r4, [r2, #0x3c]
	adds r0, r5, r4
	strh r0, [r1, #4]
	mov r0, sp
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080673FE:
	add sp, #0x48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067408: .4byte 0x0FFFFFFC
