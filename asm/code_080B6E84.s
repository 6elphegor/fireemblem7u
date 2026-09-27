	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6E84
sub_080B6E84: @ 0x080B6E84
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
_080B6E8E:
	ldrb r0, [r1]
	cmp r0, #0
	blt _080B6EA4
	cmp r0, #1
	ble _080B6EB4
	cmp r0, #5
	bgt _080B6EA4
	cmp r0, #4
	blt _080B6EA4
	adds r1, #1
	b _080B6E8E
_080B6EA4:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	ldr r0, [sp]
	adds r4, r4, r0
	b _080B6E8E
_080B6EB4:
	movs r1, #0xe0
	subs r1, r1, r4
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r5, #0
	bl Text_SetCursor
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
