	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808702C
sub_0808702C: @ 0x0808702C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r7, [r3]
	adds r4, r5, #0
	adds r4, #0x3e
	movs r0, #0
	strb r0, [r4]
	ldr r1, _0808705C @ =0x08B857F8
	ldr r6, [r1]
	ldrh r2, [r6, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08087060
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl StartChapterStatusHelpBox
	b _0808713A
	.align 2, 0
_0808705C: .4byte 0x08B857F8
_08087060:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080870B8
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _08087094
	ldr r0, [r2, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08087094
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	bl SetStatScreenLastUnitId
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_08087094:
	ldr r0, _080870B0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080870A6
	ldr r0, _080870B4 @ =0x0000038A
	bl m4aSongNumStart
_080870A6:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0808713A
	.align 2, 0
_080870B0: .4byte 0x0202BBF8
_080870B4: .4byte 0x0000038A
_080870B8:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080870E4
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080870DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808713A
	ldr r0, _080870E0 @ =0x0000038B
	bl m4aSongNumStart
	b _0808713A
	.align 2, 0
_080870DC: .4byte 0x0202BBF8
_080870E0: .4byte 0x0000038B
_080870E4:
	movs r0, #0x20
	ldrh r6, [r6, #6]
	ands r0, r6
	cmp r0, #0
	beq _080870F8
	ldrb r0, [r3]
	cmp r0, #0
	beq _080870F8
	subs r0, #1
	strb r0, [r3]
_080870F8:
	ldr r1, [r1]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _08087112
	ldrb r0, [r4]
	cmp r0, #0
	bne _08087112
	adds r0, #1
	strb r0, [r4]
_08087112:
	ldrb r0, [r4]
	cmp r0, r7
	beq _0808713A
	ldr r0, _08087140 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808712A
	ldr r0, _08087144 @ =0x00000386
	bl m4aSongNumStart
_0808712A:
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08086C10
_0808713A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087140: .4byte 0x0202BBF8
_08087144: .4byte 0x00000386
