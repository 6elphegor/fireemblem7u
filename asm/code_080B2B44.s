	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2B44
sub_080B2B44: @ 0x080B2B44
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl ArenaGetMatchupGoldValue
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, _080B2B90 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2B7A
	movs r0, #0xb9
	bl m4aSongNumStart
_080B2B7A:
	ldr r1, _080B2B94 @ =0x02022E16
	adds r0, r1, #0
	bl DisplayGoldBoxText
	ldr r0, [r7]
	bl sub_080B2DF8
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B90: .4byte 0x0202BBF8
_080B2B94: .4byte 0x02022E16
