	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BA54
sub_0801BA54: @ 0x0801BA54
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, #2
	mov ip, r1
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r0, #0
	adds r7, #0xa
	ldr r1, _0801BA98 @ =0x08B857F8
	ldr r3, [r1]
	movs r5, #0x10
	adds r0, r5, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _0801BAAA
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x41
	bgt _0801BA9C
	adds r0, r2, #1
	b _0801BAA8
	.align 2, 0
_0801BA98: .4byte 0x08B857F8
_0801BA9C:
	adds r0, r5, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801BAAA
	movs r0, #0
_0801BAA8:
	strb r0, [r1]
_0801BAAA:
	ldr r2, [r6]
	movs r3, #0x20
	adds r0, r3, #0
	ldrh r1, [r2, #6]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801BAD8
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _0801BACA
	subs r0, r1, #1
	b _0801BAD6
_0801BACA:
	adds r0, r3, #0
	ldrh r2, [r2, #8]
	ands r0, r2
	cmp r0, #0
	beq _0801BAD8
	movs r0, #0x42
_0801BAD6:
	strb r0, [r5]
_0801BAD8:
	ldr r1, [r6]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801BB0C
	lsls r4, r7, #5
	add r4, ip
	lsls r4, r4, #1
	ldr r0, _0801BB30 @ =0x02022C60
	adds r4, r4, r0
	ldr r1, _0801BB34 @ =0x081C3B74
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
_0801BB0C:
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801BB40
	ldr r1, _0801BB38 @ =0x0202BBF8
	movs r0, #3
	strb r0, [r1, #0x1b]
	ldr r0, _0801BB3C @ =0x0841E2D8
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0801BB52
	.align 2, 0
_0801BB30: .4byte 0x02022C60
_0801BB34: .4byte 0x081C3B74
_0801BB38: .4byte 0x0202BBF8
_0801BB3C: .4byte 0x0841E2D8
_0801BB40:
	ldr r1, _0801BB6C @ =0x0202BBF8
	movs r0, #2
	strb r0, [r1, #0x1b]
	ldr r0, _0801BB70 @ =0x081C8184
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
_0801BB52:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	bgt _0801BB60
	ldr r1, _0801BB6C @ =0x0202BBF8
	movs r0, #1
	strb r0, [r1, #0x1b]
_0801BB60:
	bl EnablePalSync
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BB6C: .4byte 0x0202BBF8
_0801BB70: .4byte 0x081C8184
