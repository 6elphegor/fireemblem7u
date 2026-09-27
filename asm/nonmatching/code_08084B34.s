	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084B34
sub_08084B34: @ 0x08084B34
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08084B6C @ =0x08CC2B94
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
	bge _08084B78
	ldr r0, _08084B70 @ =0x02022FA0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084B74 @ =0x020237A0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _08084B90
	.align 2, 0
_08084B6C: .4byte 0x08CC2B94
_08084B70: .4byte 0x02022FA0
_08084B74: .4byte 0x020237A0
_08084B78:
	ldr r0, _08084BE4 @ =0x02022FD0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084BE8 @ =0x020237D0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_08084B90:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084BEC @ =0x08CC2BF7
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084BF0 @ =0x08CC2B94
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
	bge _08084C04
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084BF4 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _08084BF8 @ =0x02022FA0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084BFC @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084C00 @ =0x020237A0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08084C2A
	.align 2, 0
_08084BE4: .4byte 0x02022FD0
_08084BE8: .4byte 0x020237D0
_08084BEC: .4byte 0x08CC2BF7
_08084BF0: .4byte 0x08CC2B94
_08084BF4: .4byte 0x0200323C
_08084BF8: .4byte 0x02022FA0
_08084BFC: .4byte 0x0200373C
_08084C00: .4byte 0x020237A0
_08084C04:
	ldr r0, _08084C4C @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08084C50 @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084C54 @ =0x020039BC
	ldr r1, _08084C58 @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08084C2A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08084C44
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08084C44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084C4C: .4byte 0x020034BC
_08084C50: .4byte 0x02022C60
_08084C54: .4byte 0x020039BC
_08084C58: .4byte 0x02023460
