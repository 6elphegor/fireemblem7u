	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B74B4
sub_080B74B4: @ 0x080B74B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r1, #0
	ldr r0, _080B7528 @ =0x0001FFFF
	mov sl, r0
_080B74C6:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, #0
	adds r4, #0x18
	lsls r0, r1, #0xb
	adds r1, #1
	mov sb, r1
	movs r1, #0xff
	ands r4, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	movs r7, #0xa4
	lsls r7, r7, #8
	movs r6, #8
	mov r1, sl
	ands r0, r1
	lsrs r0, r0, #5
	mov r8, r0
	movs r5, #6
_080B74F0:
	mov r3, r8
	adds r0, r3, r7
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B752C @ =0x08B905F8
	bl PutSpriteExt
	adds r7, #4
	adds r6, #0x20
	subs r5, #1
	cmp r5, #0
	bge _080B74F0
	mov r1, sb
	cmp r1, #7
	ble _080B74C6
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7528: .4byte 0x0001FFFF
_080B752C: .4byte 0x08B905F8
