	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2D20
sub_080B2D20: @ 0x080B2D20
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetResult
	cmp r0, #2
	beq _080B2D74
	cmp r0, #2
	bgt _080B2D3A
	cmp r0, #1
	beq _080B2D44
	b _080B2D78
_080B2D3A:
	cmp r0, #3
	beq _080B2D44
	cmp r0, #4
	beq _080B2D76
	b _080B2D78
_080B2D44:
	ldr r1, _080B2D6C @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	ldr r1, _080B2D70 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2D62
	movs r0, #0xb9
	bl m4aSongNumStart
_080B2D62:
	ldr r0, [r7]
	movs r1, #0x3c
	bl StartTemporaryLock
	b _080B2D78
	.align 2, 0
_080B2D6C: .4byte 0x02022E16
_080B2D70: .4byte 0x0202BBF8
_080B2D74:
	b _080B2D78
_080B2D76:
	b _080B2D78
_080B2D78:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
