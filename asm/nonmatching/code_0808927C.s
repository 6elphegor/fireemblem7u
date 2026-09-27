	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808927C
sub_0808927C: @ 0x0808927C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _080892C8 @ =0x0840F348
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _080892D0
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r5, [r4]
	lsrs r0, r5, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _080892CC @ =0x08CC3488
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0xb8
	bl PutSpriteExt
	b _080892F6
	.align 2, 0
_080892C8: .4byte 0x0840F348
_080892CC: .4byte 0x08CC3488
_080892D0:
	ldr r1, _0808936C @ =0x000020B8
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r2, [r4]
	lsrs r0, r2, #3
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08089370 @ =0x08CC3488
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	bl PutSpriteExt
_080892F6:
	str r4, [sp, #0x14]
	ldr r1, _08089374 @ =0x08CC3550
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x90
	lsls r5, r5, #8
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0x20
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _08089378 @ =0x08CC3490
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xa0
	movs r2, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _0808937C @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	ldr r4, [r6, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bls _08089384
	ldr r1, _08089380 @ =0x08CC3578
	adds r3, r4, #0
	adds r3, #0x2d
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r5, [r2]
	lsls r0, r5, #3
	adds r0, r0, r5
	ldrb r3, [r3]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl PutUiHand
	b _0808939A
	.align 2, 0
_0808936C: .4byte 0x000020B8
_08089370: .4byte 0x08CC3488
_08089374: .4byte 0x08CC3550
_08089378: .4byte 0x08CC3490
_0808937C: .4byte 0x0200E668
_08089380: .4byte 0x08CC3578
_08089384:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x40
	ldr r3, _080893E8 @ =0x08CC3498
	str r5, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
_0808939A:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne _080893AC
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _080893F4
_080893AC:
	ldr r0, _080893EC @ =0x02022860
	ldr r1, _080893F0 @ =0x02012970
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl EnablePalSync
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov r8, r0
	cmp r1, #0
	bne _08089430
	movs r0, #1
	bl sub_08089038
	movs r0, #1
	mov r4, r8
	strb r0, [r4]
	b _08089430
	.align 2, 0
_080893E8: .4byte 0x08CC3498
_080893EC: .4byte 0x02022860
_080893F0: .4byte 0x02012970
_080893F4:
	ldr r2, _080894D8 @ =0x02022860
	ldr r3, _080894DC @ =0x02012970
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r5, [r4]
	lsrs r0, r5, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x3a
	str r4, [sp, #0x18]
	mov r8, r0
	ldrb r2, [r0]
	cmp r2, #1
	bne _08089430
	movs r0, #0
	bl sub_08089038
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
_08089430:
	bl SyncUnitSpriteSheet
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	rsbs r0, r0, #0
	mov sl, r0
	movs r5, #0
	ldr r0, _080894E0 @ =0x0200E668
	movs r4, #0x30
	adds r4, r4, r6
	mov sb, r4
	ldrb r0, [r0]
	cmp r7, r0
	bge _08089482
	ldr r1, _080894E4 @ =0x0200CBF0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	str r0, [sp, #0x1c]
_0808945A:
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, [sp, #0x1c]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl PutUnitSprite
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt _08089482
	ldr r0, _080894E0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808945A
_08089482:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _080894AE
	adds r3, r5, r7
	ldr r0, _080894E0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bge _080894AE
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, _080894E4 @ =0x0200CBF0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl PutUnitSprite
_080894AE:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	adds r2, r0, #0
	adds r2, #0x2e
	ldrb r1, [r1]
	ldrb r2, [r2]
	cmp r1, r2
	bhs _080894E8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _080894E8
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #1
	movs r2, #1
	bl sub_08088E80
	b _080894F4
	.align 2, 0
_080894D8: .4byte 0x02022860
_080894DC: .4byte 0x02012970
_080894E0: .4byte 0x0200E668
_080894E4: .4byte 0x0200CBF0
_080894E8:
	mov r4, sb
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0
	bl sub_08088E80
_080894F4:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	cmp r1, #1
	bls _08089516
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08089516
	mov r5, sb
	ldrb r1, [r5]
	movs r0, #0
	movs r2, #1
	bl sub_08088E80
	b _08089522
_08089516:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_08088E80
_08089522:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #5
	bls _08089536
	movs r0, #0
	strb r0, [r1]
_08089536:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
