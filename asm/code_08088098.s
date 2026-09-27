	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088098
sub_08088098: @ 0x08088098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r0, r0, #3
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #8]
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _08088118
	cmp r1, r0
	bhi _080880F0
	cmp r1, #0
	beq _080880FE
	b _0808815A
_080880F0:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _08088130
	cmp r1, r2
	beq _08088148
	b _0808815A
_080880FE:
	ldr r0, _08088114 @ =0x03002870
	mov r1, r8
	ldrh r2, [r0, #0x1c]
	subs r1, r1, r2
	mov r8, r1
	mov r3, sb
	ldrh r0, [r0, #0x1e]
	subs r3, r3, r0
	mov sb, r3
	b _0808815A
	.align 2, 0
_08088114: .4byte 0x03002870
_08088118:
	ldr r0, _0808812C @ =0x03002870
	mov r4, r8
	ldrh r7, [r0, #0x20]
	subs r4, r4, r7
	mov r8, r4
	mov r1, sb
	ldrh r0, [r0, #0x22]
	subs r1, r1, r0
	mov sb, r1
	b _0808815A
	.align 2, 0
_0808812C: .4byte 0x03002870
_08088130:
	ldr r0, _08088144 @ =0x03002870
	mov r2, r8
	ldrh r3, [r0, #0x24]
	subs r2, r2, r3
	mov r8, r2
	mov r4, sb
	ldrh r0, [r0, #0x26]
	subs r4, r4, r0
	mov sb, r4
	b _0808815A
	.align 2, 0
_08088144: .4byte 0x03002870
_08088148:
	ldr r0, _0808821C @ =0x03002870
	mov r7, r8
	ldrh r1, [r0, #0x28]
	subs r7, r7, r1
	mov r8, r7
	mov r2, sb
	ldrh r0, [r0, #0x2a]
	subs r2, r2, r0
	mov sb, r2
_0808815A:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	adds r3, r6, #0
	adds r3, #0x5c
	str r3, [sp, #0x14]
	adds r4, r6, #0
	adds r4, #0x50
	str r4, [sp, #0xc]
	adds r7, r6, #0
	adds r7, #0x5b
	str r7, [sp, #0x10]
	cmp r1, #0
	beq _08088210
	mov r1, r8
	subs r1, #0x10
	ldr r0, _08088220 @ =0x000001FF
	ands r1, r0
	mov r4, sb
	subs r4, #0x18
	movs r2, #0xff
	ands r2, r4
	ldr r3, _08088224 @ =0x08CC3020
	ldr r0, _08088228 @ =0x000013D0
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	movs r5, #0
	adds r0, r6, #0
	adds r0, #0x61
	adds r7, r4, #0
	adds r6, r0, #0
	mov r0, r8
	subs r0, #8
	str r0, [sp, #0x18]
	movs r1, #0x14
	rsbs r1, r1, #0
	add r1, sb
	mov sl, r1
	ldrb r2, [r6]
	cmp r5, r2
	bge _080881D6
	mov r4, r8
	adds r4, #0x10
_080881B8:
	ldr r1, _08088220 @ =0x000001FF
	ands r1, r4
	ldr r0, _08088228 @ =0x000013D0
	str r0, [sp]
	movs r0, #0
	movs r2, #0xff
	ands r2, r7
	ldr r3, _0808822C @ =0x08CC3048
	bl PutSpriteExt
	adds r4, #8
	adds r5, #1
	ldrb r3, [r6]
	cmp r5, r3
	blt _080881B8
_080881D6:
	lsls r1, r5, #3
	adds r1, #0x10
	add r1, r8
	ldr r5, _08088220 @ =0x000001FF
	ands r1, r5
	movs r4, #0xff
	ands r7, r4
	ldr r3, _08088230 @ =0x08CC3034
	ldr r0, _08088228 @ =0x000013D0
	str r0, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	ldr r6, [sp, #0x18]
	ands r6, r5
	str r6, [sp, #0x18]
	mov r7, sl
	ands r7, r4
	mov sl, r7
	ldr r3, _08088234 @ =0x08CC305C
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	mov r2, sl
	bl PutSpriteExt
_08088210:
	movs r5, #0
	ldr r1, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _0808828E
	.align 2, 0
_0808821C: .4byte 0x03002870
_08088220: .4byte 0x000001FF
_08088224: .4byte 0x08CC3020
_08088228: .4byte 0x000013D0
_0808822C: .4byte 0x08CC3048
_08088230: .4byte 0x08CC3034
_08088234: .4byte 0x08CC305C
_08088238:
	movs r2, #0
	str r2, [sp, #4]
	adds r4, r5, #1
	b _08088272
_08088240:
	ldr r3, [sp, #4]
	lsls r1, r3, #5
	add r1, r8
	ldr r0, _080882C4 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #4
	add r2, sb
	movs r0, #0xff
	ands r2, r0
	lsls r0, r3, #2
	ldr r6, [sp, #0xc]
	ldrh r6, [r6]
	adds r0, r6, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	ldr r7, [sp, #8]
	adds r0, r0, r7
	str r0, [sp]
	movs r0, #2
	ldr r3, _080882C8 @ =0x08B905F8
	bl PutSpriteExt
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
_08088272:
	ldr r1, [sp, #0x10]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808827E
	adds r0, #3
_0808827E:
	asrs r0, r0, #2
	ldr r2, [sp, #4]
	cmp r2, r0
	blt _08088240
	adds r5, r4, #0
	ldr r3, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r3, r0]
_0808828E:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	blt _08088238
	movs r0, #3
	ldr r4, [sp, #0x10]
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _08088336
	ldr r6, [sp, #0x10]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _080882B2
	adds r0, r1, #3
_080882B2:
	asrs r0, r0, #2
	lsls r6, r0, #2
	lsls r0, r0, #5
	add r8, r0
	movs r5, #0
	ldr r7, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r7, r0]
	b _0808832C
	.align 2, 0
_080882C4: .4byte 0x000001FF
_080882C8: .4byte 0x08B905F8
_080882CC:
	movs r0, #0
	str r0, [sp, #4]
	adds r4, r5, #1
	b _08088306
_080882D4:
	ldr r2, [sp, #4]
	lsls r1, r2, #3
	add r1, r8
	ldr r0, _08088374 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #4
	add r2, sb
	movs r0, #0xff
	ands r2, r0
	ldr r3, [sp, #0xc]
	ldrh r3, [r3]
	adds r0, r3, r6
	ldr r7, [sp, #4]
	adds r0, r0, r7
	lsls r3, r5, #6
	adds r0, r0, r3
	ldr r3, [sp, #8]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08088378 @ =0x08B905D0
	bl PutSpriteExt
	adds r7, #1
	str r7, [sp, #4]
_08088306:
	ldr r0, [sp, #0x10]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08088314
	adds r0, r1, #3
_08088314:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _080882D4
	adds r5, r4, #0
	ldr r2, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r2, r0]
_0808832C:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	blt _080882CC
_08088336:
	ldr r3, [sp, #4]
	lsls r1, r3, #5
	add r1, r8
	ldr r0, _08088374 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #4
	add r2, sb
	movs r0, #0xff
	ands r2, r0
	ldr r3, _0808837C @ =0x08B905F8
	ldr r4, [sp, #4]
	lsls r0, r4, #2
	ldr r6, [sp, #0xc]
	ldrh r6, [r6]
	adds r0, r6, r0
	lsls r4, r5, #6
	adds r0, r0, r4
	ldr r7, [sp, #8]
	adds r0, r0, r7
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088374: .4byte 0x000001FF
_08088378: .4byte 0x08B905D0
_0808837C: .4byte 0x08B905F8
