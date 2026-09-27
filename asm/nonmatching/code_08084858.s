	.include "macro.inc"

	.syntax unified

	thumb_func_start MMB_Loop_SlideIn
MMB_Loop_SlideIn: @ 0x08084858
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _080848A4 @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _0808487A
	movs r4, #0xe
_0808487A:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080848B0
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _080848A8 @ =0x02022C60
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080848AC @ =0x02023460
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _080848D0
	.align 2, 0
_080848A4: .4byte 0x08CC2B94
_080848A8: .4byte 0x02022C60
_080848AC: .4byte 0x02023460
_080848B0:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08084928 @ =0x02022C84
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808492C @ =0x02023484
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_080848D0:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084930 @ =0x08CC2BF0
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084934 @ =0x08CC2B94
	adds r0, r7, #0
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
	bge _08084948
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084938 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _0808493C @ =0x02022C60
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08084940 @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084944 @ =0x02023460
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _0808496E
	.align 2, 0
_08084928: .4byte 0x02022C84
_0808492C: .4byte 0x02023484
_08084930: .4byte 0x08CC2BF0
_08084934: .4byte 0x08CC2B94
_08084938: .4byte 0x0200323C
_0808493C: .4byte 0x02022C60
_08084940: .4byte 0x0200373C
_08084944: .4byte 0x02023460
_08084948:
	ldr r0, _080849B8 @ =0x0200323C
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _080849BC @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _080849C0 @ =0x0200373C
	ldr r1, _080849C4 @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_0808496E:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _080849AC
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, _080849C8 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _080849CC @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl UnitMapUiUpdate
_080849AC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080849B8: .4byte 0x0200323C
_080849BC: .4byte 0x02022C60
_080849C0: .4byte 0x0200373C
_080849C4: .4byte 0x02023460
_080849C8: .4byte 0x0202BBB8
_080849CC: .4byte 0x0202E3DC
