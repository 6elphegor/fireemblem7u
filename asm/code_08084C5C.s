	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084C5C
sub_08084C5C: @ 0x08084C5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08084C9C @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084CA8
	ldr r0, _08084CA0 @ =0x02022FA0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084CA4 @ =0x020237A0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _08084CC0
	.align 2, 0
_08084C9C: .4byte 0x08CC2B94
_08084CA0: .4byte 0x02022FA0
_08084CA4: .4byte 0x020237A0
_08084CA8:
	ldr r0, _08084D14 @ =0x02022FD0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084D18 @ =0x020237D0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_08084CC0:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084D1C @ =0x08CC2BFA
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084D20 @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084D34
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084D24 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _08084D28 @ =0x02022FA0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084D2C @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084D30 @ =0x020237A0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08084D5A
	.align 2, 0
_08084D14: .4byte 0x02022FD0
_08084D18: .4byte 0x020237D0
_08084D1C: .4byte 0x08CC2BFA
_08084D20: .4byte 0x08CC2B94
_08084D24: .4byte 0x0200323C
_08084D28: .4byte 0x02022FA0
_08084D2C: .4byte 0x0200373C
_08084D30: .4byte 0x020237A0
_08084D34:
	ldr r0, _08084D80 @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08084D84 @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084D88 @ =0x020039BC
	ldr r1, _08084D8C @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08084D5A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08084D78
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08084D78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084D80: .4byte 0x020034BC
_08084D84: .4byte 0x02022C60
_08084D88: .4byte 0x020039BC
_08084D8C: .4byte 0x02023460
