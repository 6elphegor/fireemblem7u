	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086008
sub_08086008: @ 0x08086008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _08086190 @ =0x08CC2B94
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	cmp r1, #0
	bge _08086076
	cmp r0, #0
	bge _08086076
	ldr r4, _08086194 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _08086198 @ =0x02022C60
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808619C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _080861A0 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086076:
	mov r0, r8
	cmp r0, #0
	ble _080860C6
	mov r1, sb
	cmp r1, #0
	bge _080860C6
	ldr r4, _080861A4 @ =0x02023486
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _080861A8 @ =0x02022C86
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808619C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _080861A0 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_080860C6:
	mov r0, r8
	cmp r0, #0
	bge _08086120
	mov r1, sb
	cmp r1, #0
	ble _08086120
	ldr r5, _080861AC @ =0x020237E0
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080861B0 @ =0x02022FE0
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080861B4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _080861BC @ =0x02003564
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086120:
	mov r0, r8
	cmp r0, #0
	ble _0808617A
	mov r1, sb
	cmp r1, #0
	ble _0808617A
	ldr r5, _080861C0 @ =0x02023806
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080861C4 @ =0x02023006
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080861B4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _080861BC @ =0x02003564
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_0808617A:
	movs r0, #3
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086190: .4byte 0x08CC2B94
_08086194: .4byte 0x02023460
_08086198: .4byte 0x02022C60
_0808619C: .4byte 0x02003764
_080861A0: .4byte 0x02003264
_080861A4: .4byte 0x02023486
_080861A8: .4byte 0x02022C86
_080861AC: .4byte 0x020237E0
_080861B0: .4byte 0x02022FE0
_080861B4: .4byte 0x020039E4
_080861B8: .4byte 0xFFFFFC80
_080861BC: .4byte 0x02003564
_080861C0: .4byte 0x02023806
_080861C4: .4byte 0x02023006
