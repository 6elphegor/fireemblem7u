	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterTitleGfx
PutChapterTitleGfx: @ 0x08082308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_080822A4
	adds r7, r0, #0
	lsls r0, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r1, r1, r0
	mov r8, r1
	adds r0, r7, #0
	bl sub_08082224
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r1, _08082354 @ =0x0203E698
	ldr r2, _08082358 @ =0x000003FF
	adds r0, r2, #0
	ands r4, r0
	movs r0, #0
	strh r4, [r1, #2]
	str r0, [sp]
	ldr r2, _0808235C @ =0x01000200
	mov r0, sp
	mov r1, r8
	bl CpuFastSet
	ldr r0, _08082360 @ =0x0840260C
	ldr r1, _08082364 @ =0x02020140
	bl Decompress
	b _080823C6
	.align 2, 0
_08082354: .4byte 0x0203E698
_08082358: .4byte 0x000003FF
_0808235C: .4byte 0x01000200
_08082360: .4byte 0x0840260C
_08082364: .4byte 0x02020140
_08082368:
	adds r0, r7, #0
	bl sub_080820E8
	adds r2, r0, #0
	cmp r2, #0x80
	bne _08082386
	cmp r6, r5
	bls _0808237C
	adds r0, r6, #3
	b _0808237E
_0808237C:
	adds r0, r5, #3
_0808237E:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	b _080823C4
_08082386:
	lsls r1, r2, #3
	ldr r0, _0808239C @ =0x08CC2784
	adds r4, r1, r0
	ldrb r3, [r4]
	subs r1, r6, r3
	ldrb r3, [r4, #1]
	subs r0, r5, r3
	cmp r1, r0
	ble _080823A0
	adds r5, r6, #0
	b _080823A2
	.align 2, 0
_0808239C: .4byte 0x08CC2784
_080823A0:
	adds r6, r5, #0
_080823A2:
	ldr r0, _080823DC @ =0x02020140
	mov r1, r8
	adds r3, r6, #0
	bl sub_08082168
	adds r0, r6, #0
	adds r0, #0xff
	ldrb r1, [r4, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xff
	ldrb r4, [r4, #3]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080823C4:
	adds r7, #1
_080823C6:
	ldrb r0, [r7]
	cmp r0, #0
	beq _080823D0
	cmp r0, #0x1f
	bne _08082368
_080823D0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080823DC: .4byte 0x02020140
