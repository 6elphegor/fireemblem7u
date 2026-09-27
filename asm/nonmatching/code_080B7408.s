	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7408
sub_080B7408: @ 0x080B7408
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0xf0
	mov sb, r0
	movs r5, #0
_080B741C:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x46
	movs r2, #0
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	adds r4, r0, #0
	adds r4, #0xa0
	cmp r4, #0
	bge _080B744E
	rsbs r0, r4, #0
	mov r1, sb
	bl __modsi3
	adds r2, r0, #0
	cmp r2, #0x17
	bgt _080B744A
	movs r0, #0x80
	lsls r0, r0, #1
	subs r4, r0, r2
	b _080B744E
_080B744A:
	mov r3, sb
	subs r4, r3, r2
_080B744E:
	movs r0, #0xff
	ands r4, r0
	cmp r4, #0x9f
	ble _080B745E
	adds r0, r5, #1
	mov r8, r0
	cmp r4, #0xe8
	ble _080B7496
_080B745E:
	lsls r0, r5, #0xb
	adds r5, #1
	mov r8, r5
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080B74AC @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r2, #0xa4
	lsls r2, r2, #8
	adds r5, r0, r2
	movs r7, #8
	movs r6, #6
_080B747A:
	str r5, [sp]
	movs r0, #4
	adds r1, r7, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B74B0 @ =0x08B905F8
	bl PutSpriteExt
	adds r5, #4
	adds r7, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080B747A
_080B7496:
	mov r5, r8
	cmp r5, #9
	ble _080B741C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B74AC: .4byte 0x0001FFFF
_080B74B0: .4byte 0x08B905F8
