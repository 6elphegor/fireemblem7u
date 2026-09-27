	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089DD4
sub_08089DD4: @ 0x08089DD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r1, #0
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08089E08
	ldr r0, _08089E04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089E62
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08089E62
	.align 2, 0
_08089E04: .4byte 0x0202BBF8
_08089E08:
	ldr r4, [r6, #0xc]
	movs r5, #0xc0
	lsls r5, r5, #8
	adds r0, r4, #0
	ands r0, r5
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, _08089E44 @ =0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r6, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _08089E50
	ldr r0, _08089E48 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089E62
	ldr r0, _08089E4C @ =0x0000038A
	bl m4aSongNumStart
	b _08089E62
	.align 2, 0
_08089E44: .4byte 0xFFFF3FFF
_08089E48: .4byte 0x0202BBF8
_08089E4C: .4byte 0x0000038A
_08089E50:
	ldr r0, _08089E68 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089E62
	ldr r0, _08089E6C @ =0x0000038B
	bl m4aSongNumStart
_08089E62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089E68: .4byte 0x0202BBF8
_08089E6C: .4byte 0x0000038B
