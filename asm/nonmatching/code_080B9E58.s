	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerRank_LoopLetters
PlayerRank_LoopLetters: @ 0x080B9E58
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r2, r3, #0
	adds r2, #0x20
	str r2, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x4c
	adds r5, r1, r0
	adds r0, r2, #0
	cmp r2, #0
	bge _080B9E78
	ldr r1, _080B9E9C @ =0x0000021F
	adds r0, r3, r1
_080B9E78:
	asrs r0, r0, #9
	lsls r0, r0, #9
	subs r0, r2, r0
	cmp r0, #0xff
	ble _080B9EA4
	adds r0, r2, #0
	cmp r2, #0
	bge _080B9E8C
	ldr r1, _080B9EA0 @ =0x0000011F
	adds r0, r3, r1
_080B9E8C:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	b _080B9EB4
	.align 2, 0
_080B9E9C: .4byte 0x0000021F
_080B9EA0: .4byte 0x0000011F
_080B9EA4:
	adds r0, r2, #0
	cmp r2, #0
	bge _080B9EAE
	ldr r1, _080B9F10 @ =0x0000011F
	adds r0, r3, r1
_080B9EAE:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r1, r2, r0
_080B9EB4:
	strh r1, [r5]
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	adds r2, r4, #0
	adds r2, #0x40
	cmp r0, #0
	bne _080B9ED2
	adds r1, r2, r1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080B9ED2:
	ldr r3, [r4, #0x2c]
	adds r1, r2, r3
	adds r0, r4, #0
	adds r0, #0x3a
	adds r0, r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B9F40
	lsls r0, r3, #1
	adds r0, r5, r0
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0]
	cmp r0, r1
	bne _080B9F40
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r1, _080B9F14 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080B9F18
	cmp r3, #3
	bne _080B9F18
	movs r0, #0xf
	adds r1, r4, #0
	bl StartPlayerRankFlash
	b _080B9F22
	.align 2, 0
_080B9F10: .4byte 0x0000011F
_080B9F14: .4byte 0x0202BBF8
_080B9F18:
	ldr r0, [r4, #0x2c]
	adds r0, #0xa
	adds r1, r4, #0
	bl StartPlayerRankFlash
_080B9F22:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldr r0, _080B9F48 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B9F3A
	movs r0, #0x85
	bl m4aSongNumStart
_080B9F3A:
	adds r0, r4, #0
	bl Proc_Break
_080B9F40:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F48: .4byte 0x0202BBF8
