	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808A770
sub_0808A770: @ 0x0808A770
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, _0808A7D0 @ =0x08CC342C
	ldrh r2, [r5, #0x3c]
	adds r0, r2, r0
	ldrb r2, [r1]
	ldrb r0, [r0]
	adds r0, r2, r0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808A79C
	movs r0, #0x14
	strb r0, [r1]
_0808A79C:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x36
	str r0, [sp, #8]
	movs r1, #0x2f
	adds r1, r1, r5
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #4]
_0808A7B6:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	mov r0, sl
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808A7D4
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	adds r0, r1, r3
	cmp r0, #0x14
	bgt _0808A7DC
	b _0808A7E2
	.align 2, 0
_0808A7D0: .4byte 0x08CC342C
_0808A7D4:
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r3, r0
	bge _0808A7E0
_0808A7DC:
	movs r1, #0
	b _0808A7E8
_0808A7E0:
	subs r0, r3, r0
_0808A7E2:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0808A7E8:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r1, r3, #1
	mov sb, r1
	cmp r4, r0
	bge _0808A82C
	movs r2, #0x1f
	mov r8, r2
	ldr r0, _0808A8A8 @ =0x02022C60
	mov ip, r0
	ldr r7, _0808A8AC @ =0x0200CCF0
	adds r2, r6, #0
_0808A806:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808A806
_0808A82C:
	ldr r0, _0808A8B0 @ =0x02023C60
	ldr r1, _0808A8B4 @ =0x0200D4F0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
_0808A83C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0808A83C
	mov r3, sb
	cmp r3, #0x13
	ble _0808A7B6
	movs r0, #5
	bl EnableBgSync
	ldr r2, [sp, #0xc]
	ldrb r2, [r2]
	cmp r2, #0x13
	bls _0808A910
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _0808A8B8 @ =0x02023DB0
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808A8BC @ =0x02022C70
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, _0808A8C0 @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0808A88E:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0808A88E
	bl ClearIcons
	ldrb r0, [r4]
	bl sub_08088CD4
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808A8E0
	.align 2, 0
_0808A8A8: .4byte 0x02022C60
_0808A8AC: .4byte 0x0200CCF0
_0808A8B0: .4byte 0x02023C60
_0808A8B4: .4byte 0x0200D4F0
_0808A8B8: .4byte 0x02023DB0
_0808A8BC: .4byte 0x02022C70
_0808A8C0: .4byte 0x0200E66C
_0808A8C4:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A920 @ =0x0200CCF0
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808A8E0:
	cmp r4, r0
	bge _0808A8EC
	ldr r0, _0808A924 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A8C4
_0808A8EC:
	ldr r0, _0808A928 @ =0x0200D4F0
	mov r2, sl
	ldrb r1, [r2]
	bl UnitList_DrawColumnNames
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl sub_0808AC90
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
_0808A910:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A920: .4byte 0x0200CCF0
_0808A924: .4byte 0x0200E668
_0808A928: .4byte 0x0200D4F0
