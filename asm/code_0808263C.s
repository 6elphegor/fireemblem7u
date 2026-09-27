	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSpriteTalkBox
PutSpriteTalkBox: @ 0x0808263C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	mov sb, r1
	adds r7, r2, #0
	mov r8, r3
	cmp r7, #0x1f
	bgt _08082656
	movs r7, #0x20
_08082656:
	cmp r7, #0xc0
	ble _0808265C
	movs r7, #0xc0
_0808265C:
	mov r0, r8
	cmp r0, #0xf
	bgt _08082666
	movs r1, #0x10
	mov r8, r1
_08082666:
	mov r3, r8
	cmp r3, #0x30
	ble _08082670
	movs r0, #0x30
	mov r8, r0
_08082670:
	adds r0, r7, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _0808267A
	adds r0, #0x1f
_0808267A:
	asrs r0, r0, #5
	mov r1, r8
	adds r1, #0xf
	cmp r1, #0
	bge _08082686
	adds r1, #0xf
_08082686:
	asrs r1, r1, #4
	str r1, [sp, #4]
	subs r6, r0, #1
	str r6, [sp, #0x18]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x14]
	mov r3, sb
	add r3, r8
	str r3, [sp, #0xc]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0x10]
	mov r1, sl
	adds r1, r1, r7
	str r1, [sp, #8]
	cmp r6, #0
	blt _080826F2
_080826AA:
	ldr r5, [sp, #4]
	subs r4, r6, #1
	cmp r5, #0
	blt _080826EC
_080826B2:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _080826BC
	adds r1, r7, #0
_080826BC:
	subs r1, #0x20
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080826C8
	mov r0, r8
_080826C8:
	subs r0, #0x10
	add r1, sl
	mov r3, sb
	adds r2, r3, r0
	ldr r3, _080827F0 @ =0x0203E6A0
	lsls r0, r6, #2
	ldrh r3, [r3, #0x30]
	adds r0, r3, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0
	ldr r3, _080827F4 @ =0x08B905F8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080826B2
_080826EC:
	adds r6, r4, #0
	cmp r6, #0
	bge _080826AA
_080826F2:
	ldr r6, [sp, #0x18]
	cmp r6, #0
	blt _08082734
	ldr r5, _080827F0 @ =0x0203E6A0
_080826FA:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _08082704
	adds r1, r7, #0
_08082704:
	subs r1, #0x20
	mov r0, sl
	adds r4, r0, r1
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _080827F8 @ =0x08B90608
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0xc]
	ldr r3, _080827FC @ =0x08B90618
	bl PutSprite
	subs r6, #1
	cmp r6, #0
	bge _080826FA
_08082734:
	ldr r5, [sp, #4]
	cmp r5, #0
	blt _08082776
	ldr r6, _080827F0 @ =0x0203E6A0
_0808273C:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08082746
	mov r0, r8
_08082746:
	subs r0, #0x10
	mov r1, sb
	adds r4, r1, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _08082800 @ =0x08B905D0
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r4, #0
	ldr r3, _08082804 @ =0x08B90620
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808273C
_08082776:
	ldr r3, _08082808 @ =0x08B905B0
	ldr r4, _080827F0 @ =0x0203E6A0
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _0808280C @ =0x08B90628
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08082810 @ =0x08B90630
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r3, _08082814 @ =0x08B90638
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _080827DE
	mov r2, sb
	subs r2, #0xb
	ldr r3, _080827F4 @ =0x08B905F8
	ldr r0, _08082818 @ =0x000003FF
	ldrh r4, [r4, #0x30]
	ands r0, r4
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	bl PutSprite
_080827DE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080827F0: .4byte 0x0203E6A0
_080827F4: .4byte 0x08B905F8
_080827F8: .4byte 0x08B90608
_080827FC: .4byte 0x08B90618
_08082800: .4byte 0x08B905D0
_08082804: .4byte 0x08B90620
_08082808: .4byte 0x08B905B0
_0808280C: .4byte 0x08B90628
_08082810: .4byte 0x08B90630
_08082814: .4byte 0x08B90638
_08082818: .4byte 0x000003FF
