	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7EF8
sub_080B7EF8: @ 0x080B7EF8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl AppendCharacter
	adds r5, r0, #0
	ldr r6, _080B7F4C @ =0x085E9ACC
	adds r0, r6, #0
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B7F50 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B7F26
	movs r1, #2
_080B7F26:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B7F4C: .4byte 0x085E9ACC
_080B7F50: .4byte 0x0202BBF8
