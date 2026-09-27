	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080849D0
sub_080849D0: @ 0x080849D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _08084A30 @ =0x08CC2B94
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _080849F4
	movs r4, #0xe
_080849F4:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084A3C
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08084A34 @ =0x02022C60
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084A38 @ =0x02023460
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _08084A5C
	.align 2, 0
_08084A30: .4byte 0x08CC2B94
_08084A34: .4byte 0x02022C60
_08084A38: .4byte 0x02023460
_08084A3C:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08084AB4 @ =0x02022C84
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084AB8 @ =0x02023484
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_08084A5C:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084ABC @ =0x08CC2BF4
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084AC0 @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084AD4
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084AC4 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _08084AC8 @ =0x02022C60
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08084ACC @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084AD0 @ =0x02023460
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _08084AFA
	.align 2, 0
_08084AB4: .4byte 0x02022C84
_08084AB8: .4byte 0x02023484
_08084ABC: .4byte 0x08CC2BF4
_08084AC0: .4byte 0x08CC2B94
_08084AC4: .4byte 0x0200323C
_08084AC8: .4byte 0x02022C60
_08084ACC: .4byte 0x0200373C
_08084AD0: .4byte 0x02023460
_08084AD4:
	ldr r0, _08084B24 @ =0x0200323C
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08084B28 @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08084B2C @ =0x0200373C
	ldr r1, _08084B30 @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_08084AFA:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08084B1A
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08084B1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B24: .4byte 0x0200323C
_08084B28: .4byte 0x02022C60
_08084B2C: .4byte 0x0200373C
_08084B30: .4byte 0x02023460
